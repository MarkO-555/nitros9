********************************************************************
* Clock - Clock for OS-9 Level Two/NitrOS-9
*
* Clock module for CoCo 3 and TC9 OS9 Level 2 and NitrOS-9
*
* Includes support for several different RTC chips, GIME Toggle
* IRQ fix, numerous minor changes.
*
* Based on Microware/Tandy Clock Module for CC3/L2
*
* $Id$
*
* Edt/Rev  YYYY/MM/DD  Modified by
* Comment
* ------------------------------------------------------------------
*          ????/??/??
* NitrOS-9 2.00 distribution.
*
*   9r4    2003/01/01  Boisy G. Pitre
* Back-ported to OS-9 Level Two.
*
*   9r5    2003/08/18  Boisy G. Pitre
* Separated clock into Clock and Clock2 for modularity.

         nam   Clock
         ttl   Clock for OS-9 Level Two/NitrOS-9

TkPerTS  equ 2 ticks per time slice
GI.Toggl equ %00000001 GIME CART* IRQ enable bit, for CC3

* TC9 needs to reset more interrupt sources
*GI.Toggl equ %00000111 GIME SERINT*, KEYINT*, CART* IRQ enable bits

         IFP1
         use defsfile
         ENDC

Edtn     equ 9
Vrsn     equ 5

*------------------------------------------------------------
*
* Start of module
*
         mod len,name,Systm+Objct,ReEnt+Vrsn,Init,0

name     fcs "Clock"
         fcb Edtn

*
* Table to set up Service Calls:
*
NewSvc   fcb   F$Time
         fdb   F.Time-*-2
         fcb   F$VIRQ
         fdb   F.VIRQ-*-2
         fcb   F$Alarm
         fdb   F.ALARM-*-2
         fcb   F$STime
         fdb   F.STime-*-2

         IFNE  RTCElim
         fcb   F$NVRAM    Eliminator adds one new service call
         fdb   F.NVRAM-*-2
         ENDC

         fcb   $80 end of service call installation table

*---------------------------------------------------------
* IRQ Handling starts here.
*
* Caveat: There may not be a stack at this point, so avoid using one.
*         Stack is set up by the kernel between here and SvcVIRQ.
*
SvcIRQ   lda   >IRQEnR       Get GIME IRQ Status and save it.
         ora   <D.IRQS
         sta   <D.IRQS
         bita  #$08          Check for clock interrupt
         beq   NoClock
         anda  #^$08         Drop clock interrupt
         sta   <D.IRQS
         ldx   <D.VIRQ       Set VIRQ routine to be executed
         clr   <D.QIRQ      ---x IS clock IRQ
         bra   ContIRQ

NoClock  leax DoPoll,pcr       If not clock IRQ, just poll IRQ source
         IFNE  H6309
         oim   #$FF,<D.QIRQ    ---x set flag to NOT clock IRQ
         ELSE
         lda   #$FF
         sta   <D.QIRQ
         ENDC
ContIRQ  stx  <D.SvcIRQ
         jmp  [D.XIRQ]         Chain through Kernel to continue IRQ handling

*------------------------------------------------------------
*
* IRQ handling re-enters here on VSYNC IRQ.
*
* - Count down VIRQ timers, mark ones that are done
* - Call DoPoll/DoToggle to service VIRQs and IRQs and reset GIME
* - Call Keyboard scan
* - Update time variables
* - At end of minute, check alarm
*
SvcVIRQ  clra               Flag if we find any VIRQs to service
         pshs  a
         ldy   <D.CLTb      Get address of VIRQ table
         bra   virqent

virqloop equ   *
         IFGT  Level-2
         ldd   2,y		Get Level 3 extended map type
         orcc  #IntMasks
         sta   >$0643
         stb   >$0645
         std   >$FFA1
         andcc #^IntMasks
         ENDC

         ldd   Vi.Cnt,x     Decrement tick count
         IFNE  H6309
         decd               --- subd #1
         ELSE
         subd  #$0001
         ENDC
         bne   notzero      Is this one done?
         lda   Vi.Stat,x    Should we reset?
         bmi   doreset
         lbsr  DelVIRQ      No, delete this entry
doreset  ora   #$01         Mark this VIRQ as triggered.
         sta   Vi.Stat,x
         lda   #$80         Add VIRQ as interrupt source
         sta   ,s
         ldd   Vi.Rst,x     Reset from Reset count.
notzero  std   Vi.Cnt,x
virqent  ldx   ,y++
         bne   virqloop

         IFGT  Level-2
         puls  d
         orcc  #Carry
         stb   >$0643
         stb   >$FFA1
         incb
         stb   >$0645
         stb   >$FFA1
         andcc #^IntMasks
         ELSE
         puls  a            Get VIRQ status flag: high bit set if VIRQ
         ENDC

         ora   <D.IRQS      Check to see if other hardware IRQ pending.
         bita  #%10110111   Any V/IRQ interrupts pending?
         beq   toggle
         IFGT  Level-2
         lbsr  DoPoll       Yes, go service them.
         ELSE
         bsr   DoPoll       Yes, go service them.
         ENDC
         bra   KbdCheck
toggle   equ   *
         IFGT  Level-2
         lbsr  DoToggle     No, toggle GIME anyway
         ELSE
         bsr   DoToggle     No, toggle GIME anyway
         ENDC

KbdCheck equ   *
         IFGT  Level-2
         lda   >$0643		grab current map type
         ldb   >$0645
         pshs  d		save it
         orcc  #IntMasks	IRQs off
         lda   >$0660		SCF local memory ---x
         sta   >$0643		into DAT image ---x
         sta   >$FFA1		and into RAM ---x
         inca
         sta   >$0645
         sta   >$FFA2		map in SCF, CC3IO, WindInt, etc.
         ENDC

         jsr   [>D.AltIRQ]  go update mouse, gfx cursor, keyboard, etc.

         IFGT  Level-2
         puls  d		restore original map type ---x
         orcc  #IntMasks
         sta   >$0643		into system DAT image ---x
         stb   >$0645
         std   >$FFA1		and into RAM ---x
         andcc  #$AF
         ENDC

         dec   <D.Tick      End of second?
         bne   VIRQend      No, skip time update and alarm check
         lda   #TkPerSec    Reset tick count
         sta   <D.Tick

* ATD: Modified to call real time clocks on every minute ONLY.
         inc   <D.Sec       go up one second
         lda   <D.Sec       grab current second
         cmpa  #60          End of minute?
         blo   VIRQend      No, skip time update and alarm check
         clr   <D.Sec       Reset second count to zero

*
* Call GetTime entry point in Clock2
*
         ldx   <D.Clock2	get entry point to Clock2
         jsr   $03,x		call GetTime entry point

NoGet    ldd   >WGlobal+G.AlPID
         ble   VIRQend      Quit if no Alarm set
         ldd   >WGlobal+G.AlPckt+3   Does Hour/Minute agree?
         cmpd  <D.Hour
         bne   VIRQend
         ldd   >WGlobal+G.AlPckt+1  Does Month/Day agree?
         cmpd  <D.Month
         bne   VIRQend
         ldb   >WGlobal+G.AlPckt+0     Does Year agree?
         cmpb  <D.Year
         bne   VIRQend
         ldd   >WGlobal+G.AlPID
         cmpd  #1
         beq   checkbel
         os9   F$Send   
         bra   endalarm
checkbel ldb   <D.Sec       Sound bell for 15 seconds
         andb  #$F0
         beq   dobell
endalarm ldd   #$FFFF
         std   >WGlobal+G.AlPID
         bra   VIRQend
dobell   ldx   >WGlobal+G.BelVec
         beq   VIRQend
         jsr   ,x
VIRQend  jmp   [>D.Clock]   Jump to kernel's timeslice routine

*------------------------------------------------------------
* Interrupt polling and GIME reset code
*

*
* Call [D.Poll] until all interrupts have been handled
*
Dopoll
         IFGT  Level-2
         lda   >$0643		Level 3: get map type
         ldb   >$0645
         pshs  d		save for later
         ENDC
Dopoll.i
         jsr   [>D.Poll]    Call poll routine
         bcc   DoPoll.i     Until error (error -> no interrupt found)

         IFGT  Level-2
         puls  d
         orcc  #IntMasks
         sta   >$0643
         stb   >$0645
         std   >$FFA1
         andcc #^IntMasks
         ENDC

*
* Reset GIME to avoid missed IRQs
*
DoToggle lda   #^GI.Toggl   Mask off CART* bit
         anda  <D.IRQS
         sta   <D.IRQS
         lda   <D.IRQER     Get current enable register status
         tfr   a,b
         anda  #^GI.Toggl   Mask off CART* bit
         orb   #GI.Toggl    --- ensure that 60Hz IRQ's are always enabled
         sta   >IRQEnR      Disable CART
         stb   >IRQEnR      Enable CART
         clrb
         rts


*------------------------------------------------------------
*
* Handle F$VIRQ system call
*
F.VIRQ   pshs  cc
         orcc  #IntMasks  Disable interrupts
         ldy   <D.CLTb    Address of VIRQ table
         ldx   <D.Init    Address of INIT
         ldb   PollCnt,x  Number of polling table entries from INIT
         ldx   R$X,u      Zero means delete entry
         beq   RemVIRQ
         IFGT  Level-2
         bra   FindVIRQ		---x

v.loop   leay  4,y		---x
         ENDC
FindVIRQ ldx   ,y++       Is VIRQ entry null?
         beq   AddVIRQ    If yes, add entry here
         decb
         bne   FindVIRQ
         puls  cc
         comb  
         ldb   #E$Poll
         rts   

AddVIRQ  
         IFGT  Level-2
         ldx   R$Y,u
         stx   ,y
         lda   >$0643
         ldb   >$0645
         std   2,y
         ELSE
         leay  -2,y         point to first null VIRQ entry
         ldx   R$Y,u
         stx   ,y
         ENDC
         ldy   R$D,u
         sty   ,x
         bra   virqexit

         IFGT  Level-2
v.chk    leay  4,y
RemVIRQ  ldx   ,y
         ELSE
RemVIRQ  ldx   ,y++
         ENDC
         beq   virqexit
         cmpx  R$Y,u
         bne   RemVIRQ
         bsr   DelVIRQ
virqexit puls  cc
         clrb  
         rts   

DelVIRQ  pshs  x,y
DelVLup  
         IFGT  Level-2
         ldq   ,y++		move entries up in table
         leay  2,y
         stq   -8,y
         bne   DelVLup
         puls  x,y,pc
         ELSE
         ldx  ,y++ move entries up in table
         stx  -4,y
         bne  DelVLup
         puls  x,y
         leay  -2,y
         rts
         ENDC

*------------------------------------------------------------
*
* Handle F$Alarm call
*
F.Alarm  ldx   #WGlobal+G.AlPckt
         ldd   R$D,u
         bne   DoAlarm
         std   G.AlPID-G.AlPckt,x  Erase F$Alarm PID, Signal.
         rts   

DoAlarm  tsta               If PID != 0, set alarm for this process
         bne   SetAlarm
         cmpd  #1           1 -> Set system-wide alarm
         bne   GetAlarm
SetAlarm std   G.AlPID-G.AlPckt,x
         ldy   <D.Proc
         lda   P$Task,y     Move from process task
         ldb   <D.SysTsk    To system task
         ldx   R$X,u        From address given in X
         ldu   #WGlobal+G.AlPckt
         ldy   #5           Move 5 bytes
         bra   FMove

GetAlarm cmpd  #2
         bne   AlarmErr
         ldd   G.AlPID-G.AlPckt,x
         std   R$D,u
         bra   RetTime
AlarmErr comb
         ldb   #E$IllArg
         rts   

*------------------------------------------------------------
*
* Handle F$Time System call
*
F.Time   ldx   #D.Time    Address of system time packet
RetTime  ldy   <D.Proc    Get pointer to current proc descriptor
         ldb   P$Task,y      Process Task number
         lda   <D.SysTsk  From System Task
         ldu   R$X,u
STime.Mv ldy   #6         Move 6 bytes
FMove    os9   F$Move   
         rts   

*------------------------------------------------------------
*
* Handle F$STime system call
*
* First, copy time packet from user address space to system time
* variables, then fall through to code to update RTC.
*
F.STime  ldx   <D.Proc   Caller's process descriptor
         lda   P$Task,x  Source is in user map
         ldx   R$X,u     Address of caller's time packet
         ldu   #D.Time   Destination address
         ldb   <D.SysTsk Destination is in system map
         bsr   STime.Mv  Get time packet (ignore errors)
         lda   #TkPerSec Reset to start of second
         sta   <D.Tick

*
* Call SetTime entry point in Clock2
         ldx   <D.Clock2	get entry point to Clock2
         jsr   $06,x		else call GetTime entry point

NoSet    rts

*------------------------------------------------------------
* read/write RTC Non Volatile RAM (NVRAM)
*
* INPUT:  [U] = pointer to caller's register stack
*         R$A = access mode (1 = read, 2 = write, other = error)
*         R$B = byte count (1 through 50 here, but in other implementations
*               may be 1 through 256 where 0 implies 256)
*         R$X = address of buffer in user map
*         R$Y = start address in NVRAM
*
* OUTPUT:  RTC NVRAM read/written
*
* ERROR OUTPUT:  [CC] = Carry set
*                [B] = error code
         IFNE  RTCElim
F.NVRAM  tfr   u,y        copy caller's register stack pointer
         ldd   #$0100     ask for one page
         os9   F$SRqMem
         bcs   NVR.Exit   go report error...
         pshs  y,u       save caller's stack and data buffer pointers
         ldx   R$Y,y      get NVRAM start address
         cmpx  #50       too high?
         bhs   Arg.Err    yes, go return error...
         ldb   R$B,y      get NVRAM byte count
         beq   Arg.Err
         abx            check end address
         cmpx  #50       too high?
         bhi   Arg.Err    yes, go return error...
         lda   R$A,y      get direction flag
         cmpa  #WRITE.   put caller's data into NVRAM?
         bne   ChkRead    no, go check if read...
         clra           [D]=byte count
         pshs  d         save it...
         ldx   <D.Proc    get caller's process descriptor address
         lda   P$Task,x   caller is source task
         ldb   <D.SysTsk  system is destination task
         ldx   R$X,y      get caller's source pointer
         puls  y         recover byte count
         os9   F$Move     go MOVE data
         bcs   NVR.Err
         ldy   ,s         get caller's register stack pointer from stack
         lda   R$Y+1,y    get NVRAM start address
         adda  #$0E      add offset to first RTC NVRAM address
         ldb   R$B,y      get byte count
         ldx   M$Mem,pcr  get clock base address from fake memory requirement
         pshs  cc,b      save IRQ enable status and byte counter
         orcc  #IntMasks disable IRQs
WrNVR.Lp ldb   ,u+        get caller's data
         std   ,x         generate RTC address strobe and save data to NVRAM
         inca             next NVRAM address
         dec   1,s        done yet?
         bne   WrNVR.Lp   no, go save another byte
         puls  cc,b      recover IRQ enable status and clean up stack
NVR.RtM  puls  y,u       recover register stack & data buffer pointers
         ldd   #$0100     return one page
         os9   F$SRtMem
NVR.Exit rts

Arg.Err  ldb   #E$IllArg Illegal Argument error
         bra   NVR.Err

ChkRead  cmpa  #READ.    return NVRAM data to caller?
         bne   Arg.Err    illegal access mode, go return error...
         lda   R$Y+1,y    get NVRAM start address
         adda  #$0E      add offset to first RTC NVRAM address
         ldx   M$Mem,pcr  get clock base address from fake memory requirement
         pshs  cc,b      save IRQ enable status and byte counter
         orcc  #IntMasks disable IRQs
RdNVR.Lp sta   ,x         generate RTC address strobe
         ldb   1,x        get NVRAM data
         stb   ,u+        save it to buffer
         inca             next NVRAM address
         dec   1,s        done yet?
         bne   RdNVR.Lp   no, go get another byte
         puls  cc,a       recover IRQ enable status, clean up stack ([A]=0)
         ldb   R$B,y      [D]=byte count
         pshs  d          save it...
         ldx   <D.Proc    get caller's process descriptor address
         ldb  P$Task,x    caller is source task
         lda   <D.SysTsk  system is destination task
         ldu   R$X,y      get caller's source pointer
         puls  y          recover byte count
         ldx   2,s        get data buffer (source) pointer
         os9   F$Move     go MOVE data
         bcc   NVR.RtM
NVR.Err  puls  y,u       recover caller's stack and data pointers
         pshs  b         save error code
         ldd   #$0100     return one page
         os9   F$SRtMem
         comb   set       Carry for error
         puls  b,pc      recover error code, return...
         ENDC

Clock2   fcs   "Clock2"

*--------------------------------------------------
*
* Clock Initialization
*
* This vector is called by the kernel to service the first F$STime
* call.  F$STime is usually called by CC3Go (with a dummy argument)
* in order to initialize the clock.  F$STime is re-vectored to the
* service code above to handle future F$STime calls.
*
*
Init     ldx   <D.Proc                  save user proc
         pshs  x
         ldx   <D.SysPrc                make sys for link
         stx   <D.Proc

         leax  <Clock2,pcr
         lda   #Systm+Objct
         os9   F$Link

* And here, we restore the original D.Proc value
         puls  x
         stx   <D.Proc                  restore user proc

         bcc   LinkOk
         lda   #E$MNF
         jmp   <D.Crash
LinkOk   sty   <D.Clock2	save entry point
InitCont ldx   #PIA0Base point to PIA0
         clra          no error for return...
         pshs  cc       save IRQ enable status (and Carry clear)
         orcc  #IntMasks stop interrupts

         IFEQ  TkPerSec-50
         ldb   <D.VIDMD    get video mode register copy
         orb   #$08        set 50 Hz VSYNC bit
         stb   <D.VIDMD    save video mode register copy
         stb   >$FF98      set 50 Hz VSYNC
         ENDC

         sta   1,x enable DDRA
         sta   ,x set port A all inputs
         sta   3,x enable DDRB
         coma
         sta   2,x set port B all outputs
         ldd   #$343C [A]=PIA0 CRA contents, [B]=PIA0 CRB contents
         sta   1,x CA2 (MUX0) out low, port A, disable HBORD high-to-low IRQs
         stb   3,x CB2 (MUX1) out low, port B, disable VBORD low-to-high IRQs
         lda   ,x clear possible pending PIA0 HBORD IRQ
         lda   2,x clear possible pending PIA0 VBORD IRQ

* Don't need to explicitly read RTC during initialization
         ldd   #59*256+TkPerTS last second and time slice in minute
         std   <D.Sec      Will prompt RTC read at next time slice

         stb   <D.TSlice set ticks per time slice
         stb   <D.Slice set first time slice
         leax  SvcIRQ,pcr set IRQ handler
         stx   <D.IRQ
         leax  SvcVIRQ,pcr set VIRQ handler
         stx   <D.VIRQ
         leay  NewSvc,pcr insert syscalls
         os9   F$SSvc
         lda   <D.IRQER get shadow GIME IRQ enable register
         ora   #$08 set VBORD bit
         sta   <D.IRQER save shadow register
         sta   >IRQEnR enable GIME VBORD IRQs

* Call Clock2 init routine
         ldy   <D.Clock2	get entry point to Clock2
         jsr   ,y		call init entry point of Clock2
InitRts  puls  cc,pc recover IRQ enable status and return

         emod
len      equ *
         end

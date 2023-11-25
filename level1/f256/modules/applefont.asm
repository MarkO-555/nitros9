********************************************************************
* font - F256 font
*
* $Id$
*
* Edt/Rev  YYYY/MM/DD  Modified by
* Comment
* ------------------------------------------------------------------
*   1      2023/09/24  Boisy G. Pitre
* Created.
*
               nam       font
               ttl       F256 font

               use       defsfile

tylg           set       Data
atrv           set       ReEnt+rev
rev            set       $01

               mod       eom,name,tylg,atrv,start,0

name           fcs       /font/

start

L0000    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0008    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0010    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0018    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0020    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0028    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0030    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0038    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0040    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0048    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0050    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0058    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0060    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0068    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0070    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0078    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0080    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0088    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0090    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0098    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L00A0    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L00A8    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L00B0    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L00B8    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L00C0    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L00C8    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L00D0    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L00D8    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L00E0    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L00E8    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L00F0    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L00F8    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0100    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0108    fcb   $10,$10,$10,$10,$10,$00,$10,$00   ........
L0110    fcb   $28,$28,$28,$00,$00,$00,$00,$00   (((.....
L0118    fcb   $28,$28,$7C,$28,$7C,$28,$28,$00   ((|(|((.
L0120    fcb   $10,$3C,$50,$38,$14,$78,$10,$00   .<P8.x..
L0128    fcb   $60,$64,$08,$10,$20,$4C,$0C,$00   `d.. L..
L0130    fcb   $20,$50,$50,$20,$54,$48,$34,$00    PP TH4.
L0138    fcb   $10,$10,$10,$00,$00,$00,$00,$00   ........
L0140    fcb   $10,$20,$40,$40,$40,$20,$10,$00   . @@@ ..
L0148    fcb   $10,$08,$04,$04,$04,$08,$10,$00   ........
L0150    fcb   $10,$54,$38,$10,$38,$54,$10,$00   .T8.8T..
L0158    fcb   $00,$10,$10,$7C,$10,$10,$00,$00   ...|....
L0160    fcb   $00,$00,$00,$00,$10,$10,$20,$00   ...... .
L0168    fcb   $00,$00,$00,$7C,$00,$00,$00,$00   ...|....
L0170    fcb   $00,$00,$00,$00,$00,$00,$10,$00   ........
L0178    fcb   $00,$04,$08,$10,$20,$40,$00,$00   .... @..
L0180    fcb   $38,$44,$4C,$54,$64,$44,$38,$00   8DLTdD8.
L0188    fcb   $10,$30,$10,$10,$10,$10,$38,$00   .0....8.
L0190    fcb   $38,$44,$04,$18,$20,$40,$7C,$00   8D.. @|.
L0198    fcb   $7C,$04,$08,$18,$04,$44,$38,$00   |....D8.
L01A0    fcb   $08,$18,$28,$48,$7C,$08,$08,$00   ..(H|...
L01A8    fcb   $7C,$40,$78,$04,$04,$44,$38,$00   |@x..D8.
L01B0    fcb   $1C,$20,$40,$78,$44,$44,$38,$00   . @xDD8.
L01B8    fcb   $7C,$04,$08,$10,$20,$20,$20,$00   |...   .
L01C0    fcb   $38,$44,$44,$38,$44,$44,$38,$00   8DD8DD8.
L01C8    fcb   $38,$44,$44,$3C,$04,$08,$70,$00   8DD<..p.
L01D0    fcb   $00,$00,$10,$00,$10,$00,$00,$00   ........
L01D8    fcb   $00,$00,$10,$00,$10,$10,$20,$00   ...... .
L01E0    fcb   $08,$10,$20,$40,$20,$10,$08,$00   .. @ ...
L01E8    fcb   $00,$00,$7C,$00,$7C,$00,$00,$00   ..|.|...
L01F0    fcb   $20,$10,$08,$04,$08,$10,$20,$00    ..... .
L01F8    fcb   $38,$44,$08,$10,$10,$00,$10,$00   8D......
L0200    fcb   $38,$44,$54,$5C,$58,$40,$3C,$00   8DT\X@<.
L0208    fcb   $10,$28,$44,$44,$7C,$44,$44,$00   .(DD|DD.
L0210    fcb   $78,$44,$44,$78,$44,$44,$78,$00   xDDxDDx.
L0218    fcb   $38,$44,$40,$40,$40,$44,$38,$00   8D@@@D8.
L0220    fcb   $78,$44,$44,$44,$44,$44,$78,$00   xDDDDDx.
L0228    fcb   $7C,$40,$40,$78,$40,$40,$7C,$00   |@@x@@|.
L0230    fcb   $7C,$40,$40,$70,$40,$40,$40,$00   |@@p@@@.
L0238    fcb   $3C,$40,$40,$40,$4C,$44,$3C,$00   <@@@LD<.
L0240    fcb   $44,$44,$44,$7C,$44,$44,$44,$00   DDD|DDD.
L0248    fcb   $38,$10,$10,$10,$10,$10,$38,$00   8.....8.
L0250    fcb   $04,$04,$04,$04,$04,$44,$38,$00   .....D8.
L0258    fcb   $44,$48,$50,$60,$50,$48,$44,$00   DHP`PHD.
L0260    fcb   $40,$40,$40,$40,$40,$40,$7C,$00   @@@@@@|.
L0268    fcb   $44,$6C,$54,$54,$44,$44,$44,$00   DlTTDDD.
L0270    fcb   $44,$44,$64,$54,$4C,$44,$44,$00   DDdTLDD.
L0278    fcb   $38,$44,$44,$44,$44,$44,$38,$00   8DDDDD8.
L0280    fcb   $78,$44,$44,$78,$40,$40,$40,$00   xDDx@@@.
L0288    fcb   $38,$44,$44,$44,$54,$48,$34,$00   8DDDTH4.
L0290    fcb   $78,$44,$44,$78,$50,$48,$44,$00   xDDxPHD.
L0298    fcb   $38,$44,$40,$38,$04,$44,$38,$00   8D@8.D8.
L02A0    fcb   $7C,$10,$10,$10,$10,$10,$10,$00   |.......
L02A8    fcb   $44,$44,$44,$44,$44,$44,$38,$00   DDDDDD8.
L02B0    fcb   $44,$44,$44,$44,$44,$28,$10,$00   DDDDD(..
L02B8    fcb   $44,$44,$44,$54,$54,$6C,$44,$00   DDDTTlD.
L02C0    fcb   $44,$44,$28,$10,$28,$44,$44,$00   DD(.(DD.
L02C8    fcb   $44,$44,$28,$10,$10,$10,$10,$00   DD(.....
L02D0    fcb   $7C,$04,$08,$10,$20,$40,$7C,$00   |... @|.
L02D8    fcb   $7C,$60,$60,$60,$60,$60,$7C,$00   |`````|.
L02E0    fcb   $00,$40,$20,$10,$08,$04,$00,$00   .@ .....
L02E8    fcb   $7C,$0C,$0C,$0C,$0C,$0C,$7C,$00   |.....|.
L02F0    fcb   $00,$10,$28,$44,$00,$00,$00,$00   ..(D....
L02F8    fcb   $00,$00,$00,$00,$00,$00,$7C,$00   ......|.
L0300    fcb   $20,$20,$10,$08,$00,$00,$00,$00     ......
L0308    fcb   $00,$00,$38,$04,$3C,$44,$3C,$00   ..8.<D<.
L0310    fcb   $40,$40,$78,$44,$44,$44,$78,$00   @@xDDDx.
L0318    fcb   $00,$00,$3C,$40,$40,$40,$3C,$00   ..<@@@<.
L0320    fcb   $04,$04,$3C,$44,$44,$44,$3C,$00   ..<DDD<.
L0328    fcb   $00,$00,$38,$44,$7C,$40,$3C,$00   ..8D|@<.
L0330    fcb   $18,$24,$20,$78,$20,$20,$20,$00   .$ x   .
L0338    fcb   $00,$00,$38,$44,$44,$3C,$04,$38   ..8DD<.8
L0340    fcb   $40,$40,$78,$44,$44,$44,$44,$00   @@xDDDD.
L0348    fcb   $10,$00,$30,$10,$10,$10,$38,$00   ..0...8.
L0350    fcb   $08,$00,$18,$08,$08,$08,$48,$30   ......H0
L0358    fcb   $40,$40,$44,$48,$70,$48,$44,$00   @@DHpHD.
L0360    fcb   $30,$10,$10,$10,$10,$10,$38,$00   0.....8.
L0368    fcb   $00,$00,$6C,$54,$54,$54,$44,$00   ..lTTTD.
L0370    fcb   $00,$00,$78,$44,$44,$44,$44,$00   ..xDDDD.
L0378    fcb   $00,$00,$38,$44,$44,$44,$38,$00   ..8DDD8.
L0380    fcb   $00,$00,$78,$44,$44,$78,$40,$40   ..xDDx@@
L0388    fcb   $00,$00,$3C,$44,$44,$3C,$04,$04   ..<DD<..
L0390    fcb   $00,$00,$5C,$60,$40,$40,$40,$00   ..\`@@@.
L0398    fcb   $00,$00,$3C,$40,$38,$04,$78,$00   ..<@8.x.
L03A0    fcb   $20,$20,$78,$20,$20,$24,$18,$00     x  $..
L03A8    fcb   $00,$00,$44,$44,$44,$4C,$34,$00   ..DDDL4.
L03B0    fcb   $00,$00,$44,$44,$44,$28,$10,$00   ..DDD(..
L03B8    fcb   $00,$00,$44,$44,$54,$54,$6C,$00   ..DDTTl.
L03C0    fcb   $00,$00,$44,$28,$10,$28,$44,$00   ..D(.(D.
L03C8    fcb   $00,$00,$44,$44,$44,$3C,$04,$38   ..DDD<.8
L03D0    fcb   $00,$00,$7C,$08,$10,$20,$7C,$00   ..|.. |.
L03D8    fcb   $1C,$30,$30,$60,$30,$30,$1C,$00   .00`00..
L03E0    fcb   $10,$10,$10,$10,$10,$10,$10,$10   ........
L03E8    fcb   $70,$18,$18,$0C,$18,$18,$70,$00   p.....p.
L03F0    fcb   $34,$58,$00,$00,$00,$00,$00,$00   4X......
L03F8    fcb   $54,$28,$54,$28,$54,$28,$54,$00   T(T(T(T.
L0400    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0408    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0410    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0418    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0420    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0428    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0430    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0438    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0440    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0448    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0450    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0458    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0460    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0468    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0470    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0478    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0480    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0488    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0490    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0498    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L04A0    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L04A8    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L04B0    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L04B8    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L04C0    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L04C8    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L04D0    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L04D8    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L04E0    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L04E8    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L04F0    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L04F8    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0500    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0508    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0510    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0518    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0520    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0528    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0530    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0538    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0540    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0548    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0550    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0558    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0560    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0568    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0570    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0578    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0580    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0588    fcb   $7C,$7C,$7C,$7C,$7C,$7C,$7C,$7C   ||||||||
L0590    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0598    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L05A0    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L05A8    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L05B0    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L05B8    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L05C0    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L05C8    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L05D0    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L05D8    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L05E0    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L05E8    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L05F0    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L05F8    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0600    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0608    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0610    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0618    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0620    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0628    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0630    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0638    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0640    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0648    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0650    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0658    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0660    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0668    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0670    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0678    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0680    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0688    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0690    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0698    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L06A0    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L06A8    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L06B0    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L06B8    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L06C0    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L06C8    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L06D0    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L06D8    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L06E0    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L06E8    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L06F0    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L06F8    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0700    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0708    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0710    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0718    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0720    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0728    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0730    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0738    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0740    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0748    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0750    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0758    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0760    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0768    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0770    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0778    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0780    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0788    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0790    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L0798    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L07A0    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L07A8    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L07B0    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L07B8    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L07C0    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L07C8    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L07D0    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L07D8    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L07E0    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L07E8    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L07F0    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........
L07F8    fcb   $00,$00,$00,$00,$00,$00,$00,$00   ........

               emod
eom            equ       *
               end

;   Copyright(c) 2022 Renesas Electronics Corporation
;   RENESAS ELECTRONICS CONFIDENTIAL AND PROPRIETARY.
;   This program must be used solely for the purpose for which
;   it was furnished by Renesas Electronics Corporation. No part of this
;   program may be reproduced or disclosed to others, in any
;   form, without the prior written permission of Renesas Electronics
;   Corporation.

;-----------------------------------------------------------------------------
;   for direct vector method
;-----------------------------------------------------------------------------

    .section "RESET_PE0", text
    .align    512
    jr32    __start             ; RESET

    .align  16
    jr32    _Dummy              ; SYSERR

    .align  16
    jr32    _Dummy              ; HVTRAP

    .align  16
    jr32    _Dummy              ; FETRAP

    .align  16
    jr32    _Dummy_EI           ; TRAP0

    .align  16
    jr32    _Dummy_EI           ; TRAP1

    .align  16
    jr32    _Dummy              ; RIE

    .align  16
    jr32    _Dummy_EI           ; FPE/FXE

    .align  16
    jr32    _Dummy              ; UCPOP

    .align  16
    jr32    _Dummy              ; MIP/MDP

    .align  16
    jr32    _Dummy              ; PIE

    .align  16
    jr32    _Dummy              ; Debug

    .align  16
    jr32    _Dummy              ; MAE

    .align  16
    jr32    _Dummy              ; (R.F.U)

    .align  16
    jr32    _Dummy              ; FENMI

    .align  16
    jr32    _Dummy              ; FEINT

    .align  16
    jr32    _Dummy_EI           ; INTn(priority0)

    .align  16
    jr32    _Dummy_EI           ; INTn(priority1)

    .align  16
    jr32    _Dummy_EI           ; INTn(priority2)

    .align  16
    jr32    _Dummy_EI           ; INTn(priority3)

    .align  16
    jr32    _Dummy_EI           ; INTn(priority4)

    .align  16
    jr32    _Dummy_EI           ; INTn(priority5)

    .align  16
    jr32    _Dummy_EI           ; INTn(priority6)

    .align  16
    jr32    _Dummy_EI           ; INTn(priority7)

    .align  16
    jr32    _Dummy_EI           ; INTn(priority8)

    .align  16
    jr32    _Dummy_EI           ; INTn(priority9)

    .align  16
    jr32    _Dummy_EI           ; INTn(priority10)

    .align  16
    jr32    _Dummy_EI           ; INTn(priority11)

    .align  16
    jr32    _Dummy_EI           ; INTn(priority12)

    .align  16
    jr32    _Dummy_EI           ; INTn(priority13)

    .align  16
    jr32    _Dummy_EI           ; INTn(priority14)

    .align  16
    jr32    _Dummy_EI           ; INTn(priority15)

;-----------------------------------------------------------------------------
;   for table reference method
;-----------------------------------------------------------------------------

    .section "EIINTTBL_PE0", const
    .align  512
    ;   jump address            ;   <Ch>    <Exception Code>    <Offset>
    .dw #_Dummy_EI              ;   0       1000h               +000h
    .dw #_Dummy_EI              ;   1       1001h               +004h
    .dw #_Dummy_EI              ;   2       1002h               +008h
    .dw #_Dummy_EI              ;   3       1003h               +00Ch
    .dw #_Dummy_EI              ;   4       1004h               +010h
    .dw #_Dummy_EI              ;   5       1005h               +014h
    .dw #_Dummy_EI              ;   6       1006h               +018h
    .dw #_Dummy_EI              ;   7       1007h               +01Ch
    .dw #_Dummy_EI              ;   8       1008h               +020h
    .dw #_Dummy_EI              ;   9       1009h               +024h
    .dw #_Dummy_EI              ;   10      100Ah               +028h
    .dw #_Dummy_EI              ;   11      100Bh               +02Ch
    .dw #_Dummy_EI              ;   12      100Ch               +030h
    .dw #_Dummy_EI              ;   13      100Dh               +034h
    .dw #_Dummy_EI              ;   14      100Eh               +038h
    .dw #_Dummy_EI              ;   15      100Fh               +03Ch
    .dw #_Dummy_EI              ;   16      1010h               +040h
    .dw #_Dummy_EI              ;   17      1011h               +044h
    .dw #_Dummy_EI              ;   18      1012h               +048h
    .dw #_Dummy_EI              ;   19      1013h               +04Ch
    .dw #_Dummy_EI              ;   20      1014h               +050h
    .dw #_Dummy_EI              ;   21      1015h               +054h
    .dw #_Dummy_EI              ;   22      1016h               +058h
    .dw #_Dummy_EI              ;   23      1017h               +05Ch
    .dw #_Dummy_EI              ;   24      1018h               +060h
    .dw #_Dummy_EI              ;   25      1019h               +064h
    .dw #_Dummy_EI              ;   26      101Ah               +068h
    .dw #_Dummy_EI              ;   27      101Bh               +06Ch
    .dw #_Dummy_EI              ;   28      101Ch               +070h
    .dw #_Dummy_EI              ;   29      101Dh               +074h
    .dw #_Dummy_EI              ;   30      101Eh               +078h
    .dw #_Dummy_EI              ;   31      101Fh               +07Ch
    .dw #_Dummy_EI              ;   32      1020h               +080h
    .dw #_Dummy_EI              ;   33      1021h               +084h
    .dw #_Dummy_EI              ;   34      1022h               +088h
    .dw #_Dummy_EI              ;   35      1023h               +08Ch
    .dw #_Dummy_EI              ;   36      1024h               +090h
    .dw #_Dummy_EI              ;   37      1025h               +094h
    .dw #_Dummy_EI              ;   38      1026h               +098h
    .dw #_Dummy_EI              ;   39      1027h               +09Ch
    .dw #_Dummy_EI              ;   40      1028h               +0A0h
    .dw #_Dummy_EI              ;   41      1029h               +0A4h
    .dw #_Dummy_EI              ;   42      102Ah               +0A8h
    .dw #_Dummy_EI              ;   43      102Bh               +0ACh
    .dw #_Dummy_EI              ;   44      102Ch               +0B0h
    .dw #_Dummy_EI              ;   45      102Dh               +0B4h
    .dw #_Dummy_EI              ;   46      102Eh               +0B8h
    .dw #_Dummy_EI              ;   47      102Fh               +0BCh
    .dw #_Dummy_EI              ;   48      1030h               +0C0h
    .dw #_Dummy_EI              ;   49      1031h               +0C4h
    .dw #_Dummy_EI              ;   50      1032h               +0C8h
    .dw #_Dummy_EI              ;   51      1033h               +0CCh
    .dw #_Dummy_EI              ;   52      1034h               +0D0h
    .dw #_Dummy_EI              ;   53      1035h               +0D4h
    .dw #_Dummy_EI              ;   54      1036h               +0D8h
    .dw #_Dummy_EI              ;   55      1037h               +0DCh
    .dw #_Dummy_EI              ;   56      1038h               +0E0h
    .dw #_Dummy_EI              ;   57      1039h               +0E4h
    .dw #_Dummy_EI              ;   58      103Ah               +0E8h
    .dw #_Dummy_EI              ;   59      103Bh               +0ECh
    .dw #_Dummy_EI              ;   60      103Ch               +0F0h
    .dw #_Dummy_EI              ;   61      103Dh               +0F4h
    .dw #_Dummy_EI              ;   62      103Eh               +0F8h
    .dw #_Dummy_EI              ;   63      103Fh               +0FCh
    .dw #_Dummy_EI              ;   64      1040h               +100h
    .dw #_Dummy_EI              ;   65      1041h               +104h
    .dw #_Dummy_EI              ;   66      1042h               +108h
    .dw #_Dummy_EI              ;   67      1043h               +10Ch
    .dw #_Dummy_EI              ;   68      1044h               +110h
    .dw #_Dummy_EI              ;   69      1045h               +114h
    .dw #_Dummy_EI              ;   70      1046h               +118h
    .dw #_Dummy_EI              ;   71      1047h               +11Ch
    .dw #_Dummy_EI              ;   72      1048h               +120h
    .dw #_Dummy_EI              ;   73      1049h               +124h
    .dw #_Dummy_EI              ;   74      104Ah               +128h
    .dw #_Dummy_EI              ;   75      104Bh               +12Ch
    .dw #_Dummy_EI              ;   76      104Ch               +130h
    .dw #_Dummy_EI              ;   77      104Dh               +134h
    .dw #_Dummy_EI              ;   78      104Eh               +138h
    .dw #_Dummy_EI              ;   79      104Fh               +13Ch
    .dw #_Dummy_EI              ;   80      1050h               +140h
    .dw #_Dummy_EI              ;   81      1051h               +144h
    .dw #_Dummy_EI              ;   82      1052h               +148h
    .dw #_Dummy_EI              ;   83      1053h               +14Ch
    .dw #_Dummy_EI              ;   84      1054h               +150h
    .dw #_Dummy_EI              ;   85      1055h               +154h
    .dw #_Dummy_EI              ;   86      1056h               +158h
    .dw #_Dummy_EI              ;   87      1057h               +15Ch
    .dw #_Dummy_EI              ;   88      1058h               +160h
    .dw #_Dummy_EI              ;   89      1059h               +164h
    .dw #_Dummy_EI              ;   90      105Ah               +168h
    .dw #_Dummy_EI              ;   91      105Bh               +16Ch
    .dw #_Dummy_EI              ;   92      105Ch               +170h
    .dw #_Dummy_EI              ;   93      105Dh               +174h
    .dw #_Dummy_EI              ;   94      105Eh               +178h
    .dw #_Dummy_EI              ;   95      105Fh               +17Ch
    .dw #_Dummy_EI              ;   96      1060h               +180h
    .dw #_Dummy_EI              ;   97      1061h               +184h
    .dw #_Dummy_EI              ;   98      1062h               +188h
    .dw #_Dummy_EI              ;   99      1063h               +18Ch
    .dw #_Dummy_EI              ;   100     1064h               +190h
    .dw #_Dummy_EI              ;   101     1065h               +194h
    .dw #_Dummy_EI              ;   102     1066h               +198h
    .dw #_Dummy_EI              ;   103     1067h               +19Ch
    .dw #_Dummy_EI              ;   104     1068h               +1A0h
    .dw #_Dummy_EI              ;   105     1069h               +1A4h
    .dw #_Dummy_EI              ;   106     106Ah               +1A8h
    .dw #_Dummy_EI              ;   107     106Bh               +1ACh
    .dw #_Dummy_EI              ;   108     106Ch               +1B0h
    .dw #_Dummy_EI              ;   109     106Dh               +1B4h
    .dw #_Dummy_EI              ;   110     106Eh               +1B8h
    .dw #_Dummy_EI              ;   111     106Fh               +1BCh
    .dw #_Dummy_EI              ;   112     1070h               +1C0h
    .dw #_Dummy_EI              ;   113     1071h               +1C4h
    .dw #_Dummy_EI              ;   114     1072h               +1C8h
    .dw #_Dummy_EI              ;   115     1073h               +1CCh
    .dw #_Dummy_EI              ;   116     1074h               +1D0h
    .dw #_Dummy_EI              ;   117     1075h               +1D4h
    .dw #_Dummy_EI              ;   118     1076h               +1D8h
    .dw #_Dummy_EI              ;   119     1077h               +1DCh
    .dw #_Dummy_EI              ;   120     1078h               +1E0h
    .dw #_Dummy_EI              ;   121     1079h               +1E4h
    .dw #_Dummy_EI              ;   122     107Ah               +1E8h
    .dw #_Dummy_EI              ;   123     107Bh               +1ECh
    .dw #_Dummy_EI              ;   124     107Ch               +1F0h
    .dw #_Dummy_EI              ;   125     107Dh               +1F4h
    .dw #_Dummy_EI              ;   126     107Eh               +1F8h
    .dw #_Dummy_EI              ;   127     107Fh               +1FCh
    .dw #_Dummy_EI              ;   128     1080h               +200h
    .dw #_Dummy_EI              ;   129     1081h               +204h
    .dw #_Dummy_EI              ;   130     1082h               +208h
    .dw #_Dummy_EI              ;   131     1083h               +20Ch
    .dw #_Dummy_EI              ;   132     1084h               +210h
    .dw #_Dummy_EI              ;   133     1085h               +214h
    .dw #_Dummy_EI              ;   134     1086h               +218h
    .dw #_Dummy_EI              ;   135     1087h               +21Ch
    .dw #_Dummy_EI              ;   136     1088h               +220h
    .dw #_Dummy_EI              ;   137     1089h               +224h
    .dw #_Dummy_EI              ;   138     108Ah               +228h
    .dw #_Dummy_EI              ;   139     108Bh               +22Ch
    .dw #_Dummy_EI              ;   140     108Ch               +230h
    .dw #_Dummy_EI              ;   141     108Dh               +234h
    .dw #_Dummy_EI              ;   142     108Eh               +238h
    .dw #_Dummy_EI              ;   143     108Fh               +23Ch
    .dw #_Dummy_EI              ;   144     1090h               +240h
    .dw #_Dummy_EI              ;   145     1091h               +244h
    .dw #_Dummy_EI              ;   146     1092h               +248h
    .dw #_Dummy_EI              ;   147     1093h               +24Ch
    .dw #_Dummy_EI              ;   148     1094h               +250h
    .dw #_Dummy_EI              ;   149     1095h               +254h
    .dw #_Dummy_EI              ;   150     1096h               +258h
    .dw #_Dummy_EI              ;   151     1097h               +25Ch
    .dw #_Dummy_EI              ;   152     1098h               +260h
    .dw #_Dummy_EI              ;   153     1099h               +264h
    .dw #_Dummy_EI              ;   154     109Ah               +268h
    .dw #_Dummy_EI              ;   155     109Bh               +26Ch
    .dw #_Dummy_EI              ;   156     109Ch               +270h
    .dw #_Dummy_EI              ;   157     109Dh               +274h
    .dw #_Dummy_EI              ;   158     109Eh               +278h
    .dw #_Dummy_EI              ;   159     109Fh               +27Ch
    .dw #_Dummy_EI              ;   160     10A0h               +280h
    .dw #_Dummy_EI              ;   161     10A1h               +284h
    .dw #_Dummy_EI              ;   162     10A2h               +288h
    .dw #_Dummy_EI              ;   163     10A3h               +28Ch
    .dw #_Dummy_EI              ;   164     10A4h               +290h
    .dw #_Dummy_EI              ;   165     10A5h               +294h
    .dw #_Dummy_EI              ;   166     10A6h               +298h
    .dw #_Dummy_EI              ;   167     10A7h               +29Ch
    .dw #_Dummy_EI              ;   168     10A8h               +2A0h
    .dw #_Dummy_EI              ;   169     10A9h               +2A4h
    .dw #_Dummy_EI              ;   170     10AAh               +2A8h
    .dw #_Dummy_EI              ;   171     10ABh               +2ACh
    .dw #_Dummy_EI              ;   172     10ACh               +2B0h
    .dw #_Dummy_EI              ;   173     10ADh               +2B4h
    .dw #_Dummy_EI              ;   174     10AEh               +2B8h
    .dw #_Dummy_EI              ;   175     10AFh               +2BCh
    .dw #_Dummy_EI              ;   176     10B0h               +2C0h
    .dw #_Dummy_EI              ;   177     10B1h               +2C4h
    .dw #_Dummy_EI              ;   178     10B2h               +2C8h
    .dw #_Dummy_EI              ;   179     10B3h               +2CCh
    .dw #_Dummy_EI              ;   180     10B4h               +2D0h
    .dw #_Dummy_EI              ;   181     10B5h               +2D4h
    .dw #_Dummy_EI              ;   182     10B6h               +2D8h
    .dw #_Dummy_EI              ;   183     10B7h               +2DCh
    .dw #_Dummy_EI              ;   184     10B8h               +2E0h
    .dw #_Dummy_EI              ;   185     10B9h               +2E4h
    .dw #_Dummy_EI              ;   186     10BAh               +2E8h
    .dw #_Dummy_EI              ;   187     10BBh               +2ECh
    .dw #_Dummy_EI              ;   188     10BCh               +2F0h
    .dw #_Dummy_EI              ;   189     10BDh               +2F4h
    .dw #_Dummy_EI              ;   190     10BEh               +2F8h
    .dw #_Dummy_EI              ;   191     10BFh               +2FCh
    .dw #_Dummy_EI              ;   192     10C0h               +300h
    .dw #_Dummy_EI              ;   193     10C1h               +304h
    .dw #_Dummy_EI              ;   194     10C2h               +308h
    .dw #_Dummy_EI              ;   195     10C3h               +30Ch
    .dw #_Dummy_EI              ;   196     10C4h               +310h
    .dw #_Dummy_EI              ;   197     10C5h               +314h
    .dw #_Dummy_EI              ;   198     10C6h               +318h
    .dw #_Dummy_EI              ;   199     10C7h               +31Ch
    .dw #_Dummy_EI              ;   200     10C8h               +320h
    .dw #_Dummy_EI              ;   201     10C9h               +324h
    .dw #_Dummy_EI              ;   202     10CAh               +328h
    .dw #_Dummy_EI              ;   203     10CBh               +32Ch
    .dw #_Dummy_EI              ;   204     10CCh               +330h
    .dw #_Dummy_EI              ;   205     10CDh               +334h
    .dw #_Dummy_EI              ;   206     10CEh               +338h
    .dw #_Dummy_EI              ;   207     10CFh               +33Ch
    .dw #_Dummy_EI              ;   208     10D0h               +340h
    .dw #_Dummy_EI              ;   209     10D1h               +344h
    .dw #_Dummy_EI              ;   210     10D2h               +348h
    .dw #_Dummy_EI              ;   211     10D3h               +34Ch
    .dw #_Dummy_EI              ;   212     10D4h               +350h
    .dw #_Dummy_EI              ;   213     10D5h               +354h
    .dw #_Dummy_EI              ;   214     10D6h               +358h
    .dw #_Dummy_EI              ;   215     10D7h               +35Ch
    .dw #_Dummy_EI              ;   216     10D8h               +360h
    .dw #_Dummy_EI              ;   217     10D9h               +364h
    .dw #_Dummy_EI              ;   218     10DAh               +368h
    .dw #_Dummy_EI              ;   219     10DBh               +36Ch
    .dw #_Dummy_EI              ;   220     10DCh               +370h
    .dw #_Dummy_EI              ;   221     10DDh               +374h
    .dw #_Dummy_EI              ;   222     10DEh               +378h
    .dw #_Dummy_EI              ;   223     10DFh               +37Ch
    .dw #_Dummy_EI              ;   224     10E0h               +380h
    .dw #_Dummy_EI              ;   225     10E1h               +384h
    .dw #_Dummy_EI              ;   226     10E2h               +388h
    .dw #_Dummy_EI              ;   227     10E3h               +38Ch
    .dw #_Dummy_EI              ;   228     10E4h               +390h
    .dw #_Dummy_EI              ;   229     10E5h               +394h
    .dw #_Dummy_EI              ;   230     10E6h               +398h
    .dw #_Dummy_EI              ;   231     10E7h               +39Ch
    .dw #_Dummy_EI              ;   232     10E8h               +3A0h
    .dw #_Dummy_EI              ;   233     10E9h               +3A4h
    .dw #_Dummy_EI              ;   234     10EAh               +3A8h
    .dw #_Dummy_EI              ;   235     10EBh               +3ACh
    .dw #_Dummy_EI              ;   236     10ECh               +3B0h
    .dw #_Dummy_EI              ;   237     10EDh               +3B4h
    .dw #_Dummy_EI              ;   238     10EEh               +3B8h
    .dw #_Dummy_EI              ;   239     10EFh               +3BCh
    .dw #_Dummy_EI              ;   240     10F0h               +3C0h
    .dw #_Dummy_EI              ;   241     10F1h               +3C4h
    .dw #_Dummy_EI              ;   242     10F2h               +3C8h
    .dw #_Dummy_EI              ;   243     10F3h               +3CCh
    .dw #_Dummy_EI              ;   244     10F4h               +3D0h
    .dw #_Dummy_EI              ;   245     10F5h               +3D4h
    .dw #_Dummy_EI              ;   246     10F6h               +3D8h
    .dw #_Dummy_EI              ;   247     10F7h               +3DCh
    .dw #_Dummy_EI              ;   248     10F8h               +3E0h
    .dw #_Dummy_EI              ;   249     10F9h               +3E4h
    .dw #_Dummy_EI              ;   250     10FAh               +3E8h
    .dw #_Dummy_EI              ;   251     10FBh               +3ECh
    .dw #_Dummy_EI              ;   252     10FCh               +3F0h
    .dw #_Dummy_EI              ;   253     10FDh               +3F4h
    .dw #_Dummy_EI              ;   254     10FEh               +3F8h
    .dw #_Dummy_EI              ;   255     10FFh               +3FCh
    .dw #_Dummy_EI              ;   256     1100h               +400h
    .dw #_Dummy_EI              ;   257     1101h               +404h
    .dw #_Dummy_EI              ;   258     1102h               +408h
    .dw #_Dummy_EI              ;   259     1103h               +40Ch
    .dw #_Dummy_EI              ;   260     1104h               +410h
    .dw #_Dummy_EI              ;   261     1105h               +414h
    .dw #_Dummy_EI              ;   262     1106h               +418h
    .dw #_Dummy_EI              ;   263     1107h               +41Ch
    .dw #_Dummy_EI              ;   264     1108h               +420h
    .dw #_Dummy_EI              ;   265     1109h               +424h
    .dw #_Dummy_EI              ;   266     110Ah               +428h
    .dw #_Dummy_EI              ;   267     110Bh               +42Ch
    .dw #_Dummy_EI              ;   268     110Ch               +430h
    .dw #_Dummy_EI              ;   269     110Dh               +434h
    .dw #_Dummy_EI              ;   270     110Eh               +438h
    .dw #_Dummy_EI              ;   271     110Fh               +43Ch
    .dw #_Dummy_EI              ;   272     1110h               +440h
    .dw #_Dummy_EI              ;   273     1111h               +444h
    .dw #_Dummy_EI              ;   274     1112h               +448h
    .dw #_Dummy_EI              ;   275     1113h               +44Ch
    .dw #_Dummy_EI              ;   276     1114h               +450h
    .dw #_Dummy_EI              ;   277     1115h               +454h
    .dw #_Dummy_EI              ;   278     1116h               +458h
    .dw #_Dummy_EI              ;   279     1117h               +45Ch
    .dw #_Dummy_EI              ;   280     1118h               +460h
    .dw #_Dummy_EI              ;   281     1119h               +464h
    .dw #_Dummy_EI              ;   282     111Ah               +468h
    .dw #_Dummy_EI              ;   283     111Bh               +46Ch
    .dw #_Dummy_EI              ;   284     111Ch               +470h
    .dw #_Dummy_EI              ;   285     111Dh               +474h
    .dw #_Dummy_EI              ;   286     111Eh               +478h
    .dw #_Dummy_EI              ;   287     111Fh               +47Ch
    .dw #_Dummy_EI              ;   288     1120h               +480h
    .dw #_Dummy_EI              ;   289     1121h               +484h
    .dw #_Dummy_EI              ;   290     1122h               +488h
    .dw #_Dummy_EI              ;   291     1123h               +48Ch
    .dw #_Dummy_EI              ;   292     1124h               +490h
    .dw #_Dummy_EI              ;   293     1125h               +494h
    .dw #_Dummy_EI              ;   294     1126h               +498h
    .dw #_Dummy_EI              ;   295     1127h               +49Ch
    .dw #_Dummy_EI              ;   296     1128h               +4A0h
    .dw #_Dummy_EI              ;   297     1129h               +4A4h
    .dw #_Dummy_EI              ;   298     112Ah               +4A8h
    .dw #_Dummy_EI              ;   299     112Bh               +4ACh
    .dw #_Dummy_EI              ;   300     112Ch               +4B0h
    .dw #_Dummy_EI              ;   301     112Dh               +4B4h
    .dw #_Dummy_EI              ;   302     112Eh               +4B8h
    .dw #_Dummy_EI              ;   303     112Fh               +4BCh
    .dw #_Dummy_EI              ;   304     1130h               +4C0h
    .dw #_Dummy_EI              ;   305     1131h               +4C4h
    .dw #_Dummy_EI              ;   306     1132h               +4C8h
    .dw #_Dummy_EI              ;   307     1133h               +4CCh
    .dw #_Dummy_EI              ;   308     1134h               +4D0h
    .dw #_Dummy_EI              ;   309     1135h               +4D4h
    .dw #_Dummy_EI              ;   310     1136h               +4D8h
    .dw #_Dummy_EI              ;   311     1137h               +4DCh
    .dw #_Dummy_EI              ;   312     1138h               +4E0h
    .dw #_Dummy_EI              ;   313     1139h               +4E4h
    .dw #_Dummy_EI              ;   314     113Ah               +4E8h
    .dw #_Dummy_EI              ;   315     113Bh               +4ECh
    .dw #_Dummy_EI              ;   316     113Ch               +4F0h
    .dw #_Dummy_EI              ;   317     113Dh               +4F4h
    .dw #_Dummy_EI              ;   318     113Eh               +4F8h
    .dw #_Dummy_EI              ;   319     113Fh               +4FCh
    .dw #_Dummy_EI              ;   320     1140h               +500h
    .dw #_Dummy_EI              ;   321     1141h               +504h
    .dw #_Dummy_EI              ;   322     1142h               +508h
    .dw #_Dummy_EI              ;   323     1143h               +50Ch
    .dw #_Dummy_EI              ;   324     1144h               +510h
    .dw #_Dummy_EI              ;   325     1145h               +514h
    .dw #_Dummy_EI              ;   326     1146h               +518h
    .dw #_Dummy_EI              ;   327     1147h               +51Ch
    .dw #_Dummy_EI              ;   328     1148h               +520h
    .dw #_Dummy_EI              ;   329     1149h               +524h
    .dw #_Dummy_EI              ;   330     114Ah               +528h
    .dw #_Dummy_EI              ;   331     114Bh               +52Ch
    .dw #_Dummy_EI              ;   332     114Ch               +530h
    .dw #_Dummy_EI              ;   333     114Dh               +534h
    .dw #_Dummy_EI              ;   334     114Eh               +538h
    .dw #_Dummy_EI              ;   335     114Fh               +53Ch
    .dw #_Dummy_EI              ;   336     1150h               +540h
    .dw #_Dummy_EI              ;   337     1151h               +544h
    .dw #_Dummy_EI              ;   338     1152h               +548h
    .dw #_Dummy_EI              ;   339     1153h               +54Ch
    .dw #_Dummy_EI              ;   340     1154h               +550h
    .dw #_Dummy_EI              ;   341     1155h               +554h
    .dw #_Dummy_EI              ;   342     1156h               +558h
    .dw #_Dummy_EI              ;   343     1157h               +55Ch
    .dw #_Dummy_EI              ;   344     1158h               +560h
    .dw #_Dummy_EI              ;   345     1159h               +564h
    .dw #_Dummy_EI              ;   346     115Ah               +568h
    .dw #_Dummy_EI              ;   347     115Bh               +56Ch
    .dw #_Dummy_EI              ;   348     115Ch               +570h
    .dw #_Dummy_EI              ;   349     115Dh               +574h
    .dw #_Dummy_EI              ;   350     115Eh               +578h
    .dw #_Dummy_EI              ;   351     115Fh               +57Ch
    .dw #_Dummy_EI              ;   352     1160h               +580h
    .dw #_Dummy_EI              ;   353     1161h               +584h
    .dw #_Dummy_EI              ;   354     1162h               +588h
    .dw #_Dummy_EI              ;   355     1163h               +58Ch
    .dw #_Dummy_EI              ;   356     1164h               +590h
    .dw #_Dummy_EI              ;   357     1165h               +594h
    .dw #_Dummy_EI              ;   358     1166h               +598h
    .dw #_Dummy_EI              ;   359     1167h               +59Ch
    .dw #_Dummy_EI              ;   360     1168h               +5A0h
    .dw #_Dummy_EI              ;   361     1169h               +5A4h
    .dw #_Dummy_EI              ;   362     116Ah               +5A8h
    .dw #_Dummy_EI              ;   363     116Bh               +5ACh
    .dw #_Dummy_EI              ;   364     116Ch               +5B0h
    .dw #_Dummy_EI              ;   365     116Dh               +5B4h
    .dw #_Dummy_EI              ;   366     116Eh               +5B8h
    .dw #_Dummy_EI              ;   367     116Fh               +5BCh
    .dw #_Dummy_EI              ;   368     1170h               +5C0h
    .dw #_Dummy_EI              ;   369     1171h               +5C4h
    .dw #_Dummy_EI              ;   370     1172h               +5C8h
    .dw #_Dummy_EI              ;   371     1173h               +5CCh
    .dw #_Dummy_EI              ;   372     1174h               +5D0h
    .dw #_Dummy_EI              ;   373     1175h               +5D4h
    .dw #_Dummy_EI              ;   374     1176h               +5D8h
    .dw #_Dummy_EI              ;   375     1177h               +5DCh
    .dw #_Dummy_EI              ;   376     1178h               +5E0h
    .dw #_Dummy_EI              ;   377     1179h               +5E4h
    .dw #_Dummy_EI              ;   378     117Ah               +5E8h
    .dw #_Dummy_EI              ;   379     117Bh               +5ECh
    .dw #_Dummy_EI              ;   380     117Ch               +5F0h
    .dw #_Dummy_EI              ;   381     117Dh               +5F4h
    .dw #_Dummy_EI              ;   382     117Eh               +5F8h
    .dw #_Dummy_EI              ;   383     117Fh               +5FCh
    .dw #_Dummy_EI              ;   384     1180h               +600h
    .dw #_Dummy_EI              ;   385     1181h               +604h
    .dw #_Dummy_EI              ;   386     1182h               +608h
    .dw #_Dummy_EI              ;   387     1183h               +60Ch
    .dw #_Dummy_EI              ;   388     1184h               +610h
    .dw #_Dummy_EI              ;   389     1185h               +614h
    .dw #_Dummy_EI              ;   390     1186h               +618h
    .dw #_Dummy_EI              ;   391     1187h               +61Ch
    .dw #_Dummy_EI              ;   392     1188h               +620h
    .dw #_Dummy_EI              ;   393     1189h               +624h
    .dw #_Dummy_EI              ;   394     118Ah               +628h
    .dw #_Dummy_EI              ;   395     118Bh               +62Ch
    .dw #_Dummy_EI              ;   396     118Ch               +630h
    .dw #_Dummy_EI              ;   397     118Dh               +634h
    .dw #_Dummy_EI              ;   398     118Eh               +638h
    .dw #_Dummy_EI              ;   399     118Fh               +63Ch
    .dw #_Dummy_EI              ;   400     1190h               +640h
    .dw #_Dummy_EI              ;   401     1191h               +644h
    .dw #_Dummy_EI              ;   402     1192h               +648h
    .dw #_Dummy_EI              ;   403     1193h               +64Ch
    .dw #_Dummy_EI              ;   404     1194h               +650h
    .dw #_Dummy_EI              ;   405     1195h               +654h
    .dw #_Dummy_EI              ;   406     1196h               +658h
    .dw #_Dummy_EI              ;   407     1197h               +65Ch
    .dw #_Dummy_EI              ;   408     1198h               +660h
    .dw #_Dummy_EI              ;   409     1199h               +664h
    .dw #_Dummy_EI              ;   410     119Ah               +668h
    .dw #_Dummy_EI              ;   411     119Bh               +66Ch
    .dw #_Dummy_EI              ;   412     119Ch               +670h
    .dw #_Dummy_EI              ;   413     119Dh               +674h
    .dw #_Dummy_EI              ;   414     119Eh               +678h
    .dw #_Dummy_EI              ;   415     119Fh               +67Ch
    .dw #_Dummy_EI              ;   416     11A0h               +680h
    .dw #_Dummy_EI              ;   417     11A1h               +684h
    .dw #_Dummy_EI              ;   418     11A2h               +688h
    .dw #_Dummy_EI              ;   419     11A3h               +68Ch
    .dw #_Dummy_EI              ;   420     11A4h               +690h
    .dw #_Dummy_EI              ;   421     11A5h               +694h
    .dw #_Dummy_EI              ;   422     11A6h               +698h
    .dw #_Dummy_EI              ;   423     11A7h               +69Ch
    .dw #_Dummy_EI              ;   424     11A8h               +6A0h
    .dw #_Dummy_EI              ;   425     11A9h               +6A4h
    .dw #_Dummy_EI              ;   426     11AAh               +6A8h
    .dw #_Dummy_EI              ;   427     11ABh               +6ACh
    .dw #_Dummy_EI              ;   428     11ACh               +6B0h
    .dw #_Dummy_EI              ;   429     11ADh               +6B4h
    .dw #_Dummy_EI              ;   430     11AEh               +6B8h
    .dw #_Dummy_EI              ;   431     11AFh               +6BCh
    .dw #_Dummy_EI              ;   432     11B0h               +6C0h
    .dw #_Dummy_EI              ;   433     11B1h               +6C4h
    .dw #_Dummy_EI              ;   434     11B2h               +6C8h
    .dw #_Dummy_EI              ;   435     11B3h               +6CCh
    .dw #_Dummy_EI              ;   436     11B4h               +6D0h
    .dw #_Dummy_EI              ;   437     11B5h               +6D4h
    .dw #_Dummy_EI              ;   438     11B6h               +6D8h
    .dw #_Dummy_EI              ;   439     11B7h               +6DCh
    .dw #_Dummy_EI              ;   440     11B8h               +6E0h
    .dw #_Dummy_EI              ;   441     11B9h               +6E4h
    .dw #_Dummy_EI              ;   442     11BAh               +6E8h
    .dw #_Dummy_EI              ;   443     11BBh               +6ECh
    .dw #_Dummy_EI              ;   444     11BCh               +6F0h
    .dw #_Dummy_EI              ;   445     11BDh               +6F4h
    .dw #_Dummy_EI              ;   446     11BEh               +6F8h
    .dw #_Dummy_EI              ;   447     11BFh               +6FCh
    .dw #_Dummy_EI              ;   448     11C0h               +700h
    .dw #_Dummy_EI              ;   449     11C1h               +704h
    .dw #_Dummy_EI              ;   450     11C2h               +708h
    .dw #_Dummy_EI              ;   451     11C3h               +70Ch
    .dw #_Dummy_EI              ;   452     11C4h               +710h
    .dw #_Dummy_EI              ;   453     11C5h               +714h
    .dw #_Dummy_EI              ;   454     11C6h               +718h
    .dw #_Dummy_EI              ;   455     11C7h               +71Ch
    .dw #_Dummy_EI              ;   456     11C8h               +720h
    .dw #_Dummy_EI              ;   457     11C9h               +724h
    .dw #_Dummy_EI              ;   458     11CAh               +728h
    .dw #_Dummy_EI              ;   459     11CBh               +72Ch
    .dw #_Dummy_EI              ;   460     11CCh               +730h
    .dw #_Dummy_EI              ;   461     11CDh               +734h
    .dw #_Dummy_EI              ;   462     11CEh               +738h
    .dw #_Dummy_EI              ;   463     11CFh               +73Ch
    .dw #_Dummy_EI              ;   464     11D0h               +740h
    .dw #_Dummy_EI              ;   465     11D1h               +744h
    .dw #_Dummy_EI              ;   466     11D2h               +748h
    .dw #_Dummy_EI              ;   467     11D3h               +74Ch
    .dw #_Dummy_EI              ;   468     11D4h               +750h
    .dw #_Dummy_EI              ;   469     11D5h               +754h
    .dw #_Dummy_EI              ;   470     11D6h               +758h
    .dw #_Dummy_EI              ;   471     11D7h               +75Ch
    .dw #_Dummy_EI              ;   472     11D8h               +760h
    .dw #_Dummy_EI              ;   473     11D9h               +764h
    .dw #_Dummy_EI              ;   474     11DAh               +768h
    .dw #_Dummy_EI              ;   475     11DBh               +76Ch
    .dw #_Dummy_EI              ;   476     11DCh               +770h
    .dw #_Dummy_EI              ;   477     11DDh               +774h
    .dw #_Dummy_EI              ;   478     11DEh               +778h
    .dw #_Dummy_EI              ;   479     11DFh               +77Ch
    .dw #_Dummy_EI              ;   480     11E0h               +780h
    .dw #_Dummy_EI              ;   481     11E1h               +784h
    .dw #_Dummy_EI              ;   482     11E2h               +788h
    .dw #_Dummy_EI              ;   483     11E3h               +78Ch
    .dw #_Dummy_EI              ;   484     11E4h               +790h
    .dw #_Dummy_EI              ;   485     11E5h               +794h
    .dw #_Dummy_EI              ;   486     11E6h               +798h
    .dw #_Dummy_EI              ;   487     11E7h               +79Ch
    .dw #_Dummy_EI              ;   488     11E8h               +7A0h
    .dw #_Dummy_EI              ;   489     11E9h               +7A4h
    .dw #_Dummy_EI              ;   490     11EAh               +7A8h
    .dw #_Dummy_EI              ;   491     11EBh               +7ACh
    .dw #_Dummy_EI              ;   492     11ECh               +7B0h
    .dw #_Dummy_EI              ;   493     11EDh               +7B4h
    .dw #_Dummy_EI              ;   494     11EEh               +7B8h
    .dw #_Dummy_EI              ;   495     11EFh               +7BCh
    .dw #_Dummy_EI              ;   496     11F0h               +7C0h
    .dw #_Dummy_EI              ;   497     11F1h               +7C4h
    .dw #_Dummy_EI              ;   498     11F2h               +7C8h
    .dw #_Dummy_EI              ;   499     11F3h               +7CCh
    .dw #_Dummy_EI              ;   500     11F4h               +7D0h
    .dw #_Dummy_EI              ;   501     11F5h               +7D4h
    .dw #_Dummy_EI              ;   502     11F6h               +7D8h
    .dw #_Dummy_EI              ;   503     11F7h               +7DCh
    .dw #_Dummy_EI              ;   504     11F8h               +7E0h
    .dw #_Dummy_EI              ;   505     11F9h               +7E4h
    .dw #_Dummy_EI              ;   506     11FAh               +7E8h
    .dw #_Dummy_EI              ;   507     11FBh               +7ECh
    .dw #_Dummy_EI              ;   508     11FCh               +7F0h
    .dw #_Dummy_EI              ;   509     11FDh               +7F4h
    .dw #_Dummy_EI              ;   510     11FEh               +7F8h
    .dw #_Dummy_EI              ;   511     11FFh               +7FCh
    .dw #_Dummy_EI              ;   512     1200h               +800h
    .dw #_Dummy_EI              ;   513     1201h               +804h
    .dw #_Dummy_EI              ;   514     1202h               +808h
    .dw #_Dummy_EI              ;   515     1203h               +80Ch
    .dw #_Dummy_EI              ;   516     1204h               +810h
    .dw #_Dummy_EI              ;   517     1205h               +814h
    .dw #_Dummy_EI              ;   518     1206h               +818h
    .dw #_Dummy_EI              ;   519     1207h               +81Ch
    .dw #_Dummy_EI              ;   520     1208h               +820h
    .dw #_Dummy_EI              ;   521     1209h               +824h
    .dw #_Dummy_EI              ;   522     120Ah               +828h
    .dw #_Dummy_EI              ;   523     120Bh               +82Ch
    .dw #_Dummy_EI              ;   524     120Ch               +830h
    .dw #_Dummy_EI              ;   525     120Dh               +834h
    .dw #_Dummy_EI              ;   526     120Eh               +838h
    .dw #_Dummy_EI              ;   527     120Fh               +83Ch
    .dw #_Dummy_EI              ;   528     1210h               +840h
    .dw #_Dummy_EI              ;   529     1211h               +844h
    .dw #_Dummy_EI              ;   530     1212h               +848h
    .dw #_Dummy_EI              ;   531     1213h               +84Ch
    .dw #_Dummy_EI              ;   532     1214h               +850h
    .dw #_Dummy_EI              ;   533     1215h               +854h
    .dw #_Dummy_EI              ;   534     1216h               +858h
    .dw #_Dummy_EI              ;   535     1217h               +85Ch
    .dw #_Dummy_EI              ;   536     1218h               +860h
    .dw #_Dummy_EI              ;   537     1219h               +864h
    .dw #_Dummy_EI              ;   538     121Ah               +868h
    .dw #_Dummy_EI              ;   539     121Bh               +86Ch
    .dw #_Dummy_EI              ;   540     121Ch               +870h
    .dw #_Dummy_EI              ;   541     121Dh               +874h
    .dw #_Dummy_EI              ;   542     121Eh               +878h
    .dw #_Dummy_EI              ;   543     121Fh               +87Ch
    .dw #_Dummy_EI              ;   544     1220h               +880h
    .dw #_Dummy_EI              ;   545     1221h               +884h
    .dw #_Dummy_EI              ;   546     1222h               +888h
    .dw #_Dummy_EI              ;   547     1223h               +88Ch
    .dw #_Dummy_EI              ;   548     1224h               +890h
    .dw #_Dummy_EI              ;   549     1225h               +894h
    .dw #_Dummy_EI              ;   550     1226h               +898h
    .dw #_Dummy_EI              ;   551     1227h               +89Ch
    .dw #_Dummy_EI              ;   552     1228h               +8A0h
    .dw #_Dummy_EI              ;   553     1229h               +8A4h
    .dw #_Dummy_EI              ;   554     122Ah               +8A8h
    .dw #_Dummy_EI              ;   555     122Bh               +8ACh
    .dw #_Dummy_EI              ;   556     122Ch               +8B0h
    .dw #_Dummy_EI              ;   557     122Dh               +8B4h
    .dw #_Dummy_EI              ;   558     122Eh               +8B8h
    .dw #_Dummy_EI              ;   559     122Fh               +8BCh
    .dw #_Dummy_EI              ;   560     1230h               +8C0h
    .dw #_Dummy_EI              ;   561     1231h               +8C4h
    .dw #_Dummy_EI              ;   562     1232h               +8C8h
    .dw #_Dummy_EI              ;   563     1233h               +8CCh
    .dw #_Dummy_EI              ;   564     1234h               +8D0h
    .dw #_Dummy_EI              ;   565     1235h               +8D4h
    .dw #_Dummy_EI              ;   566     1236h               +8D8h
    .dw #_Dummy_EI              ;   567     1237h               +8DCh
    .dw #_Dummy_EI              ;   568     1238h               +8E0h
    .dw #_Dummy_EI              ;   569     1239h               +8E4h
    .dw #_Dummy_EI              ;   570     123Ah               +8E8h
    .dw #_Dummy_EI              ;   571     123Bh               +8ECh
    .dw #_Dummy_EI              ;   572     123Ch               +8F0h
    .dw #_Dummy_EI              ;   573     123Dh               +8F4h
    .dw #_Dummy_EI              ;   574     123Eh               +8F8h
    .dw #_Dummy_EI              ;   575     123Fh               +8FCh
    .dw #_Dummy_EI              ;   576     1240h               +900h
    .dw #_Dummy_EI              ;   577     1241h               +904h
    .dw #_Dummy_EI              ;   578     1242h               +908h
    .dw #_Dummy_EI              ;   579     1243h               +90Ch
    .dw #_Dummy_EI              ;   580     1244h               +910h
    .dw #_Dummy_EI              ;   581     1245h               +914h
    .dw #_Dummy_EI              ;   582     1246h               +918h
    .dw #_Dummy_EI              ;   583     1247h               +91Ch
    .dw #_Dummy_EI              ;   584     1248h               +920h
    .dw #_Dummy_EI              ;   585     1249h               +924h
    .dw #_Dummy_EI              ;   586     124Ah               +928h
    .dw #_Dummy_EI              ;   587     124Bh               +92Ch
    .dw #_Dummy_EI              ;   588     124Ch               +930h
    .dw #_Dummy_EI              ;   589     124Dh               +934h
    .dw #_Dummy_EI              ;   590     124Eh               +938h
    .dw #_Dummy_EI              ;   591     124Fh               +93Ch
    .dw #_Dummy_EI              ;   592     1250h               +940h
    .dw #_Dummy_EI              ;   593     1251h               +944h
    .dw #_Dummy_EI              ;   594     1252h               +948h
    .dw #_Dummy_EI              ;   595     1253h               +94Ch
    .dw #_Dummy_EI              ;   596     1254h               +950h
    .dw #_Dummy_EI              ;   597     1255h               +954h
    .dw #_Dummy_EI              ;   598     1256h               +958h
    .dw #_Dummy_EI              ;   599     1257h               +95Ch
    .dw #_Dummy_EI              ;   600     1258h               +960h
    .dw #_Dummy_EI              ;   601     1259h               +964h
    .dw #_Dummy_EI              ;   602     125Ah               +968h
    .dw #_Dummy_EI              ;   603     125Bh               +96Ch
    .dw #_Dummy_EI              ;   604     125Ch               +970h
    .dw #_Dummy_EI              ;   605     125Dh               +974h
    .dw #_Dummy_EI              ;   606     125Eh               +978h
    .dw #_Dummy_EI              ;   607     125Fh               +97Ch
    .dw #_Dummy_EI              ;   608     1260h               +980h
    .dw #_Dummy_EI              ;   609     1261h               +984h
    .dw #_Dummy_EI              ;   610     1262h               +988h
    .dw #_Dummy_EI              ;   611     1263h               +98Ch
    .dw #_Dummy_EI              ;   612     1264h               +990h
    .dw #_Dummy_EI              ;   613     1265h               +994h
    .dw #_Dummy_EI              ;   614     1266h               +998h
    .dw #_Dummy_EI              ;   615     1267h               +99Ch
    .dw #_Dummy_EI              ;   616     1268h               +9A0h
    .dw #_Dummy_EI              ;   617     1269h               +9A4h
    .dw #_Dummy_EI              ;   618     126Ah               +9A8h
    .dw #_Dummy_EI              ;   619     126Bh               +9ACh
    .dw #_Dummy_EI              ;   620     126Ch               +9B0h
    .dw #_Dummy_EI              ;   621     126Dh               +9B4h
    .dw #_Dummy_EI              ;   622     126Eh               +9B8h
    .dw #_Dummy_EI              ;   623     126Fh               +9BCh
    .dw #_Dummy_EI              ;   624     1270h               +9C0h
    .dw #_Dummy_EI              ;   625     1271h               +9C4h
    .dw #_Dummy_EI              ;   626     1272h               +9C8h
    .dw #_Dummy_EI              ;   627     1273h               +9CCh
    .dw #_Dummy_EI              ;   628     1274h               +9D0h
    .dw #_Dummy_EI              ;   629     1275h               +9D4h
    .dw #_Dummy_EI              ;   630     1276h               +9D8h
    .dw #_Dummy_EI              ;   631     1277h               +9DCh
    .dw #_Dummy_EI              ;   632     1278h               +9E0h
    .dw #_Dummy_EI              ;   633     1279h               +9E4h
    .dw #_Dummy_EI              ;   634     127Ah               +9E8h
    .dw #_Dummy_EI              ;   635     127Bh               +9ECh
    .dw #_Dummy_EI              ;   636     127Ch               +9F0h
    .dw #_Dummy_EI              ;   637     127Dh               +9F4h
    .dw #_Dummy_EI              ;   638     127Eh               +9F8h
    .dw #_Dummy_EI              ;   639     127Fh               +9FCh
    .dw #_Dummy_EI              ;   640     1280h               +A00h
    .dw #_Dummy_EI              ;   641     1281h               +A04h
    .dw #_Dummy_EI              ;   642     1282h               +A08h
    .dw #_Dummy_EI              ;   643     1283h               +A0Ch
    .dw #_Dummy_EI              ;   644     1284h               +A10h
    .dw #_Dummy_EI              ;   645     1285h               +A14h
    .dw #_Dummy_EI              ;   646     1286h               +A18h
    .dw #_Dummy_EI              ;   647     1287h               +A1Ch
    .dw #_Dummy_EI              ;   648     1288h               +A20h
    .dw #_Dummy_EI              ;   649     1289h               +A24h
    .dw #_Dummy_EI              ;   650     128Ah               +A28h
    .dw #_Dummy_EI              ;   651     128Bh               +A2Ch
    .dw #_Dummy_EI              ;   652     128Ch               +A30h
    .dw #_Dummy_EI              ;   653     128Dh               +A34h
    .dw #_Dummy_EI              ;   654     128Eh               +A38h
    .dw #_Dummy_EI              ;   655     128Fh               +A3Ch
    .dw #_Dummy_EI              ;   656     1290h               +A40h
    .dw #_Dummy_EI              ;   657     1291h               +A44h
    .dw #_Dummy_EI              ;   658     1292h               +A48h
    .dw #_Dummy_EI              ;   659     1293h               +A4Ch
    .dw #_Dummy_EI              ;   660     1294h               +A50h
    .dw #_Dummy_EI              ;   661     1295h               +A54h
    .dw #_Dummy_EI              ;   662     1296h               +A58h
    .dw #_Dummy_EI              ;   663     1297h               +A5Ch
    .dw #_Dummy_EI              ;   664     1298h               +A60h
    .dw #_Dummy_EI              ;   665     1299h               +A64h
    .dw #_Dummy_EI              ;   666     129Ah               +A68h
    .dw #_Dummy_EI              ;   667     129Bh               +A6Ch
    .dw #_Dummy_EI              ;   668     129Ch               +A70h
    .dw #_Dummy_EI              ;   669     129Dh               +A74h
    .dw #_Dummy_EI              ;   670     129Eh               +A78h
    .dw #_Dummy_EI              ;   671     129Fh               +A7Ch
    .dw #_Dummy_EI              ;   672     12A0h               +A80h
    .dw #_Dummy_EI              ;   673     12A1h               +A84h
    .dw #_Dummy_EI              ;   674     12A2h               +A88h
    .dw #_Dummy_EI              ;   675     12A3h               +A8Ch
    .dw #_Dummy_EI              ;   676     12A4h               +A90h
    .dw #_Dummy_EI              ;   677     12A5h               +A94h
    .dw #_Dummy_EI              ;   678     12A6h               +A98h
    .dw #_Dummy_EI              ;   679     12A7h               +A9Ch
    .dw #_Dummy_EI              ;   680     12A8h               +AA0h
    .dw #_Dummy_EI              ;   681     12A9h               +AA4h
    .dw #_Dummy_EI              ;   682     12AAh               +AA8h
    .dw #_Dummy_EI              ;   683     12ABh               +AACh
    .dw #_Dummy_EI              ;   684     12ACh               +AB0h
    .dw #_Dummy_EI              ;   685     12ADh               +AB4h
    .dw #_Dummy_EI              ;   686     12AEh               +AB8h
    .dw #_Dummy_EI              ;   687     12AFh               +ABCh
    .dw #_Dummy_EI              ;   688     12B0h               +AC0h
    .dw #_Dummy_EI              ;   689     12B1h               +AC4h
    .dw #_Dummy_EI              ;   690     12B2h               +AC8h
    .dw #_Dummy_EI              ;   691     12B3h               +ACCh
    .dw #_Dummy_EI              ;   692     12B4h               +AD0h
    .dw #_Dummy_EI              ;   693     12B5h               +AD4h
    .dw #_Dummy_EI              ;   694     12B6h               +AD8h
    .dw #_Dummy_EI              ;   695     12B7h               +ADCh
    .dw #_Dummy_EI              ;   696     12B8h               +AE0h
    .dw #_Dummy_EI              ;   697     12B9h               +AE4h
    .dw #_Dummy_EI              ;   698     12BAh               +AE8h
    .dw #_Dummy_EI              ;   699     12BBh               +AECh
    .dw #_Dummy_EI              ;   700     12BCh               +AF0h
    .dw #_Dummy_EI              ;   701     12BDh               +AF4h
    .dw #_Dummy_EI              ;   702     12BEh               +AF8h
    .dw #_Dummy_EI              ;   703     12BFh               +AFCh
    .dw #_Dummy_EI              ;   704     12C0h               +B00h
    .dw #_Dummy_EI              ;   705     12C1h               +B04h
    .dw #_Dummy_EI              ;   706     12C2h               +B08h
    .dw #_Dummy_EI              ;   707     12C3h               +B0Ch
    .dw #_Dummy_EI              ;   708     12C4h               +B10h
    .dw #_Dummy_EI              ;   709     12C5h               +B14h
    .dw #_Dummy_EI              ;   710     12C6h               +B18h
    .dw #_Dummy_EI              ;   711     12C7h               +B1Ch
    .dw #_Dummy_EI              ;   712     12C8h               +B20h
    .dw #_Dummy_EI              ;   713     12C9h               +B24h
    .dw #_Dummy_EI              ;   714     12CAh               +B28h
    .dw #_Dummy_EI              ;   715     12CBh               +B2Ch
    .dw #_Dummy_EI              ;   716     12CCh               +B30h
    .dw #_Dummy_EI              ;   717     12CDh               +B34h
    .dw #_Dummy_EI              ;   718     12CEh               +B38h
    .dw #_Dummy_EI              ;   719     12CFh               +B3Ch
    .dw #_Dummy_EI              ;   720     12D0h               +B40h
    .dw #_Dummy_EI              ;   721     12D1h               +B44h
    .dw #_Dummy_EI              ;   722     12D2h               +B48h
    .dw #_Dummy_EI              ;   723     12D3h               +B4Ch
    .dw #_Dummy_EI              ;   724     12D4h               +B50h
    .dw #_Dummy_EI              ;   725     12D5h               +B54h
    .dw #_Dummy_EI              ;   726     12D6h               +B58h
    .dw #_Dummy_EI              ;   727     12D7h               +B5Ch
    .dw #_Dummy_EI              ;   728     12D8h               +B60h
    .dw #_Dummy_EI              ;   729     12D9h               +B64h
    .dw #_Dummy_EI              ;   730     12DAh               +B68h
    .dw #_Dummy_EI              ;   731     12DBh               +B6Ch
    .dw #_Dummy_EI              ;   732     12DCh               +B70h
    .dw #_Dummy_EI              ;   733     12DDh               +B74h
    .dw #_Dummy_EI              ;   734     12DEh               +B78h
    .dw #_Dummy_EI              ;   735     12DFh               +B7Ch
    .dw #_Dummy_EI              ;   736     12E0h               +B80h
    .dw #_Dummy_EI              ;   737     12E1h               +B84h
    .dw #_Dummy_EI              ;   738     12E2h               +B88h
    .dw #_Dummy_EI              ;   739     12E3h               +B8Ch
    .dw #_Dummy_EI              ;   740     12E4h               +B90h
    .dw #_Dummy_EI              ;   741     12E5h               +B94h
    .dw #_Dummy_EI              ;   742     12E6h               +B98h
    .dw #_Dummy_EI              ;   743     12E7h               +B9Ch
    .dw #_Dummy_EI              ;   744     12E8h               +BA0h
    .dw #_Dummy_EI              ;   745     12E9h               +BA4h
    .dw #_Dummy_EI              ;   746     12EAh               +BA8h
    .dw #_Dummy_EI              ;   747     12EBh               +BACh
    .dw #_Dummy_EI              ;   748     12ECh               +BB0h
    .dw #_Dummy_EI              ;   749     12EDh               +BB4h
    .dw #_Dummy_EI              ;   750     12EEh               +BB8h
    .dw #_Dummy_EI              ;   751     12EFh               +BBCh
    .dw #_Dummy_EI              ;   752     12F0h               +BC0h
    .dw #_Dummy_EI              ;   753     12F1h               +BC4h
    .dw #_Dummy_EI              ;   754     12F2h               +BC8h
    .dw #_Dummy_EI              ;   755     12F3h               +BCCh
    .dw #_Dummy_EI              ;   756     12F4h               +BD0h
    .dw #_Dummy_EI              ;   757     12F5h               +BD4h
    .dw #_Dummy_EI              ;   758     12F6h               +BD8h
    .dw #_Dummy_EI              ;   759     12F7h               +BDCh
    .dw #_Dummy_EI              ;   760     12F8h               +BE0h
    .dw #_Dummy_EI              ;   761     12F9h               +BE4h
    .dw #_Dummy_EI              ;   762     12FAh               +BE8h
    .dw #_Dummy_EI              ;   763     12FBh               +BECh
    .dw #_Dummy_EI              ;   764     12FCh               +BF0h
    .dw #_Dummy_EI              ;   765     12FDh               +BF4h
    .dw #_Dummy_EI              ;   766     12FEh               +BF8h
    .dw #_Dummy_EI              ;   767     12FFh               +BFCh

;-----------------------------------------------------------------------------
;   dummy interrupt function
;-----------------------------------------------------------------------------

    .section ".text", text
    .align  4
_Dummy:
    br    _Dummy

_Dummy_EI:
    br    _Dummy_EI

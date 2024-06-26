
;.CPU  TM56F1522


.code  

	BCF     $a,$3    ; 0000, 118A
	GOTO    _L11     ; 0001, 2811
	NOP              ; 0002,   --
	NOP              ; 0003,   --
	MOVWF   $7e      ; 0004, 00FE
	SWAPF   $3,$0    ; 0005, 0E03
	MOVWF   $7a      ; 0006, 00FA
	MOVF    $4,$0    ; 0007, 0804
	MOVWF   $7b      ; 0008, 00FB
	MOVF    $a,$0    ; 0009, 080A
	MOVWF   $7c      ; 000A, 00FC
	BCF     $3,$5    ; 000B, 1283
	BCF     $3,$6    ; 000C, 1303
	MOVF    $7f,$0   ; 000D, 087F
	MOVWF   $7d      ; 000E, 00FD
	BCF     $a,$3    ; 000F, 118A
	GOTO    _L3DE    ; 0010, 2BDE

.org 0x11 
_L11:
	BSF     $a,$3    ; 0011, 158A
	GOTO    _LB10    ; 0012, 2B10

.org 0x13 
_L13:
	BCF     $3,$6    ; 0013, 1303
	BTFSS   $6,$2    ; 0014, 1D06
	GOTO    _L19     ; 0015, 2819
	BSF     $3,$5    ; 0016, 1683
	BSF     $21,$0   ; 0017, 1421
	GOTO    _L1B     ; 0018, 281B

.org 0x19 
_L19:
	BSF     $3,$5    ; 0019, 1683
	BCF     $21,$0   ; 001A, 1021

.org 0x1B 
_L1B:
	BCF     $3,$5    ; 001B, 1283
	BTFSC   $5,$7    ; 001C, 1B85
	GOTO    _L21     ; 001D, 2821
	BSF     $3,$5    ; 001E, 1683
	BSF     $21,$1   ; 001F, 14A1
	GOTO    _L23     ; 0020, 2823

.org 0x21 
_L21:
	BSF     $3,$5    ; 0021, 1683
	BCF     $21,$1   ; 0022, 10A1

.org 0x23 
_L23:
	MOVF    $21,$0   ; 0023, 0821
	XORWF   $22,$0   ; 0024, 0622
	BTFSC   $3,$2    ; 0025, 1903
	GOTO    _L5D     ; 0026, 285D
	MOVLW   $2       ; 0027, 3002
	INCF    $23,$1   ; 0028, 0AA3
	SUBWF   $23,$0   ; 0029, 0223
	BTFSS   $3,$0    ; 002A, 1C03
	GOTO    _L5E     ; 002B, 285E
	BTFSS   $22,$1   ; 002C, 1CA2
	BTFSS   $21,$1   ; 002D, 1CA1
	GOTO    _L39     ; 002E, 2839
	MOVLW   $32      ; 002F, 3032
	INCF    $25,$1   ; 0030, 0AA5
	MOVWF   $26      ; 0031, 00A6
	BSF     $24,$0   ; 0032, 1424
	CLRF    $27      ; 0033, 01A7
	CLRF    $28      ; 0034, 01A8
	BSF     $a,$3    ; 0035, 158A
	CALL    _LB64    ; 0036, 2364
	BCF     $a,$3    ; 0037, 118A
	GOTO    _L3D     ; 0038, 283D

.org 0x39 
_L39:
	BTFSC   $22,$1   ; 0039, 18A2
	BTFSC   $21,$1   ; 003A, 18A1
	GOTO    _L3D     ; 003B, 283D
	BCF     $24,$0   ; 003C, 1024

.org 0x3D 
_L3D:
	BSF     $3,$5    ; 003D, 1683
	BTFSS   $22,$0   ; 003E, 1C22
	BTFSS   $21,$0   ; 003F, 1C21
	GOTO    _L49     ; 0040, 2849
	BTFSC   $24,$4   ; 0041, 1A24
	GOTO    _L53     ; 0042, 2853
	BSF     $24,$5   ; 0043, 16A4
	BCF     $3,$5    ; 0044, 1283
	BSF     $2e,$0   ; 0045, 142E
	BSF     $3,$5    ; 0046, 1683
	BCF     $24,$7   ; 0047, 13A4
	GOTO    _L53     ; 0048, 2853

.org 0x49 
_L49:
	BTFSC   $22,$0   ; 0049, 1822
	BTFSC   $21,$0   ; 004A, 1821
	GOTO    _L53     ; 004B, 2853
	BTFSS   $24,$5   ; 004C, 1EA4
	GOTO    _L53     ; 004D, 2853
	CALL    _L3C0    ; 004E, 23C0
	BCF     $a,$3    ; 004F, 118A
	BCF     $2e,$0   ; 0050, 102E
	BSF     $3,$5    ; 0051, 1683
	BCF     $24,$5   ; 0052, 12A4

.org 0x53 
_L53:
	BCF     $3,$5    ; 0053, 1283
	BSF     $3,$6    ; 0054, 1703
	CLRF    $5c      ; 0055, 01DC
	CLRF    $5d      ; 0056, 01DD
	BSF     $3,$5    ; 0057, 1683
	BCF     $3,$6    ; 0058, 1303
	CLRF    $23      ; 0059, 01A3
	MOVF    $21,$0   ; 005A, 0821
	MOVWF   $22      ; 005B, 00A2
	GOTO    _L5E     ; 005C, 285E

.org 0x5D 
_L5D:
	CLRF    $23      ; 005D, 01A3

.org 0x5E 
_L5E:
	MOVF    $26,$0   ; 005E, 0826
	BTFSC   $3,$2    ; 005F, 1903
	GOTO    _L63     ; 0060, 2863
	DECF    $26,$1   ; 0061, 03A6
	GOTO    _L84     ; 0062, 2884

.org 0x63 
_L63:
	MOVF    $24,$0   ; 0063, 0824
	ANDLW   $31      ; 0064, 3931
	BTFSS   $3,$2    ; 0065, 1D03
	GOTO    _L82     ; 0066, 2882
	BCF     $3,$5    ; 0067, 1283
	BTFSS   $2d,$7   ; 0068, 1FAD
	BTFSC   $2e,$7   ; 0069, 1BAE
	GOTO    _L82     ; 006A, 2882
	BSF     $3,$5    ; 006B, 1683
	DECFSZ  $25,$0   ; 006C, 0B25
	GOTO    _L82     ; 006D, 2882
	MOVLW   $7       ; 006E, 3007
	BCF     $3,$5    ; 006F, 1283
	SUBWF   $46,$0   ; 0070, 0246
	BTFSS   $3,$0    ; 0071, 1C03
	GOTO    _L77     ; 0072, 2877
	MOVF    $46,$0   ; 0073, 0846
	XORLW   $11      ; 0074, 3A11
	BTFSS   $3,$2    ; 0075, 1D03
	GOTO    _L82     ; 0076, 2882

.org 0x77 
_L77:
	CALL    _L397    ; 0077, 2397
	MOVLW   $11      ; 0078, 3011
	BCF     $2c,$3   ; 0079, 11AC
	CLRF    $25      ; 007A, 01A5
	CLRF    $26      ; 007B, 01A6
	BCF     $a,$3    ; 007C, 118A
	CALL    _L5EC    ; 007D, 25EC
	BCF     $a,$3    ; 007E, 118A
	CALL    _L3A0    ; 007F, 23A0
	BCF     $a,$3    ; 0080, 118A
	CLRF    $45      ; 0081, 01C5

.org 0x82 
_L82:
	BSF     $3,$5    ; 0082, 1683
	CLRF    $25      ; 0083, 01A5

.org 0x84 
_L84:
	BTFSS   $24,$0   ; 0084, 1C24
	GOTO    _LB3     ; 0085, 28B3
	MOVLW   $0       ; 0086, 3000
	SUBWF   $28,$0   ; 0087, 0228
	MOVLW   $96      ; 0088, 3096
	BTFSC   $3,$2    ; 0089, 1903
	SUBWF   $27,$0   ; 008A, 0227
	BTFSC   $3,$0    ; 008B, 1803
	GOTO    _L95     ; 008C, 2895
	INCF    $27,$1   ; 008D, 0AA7
	BTFSC   $3,$2    ; 008E, 1903
	INCF    $28,$1   ; 008F, 0AA8
	BCF     $3,$5    ; 0090, 1283
	BSF     $3,$6    ; 0091, 1703
	CLRF    $5c      ; 0092, 01DC
	CLRF    $5d      ; 0093, 01DD
	GOTO    _LB3     ; 0094, 28B3

.org 0x95 
_L95:
	BCF     $24,$0   ; 0095, 1024
	CLRF    $25      ; 0096, 01A5
	CALL    _L3C0    ; 0097, 23C0
	BCF     $a,$3    ; 0098, 118A
	BCF     $2e,$0   ; 0099, 102E
	CALL    _L397    ; 009A, 2397
	BCF     $a,$3    ; 009B, 118A
	MOVLW   $0       ; 009C, 3000
	BTFSS   $2d,$7   ; 009D, 1FAD
	GOTO    _LA2     ; 009E, 28A2
	MOVLW   $c       ; 009F, 300C
	BCF     $2d,$7   ; 00A0, 13AD
	GOTO    _LA4     ; 00A1, 28A4

.org 0xA2 
_LA2:
	MOVLW   $b       ; 00A2, 300B
	BSF     $2d,$7   ; 00A3, 17AD

.org 0xA4 
_LA4:
	MOVWF   $47      ; 00A4, 00C7
	MOVLW   $19      ; 00A5, 3019
	MOVWF   $48      ; 00A6, 00C8
	MOVLW   $a       ; 00A7, 300A
	MOVWF   $49      ; 00A8, 00C9
	MOVLW   $43      ; 00A9, 3043
	CALL    _L3A0    ; 00AA, 23A0
	BCF     $a,$3    ; 00AB, 118A
	MOVLW   $0       ; 00AC, 3000
	CALL    _L32C    ; 00AD, 232C
	BCF     $a,$3    ; 00AE, 118A
	CALL    _L3BB    ; 00AF, 23BB
	BCF     $a,$3    ; 00B0, 118A
	CALL    _L394    ; 00B1, 2394
	BCF     $a,$3    ; 00B2, 118A

.org 0xB3 
_LB3:
	BSF     $3,$5    ; 00B3, 1683
	BCF     $3,$6    ; 00B4, 1303
	MOVF    $25,$1   ; 00B5, 08A5
	BTFSS   $3,$2    ; 00B6, 1D03
	GOTO    _LBC     ; 00B7, 28BC
	MOVF    $21,$0   ; 00B8, 0821
	ANDLW   $5       ; 00B9, 3905
	BTFSC   $3,$2    ; 00BA, 1903
	RET              ; 00BB, 0008

.org 0xBC 
_LBC:
	BCF     $3,$5    ; 00BC, 1283
	BSF     $3,$6    ; 00BD, 1703
	CLRF    $5c      ; 00BE, 01DC
	CLRF    $5d      ; 00BF, 01DD
	RET              ; 00C0, 0008

.org 0xC1 
_LC1:
	BTFSS   $2e,$0   ; 00C1, 1C2E
	GOTO    _L15C    ; 00C2, 295C
	MOVLW   $7       ; 00C3, 3007
	BCF     $2e,$0   ; 00C4, 102E
	SUBWF   $46,$0   ; 00C5, 0246
	BTFSS   $3,$0    ; 00C6, 1C03
	GOTO    _LD0     ; 00C7, 28D0
	MOVF    $46,$0   ; 00C8, 0846
	XORLW   $a       ; 00C9, 3A0A
	BTFSC   $3,$2    ; 00CA, 1903
	GOTO    _LD0     ; 00CB, 28D0
	MOVF    $46,$0   ; 00CC, 0846
	XORLW   $11      ; 00CD, 3A11
	BTFSS   $3,$2    ; 00CE, 1D03
	RET              ; 00CF, 0008

.org 0xD0 
_LD0:
	BTFSS   $2d,$7   ; 00D0, 1FAD
	BTFSC   $2e,$7   ; 00D1, 1BAE
	RET              ; 00D2, 0008
	MOVF    $3c,$0   ; 00D3, 083C
	BTFSS   $3,$2    ; 00D4, 1D03
	BTFSC   $2e,$3   ; 00D5, 19AE
	GOTO    _LD8     ; 00D6, 28D8
	GOTO    _LEB     ; 00D7, 28EB

.org 0xD8 
_LD8:
	CALL    _L397    ; 00D8, 2397
	MOVLW   $0       ; 00D9, 3000
	MOVLW   $7       ; 00DA, 3007
	BSF     $a,$3    ; 00DB, 158A
	CALL    _LC0A    ; 00DC, 240A
	BCF     $a,$3    ; 00DD, 118A
	CALL    _L3A0    ; 00DE, 23A0
	BCF     $a,$3    ; 00DF, 118A
	MOVLW   $0       ; 00E0, 3000
	CALL    _L32C    ; 00E1, 232C
	BCF     $a,$3    ; 00E2, 118A
	CLRF    $3c      ; 00E3, 01BC
	DECFSZ  $46,$0   ; 00E4, 0B46
	RET              ; 00E5, 0008
	MOVLW   $0       ; 00E6, 3000
	BCF     $2c,$3   ; 00E7, 11AC
	CLRF    $25      ; 00E8, 01A5
	CLRF    $26      ; 00E9, 01A6
	GOTO    _L394    ; 00EA, 2B94

.org 0xEB 
_LEB:
	BTFSS   $5,$3    ; 00EB, 1D85
	GOTO    _LFB     ; 00EC, 28FB
	CALL    _L397    ; 00ED, 2397
	BCF     $a,$3    ; 00EE, 118A
	MOVLW   $0       ; 00EF, 3000
	MOVLW   $d       ; 00F0, 300D
	CALL    _L3B5    ; 00F1, 23B5
	BCF     $a,$3    ; 00F2, 118A
	CALL    _L3A0    ; 00F3, 23A0
	BCF     $a,$3    ; 00F4, 118A
	MOVLW   $0       ; 00F5, 3000
	CALL    _L32C    ; 00F6, 232C
	BCF     $a,$3    ; 00F7, 118A
	CALL    _L3BB    ; 00F8, 23BB
	BCF     $a,$3    ; 00F9, 118A
	GOTO    _L394    ; 00FA, 2B94

.org 0xFB 
_LFB:
	BSF     $a,$3    ; 00FB, 158A
	CALL    _LEBA    ; 00FC, 26BA
	BCF     $a,$3    ; 00FD, 118A
	MOVF    $61,$0   ; 00FE, 0861
	MOVWF   $3b      ; 00FF, 00BB
	MOVF    $60,$0   ; 0100, 0860
	MOVWF   $3a      ; 0101, 00BA
	MOVLW   $1       ; 0102, 3001
	SUBWF   $3b,$0   ; 0103, 023B
	MOVLW   $7c      ; 0104, 307C
	BTFSC   $3,$2    ; 0105, 1903
	SUBWF   $3a,$0   ; 0106, 023A
	BTFSC   $3,$0    ; 0107, 1803
	GOTO    _L114    ; 0108, 2914

.org 0x109 
_L109:
	CALL    _L397    ; 0109, 2397
	MOVLW   $e       ; 010A, 300E
	BCF     $a,$3    ; 010B, 118A
	CALL    _L5EC    ; 010C, 25EC
	BCF     $a,$3    ; 010D, 118A
	CALL    _L3A0    ; 010E, 23A0
	CLRF    $45      ; 010F, 01C5
	BCF     $2c,$3   ; 0110, 11AC
	CLRF    $25      ; 0111, 01A5
	CLRF    $26      ; 0112, 01A6
	RET              ; 0113, 0008

.org 0x114 
_L114:
	MOVLW   $5a      ; 0114, 305A
	BSF     $3,$6    ; 0115, 1703
	MOVWF   $64      ; 0116, 00E4
	MOVLW   $a5      ; 0117, 30A5
	MOVWF   $65      ; 0118, 00E5
	BCF     $3,$6    ; 0119, 1303
	BCF     $e,$0    ; 011A, 100E
	BSF     $d,$0    ; 011B, 140D
	BSF     $3,$5    ; 011C, 1683
	MOVF    $7,$0    ; 011D, 0807
	ANDLW   $f       ; 011E, 390F
	IORLW   $30      ; 011F, 3830
	MOVWF   $7       ; 0120, 0087
	CLRF    $20      ; 0121, 01A0
	BCF     $3,$5    ; 0122, 1283
	BSF     $3,$6    ; 0123, 1703
	CLRF    $5a      ; 0124, 01DA
	CLRF    $5b      ; 0125, 01DB
	BCF     $3,$6    ; 0126, 1303
	MOVF    $35,$0   ; 0127, 0835
	MOVWF   $39      ; 0128, 00B9
	MOVF    $34,$0   ; 0129, 0834
	MOVWF   $38      ; 012A, 00B8
	BTFSS   $2d,$1   ; 012B, 1CAD
	GOTO    _L132    ; 012C, 2932
	MOVF    $35,$0   ; 012D, 0835
	MOVWF   $42      ; 012E, 00C2
	MOVF    $34,$0   ; 012F, 0834
	MOVWF   $41      ; 0130, 00C1
	BCF     $2d,$1   ; 0131, 10AD

.org 0x132 
_L132:
	MOVF    $33,$0   ; 0132, 0833
	XORLW   $80      ; 0133, 3A80
	BTFSS   $3,$2    ; 0134, 1D03
	GOTO    _L13E    ; 0135, 293E

.org 0x136 
_L136:
	MOVLW   $c8      ; 0136, 30C8
	BCF     $5,$4    ; 0137, 1205
	BCF     $5,$2    ; 0138, 1105
	MOVWF   $29      ; 0139, 00A9
	MOVWF   $28      ; 013A, 00A8
	MOVWF   $2b      ; 013B, 00AB
	MOVWF   $2a      ; 013C, 00AA
	GOTO    _L148    ; 013D, 2948

.org 0x13E 
_L13E:
	DECFSZ  $33,$0   ; 013E, 0B33
	GOTO    _L141    ; 013F, 2941
	GOTO    _L136    ; 0140, 2936

.org 0x141 
_L141:
	MOVLW   $c8      ; 0141, 30C8
	BSF     $5,$2    ; 0142, 1505
	BCF     $5,$4    ; 0143, 1205
	MOVWF   $29      ; 0144, 00A9
	MOVWF   $28      ; 0145, 00A8
	CLRF    $2b      ; 0146, 01AB
	CLRF    $2a      ; 0147, 01AA

.org 0x148 
_L148:
	MOVLW   $c8      ; 0148, 30C8
	BCF     $5,$4    ; 0149, 1205
	MOVWF   $29      ; 014A, 00A9
	MOVWF   $28      ; 014B, 00A8
	MOVLW   $32      ; 014C, 3032
	CLRF    $27      ; 014D, 01A7
	CLRF    $30      ; 014E, 01B0
	CLRF    $36      ; 014F, 01B6
	CLRF    $37      ; 0150, 01B7
	BCF     $2e,$5   ; 0151, 12AE
	BCF     $2e,$1   ; 0152, 10AE
	BCF     $b,$4    ; 0153, 120B
	BSF     $3,$6    ; 0154, 1703
	CLRF    $5e      ; 0155, 01DE
	CLRF    $5f      ; 0156, 01DF
	MOVWF   $59      ; 0157, 00D9
	BSF     $b,$4    ; 0158, 160B
	BCF     $3,$6    ; 0159, 1303
	BSF     $2e,$7   ; 015A, 17AE
	RET              ; 015B, 0008

.org 0x15C 
_L15C:
	BTFSS   $2e,$7   ; 015C, 1FAE
	RET              ; 015D, 0008
	BTFSS   $2e,$6   ; 015E, 1F2E
	GOTO    _L163    ; 015F, 2963
	CALL    _L3C0    ; 0160, 23C0
	BCF     $a,$3    ; 0161, 118A
	GOTO    _L109    ; 0162, 2909

.org 0x163 
_L163:
	MOVLW   $a       ; 0163, 300A
	SUBWF   $30,$0   ; 0164, 0230
	BTFSS   $3,$0    ; 0165, 1C03
	GOTO    _L17A    ; 0166, 297A
	CALL    _L3C0    ; 0167, 23C0
	BCF     $a,$3    ; 0168, 118A
	CALL    _L397    ; 0169, 2397
	MOVLW   $0       ; 016A, 3000
	MOVLW   $7       ; 016B, 3007
	BSF     $a,$3    ; 016C, 158A
	CALL    _LC0A    ; 016D, 240A
	BCF     $a,$3    ; 016E, 118A
	CALL    _L3A0    ; 016F, 23A0
	BCF     $a,$3    ; 0170, 118A
	MOVLW   $0       ; 0171, 3000
	CALL    _L32C    ; 0172, 232C
	BCF     $a,$3    ; 0173, 118A
	MOVLW   $0       ; 0174, 3000
	CLRF    $3c      ; 0175, 01BC
	BCF     $2c,$3   ; 0176, 11AC
	CLRF    $25      ; 0177, 01A5
	CLRF    $26      ; 0178, 01A6
	GOTO    _L394    ; 0179, 2B94

.org 0x17A 
_L17A:
	MOVLW   $3       ; 017A, 3003
	BSF     $3,$6    ; 017B, 1703
	SUBWF   $5f,$0   ; 017C, 025F
	MOVLW   $e8      ; 017D, 30E8
	BTFSC   $3,$2    ; 017E, 1903
	SUBWF   $5e,$0   ; 017F, 025E
	BTFSS   $3,$0    ; 0180, 1C03
	GOTO    _L196    ; 0181, 2996
	BSF     $3,$5    ; 0182, 1683
	BCF     $3,$6    ; 0183, 1303
	BTFSC   $24,$7   ; 0184, 1BA4
	GOTO    _L196    ; 0185, 2996
	CALL    _L3C0    ; 0186, 23C0
	BCF     $a,$3    ; 0187, 118A
	CALL    _L397    ; 0188, 2397
	BCF     $a,$3    ; 0189, 118A
	MOVLW   $0       ; 018A, 3000
	MOVLW   $f       ; 018B, 300F
	CALL    _L3B5    ; 018C, 23B5
	BCF     $a,$3    ; 018D, 118A
	CALL    _L3A0    ; 018E, 23A0
	BCF     $a,$3    ; 018F, 118A
	MOVLW   $0       ; 0190, 3000
	CALL    _L32C    ; 0191, 232C
	BCF     $a,$3    ; 0192, 118A
	CALL    _L3BB    ; 0193, 23BB
	BCF     $a,$3    ; 0194, 118A
	GOTO    _L394    ; 0195, 2B94

.org 0x196 
_L196:
	MOVLW   $5       ; 0196, 3005
	BCF     $3,$5    ; 0197, 1283
	BSF     $3,$6    ; 0198, 1703
	SUBWF   $5f,$0   ; 0199, 025F
	MOVLW   $dc      ; 019A, 30DC
	BTFSC   $3,$2    ; 019B, 1903
	SUBWF   $5e,$0   ; 019C, 025E
	BTFSS   $3,$0    ; 019D, 1C03
	GOTO    _L1B5    ; 019E, 29B5
	BSF     $3,$5    ; 019F, 1683
	BCF     $3,$6    ; 01A0, 1303
	BTFSS   $24,$7   ; 01A1, 1FA4
	GOTO    _L1B5    ; 01A2, 29B5
	CALL    _L3C0    ; 01A3, 23C0
	BCF     $a,$3    ; 01A4, 118A
	CALL    _L397    ; 01A5, 2397
	BCF     $a,$3    ; 01A6, 118A
	MOVLW   $0       ; 01A7, 3000
	MOVLW   $19      ; 01A8, 3019
	CLRF    $47      ; 01A9, 01C7
	MOVWF   $48      ; 01AA, 00C8
	MOVLW   $43      ; 01AB, 3043
	CLRF    $49      ; 01AC, 01C9
	CALL    _L3A0    ; 01AD, 23A0
	BCF     $a,$3    ; 01AE, 118A
	MOVLW   $0       ; 01AF, 3000
	CALL    _L32C    ; 01B0, 232C
	BCF     $a,$3    ; 01B1, 118A
	CALL    _L3BB    ; 01B2, 23BB
	BCF     $a,$3    ; 01B3, 118A
	GOTO    _L394    ; 01B4, 2B94

.org 0x1B5 
_L1B5:
	BCF     $3,$5    ; 01B5, 1283
	BCF     $3,$6    ; 01B6, 1303
	BTFSS   $2e,$1   ; 01B7, 1CAE
	RET              ; 01B8, 0008
	MOVLW   $3       ; 01B9, 3003
	CLRF    $47      ; 01BA, 01C7
	BSF     $a,$3    ; 01BB, 158A
	CALL    _LF19    ; 01BC, 2719
	BCF     $a,$3    ; 01BD, 118A
	MOVF    $48,$0   ; 01BE, 0848
	MOVWF   $3b      ; 01BF, 00BB
	MOVF    $47,$0   ; 01C0, 0847
	MOVWF   $3a      ; 01C1, 00BA
	BTFSS   $2e,$1   ; 01C2, 1CAE
	RET              ; 01C3, 0008
	BTFSS   $2e,$5   ; 01C4, 1EAE
	GOTO    _L244    ; 01C5, 2A44
	MOVLW   $e       ; 01C6, 300E
	SUBWF   $3b,$0   ; 01C7, 023B
	MOVLW   $d8      ; 01C8, 30D8
	BTFSC   $3,$2    ; 01C9, 1903
	SUBWF   $3a,$0   ; 01CA, 023A
	BTFSC   $3,$0    ; 01CB, 1803
	GOTO    _L1D0    ; 01CC, 29D0

.org 0x1CD 
_L1CD:
	BSF     $2e,$6   ; 01CD, 172E
	BSF     $5,$4    ; 01CE, 1605
	RET              ; 01CF, 0008

.org 0x1D0 
_L1D0:
	MOVLW   $6       ; 01D0, 3006
	ADDLW   $30      ; 01D1, 3E30
	MOVWF   $4       ; 01D2, 0084
	BCF     $3,$7    ; 01D3, 1383
	MOVF    $0,$0    ; 01D4, 0800
	INCF    $4,$1    ; 01D5, 0A84
	IORWF   $0,$0    ; 01D6, 0400
	BTFSC   $3,$2    ; 01D7, 1903
	RET              ; 01D8, 0008
	MOVF    $3a,$0   ; 01D9, 083A
	MOVWF   $47      ; 01DA, 00C7
	MOVF    $3b,$0   ; 01DB, 083B
	MOVWF   $48      ; 01DC, 00C8
	CLRF    $49      ; 01DD, 01C9
	CLRF    $4a      ; 01DE, 01CA
	MOVF    $36,$0   ; 01DF, 0836
	MOVWF   $4b      ; 01E0, 00CB
	MOVF    $37,$0   ; 01E1, 0837
	MOVWF   $4c      ; 01E2, 00CC
	CLRF    $4d      ; 01E3, 01CD
	CLRF    $4e      ; 01E4, 01CE
	BSF     $a,$3    ; 01E5, 158A
	CALL    _LF83    ; 01E6, 2783
	BCF     $a,$3    ; 01E7, 118A
	MOVF    $47,$0   ; 01E8, 0847
	MOVWF   $66      ; 01E9, 00E6
	MOVF    $48,$0   ; 01EA, 0848
	MOVWF   $67      ; 01EB, 00E7
	MOVF    $49,$0   ; 01EC, 0849
	MOVWF   $68      ; 01ED, 00E8
	MOVF    $4a,$0   ; 01EE, 084A
	MOVWF   $69      ; 01EF, 00E9
	MOVLW   $c       ; 01F0, 300C

.org 0x1F1 
_L1F1:
	BCF     $3,$0    ; 01F1, 1003
	RRF     $69,$1   ; 01F2, 0CE9
	RRF     $68,$1   ; 01F3, 0CE8
	RRF     $67,$1   ; 01F4, 0CE7
	RRF     $66,$1   ; 01F5, 0CE6
	ADDLW   $ff      ; 01F6, 3EFF
	BTFSS   $3,$2    ; 01F7, 1D03
	GOTO    _L1F1    ; 01F8, 29F1
	MOVF    $67,$0   ; 01F9, 0867
	MOVWF   $6b      ; 01FA, 00EB
	MOVF    $66,$0   ; 01FB, 0866
	MOVWF   $6a      ; 01FC, 00EA
	GOTO    _L222    ; 01FD, 2A22

.org 0x1FE 
_L1FE:
	MOVF    $6a,$0   ; 01FE, 086A
	MOVWF   $53      ; 01FF, 00D3
	MOVF    $6b,$0   ; 0200, 086B
	MOVWF   $54      ; 0201, 00D4
	MOVLW   $9       ; 0202, 3009
	CLRF    $55      ; 0203, 01D5
	CLRF    $56      ; 0204, 01D6
	CLRF    $5a      ; 0205, 01DA
	MOVWF   $59      ; 0206, 00D9
	MOVLW   $c4      ; 0207, 30C4
	MOVWF   $58      ; 0208, 00D8
	CLRF    $57      ; 0209, 01D7
	GOTO    _L218    ; 020A, 2A18

.org 0x20B 
_L20B:
	MOVF    $6a,$0   ; 020B, 086A
	MOVWF   $53      ; 020C, 00D3
	MOVF    $6b,$0   ; 020D, 086B
	MOVWF   $54      ; 020E, 00D4
	MOVLW   $8       ; 020F, 3008
	CLRF    $55      ; 0210, 01D5
	CLRF    $56      ; 0211, 01D6
	CLRF    $5a      ; 0212, 01DA
	MOVWF   $59      ; 0213, 00D9
	MOVLW   $3d      ; 0214, 303D
	MOVWF   $58      ; 0215, 00D8
	MOVLW   $60      ; 0216, 3060
	MOVWF   $57      ; 0217, 00D7

.org 0x218 
_L218:
	BSF     $a,$3    ; 0218, 158A
	CALL    _LFB6    ; 0219, 27B6
	BCF     $a,$3    ; 021A, 118A
	MOVF    $54,$0   ; 021B, 0854
	MOVWF   $6b      ; 021C, 00EB
	MOVF    $53,$0   ; 021D, 0853
	MOVWF   $6a      ; 021E, 00EA
	GOTO    _L22D    ; 021F, 2A2D

.org 0x220 
_L220:
	CLRF    $33      ; 0220, 01B3
	GOTO    _L22D    ; 0221, 2A2D

.org 0x222 
_L222:
	MOVF    $33,$0   ; 0222, 0833
	XORLW   $0       ; 0223, 3A00
	BTFSC   $3,$2    ; 0224, 1903
	GOTO    _L1FE    ; 0225, 29FE
	XORLW   $1       ; 0226, 3A01
	BTFSC   $3,$2    ; 0227, 1903
	GOTO    _L20B    ; 0228, 2A0B
	XORLW   $81      ; 0229, 3A81
	BTFSC   $3,$2    ; 022A, 1903
	GOTO    _L220    ; 022B, 2A20
	GOTO    _L22D    ; 022C, 2A2D

.org 0x22D 
_L22D:
	MOVLW   $0       ; 022D, 3000
	SUBWF   $6b,$0   ; 022E, 026B
	MOVLW   $c8      ; 022F, 30C8
	BTFSC   $3,$2    ; 0230, 1903
	SUBWF   $6a,$0   ; 0231, 026A
	BTFSS   $3,$0    ; 0232, 1C03
	GOTO    _L237    ; 0233, 2A37
	MOVLW   $c8      ; 0234, 30C8
	MOVWF   $29      ; 0235, 00A9
	RET              ; 0236, 0008

.org 0x237 
_L237:
	MOVLW   $0       ; 0237, 3000
	SUBWF   $6b,$0   ; 0238, 026B
	MOVLW   $3c      ; 0239, 303C
	BTFSC   $3,$2    ; 023A, 1903
	SUBWF   $6a,$0   ; 023B, 026A
	BTFSC   $3,$0    ; 023C, 1803
	GOTO    _L241    ; 023D, 2A41
	MOVLW   $3c      ; 023E, 303C
	MOVWF   $29      ; 023F, 00A9
	RET              ; 0240, 0008

.org 0x241 
_L241:
	MOVF    $6a,$0   ; 0241, 086A
	MOVWF   $29      ; 0242, 00A9
	RET              ; 0243, 0008

.org 0x244 
_L244:
	MOVLW   $e       ; 0244, 300E
	SUBWF   $3b,$0   ; 0245, 023B
	MOVLW   $e2      ; 0246, 30E2
	BTFSC   $3,$2    ; 0247, 1903
	SUBWF   $3a,$0   ; 0248, 023A
	BTFSS   $3,$0    ; 0249, 1C03
	GOTO    _L1CD    ; 024A, 29CD
	BSF     $2e,$5   ; 024B, 16AE
	CLRF    $32      ; 024C, 01B2
	BCF     $2c,$0   ; 024D, 102C
	BCF     $2c,$6   ; 024E, 132C
	BCF     $2c,$2   ; 024F, 112C
	BSF     $2c,$1   ; 0250, 14AC
	BTFSC   $2c,$7   ; 0251, 1BAC
	GOTO    _L258    ; 0252, 2A58
	CLRF    $21      ; 0253, 01A1
	BCF     $2c,$3   ; 0254, 11AC
	CLRF    $25      ; 0255, 01A5
	CLRF    $26      ; 0256, 01A6
	BSF     $2c,$7   ; 0257, 17AC

.org 0x258 
_L258:
	MOVLW   $19      ; 0258, 3019
	BSF     $2c,$0   ; 0259, 142C
	BSF     $2c,$3   ; 025A, 15AC
	CLRF    $47      ; 025B, 01C7
	INCF    $47,$1   ; 025C, 0AC7
	MOVWF   $48      ; 025D, 00C8
	MOVLW   $c8      ; 025E, 30C8
	MOVWF   $49      ; 025F, 00C9
	MOVLW   $43      ; 0260, 3043
	CALL    _L3A0    ; 0261, 23A0
	MOVF    $3c,$0   ; 0262, 083C
	MOVWF   $31      ; 0263, 00B1
	MOVLW   $2       ; 0264, 3002
	MOVWF   $45      ; 0265, 00C5
	RET              ; 0266, 0008

.org 0x267 
_L267:
	MOVF    $46,$0   ; 0267, 0846
	BTFSC   $3,$2    ; 0268, 1903
	RET              ; 0269, 0008
	MOVF    $44,$0   ; 026A, 0844
	BTFSC   $3,$2    ; 026B, 1903
	GOTO    _L303    ; 026C, 2B03
	GOTO    _L2D8    ; 026D, 2AD8

.org 0x26E 
_L26E:
	MOVLW   $9       ; 026E, 3009
	SUBWF   $44,$0   ; 026F, 0244
	BTFSC   $3,$0    ; 0270, 1803
	GOTO    _L301    ; 0271, 2B01
	MOVLW   $7       ; 0272, 3007
	MOVLW   $ff      ; 0273, 30FF
	CALL    _L32C    ; 0274, 232C
	BCF     $a,$3    ; 0275, 118A
	MOVLW   $ff      ; 0276, 30FF
	CALL    _L394    ; 0277, 2394
	BCF     $a,$3    ; 0278, 118A
	GOTO    _L301    ; 0279, 2B01

.org 0x27A 
_L27A:
	MOVLW   $e       ; 027A, 300E
	CALL    _L32C    ; 027B, 232C
	BCF     $a,$3    ; 027C, 118A
	GOTO    _L301    ; 027D, 2B01

.org 0x27E 
_L27E:
	MOVF    $3c,$0   ; 027E, 083C
	MOVWF   $31      ; 027F, 00B1
	MOVLW   $1       ; 0280, 3001
	XORWF   $24,$1   ; 0281, 06A4
	MOVF    $24,$0   ; 0282, 0824
	IORLW   $c       ; 0283, 380C
	CALL    _L32C    ; 0284, 232C
	BCF     $a,$3    ; 0285, 118A
	BTFSC   $44,$0   ; 0286, 1844
	GOTO    _L301    ; 0287, 2B01
	MOVLW   $14      ; 0288, 3014
	MOVWF   $44      ; 0289, 00C4
	GOTO    _L301    ; 028A, 2B01

.org 0x28B 
_L28B:
	BTFSS   $44,$0   ; 028B, 1C44
	GOTO    _L292    ; 028C, 2A92
	MOVLW   $0       ; 028D, 3000
	MOVLW   $8       ; 028E, 3008
	CALL    _L32C    ; 028F, 232C
	BCF     $a,$3    ; 0290, 118A
	GOTO    _L301    ; 0291, 2B01

.org 0x292 
_L292:
	MOVLW   $1       ; 0292, 3001
	MOVLW   $c       ; 0293, 300C
	CLRF    $31      ; 0294, 01B1
	CALL    _L32C    ; 0295, 232C
	BCF     $a,$3    ; 0296, 118A
	GOTO    _L301    ; 0297, 2B01

.org 0x298 
_L298:
	BTFSS   $44,$0   ; 0298, 1C44
	GOTO    _L29C    ; 0299, 2A9C
	MOVLW   $0       ; 029A, 3000
	GOTO    _L29D    ; 029B, 2A9D

.org 0x29C 
_L29C:
	MOVF    $33,$0   ; 029C, 0833

.org 0x29D 
_L29D:
	MOVLW   $10      ; 029D, 3010
	CALL    _L32C    ; 029E, 232C
	BCF     $a,$3    ; 029F, 118A
	GOTO    _L301    ; 02A0, 2B01

.org 0x2A1 
_L2A1:
	BTFSS   $44,$0   ; 02A1, 1C44
	GOTO    _L2B7    ; 02A2, 2AB7
	MOVF    $46,$0   ; 02A3, 0846
	XORLW   $e       ; 02A4, 3A0E
	BTFSS   $3,$2    ; 02A5, 1D03
	GOTO    _L2AF    ; 02A6, 2AAF
	MOVLW   $7       ; 02A7, 3007
	MOVLW   $e       ; 02A8, 300E
	CALL    _L32C    ; 02A9, 232C
	BCF     $a,$3    ; 02AA, 118A
	MOVLW   $ff      ; 02AB, 30FF
	CALL    _L394    ; 02AC, 2394
	BCF     $a,$3    ; 02AD, 118A
	GOTO    _L301    ; 02AE, 2B01

.org 0x2AF 
_L2AF:
	MOVLW   $0       ; 02AF, 3000
	MOVLW   $0       ; 02B0, 3000
	CALL    _L32C    ; 02B1, 232C
	BCF     $a,$3    ; 02B2, 118A
	MOVLW   $0       ; 02B3, 3000
	CALL    _L394    ; 02B4, 2394
	BCF     $a,$3    ; 02B5, 118A
	GOTO    _L301    ; 02B6, 2B01

.org 0x2B7 
_L2B7:
	MOVLW   $7       ; 02B7, 3007
	MOVLW   $e       ; 02B8, 300E
	CALL    _L32C    ; 02B9, 232C
	BCF     $a,$3    ; 02BA, 118A
	MOVLW   $ff      ; 02BB, 30FF
	CALL    _L394    ; 02BC, 2394
	BCF     $a,$3    ; 02BD, 118A
	GOTO    _L301    ; 02BE, 2B01

.org 0x2BF 
_L2BF:
	BTFSS   $44,$0   ; 02BF, 1C44
	GOTO    _L2C3    ; 02C0, 2AC3
	MOVLW   $0       ; 02C1, 3000
	GOTO    _L301    ; 02C2, 2B01

.org 0x2C3 
_L2C3:
	MOVF    $33,$0   ; 02C3, 0833
	GOTO    _L301    ; 02C4, 2B01

.org 0x2C5 
_L2C5:
	MOVF    $33,$0   ; 02C5, 0833
	MOVLW   $e       ; 02C6, 300E
	CALL    _L32C    ; 02C7, 232C
	BCF     $a,$3    ; 02C8, 118A
	MOVLW   $ff      ; 02C9, 30FF
	CALL    _L394    ; 02CA, 2394
	BCF     $a,$3    ; 02CB, 118A
	GOTO    _L301    ; 02CC, 2B01

.org 0x2CD 
_L2CD:
	MOVLW   $e       ; 02CD, 300E
	CALL    _L32C    ; 02CE, 232C
	BCF     $a,$3    ; 02CF, 118A
	GOTO    _L301    ; 02D0, 2B01

.org 0x2D1 
_L2D1:
	MOVLW   $d       ; 02D1, 300D
	CALL    _L32C    ; 02D2, 232C
	BCF     $a,$3    ; 02D3, 118A
	MOVLW   $ff      ; 02D4, 30FF
	CALL    _L394    ; 02D5, 2394
	BCF     $a,$3    ; 02D6, 118A
	GOTO    _L301    ; 02D7, 2B01

.org 0x2D8 
_L2D8:
	MOVF    $46,$0   ; 02D8, 0846
	XORLW   $1       ; 02D9, 3A01
	BTFSC   $3,$2    ; 02DA, 1903
	GOTO    _L27A    ; 02DB, 2A7A
	XORLW   $5       ; 02DC, 3A05
	BTFSC   $3,$2    ; 02DD, 1903
	GOTO    _L27E    ; 02DE, 2A7E
	XORLW   $1       ; 02DF, 3A01
	BTFSC   $3,$2    ; 02E0, 1903
	GOTO    _L2D1    ; 02E1, 2AD1
	XORLW   $3       ; 02E2, 3A03
	BTFSC   $3,$2    ; 02E3, 1903
	GOTO    _L2CD    ; 02E4, 2ACD
	XORLW   $1       ; 02E5, 3A01
	BTFSC   $3,$2    ; 02E6, 1903
	GOTO    _L28B    ; 02E7, 2A8B
	XORLW   $d       ; 02E8, 3A0D
	BTFSC   $3,$2    ; 02E9, 1903
	GOTO    _L2BF    ; 02EA, 2ABF
	XORLW   $1       ; 02EB, 3A01
	BTFSC   $3,$2    ; 02EC, 1903
	GOTO    _L2BF    ; 02ED, 2ABF
	XORLW   $7       ; 02EE, 3A07
	BTFSC   $3,$2    ; 02EF, 1903
	GOTO    _L2BF    ; 02F0, 2ABF
	XORLW   $1       ; 02F1, 3A01
	BTFSC   $3,$2    ; 02F2, 1903
	GOTO    _L2A1    ; 02F3, 2AA1
	XORLW   $3       ; 02F4, 3A03
	BTFSC   $3,$2    ; 02F5, 1903
	GOTO    _L2A1    ; 02F6, 2AA1
	XORLW   $1       ; 02F7, 3A01
	BTFSC   $3,$2    ; 02F8, 1903
	GOTO    _L298    ; 02F9, 2A98
	XORLW   $1f      ; 02FA, 3A1F
	BTFSC   $3,$2    ; 02FB, 1903
	GOTO    _L26E    ; 02FC, 2A6E
	XORLW   $1       ; 02FD, 3A01
	BTFSC   $3,$2    ; 02FE, 1903
	GOTO    _L2C5    ; 02FF, 2AC5
	GOTO    _L301    ; 0300, 2B01

.org 0x301 
_L301:
	DECF    $44,$1   ; 0301, 03C4
	RET              ; 0302, 0008

.org 0x303 
_L303:
	MOVLW   $e       ; 0303, 300E
	SUBWF   $46,$0   ; 0304, 0246
	BTFSC   $3,$0    ; 0305, 1803
	GOTO    _L30B    ; 0306, 2B0B
	MOVLW   $7       ; 0307, 3007
	SUBWF   $46,$0   ; 0308, 0246
	BTFSC   $3,$0    ; 0309, 1803
	GOTO    _L30E    ; 030A, 2B0E

.org 0x30B 
_L30B:
	MOVLW   $0       ; 030B, 3000
	CALL    _L32C    ; 030C, 232C
	BCF     $a,$3    ; 030D, 118A

.org 0x30E 
_L30E:
	MOVF    $46,$0   ; 030E, 0846
	XORLW   $e       ; 030F, 3A0E
	BTFSC   $3,$2    ; 0310, 1903
	GOTO    _L31A    ; 0311, 2B1A
	MOVF    $46,$0   ; 0312, 0846
	XORLW   $10      ; 0313, 3A10
	BTFSC   $3,$2    ; 0314, 1903
	GOTO    _L31A    ; 0315, 2B1A
	MOVF    $46,$0   ; 0316, 0846
	XORLW   $11      ; 0317, 3A11
	BTFSS   $3,$2    ; 0318, 1D03
	GOTO    _L31E    ; 0319, 2B1E

.org 0x31A 
_L31A:
	MOVLW   $0       ; 031A, 3000
	MOVLW   $0       ; 031B, 3000
	CALL    _L394    ; 031C, 2394
	BCF     $a,$3    ; 031D, 118A

.org 0x31E 
_L31E:
	DECF    $46,$0   ; 031E, 0346
	BTFSC   $3,$2    ; 031F, 1903
	GOTO    _L325    ; 0320, 2B25
	MOVF    $46,$0   ; 0321, 0846
	XORLW   $5       ; 0322, 3A05
	BTFSS   $3,$2    ; 0323, 1D03
	GOTO    _L32A    ; 0324, 2B2A

.org 0x325 
_L325:
	MOVLW   $0       ; 0325, 3000
	BCF     $2c,$3   ; 0326, 11AC
	CLRF    $25      ; 0327, 01A5
	CLRF    $26      ; 0328, 01A6
	CALL    _L394    ; 0329, 2394

.org 0x32A 
_L32A:
	CLRF    $46      ; 032A, 01C6
	RET              ; 032B, 0008

.org 0x32C 
_L32C:
	MOVWF   $4a      ; 032C, 00CA
	CLRF    $47      ; 032D, 01C7
	CLRF    $49      ; 032E, 01C9
	BCF     $2c,$4   ; 032F, 122C
	GOTO    _L378    ; 0330, 2B78

.org 0x331 
_L331:
	BTFSS   $4a,$2   ; 0331, 1D4A
	GOTO    _L348    ; 0332, 2B48
	MOVF    $31,$0   ; 0333, 0831
	MOVWF   $49      ; 0334, 00C9
	MOVLW   $64      ; 0335, 3064
	SUBWF   $49,$0   ; 0336, 0249
	BTFSS   $3,$0    ; 0337, 1C03
	GOTO    _L33C    ; 0338, 2B3C
	MOVLW   $6       ; 0339, 3006
	IORWF   $47,$1   ; 033A, 04C7
	GOTO    _L348    ; 033B, 2B48

.org 0x33C 
_L33C:
	CLRF    $48      ; 033C, 01C8

.org 0x33D 
_L33D:
	MOVLW   $a       ; 033D, 300A
	SUBWF   $49,$0   ; 033E, 0249
	BTFSS   $3,$0    ; 033F, 1C03
	GOTO    _L348    ; 0340, 2B48
	MOVLW   $a       ; 0341, 300A
	SUBWF   $49,$1   ; 0342, 02C9
	MOVLW   $a       ; 0343, 300A
	INCF    $48,$1   ; 0344, 0AC8
	SUBWF   $48,$0   ; 0345, 0248
	BTFSS   $3,$0    ; 0346, 1C03
	GOTO    _L33D    ; 0347, 2B3D

.org 0x348 
_L348:
	BTFSC   $4a,$3   ; 0348, 19CA
	BSF     $47,$0   ; 0349, 1447
	BTFSC   $4a,$0   ; 034A, 184A
	BSF     $47,$7   ; 034B, 17C7
	BTFSS   $4a,$1   ; 034C, 1CCA
	GOTO    _L38F    ; 034D, 2B8F
	MOVLW   $0       ; 034E, 3000
	BSF     $3,$6    ; 034F, 1703
	SUBWF   $63,$0   ; 0350, 0263
	BTFSS   $3,$2    ; 0351, 1D03
	GOTO    _L35D    ; 0352, 2B5D
	MOVLW   $0       ; 0353, 3000
	SUBWF   $62,$0   ; 0354, 0262
	BTFSS   $3,$2    ; 0355, 1D03
	GOTO    _L35D    ; 0356, 2B5D
	MOVLW   $d6      ; 0357, 30D6
	SUBWF   $61,$0   ; 0358, 0261
	BTFSS   $3,$2    ; 0359, 1D03
	GOTO    _L35D    ; 035A, 2B5D
	MOVLW   $d8      ; 035B, 30D8
	SUBWF   $60,$0   ; 035C, 0260

.org 0x35D 
_L35D:
	BTFSC   $3,$0    ; 035D, 1803
	GOTO    _L361    ; 035E, 2B61
	MOVLW   $70      ; 035F, 3070
	GOTO    _L372    ; 0360, 2B72

.org 0x361 
_L361:
	MOVLW   $0       ; 0361, 3000
	SUBWF   $63,$0   ; 0362, 0263
	BTFSS   $3,$2    ; 0363, 1D03
	GOTO    _L36F    ; 0364, 2B6F
	MOVLW   $1       ; 0365, 3001
	SUBWF   $62,$0   ; 0366, 0262
	BTFSS   $3,$2    ; 0367, 1D03
	GOTO    _L36F    ; 0368, 2B6F
	MOVLW   $8e      ; 0369, 308E
	SUBWF   $61,$0   ; 036A, 0261
	BTFSS   $3,$2    ; 036B, 1D03
	GOTO    _L36F    ; 036C, 2B6F
	MOVLW   $70      ; 036D, 3070
	SUBWF   $60,$0   ; 036E, 0260

.org 0x36F 
_L36F:
	BTFSC   $3,$0    ; 036F, 1803
	GOTO    _L375    ; 0370, 2B75
	MOVLW   $30      ; 0371, 3030

.org 0x372 
_L372:
	BCF     $3,$6    ; 0372, 1303
	IORWF   $47,$1   ; 0373, 04C7
	GOTO    _L38F    ; 0374, 2B8F

.org 0x375 
_L375:
	BCF     $3,$6    ; 0375, 1303
	BSF     $47,$4   ; 0376, 1647
	GOTO    _L38F    ; 0377, 2B8F

.org 0x378 
_L378:
	MOVF    $4a,$0   ; 0378, 084A
	XORLW   $0       ; 0379, 3A00
	BTFSC   $3,$2    ; 037A, 1903
	GOTO    _L38F    ; 037B, 2B8F
	XORLW   $f       ; 037C, 3A0F
	BTFSC   $3,$2    ; 037D, 1903
	GOTO    _L38F    ; 037E, 2B8F
	XORLW   $1f      ; 037F, 3A1F
	BTFSC   $3,$2    ; 0380, 1903
	GOTO    _L38F    ; 0381, 2B8F
	XORLW   $50      ; 0382, 3A50
	BTFSC   $3,$2    ; 0383, 1903
	GOTO    _L38F    ; 0384, 2B8F
	XORLW   $c0      ; 0385, 3AC0
	BTFSC   $3,$2    ; 0386, 1903
	GOTO    _L38F    ; 0387, 2B8F
	XORLW   $40      ; 0388, 3A40
	BTFSC   $3,$2    ; 0389, 1903
	GOTO    _L38F    ; 038A, 2B8F
	XORLW   $3f      ; 038B, 3A3F
	BTFSC   $3,$2    ; 038C, 1903
	GOTO    _L38F    ; 038D, 2B8F
	GOTO    _L331    ; 038E, 2B31

.org 0x38F 
_L38F:
	CLRF    $23      ; 038F, 01A3
	BCF     $2c,$5   ; 0390, 12AC
	BSF     $2c,$4   ; 0391, 162C
	RET              ; 0392, 0008
	RET              ; 0393, 0008

.org 0x394 
_L394:
	BCF     $2c,$4   ; 0394, 122C
	BSF     $2c,$4   ; 0395, 162C
	RET              ; 0396, 0008

.org 0x397 
_L397:
	MOVLW   $64      ; 0397, 3064
	BCF     $2c,$0   ; 0398, 102C
	BCF     $2c,$6   ; 0399, 132C
	BCF     $2c,$7   ; 039A, 13AC
	BCF     $2c,$2   ; 039B, 112C
	BSF     $2c,$1   ; 039C, 14AC
	MOVWF   $22      ; 039D, 00A2
	CLRF    $21      ; 039E, 01A1
	RET              ; 039F, 0008

.org 0x3A0 
_L3A0:
	MOVWF   $4a      ; 03A0, 00CA
	ADDLW   $3       ; 03A1, 3E03
	MOVWF   $4       ; 03A2, 0084
	MOVF    $47,$0   ; 03A3, 0847
	BCF     $3,$7    ; 03A4, 1383
	MOVWF   $0       ; 03A5, 0080
	MOVF    $4a,$0   ; 03A6, 084A
	ADDLW   $1       ; 03A7, 3E01
	MOVWF   $4       ; 03A8, 0084
	MOVF    $49,$0   ; 03A9, 0849
	MOVWF   $0       ; 03AA, 0080
	MOVF    $4a,$0   ; 03AB, 084A
	MOVWF   $4       ; 03AC, 0084
	MOVF    $48,$0   ; 03AD, 0848
	MOVWF   $0       ; 03AE, 0080
	MOVF    $4a,$0   ; 03AF, 084A
	ADDLW   $2       ; 03B0, 3E02
	MOVWF   $4       ; 03B1, 0084
	MOVF    $48,$0   ; 03B2, 0848
	MOVWF   $0       ; 03B3, 0080
	RET              ; 03B4, 0008

.org 0x3B5 
_L3B5:
	MOVWF   $47      ; 03B5, 00C7
	MOVLW   $19      ; 03B6, 3019
	MOVWF   $48      ; 03B7, 00C8
	MOVLW   $4       ; 03B8, 3004
	MOVWF   $49      ; 03B9, 00C9
	RETLW   $43      ; 03BA, 3443

.org 0x3BB 
_L3BB:
	MOVLW   $0       ; 03BB, 3000
	BCF     $2c,$3   ; 03BC, 11AC
	CLRF    $25      ; 03BD, 01A5
	CLRF    $26      ; 03BE, 01A6
	RET              ; 03BF, 0008

.org 0x3C0 
_L3C0:
	BCF     $3,$5    ; 03C0, 1283
	BTFSS   $2e,$7   ; 03C1, 1FAE
	RET              ; 03C2, 0008
	BCF     $2e,$7   ; 03C3, 13AE
	BCF     $d,$0    ; 03C4, 100D
	BCF     $2e,$6   ; 03C5, 132E
	BSF     $5,$4    ; 03C6, 1605
	BSF     $3,$6    ; 03C7, 1703
	CLRF    $64      ; 03C8, 01E4
	CLRF    $65      ; 03C9, 01E5
	MOVLW   $4f      ; 03CA, 304F
	BSF     $3,$5    ; 03CB, 1683
	BCF     $3,$6    ; 03CC, 1303
	ANDWF   $24,$1   ; 03CD, 05A4
	MOVF    $7,$0    ; 03CE, 0807
	ANDLW   $f       ; 03CF, 390F
	IORLW   $90      ; 03D0, 3890
	MOVWF   $7       ; 03D1, 0087
	BCF     $3,$5    ; 03D2, 1283
	MOVLW   $8       ; 03D3, 3008
	BSF     $5,$3    ; 03D4, 1585
	BCF     $2c,$0   ; 03D5, 102C
	BCF     $2c,$6   ; 03D6, 132C
	BCF     $2c,$1   ; 03D7, 10AC
	BSF     $2c,$2   ; 03D8, 152C
	BSF     $2c,$7   ; 03D9, 17AC
	BSF     $2c,$0   ; 03DA, 142C
	MOVWF   $44      ; 03DB, 00C4
	CLRF    $45      ; 03DC, 01C5
	RET              ; 03DD, 0008

.org 0x3DE 
_L3DE:
	BTFSS   $e,$4    ; 03DE, 1E0E
	GOTO    _L3E8    ; 03DF, 2BE8
	BTFSC   $2e,$7   ; 03E0, 1BAE
	BTFSC   $2e,$6   ; 03E1, 1B2E
	GOTO    _L3E6    ; 03E2, 2BE6
	BSF     $5,$4    ; 03E3, 1605
	BSF     $5,$2    ; 03E4, 1505
	BSF     $2e,$6   ; 03E5, 172E

.org 0x3E6 
_L3E6:
	BCF     $e,$4    ; 03E6, 120E
	GOTO    _L418    ; 03E7, 2C18

.org 0x3E8 
_L3E8:
	BTFSS   $e,$0    ; 03E8, 1C0E
	GOTO    _L3F5    ; 03E9, 2BF5
	BTFSC   $2e,$7   ; 03EA, 1BAE
	GOTO    _L3EE    ; 03EB, 2BEE
	BTFSS   $d,$0    ; 03EC, 1C0D
	GOTO    _L3F3    ; 03ED, 2BF3

.org 0x3EE 
_L3EE:
	BTFSC   $2e,$6   ; 03EE, 1B2E
	GOTO    _L3F3    ; 03EF, 2BF3
	BSF     $5,$4    ; 03F0, 1605
	BSF     $5,$2    ; 03F1, 1505
	BSF     $2e,$6   ; 03F2, 172E

.org 0x3F3 
_L3F3:
	BCF     $e,$0    ; 03F3, 100E
	GOTO    _L418    ; 03F4, 2C18

.org 0x3F5 
_L3F5:
	BTFSS   $c,$4    ; 03F5, 1E0C
	GOTO    _L409    ; 03F6, 2C09
	MOVLW   $64      ; 03F7, 3064
	BSF     $3,$6    ; 03F8, 1703
	INCF    $59,$1   ; 03F9, 0AD9
	SUBWF   $59,$0   ; 03FA, 0259
	BTFSS   $3,$0    ; 03FB, 1C03
	GOTO    _L400    ; 03FC, 2C00
	CLRF    $59      ; 03FD, 01D9
	BCF     $3,$6    ; 03FE, 1303
	BSF     $2d,$6   ; 03FF, 172D

.org 0x400 
_L400:
	CALL    _L44B    ; 0400, 244B
	BCF     $a,$3    ; 0401, 118A
	BTFSC   $2e,$7   ; 0402, 1BAE
	BTFSC   $2e,$6   ; 0403, 1B2E
	GOTO    _L407    ; 0404, 2C07
	CALL    _L423    ; 0405, 2423
	BCF     $a,$3    ; 0406, 118A

.org 0x407 
_L407:
	BCF     $c,$4    ; 0407, 120C
	GOTO    _L418    ; 0408, 2C18

.org 0x409 
_L409:
	BTFSS   $c,$0    ; 0409, 1C0C
	GOTO    _L40D    ; 040A, 2C0D
	BCF     $c,$0    ; 040B, 100C
	GOTO    _L418    ; 040C, 2C18

.org 0x40D 
_L40D:
	BTFSS   $c,$1    ; 040D, 1C8C
	GOTO    _L411    ; 040E, 2C11
	BCF     $c,$1    ; 040F, 108C
	GOTO    _L418    ; 0410, 2C18

.org 0x411 
_L411:
	BTFSS   $c,$2    ; 0411, 1D0C
	GOTO    _L415    ; 0412, 2C15
	BCF     $c,$2    ; 0413, 110C
	GOTO    _L418    ; 0414, 2C18

.org 0x415 
_L415:
	BTFSS   $c,$3    ; 0415, 1D8C
	GOTO    _L418    ; 0416, 2C18
	BCF     $c,$3    ; 0417, 118C

.org 0x418 
_L418:
	MOVF    $7d,$0   ; 0418, 087D
	MOVWF   $7f      ; 0419, 00FF
	MOVF    $7c,$0   ; 041A, 087C
	MOVWF   $a       ; 041B, 008A
	MOVF    $7b,$0   ; 041C, 087B
	MOVWF   $4       ; 041D, 0084
	SWAPF   $7a,$0   ; 041E, 0E7A
	MOVWF   $3       ; 041F, 0083
	SWAPF   $7e,$1   ; 0420, 0EFE
	SWAPF   $7e,$0   ; 0421, 0E7E
	RETI             ; 0422, 0009

.org 0x423 
_L423:
	MOVLW   $c8      ; 0423, 30C8
	SUBWF   $27,$0   ; 0424, 0227
	BTFSS   $3,$0    ; 0425, 1C03
	GOTO    _L439    ; 0426, 2C39
	CLRF    $27      ; 0427, 01A7
	MOVF    $29,$0   ; 0428, 0829
	MOVWF   $28      ; 0429, 00A8
	MOVF    $2b,$0   ; 042A, 082B
	MOVWF   $2a      ; 042B, 00AA
	MOVF    $28,$0   ; 042C, 0828
	BTFSC   $3,$2    ; 042D, 1903
	GOTO    _L431    ; 042E, 2C31
	BCF     $5,$4    ; 042F, 1205
	GOTO    _L432    ; 0430, 2C32

.org 0x431 
_L431:
	BSF     $5,$4    ; 0431, 1605

.org 0x432 
_L432:
	MOVF    $2a,$0   ; 0432, 082A
	BTFSC   $3,$2    ; 0433, 1903
	GOTO    _L437    ; 0434, 2C37
	BCF     $5,$2    ; 0435, 1105
	GOTO    _L445    ; 0436, 2C45

.org 0x437 
_L437:
	BSF     $5,$2    ; 0437, 1505
	GOTO    _L445    ; 0438, 2C45

.org 0x439 
_L439:
	MOVF    $27,$0   ; 0439, 0827
	BTFSC   $3,$2    ; 043A, 1903
	GOTO    _L445    ; 043B, 2C45
	MOVF    $28,$0   ; 043C, 0828
	XORWF   $27,$0   ; 043D, 0627
	BTFSS   $3,$2    ; 043E, 1D03
	GOTO    _L441    ; 043F, 2C41
	BSF     $5,$4    ; 0440, 1605

.org 0x441 
_L441:
	MOVF    $2a,$0   ; 0441, 082A
	XORWF   $27,$0   ; 0442, 0627
	BTFSC   $3,$2    ; 0443, 1903
	GOTO    _L437    ; 0444, 2C37

.org 0x445 
_L445:
	MOVF    $27,$0   ; 0445, 0827
	XORLW   $5       ; 0446, 3A05
	BTFSC   $3,$2    ; 0447, 1903
	BSF     $2e,$4   ; 0448, 162E
	INCF    $27,$1   ; 0449, 0AA7
	RET              ; 044A, 0008

.org 0x44B 
_L44B:
	CLRF    $78      ; 044B, 01F8
	CLRF    $79      ; 044C, 01F9
	CLRF    $79      ; 044D, 01F9

.org 0x44E 
_L44E:
	MOVF    $79,$0   ; 044E, 0879
	CALL    _L549    ; 044F, 2549
	BCF     $a,$3    ; 0450, 118A
	MOVLW   $8       ; 0451, 3008
	INCF    $79,$1   ; 0452, 0AF9
	SUBWF   $79,$0   ; 0453, 0279
	BTFSS   $3,$0    ; 0454, 1C03
	GOTO    _L44E    ; 0455, 2C4E
	CLRF    $79      ; 0456, 01F9

.org 0x457 
_L457:
	MOVLW   $6       ; 0457, 3006
	MOVWF   $70      ; 0458, 00F0
	BCF     $3,$5    ; 0459, 1283
	BCF     $3,$6    ; 045A, 1303
	MOVF    $2f,$0   ; 045B, 082F
	CALL    _L4B4    ; 045C, 24B4
	BCF     $a,$3    ; 045D, 118A
	CALL    _L5A0    ; 045E, 25A0
	BCF     $a,$3    ; 045F, 118A
	CALL    _L5AA    ; 0460, 25AA
	BCF     $a,$3    ; 0461, 118A
	CALL    _L600    ; 0462, 2600
	BCF     $a,$3    ; 0463, 118A
	IORLW   $0       ; 0464, 3800
	BTFSC   $3,$2    ; 0465, 1903
	GOTO    _L4AC    ; 0466, 2CAC
	MOVLW   $6       ; 0467, 3006
	MOVWF   $70      ; 0468, 00F0
	MOVF    $2f,$0   ; 0469, 082F
	CALL    _L4B4    ; 046A, 24B4
	BCF     $a,$3    ; 046B, 118A
	CALL    _L5A0    ; 046C, 25A0
	BCF     $a,$3    ; 046D, 118A
	CALL    _L5AA    ; 046E, 25AA
	BCF     $a,$3    ; 046F, 118A
	CALL    _L600    ; 0470, 2600
	BCF     $a,$3    ; 0471, 118A
	ADDLW   $ff      ; 0472, 3EFF
	MOVWF   $77      ; 0473, 00F7
	MOVLW   $6       ; 0474, 3006
	MOVWF   $70      ; 0475, 00F0
	MOVF    $2f,$0   ; 0476, 082F
	CALL    _L4B4    ; 0477, 24B4
	BCF     $a,$3    ; 0478, 118A
	CALL    _L5A0    ; 0479, 25A0
	MOVWF   $75      ; 047A, 00F5
	MOVF    $74,$0   ; 047B, 0874
	BTFSC   $3,$0    ; 047C, 1803
	ADDLW   $1       ; 047D, 3E01
	MOVWF   $76      ; 047E, 00F6
	MOVLW   $1       ; 047F, 3001
	ADDWF   $75,$0   ; 0480, 0775
	MOVWF   $4       ; 0481, 0084
	MOVF    $76,$0   ; 0482, 0876
	BTFSC   $3,$0    ; 0483, 1803
	INCF    $76,$0   ; 0484, 0A76
	MOVWF   $7f      ; 0485, 00FF
	BCF     $a,$3    ; 0486, 118A
	CALL    _L600    ; 0487, 2600
	BCF     $a,$3    ; 0488, 118A
	ADDLW   $ff      ; 0489, 3EFF
	MOVWF   $78      ; 048A, 00F8
	MOVF    $77,$0   ; 048B, 0877
	MOVWF   $73      ; 048C, 00F3
	MOVLW   $a0      ; 048D, 30A0
	BCF     $3,$0    ; 048E, 1003
	RLF     $73,$1   ; 048F, 0DF3
	BCF     $3,$0    ; 0490, 1003
	RLF     $73,$1   ; 0491, 0DF3
	BCF     $3,$0    ; 0492, 1003
	RLF     $73,$1   ; 0493, 0DF3
	ADDWF   $73,$0   ; 0494, 0773
	MOVWF   $74      ; 0495, 00F4
	MOVF    $78,$0   ; 0496, 0878
	ADDWF   $74,$0   ; 0497, 0774
	MOVWF   $75      ; 0498, 00F5
	MOVWF   $4       ; 0499, 0084
	BSF     $3,$7    ; 049A, 1783
	MOVF    $0,$1    ; 049B, 0880
	BTFSC   $3,$2    ; 049C, 1903
	GOTO    _L4A7    ; 049D, 2CA7
	CLRF    $70      ; 049E, 01F0
	MOVF    $77,$0   ; 049F, 0877
	CALL    _L4C2    ; 04A0, 24C2
	BCF     $a,$3    ; 04A1, 118A
	CLRF    $70      ; 04A2, 01F0
	INCF    $70,$1   ; 04A3, 0AF0
	MOVF    $78,$0   ; 04A4, 0878
	CALL    _L4C2    ; 04A5, 24C2
	BCF     $a,$3    ; 04A6, 118A

.org 0x4A7 
_L4A7:
	MOVLW   $3       ; 04A7, 3003
	INCF    $79,$1   ; 04A8, 0AF9
	SUBWF   $79,$0   ; 04A9, 0279
	BTFSS   $3,$0    ; 04AA, 1C03
	GOTO    _L457    ; 04AB, 2C57

.org 0x4AC 
_L4AC:
	BCF     $3,$5    ; 04AC, 1283
	BCF     $3,$6    ; 04AD, 1303
	INCF    $2f,$1   ; 04AE, 0AAF
	MOVF    $2f,$0   ; 04AF, 082F
	XORLW   $12      ; 04B0, 3A12
	BTFSC   $3,$2    ; 04B1, 1903
	CLRF    $2f      ; 04B2, 01AF
	RET              ; 04B3, 0008

.org 0x4B4 
_L4B4:
	MOVWF   $72      ; 04B4, 00F2
	CLRF    $71      ; 04B5, 01F1

.org 0x4B6 
_L4B6:
	MOVF    $70,$0   ; 04B6, 0870
	BTFSC   $72,$0   ; 04B7, 1872
	ADDWF   $71,$1   ; 04B8, 07F1
	BCF     $3,$0    ; 04B9, 1003
	RLF     $70,$1   ; 04BA, 0DF0
	BCF     $3,$0    ; 04BB, 1003
	RRF     $72,$1   ; 04BC, 0CF2
	MOVF    $72,$1   ; 04BD, 08F2
	BTFSS   $3,$2    ; 04BE, 1D03
	GOTO    _L4B6    ; 04BF, 2CB6
	MOVF    $71,$0   ; 04C0, 0871
	RET              ; 04C1, 0008

.org 0x4C2 
_L4C2:
	MOVWF   $71      ; 04C2, 00F1
	GOTO    _L53C    ; 04C3, 2D3C

.org 0x4C4 
_L4C4:
	BSF     $3,$5    ; 04C4, 1683
	BCF     $3,$6    ; 04C5, 1303
	MOVF    $d,$0    ; 04C6, 080D
	ANDLW   $f       ; 04C7, 390F
	IORLW   $60      ; 04C8, 3860
	MOVWF   $d       ; 04C9, 008D
	MOVF    $70,$0   ; 04CA, 0870
	BTFSC   $3,$2    ; 04CB, 1903
	GOTO    _L4D0    ; 04CC, 2CD0
	BCF     $3,$5    ; 04CD, 1283
	BSF     $6,$3    ; 04CE, 1586
	RET              ; 04CF, 0008

.org 0x4D0 
_L4D0:
	BCF     $3,$5    ; 04D0, 1283
	BCF     $6,$3    ; 04D1, 1186
	RET              ; 04D2, 0008

.org 0x4D3 
_L4D3:
	BSF     $3,$5    ; 04D3, 1683
	BCF     $3,$6    ; 04D4, 1303
	MOVF    $10,$0   ; 04D5, 0810
	ANDLW   $f0      ; 04D6, 39F0
	IORLW   $6       ; 04D7, 3806
	MOVWF   $10      ; 04D8, 0090
	MOVF    $70,$0   ; 04D9, 0870
	BTFSC   $3,$2    ; 04DA, 1903
	GOTO    _L4DF    ; 04DB, 2CDF
	BCF     $3,$5    ; 04DC, 1283
	BSF     $7,$0    ; 04DD, 1407
	RET              ; 04DE, 0008

.org 0x4DF 
_L4DF:
	BCF     $3,$5    ; 04DF, 1283
	BCF     $7,$0    ; 04E0, 1007
	RET              ; 04E1, 0008

.org 0x4E2 
_L4E2:
	BSF     $3,$5    ; 04E2, 1683
	BCF     $3,$6    ; 04E3, 1303
	MOVF    $10,$0   ; 04E4, 0810
	ANDLW   $f       ; 04E5, 390F
	IORLW   $60      ; 04E6, 3860
	MOVWF   $10      ; 04E7, 0090
	MOVF    $70,$0   ; 04E8, 0870
	BTFSC   $3,$2    ; 04E9, 1903
	GOTO    _L4EE    ; 04EA, 2CEE
	BCF     $3,$5    ; 04EB, 1283
	BSF     $7,$1    ; 04EC, 1487
	RET              ; 04ED, 0008

.org 0x4EE 
_L4EE:
	BCF     $3,$5    ; 04EE, 1283
	BCF     $7,$1    ; 04EF, 1087
	RET              ; 04F0, 0008

.org 0x4F1 
_L4F1:
	BSF     $3,$5    ; 04F1, 1683
	BCF     $3,$6    ; 04F2, 1303
	MOVF    $e,$0    ; 04F3, 080E
	ANDLW   $f0      ; 04F4, 39F0
	IORLW   $6       ; 04F5, 3806
	MOVWF   $e       ; 04F6, 008E
	MOVF    $70,$0   ; 04F7, 0870
	BTFSC   $3,$2    ; 04F8, 1903
	GOTO    _L4FD    ; 04F9, 2CFD
	BCF     $3,$5    ; 04FA, 1283
	BSF     $6,$4    ; 04FB, 1606
	RET              ; 04FC, 0008

.org 0x4FD 
_L4FD:
	BCF     $3,$5    ; 04FD, 1283
	BCF     $6,$4    ; 04FE, 1206
	RET              ; 04FF, 0008

.org 0x500 
_L500:
	BSF     $3,$5    ; 0500, 1683
	BCF     $3,$6    ; 0501, 1303
	MOVF    $e,$0    ; 0502, 080E
	ANDLW   $f       ; 0503, 390F
	IORLW   $60      ; 0504, 3860
	MOVWF   $e       ; 0505, 008E
	MOVF    $70,$0   ; 0506, 0870
	BTFSC   $3,$2    ; 0507, 1903
	GOTO    _L50C    ; 0508, 2D0C
	BCF     $3,$5    ; 0509, 1283
	BSF     $6,$5    ; 050A, 1686
	RET              ; 050B, 0008

.org 0x50C 
_L50C:
	BCF     $3,$5    ; 050C, 1283
	BCF     $6,$5    ; 050D, 1286
	RET              ; 050E, 0008

.org 0x50F 
_L50F:
	BSF     $3,$5    ; 050F, 1683
	BCF     $3,$6    ; 0510, 1303
	MOVF    $f,$0    ; 0511, 080F
	ANDLW   $f0      ; 0512, 39F0
	IORLW   $6       ; 0513, 3806
	MOVWF   $f       ; 0514, 008F
	MOVF    $70,$0   ; 0515, 0870
	BTFSC   $3,$2    ; 0516, 1903
	GOTO    _L51B    ; 0517, 2D1B
	BCF     $3,$5    ; 0518, 1283
	BSF     $6,$6    ; 0519, 1706
	RET              ; 051A, 0008

.org 0x51B 
_L51B:
	BCF     $3,$5    ; 051B, 1283
	BCF     $6,$6    ; 051C, 1306
	RET              ; 051D, 0008

.org 0x51E 
_L51E:
	BSF     $3,$5    ; 051E, 1683
	BCF     $3,$6    ; 051F, 1303
	MOVF    $f,$0    ; 0520, 080F
	ANDLW   $f       ; 0521, 390F
	IORLW   $60      ; 0522, 3860
	MOVWF   $f       ; 0523, 008F
	MOVF    $70,$0   ; 0524, 0870
	BTFSC   $3,$2    ; 0525, 1903
	GOTO    _L52A    ; 0526, 2D2A
	BCF     $3,$5    ; 0527, 1283
	BSF     $6,$7    ; 0528, 1786
	RET              ; 0529, 0008

.org 0x52A 
_L52A:
	BCF     $3,$5    ; 052A, 1283
	BCF     $6,$7    ; 052B, 1386
	RET              ; 052C, 0008

.org 0x52D 
_L52D:
	BSF     $3,$5    ; 052D, 1683
	BCF     $3,$6    ; 052E, 1303
	MOVF    $c,$0    ; 052F, 080C
	ANDLW   $f0      ; 0530, 39F0
	IORLW   $6       ; 0531, 3806
	MOVWF   $c       ; 0532, 008C
	MOVF    $70,$0   ; 0533, 0870
	BTFSC   $3,$2    ; 0534, 1903
	GOTO    _L539    ; 0535, 2D39
	BCF     $3,$5    ; 0536, 1283
	BSF     $6,$0    ; 0537, 1406
	RET              ; 0538, 0008

.org 0x539 
_L539:
	BCF     $3,$5    ; 0539, 1283
	BCF     $6,$0    ; 053A, 1006
	RET              ; 053B, 0008

.org 0x53C 
_L53C:
	MOVF    $71,$0   ; 053C, 0871
	MOVWF   $4       ; 053D, 0084
	MOVLW   $8       ; 053E, 3008
	SUBWF   $4,$0    ; 053F, 0204
	BTFSC   $3,$0    ; 0540, 1803
	RET              ; 0541, 0008
	MOVLW   $8       ; 0542, 3008
	MOVWF   $a       ; 0543, 008A
	BCF     $3,$0    ; 0544, 1003
	RLF     $4,$0    ; 0545, 0D04
	ADDLW   $0       ; 0546, 3E00
	MOVWF   $2       ; 0547, 0082
	RET              ; 0548, 0008

.org 0x549 
_L549:
	MOVWF   $70      ; 0549, 00F0
	GOTO    _L593    ; 054A, 2D93

.org 0x54B 
_L54B:
	BCF     $3,$5    ; 054B, 1283
	BCF     $3,$6    ; 054C, 1303
	BSF     $6,$3    ; 054D, 1586
	BSF     $3,$5    ; 054E, 1683
	MOVF    $d,$0    ; 054F, 080D
	ANDLW   $f       ; 0550, 390F
	IORLW   $10      ; 0551, 3810
	MOVWF   $d       ; 0552, 008D
	RET              ; 0553, 0008

.org 0x554 
_L554:
	BCF     $3,$5    ; 0554, 1283
	BCF     $3,$6    ; 0555, 1303
	BSF     $7,$0    ; 0556, 1407
	BSF     $3,$5    ; 0557, 1683
	MOVF    $10,$0   ; 0558, 0810
	ANDLW   $f0      ; 0559, 39F0
	IORLW   $1       ; 055A, 3801
	MOVWF   $10      ; 055B, 0090
	RET              ; 055C, 0008

.org 0x55D 
_L55D:
	BCF     $3,$5    ; 055D, 1283
	BCF     $3,$6    ; 055E, 1303
	BSF     $7,$1    ; 055F, 1487
	BSF     $3,$5    ; 0560, 1683
	MOVF    $10,$0   ; 0561, 0810
	ANDLW   $f       ; 0562, 390F
	IORLW   $10      ; 0563, 3810
	MOVWF   $10      ; 0564, 0090
	RET              ; 0565, 0008

.org 0x566 
_L566:
	BCF     $3,$5    ; 0566, 1283
	BCF     $3,$6    ; 0567, 1303
	BSF     $6,$4    ; 0568, 1606
	BSF     $3,$5    ; 0569, 1683
	MOVF    $e,$0    ; 056A, 080E
	ANDLW   $f0      ; 056B, 39F0
	IORLW   $1       ; 056C, 3801
	MOVWF   $e       ; 056D, 008E
	RET              ; 056E, 0008

.org 0x56F 
_L56F:
	BCF     $3,$5    ; 056F, 1283
	BCF     $3,$6    ; 0570, 1303
	BSF     $6,$5    ; 0571, 1686
	BSF     $3,$5    ; 0572, 1683
	MOVF    $e,$0    ; 0573, 080E
	ANDLW   $f       ; 0574, 390F
	IORLW   $10      ; 0575, 3810
	MOVWF   $e       ; 0576, 008E
	RET              ; 0577, 0008

.org 0x578 
_L578:
	BCF     $3,$5    ; 0578, 1283
	BCF     $3,$6    ; 0579, 1303
	BSF     $6,$6    ; 057A, 1706
	BSF     $3,$5    ; 057B, 1683
	MOVF    $f,$0    ; 057C, 080F
	ANDLW   $f0      ; 057D, 39F0
	IORLW   $1       ; 057E, 3801
	MOVWF   $f       ; 057F, 008F
	RET              ; 0580, 0008

.org 0x581 
_L581:
	BCF     $3,$5    ; 0581, 1283
	BCF     $3,$6    ; 0582, 1303
	BSF     $6,$7    ; 0583, 1786
	BSF     $3,$5    ; 0584, 1683
	MOVF    $f,$0    ; 0585, 080F
	ANDLW   $f       ; 0586, 390F
	IORLW   $10      ; 0587, 3810
	MOVWF   $f       ; 0588, 008F
	RET              ; 0589, 0008

.org 0x58A 
_L58A:
	BCF     $3,$5    ; 058A, 1283
	BCF     $3,$6    ; 058B, 1303
	BSF     $6,$0    ; 058C, 1406
	BSF     $3,$5    ; 058D, 1683
	MOVF    $c,$0    ; 058E, 080C
	ANDLW   $f0      ; 058F, 39F0
	IORLW   $1       ; 0590, 3801
	MOVWF   $c       ; 0591, 008C
	RET              ; 0592, 0008

.org 0x593 
_L593:
	MOVF    $70,$0   ; 0593, 0870
	MOVWF   $4       ; 0594, 0084
	MOVLW   $8       ; 0595, 3008
	SUBWF   $4,$0    ; 0596, 0204
	BTFSC   $3,$0    ; 0597, 1803
	RET              ; 0598, 0008
	MOVLW   $8       ; 0599, 3008
	MOVWF   $a       ; 059A, 008A
	BCF     $3,$0    ; 059B, 1003
	RLF     $4,$0    ; 059C, 0D04
	ADDLW   $10      ; 059D, 3E10
	MOVWF   $2       ; 059E, 0082
	RET              ; 059F, 0008

.org 0x5A0 
_L5A0:
	ADDLW   $dc      ; 05A0, 3EDC
	MOVWF   $73      ; 05A1, 00F3
	MOVLW   $86      ; 05A2, 3086
	BTFSC   $3,$0    ; 05A3, 1803
	ADDLW   $1       ; 05A4, 3E01
	MOVWF   $74      ; 05A5, 00F4
	BCF     $3,$0    ; 05A6, 1003
	RLF     $79,$0   ; 05A7, 0D79
	ADDWF   $73,$0   ; 05A8, 0773
	RET              ; 05A9, 0008

.org 0x5AA 
_L5AA:
	MOVWF   $4       ; 05AA, 0084
	MOVF    $74,$0   ; 05AB, 0874
	BTFSC   $3,$0    ; 05AC, 1803
	INCF    $74,$0   ; 05AD, 0A74
	MOVWF   $7f      ; 05AE, 00FF
	RET              ; 05AF, 0008

.org 0x5B0 
_L5B0:
	BTFSS   $2d,$2   ; 05B0, 1D2D
	GOTO    _L5DA    ; 05B1, 2DDA
	BTFSC   $5,$6    ; 05B2, 1B05
	GOTO    _L5D7    ; 05B3, 2DD7
	BSF     $3,$5    ; 05B4, 1683
	MOVLW   $3       ; 05B5, 3003
	INCF    $20,$1   ; 05B6, 0AA0
	SUBWF   $20,$0   ; 05B7, 0220
	BTFSS   $3,$0    ; 05B8, 1C03
	RET              ; 05B9, 0008
	BCF     $3,$5    ; 05BA, 1283
	BCF     $2d,$2   ; 05BB, 112D
	BCF     $2d,$3   ; 05BC, 11AD
	BSF     $3,$5    ; 05BD, 1683
	CLRF    $20      ; 05BE, 01A0
	BCF     $3,$5    ; 05BF, 1283
	MOVLW   $4       ; 05C0, 3004
	BSF     $3,$6    ; 05C1, 1703
	CLRF    $5c      ; 05C2, 01DC
	CLRF    $5d      ; 05C3, 01DD
	BCF     $3,$6    ; 05C4, 1303
	SUBWF   $46,$0   ; 05C5, 0246
	BTFSC   $3,$0    ; 05C6, 1803
	GOTO    _L5CC    ; 05C7, 2DCC
	MOVLW   $7       ; 05C8, 3007
	SUBWF   $46,$0   ; 05C9, 0246
	BTFSC   $3,$0    ; 05CA, 1803
	RET              ; 05CB, 0008

.org 0x5CC 
_L5CC:
	MOVLW   $6       ; 05CC, 3006
	CALL    _L5EC    ; 05CD, 25EC
	BCF     $a,$3    ; 05CE, 118A
	CALL    _L3A0    ; 05CF, 23A0
	MOVLW   $0       ; 05D0, 3000
	CLRF    $45      ; 05D1, 01C5
	BCF     $2c,$3   ; 05D2, 11AC
	CLRF    $25      ; 05D3, 01A5
	CLRF    $26      ; 05D4, 01A6
	BCF     $a,$3    ; 05D5, 118A
	GOTO    _L394    ; 05D6, 2B94

.org 0x5D7 
_L5D7:
	BSF     $3,$5    ; 05D7, 1683
	CLRF    $20      ; 05D8, 01A0
	RET              ; 05D9, 0008

.org 0x5DA 
_L5DA:
	BTFSS   $5,$6    ; 05DA, 1F05
	GOTO    _L5D7    ; 05DB, 2DD7
	BSF     $3,$5    ; 05DC, 1683
	MOVLW   $3       ; 05DD, 3003
	INCF    $20,$1   ; 05DE, 0AA0
	SUBWF   $20,$0   ; 05DF, 0220
	BTFSS   $3,$0    ; 05E0, 1C03
	RET              ; 05E1, 0008
	BCF     $3,$5    ; 05E2, 1283
	BSF     $2d,$2   ; 05E3, 152D
	BCF     $2d,$3   ; 05E4, 11AD
	BSF     $3,$5    ; 05E5, 1683
	CLRF    $20      ; 05E6, 01A0
	BCF     $3,$5    ; 05E7, 1283
	BSF     $3,$6    ; 05E8, 1703
	CLRF    $5a      ; 05E9, 01DA
	CLRF    $5b      ; 05EA, 01DB
	RET              ; 05EB, 0008

.org 0x5EC 
_L5EC:
	MOVWF   $47      ; 05EC, 00C7
	MOVLW   $19      ; 05ED, 3019
	MOVWF   $48      ; 05EE, 00C8
	MOVLW   $8       ; 05EF, 3008
	MOVWF   $49      ; 05F0, 00C9
	RETLW   $43      ; 05F1, 3443
	NOP              ; 05F2,   --
	NOP              ; 05F3,   --
	NOP              ; 05F4,   --
	NOP              ; 05F5,   --
	NOP              ; 05F6,   --
	NOP              ; 05F7,   --
	NOP              ; 05F8,   --
	NOP              ; 05F9,   --
	NOP              ; 05FA,   --
	NOP              ; 05FB,   --
	NOP              ; 05FC,   --
	NOP              ; 05FD,   --
	NOP              ; 05FE,   --
	NOP              ; 05FF,   --

.org 0x600 
_L600:
	BTFSC   $7f,$7   ; 0600, 1BFF
	GOTO    _L60A    ; 0601, 2E0A
	BCF     $3,$7    ; 0602, 1383
	BTFSC   $7f,$0   ; 0603, 187F
	BSF     $3,$7    ; 0604, 1783
	MOVF    $0,$0    ; 0605, 0800
	INCF    $4,$1    ; 0606, 0A84
	BTFSC   $3,$2    ; 0607, 1903
	INCF    $7f,$1   ; 0608, 0AFF
	RET              ; 0609, 0008

.org 0x60A 
_L60A:
	MOVF    $7f,$0   ; 060A, 087F
	ANDLW   $7f      ; 060B, 397F
	MOVWF   $a       ; 060C, 008A
	MOVF    $4,$0    ; 060D, 0804
	INCF    $4,$1    ; 060E, 0A84
	BTFSC   $3,$2    ; 060F, 1903
	INCF    $7f,$1   ; 0610, 0AFF
	MOVWF   $2       ; 0611, 0082
	RETLW   $e4      ; 0612, 34E4
	RETLW   $c       ; 0613, 340C
	RETLW   $f2      ; 0614, 34F2
	RETLW   $c       ; 0615, 340C
	RETLW   $0       ; 0616, 3400
	RETLW   $d       ; 0617, 340D
	RETLW   $e       ; 0618, 340E
	RETLW   $d       ; 0619, 340D
	RETLW   $1c      ; 061A, 341C
	RETLW   $d       ; 061B, 340D
	RETLW   $2a      ; 061C, 342A
	RETLW   $d       ; 061D, 340D
	RETLW   $38      ; 061E, 3438
	RETLW   $d       ; 061F, 340D
	RETLW   $46      ; 0620, 3446
	RETLW   $d       ; 0621, 340D
	RETLW   $54      ; 0622, 3454
	RETLW   $d       ; 0623, 340D
	RETLW   $62      ; 0624, 3462
	RETLW   $d       ; 0625, 340D
	RETLW   $70      ; 0626, 3470
	RETLW   $d       ; 0627, 340D
	RETLW   $7a      ; 0628, 347A
	RETLW   $d       ; 0629, 340D
	RETLW   $84      ; 062A, 3484
	RETLW   $d       ; 062B, 340D
	RETLW   $8e      ; 062C, 348E
	RETLW   $d       ; 062D, 340D
	RETLW   $98      ; 062E, 3498
	RETLW   $d       ; 062F, 340D
	RETLW   $a2      ; 0630, 34A2
	RETLW   $d       ; 0631, 340D
	RETLW   $ac      ; 0632, 34AC
	RETLW   $d       ; 0633, 340D
	RETLW   $b6      ; 0634, 34B6
	RETLW   $d       ; 0635, 340D
	RETLW   $c0      ; 0636, 34C0
	RETLW   $d       ; 0637, 340D
	RETLW   $ca      ; 0638, 34CA
	RETLW   $d       ; 0639, 340D
	RETLW   $d4      ; 063A, 34D4
	RETLW   $d       ; 063B, 340D
	RETLW   $de      ; 063C, 34DE
	RETLW   $d       ; 063D, 340D
	RETLW   $e8      ; 063E, 34E8
	RETLW   $d       ; 063F, 340D
	RETLW   $f2      ; 0640, 34F2
	RETLW   $d       ; 0641, 340D
	RETLW   $fc      ; 0642, 34FC
	RETLW   $d       ; 0643, 340D
	RETLW   $6       ; 0644, 3406
	RETLW   $e       ; 0645, 340E
	RETLW   $10      ; 0646, 3410
	RETLW   $e       ; 0647, 340E
	RETLW   $1a      ; 0648, 341A
	RETLW   $e       ; 0649, 340E
	RETLW   $24      ; 064A, 3424
	RETLW   $e       ; 064B, 340E
	RETLW   $2e      ; 064C, 342E
	RETLW   $e       ; 064D, 340E
	RETLW   $38      ; 064E, 3438
	RETLW   $e       ; 064F, 340E
	RETLW   $3c      ; 0650, 343C
	RETLW   $e       ; 0651, 340E
	RETLW   $40      ; 0652, 3440
	RETLW   $e       ; 0653, 340E
	RETLW   $44      ; 0654, 3444
	RETLW   $e       ; 0655, 340E
	RETLW   $48      ; 0656, 3448
	RETLW   $e       ; 0657, 340E
	RETLW   $4c      ; 0658, 344C
	RETLW   $e       ; 0659, 340E
	RETLW   $50      ; 065A, 3450
	RETLW   $e       ; 065B, 340E
	RETLW   $54      ; 065C, 3454
	RETLW   $e       ; 065D, 340E
	RETLW   $58      ; 065E, 3458
	RETLW   $e       ; 065F, 340E
	RETLW   $5c      ; 0660, 345C
	RETLW   $e       ; 0661, 340E
	RETLW   $60      ; 0662, 3460
	RETLW   $e       ; 0663, 340E
	RETLW   $64      ; 0664, 3464
	RETLW   $e       ; 0665, 340E
	RETLW   $68      ; 0666, 3468
	RETLW   $e       ; 0667, 340E
	RETLW   $6c      ; 0668, 346C
	RETLW   $e       ; 0669, 340E
	RETLW   $70      ; 066A, 3470
	RETLW   $e       ; 066B, 340E
	RETLW   $74      ; 066C, 3474
	RETLW   $e       ; 066D, 340E
	RETLW   $78      ; 066E, 3478
	RETLW   $e       ; 066F, 340E
	RETLW   $7c      ; 0670, 347C
	RETLW   $e       ; 0671, 340E
	RETLW   $80      ; 0672, 3480
	RETLW   $e       ; 0673, 340E
	RETLW   $84      ; 0674, 3484
	RETLW   $e       ; 0675, 340E
	RETLW   $88      ; 0676, 3488
	RETLW   $e       ; 0677, 340E
	RETLW   $8c      ; 0678, 348C
	RETLW   $e       ; 0679, 340E
	RETLW   $90      ; 067A, 3490
	RETLW   $e       ; 067B, 340E
	RETLW   $94      ; 067C, 3494
	RETLW   $e       ; 067D, 340E
	RETLW   $98      ; 067E, 3498
	RETLW   $e       ; 067F, 340E
	RETLW   $9c      ; 0680, 349C
	RETLW   $e       ; 0681, 340E
	RETLW   $a0      ; 0682, 34A0
	RETLW   $e       ; 0683, 340E
	RETLW   $a4      ; 0684, 34A4
	RETLW   $e       ; 0685, 340E
	RETLW   $a8      ; 0686, 34A8
	RETLW   $e       ; 0687, 340E
	RETLW   $ac      ; 0688, 34AC
	RETLW   $e       ; 0689, 340E
	RETLW   $b0      ; 068A, 34B0
	RETLW   $e       ; 068B, 340E
	RETLW   $b4      ; 068C, 34B4
	RETLW   $e       ; 068D, 340E
	RETLW   $b8      ; 068E, 34B8
	RETLW   $e       ; 068F, 340E
	RETLW   $bc      ; 0690, 34BC
	RETLW   $e       ; 0691, 340E
	RETLW   $c0      ; 0692, 34C0
	RETLW   $e       ; 0693, 340E
	RETLW   $c4      ; 0694, 34C4
	RETLW   $e       ; 0695, 340E
	RETLW   $c8      ; 0696, 34C8
	RETLW   $e       ; 0697, 340E
	RETLW   $cc      ; 0698, 34CC
	RETLW   $e       ; 0699, 340E
	RETLW   $d0      ; 069A, 34D0
	RETLW   $e       ; 069B, 340E
	RETLW   $d4      ; 069C, 34D4
	RETLW   $e       ; 069D, 340E
	RETLW   $d8      ; 069E, 34D8
	RETLW   $e       ; 069F, 340E
	RETLW   $e2      ; 06A0, 34E2
	RETLW   $e       ; 06A1, 340E
	RETLW   $ec      ; 06A2, 34EC
	RETLW   $e       ; 06A3, 340E
	RETLW   $f6      ; 06A4, 34F6
	RETLW   $e       ; 06A5, 340E
	RETLW   $0       ; 06A6, 3400
	RETLW   $f       ; 06A7, 340F
	RETLW   $a       ; 06A8, 340A
	RETLW   $f       ; 06A9, 340F
	RETLW   $14      ; 06AA, 3414
	RETLW   $f       ; 06AB, 340F
	RETLW   $1e      ; 06AC, 341E
	RETLW   $f       ; 06AD, 340F
	RETLW   $28      ; 06AE, 3428
	RETLW   $f       ; 06AF, 340F
	RETLW   $32      ; 06B0, 3432
	RETLW   $f       ; 06B1, 340F
	RETLW   $3c      ; 06B2, 343C
	RETLW   $f       ; 06B3, 340F
	RETLW   $46      ; 06B4, 3446
	RETLW   $f       ; 06B5, 340F
	RETLW   $50      ; 06B6, 3450
	RETLW   $f       ; 06B7, 340F
	RETLW   $5a      ; 06B8, 345A
	RETLW   $f       ; 06B9, 340F
	RETLW   $64      ; 06BA, 3464
	RETLW   $f       ; 06BB, 340F
	RETLW   $6e      ; 06BC, 346E
	RETLW   $f       ; 06BD, 340F
	RETLW   $78      ; 06BE, 3478
	RETLW   $f       ; 06BF, 340F
	RETLW   $82      ; 06C0, 3482
	RETLW   $f       ; 06C1, 340F
	RETLW   $8c      ; 06C2, 348C
	RETLW   $f       ; 06C3, 340F
	RETLW   $96      ; 06C4, 3496
	RETLW   $f       ; 06C5, 340F
	RETLW   $a0      ; 06C6, 34A0
	RETLW   $f       ; 06C7, 340F
	RETLW   $a5      ; 06C8, 34A5
	RETLW   $f       ; 06C9, 340F
	RETLW   $aa      ; 06CA, 34AA
	RETLW   $f       ; 06CB, 340F
	RETLW   $af      ; 06CC, 34AF
	RETLW   $f       ; 06CD, 340F
	RETLW   $b4      ; 06CE, 34B4
	RETLW   $f       ; 06CF, 340F
	RETLW   $b9      ; 06D0, 34B9
	RETLW   $f       ; 06D1, 340F
	RETLW   $be      ; 06D2, 34BE
	RETLW   $f       ; 06D3, 340F
	RETLW   $c3      ; 06D4, 34C3
	RETLW   $f       ; 06D5, 340F
	RETLW   $c8      ; 06D6, 34C8
	RETLW   $f       ; 06D7, 340F
	RETLW   $cd      ; 06D8, 34CD
	RETLW   $f       ; 06D9, 340F
	RETLW   $2c      ; 06DA, 342C
	RETLW   $10      ; 06DB, 3410
	RETLW   $1       ; 06DC, 3401
	RETLW   $2       ; 06DD, 3402
	RETLW   $1       ; 06DE, 3401
	RETLW   $3       ; 06DF, 3403
	RETLW   $1       ; 06E0, 3401
	RETLW   $4       ; 06E1, 3404
	RETLW   $1       ; 06E2, 3401
	RETLW   $5       ; 06E3, 3405
	RETLW   $1       ; 06E4, 3401
	RETLW   $6       ; 06E5, 3406
	RETLW   $1       ; 06E6, 3401
	RETLW   $7       ; 06E7, 3407
	RETLW   $2       ; 06E8, 3402
	RETLW   $1       ; 06E9, 3401
	RETLW   $2       ; 06EA, 3402
	RETLW   $3       ; 06EB, 3403
	RETLW   $2       ; 06EC, 3402
	RETLW   $4       ; 06ED, 3404
	RETLW   $2       ; 06EE, 3402
	RETLW   $5       ; 06EF, 3405
	RETLW   $2       ; 06F0, 3402
	RETLW   $6       ; 06F1, 3406
	RETLW   $2       ; 06F2, 3402
	RETLW   $7       ; 06F3, 3407
	RETLW   $3       ; 06F4, 3403
	RETLW   $1       ; 06F5, 3401
	RETLW   $3       ; 06F6, 3403
	RETLW   $2       ; 06F7, 3402
	RETLW   $3       ; 06F8, 3403
	RETLW   $4       ; 06F9, 3404
	RETLW   $3       ; 06FA, 3403
	RETLW   $5       ; 06FB, 3405
	RETLW   $3       ; 06FC, 3403
	RETLW   $6       ; 06FD, 3406
	RETLW   $3       ; 06FE, 3403
	RETLW   $7       ; 06FF, 3407
	RETLW   $4       ; 0700, 3404
	RETLW   $1       ; 0701, 3401
	RETLW   $4       ; 0702, 3404
	RETLW   $2       ; 0703, 3402
	RETLW   $4       ; 0704, 3404
	RETLW   $3       ; 0705, 3403
	RETLW   $4       ; 0706, 3404
	RETLW   $5       ; 0707, 3405
	RETLW   $4       ; 0708, 3404
	RETLW   $6       ; 0709, 3406
	RETLW   $4       ; 070A, 3404
	RETLW   $7       ; 070B, 3407
	RETLW   $5       ; 070C, 3405
	RETLW   $1       ; 070D, 3401
	RETLW   $5       ; 070E, 3405
	RETLW   $2       ; 070F, 3402
	RETLW   $5       ; 0710, 3405
	RETLW   $3       ; 0711, 3403
	RETLW   $5       ; 0712, 3405
	RETLW   $4       ; 0713, 3404
	RETLW   $5       ; 0714, 3405
	RETLW   $6       ; 0715, 3406
	RETLW   $5       ; 0716, 3405
	RETLW   $7       ; 0717, 3407
	RETLW   $6       ; 0718, 3406
	RETLW   $1       ; 0719, 3401
	RETLW   $6       ; 071A, 3406
	RETLW   $2       ; 071B, 3402
	RETLW   $6       ; 071C, 3406
	RETLW   $3       ; 071D, 3403
	RETLW   $6       ; 071E, 3406
	RETLW   $4       ; 071F, 3404
	RETLW   $6       ; 0720, 3406
	RETLW   $5       ; 0721, 3405
	RETLW   $6       ; 0722, 3406
	RETLW   $7       ; 0723, 3407
	RETLW   $7       ; 0724, 3407
	RETLW   $1       ; 0725, 3401
	RETLW   $7       ; 0726, 3407
	RETLW   $2       ; 0727, 3402
	RETLW   $7       ; 0728, 3407
	RETLW   $3       ; 0729, 3403
	RETLW   $7       ; 072A, 3407
	RETLW   $4       ; 072B, 3404
	RETLW   $7       ; 072C, 3407
	RETLW   $5       ; 072D, 3405
	RETLW   $7       ; 072E, 3407
	RETLW   $6       ; 072F, 3406
	RETLW   $8       ; 0730, 3408
	RETLW   $1       ; 0731, 3401
	RETLW   $8       ; 0732, 3408
	RETLW   $2       ; 0733, 3402
	RETLW   $8       ; 0734, 3408
	RETLW   $3       ; 0735, 3403
	RETLW   $8       ; 0736, 3408
	RETLW   $4       ; 0737, 3404
	RETLW   $8       ; 0738, 3408
	RETLW   $5       ; 0739, 3405
	RETLW   $8       ; 073A, 3408
	RETLW   $6       ; 073B, 3406
	RETLW   $1       ; 073C, 3401
	RETLW   $8       ; 073D, 3408
	RETLW   $2       ; 073E, 3402
	RETLW   $8       ; 073F, 3408
	RETLW   $0       ; 0740, 3400
	RETLW   $0       ; 0741, 3400
	RETLW   $8       ; 0742, 3408
	RETLW   $7       ; 0743, 3407
	RETLW   $0       ; 0744, 3400
	RETLW   $0       ; 0745, 3400
	RETLW   $0       ; 0746, 3400
	RETLW   $0       ; 0747, 3400
	RETLW   $3f      ; 0748, 343F
	RETLW   $6       ; 0749, 3406
	RETLW   $5b      ; 074A, 345B
	RETLW   $4f      ; 074B, 344F
	RETLW   $66      ; 074C, 3466
	RETLW   $6d      ; 074D, 346D
	RETLW   $7d      ; 074E, 347D
	RETLW   $7       ; 074F, 3407
	RETLW   $7f      ; 0750, 347F
	RETLW   $6f      ; 0751, 346F
	RETLW   $77      ; 0752, 3477
	RETLW   $7c      ; 0753, 347C
	RETLW   $3a      ; 0754, 343A
	RETLW   $5e      ; 0755, 345E
	RETLW   $79      ; 0756, 3479
	RETLW   $71      ; 0757, 3471
	RETLW   $0       ; 0758, 3400
	RETLW   $38      ; 0759, 3438
	RETLW   $76      ; 075A, 3476
	RETLW   $5c      ; 075B, 345C

.org 0x75C 
_L75C:
	CLRF    $50      ; 075C, 01D0
	BTFSS   $4a,$7   ; 075D, 1FCA
	GOTO    _L76C    ; 075E, 2F6C
	COMF    $47,$1   ; 075F, 09C7
	COMF    $48,$1   ; 0760, 09C8
	COMF    $49,$1   ; 0761, 09C9
	COMF    $4a,$1   ; 0762, 09CA
	INCF    $47,$1   ; 0763, 0AC7
	BTFSC   $3,$2    ; 0764, 1903
	INCF    $48,$1   ; 0765, 0AC8
	BTFSC   $3,$2    ; 0766, 1903
	INCF    $49,$1   ; 0767, 0AC9
	BTFSC   $3,$2    ; 0768, 1903
	INCF    $4a,$1   ; 0769, 0ACA
	CLRF    $50      ; 076A, 01D0
	INCF    $50,$1   ; 076B, 0AD0

.org 0x76C 
_L76C:
	BTFSS   $4e,$7   ; 076C, 1FCE
	GOTO    _L77B    ; 076D, 2F7B
	COMF    $4b,$1   ; 076E, 09CB
	COMF    $4c,$1   ; 076F, 09CC
	COMF    $4d,$1   ; 0770, 09CD
	COMF    $4e,$1   ; 0771, 09CE
	INCF    $4b,$1   ; 0772, 0ACB
	BTFSC   $3,$2    ; 0773, 1903
	INCF    $4c,$1   ; 0774, 0ACC
	BTFSC   $3,$2    ; 0775, 1903
	INCF    $4d,$1   ; 0776, 0ACD
	BTFSC   $3,$2    ; 0777, 1903
	INCF    $4e,$1   ; 0778, 0ACE
	MOVLW   $1       ; 0779, 3001
	XORWF   $50,$1   ; 077A, 06D0

.org 0x77B 
_L77B:
	CLRF    $51      ; 077B, 01D1
	CLRF    $52      ; 077C, 01D2
	CLRF    $53      ; 077D, 01D3
	CLRF    $54      ; 077E, 01D4
	MOVF    $4a,$0   ; 077F, 084A
	IORWF   $49,$0   ; 0780, 0449
	IORWF   $48,$0   ; 0781, 0448
	IORWF   $47,$0   ; 0782, 0447
	BTFSC   $3,$2    ; 0783, 1903
	GOTO    _L7BA    ; 0784, 2FBA
	CLRF    $4f      ; 0785, 01CF

.org 0x786 
_L786:
	INCF    $4f,$1   ; 0786, 0ACF
	BTFSC   $4a,$7   ; 0787, 1BCA
	GOTO    _L78F    ; 0788, 2F8F
	BCF     $3,$0    ; 0789, 1003
	RLF     $47,$1   ; 078A, 0DC7
	RLF     $48,$1   ; 078B, 0DC8
	RLF     $49,$1   ; 078C, 0DC9
	RLF     $4a,$1   ; 078D, 0DCA
	GOTO    _L786    ; 078E, 2F86

.org 0x78F 
_L78F:
	BCF     $3,$0    ; 078F, 1003
	RLF     $51,$1   ; 0790, 0DD1
	RLF     $52,$1   ; 0791, 0DD2
	RLF     $53,$1   ; 0792, 0DD3
	RLF     $54,$1   ; 0793, 0DD4
	MOVF    $4a,$0   ; 0794, 084A
	SUBWF   $4e,$0   ; 0795, 024E
	BTFSS   $3,$2    ; 0796, 1D03
	GOTO    _L7A2    ; 0797, 2FA2
	MOVF    $49,$0   ; 0798, 0849
	SUBWF   $4d,$0   ; 0799, 024D
	BTFSS   $3,$2    ; 079A, 1D03
	GOTO    _L7A2    ; 079B, 2FA2
	MOVF    $48,$0   ; 079C, 0848
	SUBWF   $4c,$0   ; 079D, 024C
	BTFSS   $3,$2    ; 079E, 1D03
	GOTO    _L7A2    ; 079F, 2FA2
	MOVF    $47,$0   ; 07A0, 0847
	SUBWF   $4b,$0   ; 07A1, 024B

.org 0x7A2 
_L7A2:
	BTFSS   $3,$0    ; 07A2, 1C03
	GOTO    _L7B4    ; 07A3, 2FB4
	MOVF    $47,$0   ; 07A4, 0847
	SUBWF   $4b,$1   ; 07A5, 02CB
	MOVF    $48,$0   ; 07A6, 0848
	BTFSS   $3,$0    ; 07A7, 1C03
	INCFSZ  $48,$0   ; 07A8, 0F48
	SUBWF   $4c,$1   ; 07A9, 02CC
	MOVF    $49,$0   ; 07AA, 0849
	BTFSS   $3,$0    ; 07AB, 1C03
	INCFSZ  $49,$0   ; 07AC, 0F49
	SUBWF   $4d,$1   ; 07AD, 02CD
	MOVF    $4a,$0   ; 07AE, 084A
	BTFSS   $3,$0    ; 07AF, 1C03
	INCFSZ  $4a,$0   ; 07B0, 0F4A
	SUBWF   $4e,$1   ; 07B1, 02CE
	BSF     $51,$0   ; 07B2, 1451
	BCF     $3,$0    ; 07B3, 1003

.org 0x7B4 
_L7B4:
	RRF     $4a,$1   ; 07B4, 0CCA
	RRF     $49,$1   ; 07B5, 0CC9
	RRF     $48,$1   ; 07B6, 0CC8
	RRF     $47,$1   ; 07B7, 0CC7
	DECFSZ  $4f,$1   ; 07B8, 0BCF
	GOTO    _L78F    ; 07B9, 2F8F

.org 0x7BA 
_L7BA:
	MOVF    $50,$0   ; 07BA, 0850
	BTFSC   $3,$2    ; 07BB, 1903
	GOTO    _L7C8    ; 07BC, 2FC8
	COMF    $51,$1   ; 07BD, 09D1
	COMF    $52,$1   ; 07BE, 09D2
	COMF    $53,$1   ; 07BF, 09D3
	COMF    $54,$1   ; 07C0, 09D4
	INCF    $51,$1   ; 07C1, 0AD1
	BTFSC   $3,$2    ; 07C2, 1903
	INCF    $52,$1   ; 07C3, 0AD2
	BTFSC   $3,$2    ; 07C4, 1903
	INCF    $53,$1   ; 07C5, 0AD3
	BTFSC   $3,$2    ; 07C6, 1903
	INCF    $54,$1   ; 07C7, 0AD4

.org 0x7C8 
_L7C8:
	MOVF    $54,$0   ; 07C8, 0854
	MOVWF   $4a      ; 07C9, 00CA
	MOVF    $53,$0   ; 07CA, 0853
	MOVWF   $49      ; 07CB, 00C9
	MOVF    $52,$0   ; 07CC, 0852
	MOVWF   $48      ; 07CD, 00C8
	MOVF    $51,$0   ; 07CE, 0851
	MOVWF   $47      ; 07CF, 00C7
	RET              ; 07D0, 0008

.org 0x7D1 
_L7D1:
	MOVLW   $20      ; 07D1, 3020
	BCF     $3,$7    ; 07D2, 1383
	MOVWF   $4       ; 07D3, 0084

.org 0x7D4 
_L7D4:
	MOVLW   $80      ; 07D4, 3080
	SUBWF   $4,$0    ; 07D5, 0204
	BTFSC   $3,$0    ; 07D6, 1803
	GOTO    _L7DC    ; 07D7, 2FDC
	BCF     $3,$6    ; 07D8, 1303
	CLRF    $0       ; 07D9, 0180
	INCF    $4,$1    ; 07DA, 0A84
	GOTO    _L7D4    ; 07DB, 2FD4

.org 0x7DC 
_L7DC:
	MOVLW   $a0      ; 07DC, 30A0
	MOVWF   $4       ; 07DD, 0084

.org 0x7DE 
_L7DE:
	MOVLW   $f0      ; 07DE, 30F0
	SUBWF   $4,$0    ; 07DF, 0204
	BTFSC   $3,$0    ; 07E0, 1803
	GOTO    _L7E6    ; 07E1, 2FE6
	BCF     $3,$6    ; 07E2, 1303
	CLRF    $0       ; 07E3, 0180
	INCF    $4,$1    ; 07E4, 0A84
	GOTO    _L7DE    ; 07E5, 2FDE

.org 0x7E6 
_L7E6:
	MOVLW   $20      ; 07E6, 3020
	BSF     $3,$7    ; 07E7, 1783
	MOVWF   $4       ; 07E8, 0084

.org 0x7E9 
_L7E9:
	MOVLW   $60      ; 07E9, 3060
	SUBWF   $4,$0    ; 07EA, 0204
	BTFSC   $3,$0    ; 07EB, 1803
	GOTO    _L7F1    ; 07EC, 2FF1
	BCF     $3,$6    ; 07ED, 1303
	CLRF    $0       ; 07EE, 0180
	INCF    $4,$1    ; 07EF, 0A84
	GOTO    _L7E9    ; 07F0, 2FE9

.org 0x7F1 
_L7F1:
	BCF     $3,$7    ; 07F1, 1383
	BCF     $3,$5    ; 07F2, 1283
	BCF     $3,$6    ; 07F3, 1303
	RET              ; 07F4, 0008

.org 0x7F5 
_L7F5:
	CLRWDT           ; 07F5, 0064

.org 0x7F6 
_L7F6:
	CLRF    $0       ; 07F6, 0180
	INCF    $4,$1    ; 07F7, 0A84
	XORWF   $4,$0    ; 07F8, 0604
	BTFSC   $3,$2    ; 07F9, 1903
	RETLW   $0       ; 07FA, 3400
	XORWF   $4,$0    ; 07FB, 0604
	GOTO    _L7F6    ; 07FC, 2FF6
	NOP              ; 07FD,   --
	NOP              ; 07FE,   --
	NOP              ; 07FF,   --
	BCF     $a,$3    ; 0800, 118A
	GOTO    _L4C4    ; 0801, 2CC4
	BCF     $a,$3    ; 0802, 118A
	GOTO    _L4D3    ; 0803, 2CD3
	BCF     $a,$3    ; 0804, 118A
	GOTO    _L4E2    ; 0805, 2CE2
	BCF     $a,$3    ; 0806, 118A
	GOTO    _L4F1    ; 0807, 2CF1
	BCF     $a,$3    ; 0808, 118A
	GOTO    _L500    ; 0809, 2D00
	BCF     $a,$3    ; 080A, 118A
	GOTO    _L50F    ; 080B, 2D0F
	BCF     $a,$3    ; 080C, 118A
	GOTO    _L51E    ; 080D, 2D1E
	BCF     $a,$3    ; 080E, 118A
	GOTO    _L52D    ; 080F, 2D2D
	BCF     $a,$3    ; 0810, 118A
	GOTO    _L54B    ; 0811, 2D4B
	BCF     $a,$3    ; 0812, 118A
	GOTO    _L554    ; 0813, 2D54
	BCF     $a,$3    ; 0814, 118A
	GOTO    _L55D    ; 0815, 2D5D
	BCF     $a,$3    ; 0816, 118A
	GOTO    _L566    ; 0817, 2D66
	BCF     $a,$3    ; 0818, 118A
	GOTO    _L56F    ; 0819, 2D6F
	BCF     $a,$3    ; 081A, 118A
	GOTO    _L578    ; 081B, 2D78
	BCF     $a,$3    ; 081C, 118A
	GOTO    _L581    ; 081D, 2D81
	BCF     $a,$3    ; 081E, 118A
	GOTO    _L58A    ; 081F, 2D8A

.org 0xB00 
_LB00:
	NOP              ; 0B00,   --
	NOP              ; 0B01,   --
	NOP              ; 0B02,   --
	NOP              ; 0B03,   --
	NOP              ; 0B04,   --
	NOP              ; 0B05,   --
	NOP              ; 0B06,   --
	NOP              ; 0B07,   --
	NOP              ; 0B08,   --
	NOP              ; 0B09,   --
	NOP              ; 0B0A,   --
	NOP              ; 0B0B,   --
	NOP              ; 0B0C,   --
	NOP              ; 0B0D,   --
	NOP              ; 0B0E,   --
	NOP              ; 0B0F,   --

.org 0xB10 
_LB10:
	MOVLW   $20      ; 0B10, 3020
	BCF     $3,$7    ; 0B11, 1383
	MOVWF   $4       ; 0B12, 0084
	MOVLW   $47      ; 0B13, 3047
	BCF     $a,$3    ; 0B14, 118A
	CALL    _L7F5    ; 0B15, 27F5
	BSF     $a,$3    ; 0B16, 158A
	MOVLW   $a0      ; 0B17, 30A0
	MOVWF   $4       ; 0B18, 0084
	MOVLW   $b1      ; 0B19, 30B1
	BCF     $a,$3    ; 0B1A, 118A
	CALL    _L7F5    ; 0B1B, 27F5
	BSF     $a,$3    ; 0B1C, 158A
	MOVLW   $a0      ; 0B1D, 30A0
	BSF     $3,$7    ; 0B1E, 1783
	MOVWF   $4       ; 0B1F, 0084
	MOVLW   $e0      ; 0B20, 30E0
	BCF     $a,$3    ; 0B21, 118A
	CALL    _L7F5    ; 0B22, 27F5
	CLRF    $3       ; 0B23, 0183
	BSF     $a,$3    ; 0B24, 158A
	GOTO    _LCCA    ; 0B25, 2CCA

.org 0xB26 
_LB26:
	BTFSS   $2c,$3   ; 0B26, 1DAC
	RET              ; 0B27, 0008
	MOVF    $26,$0   ; 0B28, 0826
	BTFSC   $3,$2    ; 0B29, 1903
	GOTO    _LB2D    ; 0B2A, 2B2D
	DECF    $26,$1   ; 0B2B, 03A6
	RET              ; 0B2C, 0008

.org 0xB2D 
_LB2D:
	MOVLW   $a       ; 0B2D, 300A
	MOVWF   $26      ; 0B2E, 00A6
	GOTO    _LB32    ; 0B2F, 2B32

.org 0xB30 
_LB30:
	CLRF    $25      ; 0B30, 01A5
	GOTO    _LB4C    ; 0B31, 2B4C

.org 0xB32 
_LB32:
	MOVF    $25,$0   ; 0B32, 0825
	XORLW   $1       ; 0B33, 3A01
	BTFSC   $3,$2    ; 0B34, 1903
	GOTO    _LB4C    ; 0B35, 2B4C
	XORLW   $3       ; 0B36, 3A03
	BTFSC   $3,$2    ; 0B37, 1903
	GOTO    _LB4C    ; 0B38, 2B4C
	XORLW   $1       ; 0B39, 3A01
	BTFSC   $3,$2    ; 0B3A, 1903
	GOTO    _LB4C    ; 0B3B, 2B4C
	XORLW   $7       ; 0B3C, 3A07
	BTFSC   $3,$2    ; 0B3D, 1903
	GOTO    _LB4C    ; 0B3E, 2B4C
	XORLW   $1       ; 0B3F, 3A01
	BTFSC   $3,$2    ; 0B40, 1903
	GOTO    _LB4C    ; 0B41, 2B4C
	XORLW   $3       ; 0B42, 3A03
	BTFSC   $3,$2    ; 0B43, 1903
	GOTO    _LB4C    ; 0B44, 2B4C
	XORLW   $1       ; 0B45, 3A01
	BTFSC   $3,$2    ; 0B46, 1903
	GOTO    _LB4C    ; 0B47, 2B4C
	XORLW   $f       ; 0B48, 3A0F
	BTFSC   $3,$2    ; 0B49, 1903
	GOTO    _LB4C    ; 0B4A, 2B4C
	GOTO    _LB30    ; 0B4B, 2B30

.org 0xB4C 
_LB4C:
	BTFSC   $2c,$7   ; 0B4C, 1BAC
	BTFSS   $2c,$1   ; 0B4D, 1CAC
	GOTO    _LB55    ; 0B4E, 2B55
	MOVLW   $8       ; 0B4F, 3008
	SUBWF   $25,$0   ; 0B50, 0225
	BTFSC   $3,$0    ; 0B51, 1803
	RET              ; 0B52, 0008

.org 0xB53 
_LB53:
	INCF    $25,$1   ; 0B53, 0AA5
	RET              ; 0B54, 0008

.org 0xB55 
_LB55:
	BTFSC   $2c,$7   ; 0B55, 1BAC
	BTFSS   $2c,$2   ; 0B56, 1D2C
	GOTO    _LB5C    ; 0B57, 2B5C
	MOVF    $25,$0   ; 0B58, 0825
	BTFSS   $3,$2    ; 0B59, 1D03
	DECF    $25,$1   ; 0B5A, 03A5
	RET              ; 0B5B, 0008

.org 0xB5C 
_LB5C:
	BTFSS   $2d,$2   ; 0B5C, 1D2D
	RET              ; 0B5D, 0008
	MOVLW   $8       ; 0B5E, 3008
	SUBWF   $25,$0   ; 0B5F, 0225
	BTFSS   $3,$0    ; 0B60, 1C03
	GOTO    _LB53    ; 0B61, 2B53
	CLRF    $25      ; 0B62, 01A5
	RET              ; 0B63, 0008

.org 0xB64 
_LB64:
	GOTO    _LB6D    ; 0B64, 2B6D

.org 0xB65 
_LB65:
	CLRF    $33      ; 0B65, 01B3
	INCF    $33,$1   ; 0B66, 0AB3
	GOTO    _LB79    ; 0B67, 2B79

.org 0xB68 
_LB68:
	MOVLW   $80      ; 0B68, 3080
	MOVWF   $33      ; 0B69, 00B3
	GOTO    _LB79    ; 0B6A, 2B79

.org 0xB6B 
_LB6B:
	CLRF    $33      ; 0B6B, 01B3
	GOTO    _LB79    ; 0B6C, 2B79

.org 0xB6D 
_LB6D:
	BCF     $3,$5    ; 0B6D, 1283
	MOVF    $33,$0   ; 0B6E, 0833
	XORLW   $0       ; 0B6F, 3A00
	BTFSC   $3,$2    ; 0B70, 1903
	GOTO    _LB65    ; 0B71, 2B65
	XORLW   $1       ; 0B72, 3A01
	BTFSC   $3,$2    ; 0B73, 1903
	GOTO    _LB68    ; 0B74, 2B68
	XORLW   $81      ; 0B75, 3A81
	BTFSC   $3,$2    ; 0B76, 1903
	GOTO    _LB6B    ; 0B77, 2B6B
	GOTO    _LB79    ; 0B78, 2B79

.org 0xB79 
_LB79:
	MOVLW   $7       ; 0B79, 3007
	BSF     $2d,$1   ; 0B7A, 14AD
	SUBWF   $46,$0   ; 0B7B, 0246
	BTFSS   $3,$0    ; 0B7C, 1C03
	GOTO    _LB86    ; 0B7D, 2B86
	MOVF    $46,$0   ; 0B7E, 0846
	XORLW   $a       ; 0B7F, 3A0A
	BTFSC   $3,$2    ; 0B80, 1903
	GOTO    _LB86    ; 0B81, 2B86
	MOVF    $46,$0   ; 0B82, 0846
	XORLW   $11      ; 0B83, 3A11
	BTFSS   $3,$2    ; 0B84, 1D03
	RET              ; 0B85, 0008

.org 0xB86 
_LB86:
	BCF     $a,$3    ; 0B86, 118A
	CALL    _L397    ; 0B87, 2397
	BSF     $a,$3    ; 0B88, 158A
	MOVLW   $0       ; 0B89, 3000
	MOVLW   $a       ; 0B8A, 300A
	MOVWF   $47      ; 0B8B, 00C7
	MOVLW   $19      ; 0B8C, 3019
	MOVWF   $48      ; 0B8D, 00C8
	MOVLW   $6       ; 0B8E, 3006
	MOVWF   $49      ; 0B8F, 00C9
	MOVLW   $43      ; 0B90, 3043
	BCF     $a,$3    ; 0B91, 118A
	CALL    _L3A0    ; 0B92, 23A0
	BSF     $a,$3    ; 0B93, 158A
	BTFSS   $2d,$2   ; 0B94, 1D2D
	GOTO    _LB9A    ; 0B95, 2B9A
	MOVF    $46,$0   ; 0B96, 0846
	XORLW   $11      ; 0B97, 3A11
	BTFSS   $3,$2    ; 0B98, 1D03
	RET              ; 0B99, 0008

.org 0xB9A 
_LB9A:
	MOVLW   $0       ; 0B9A, 3000
	BCF     $a,$3    ; 0B9B, 118A
	CALL    _L32C    ; 0B9C, 232C
	BSF     $a,$3    ; 0B9D, 158A
	BCF     $a,$3    ; 0B9E, 118A
	CALL    _L3BB    ; 0B9F, 23BB
	BCF     $a,$3    ; 0BA0, 118A
	GOTO    _L394    ; 0BA1, 2B94

.org 0xBA2 
_LBA2:
	BCF     $3,$5    ; 0BA2, 1283
	BCF     $3,$6    ; 0BA3, 1303
	BTFSS   $2d,$2   ; 0BA4, 1D2D
	GOTO    _LBF7    ; 0BA5, 2BF7
	MOVF    $46,$1   ; 0BA6, 08C6
	BTFSS   $3,$2    ; 0BA7, 1D03
	GOTO    _LBB1    ; 0BA8, 2BB1
	MOVLW   $4       ; 0BA9, 3004
	CALL    _LC0A    ; 0BAA, 240A
	BCF     $a,$3    ; 0BAB, 118A
	CALL    _L3A0    ; 0BAC, 23A0
	BSF     $a,$3    ; 0BAD, 158A
	CLRF    $24      ; 0BAE, 01A4
	CLRF    $45      ; 0BAF, 01C5
	BSF     $2c,$3   ; 0BB0, 15AC

.org 0xBB1 
_LBB1:
	BTFSC   $2d,$3   ; 0BB1, 19AD
	GOTO    _LBDB    ; 0BB2, 2BDB
	MOVLW   $f       ; 0BB3, 300F
	SUBWF   $35,$0   ; 0BB4, 0235
	MOVLW   $6e      ; 0BB5, 306E
	BTFSC   $3,$2    ; 0BB6, 1903
	SUBWF   $34,$0   ; 0BB7, 0234
	BTFSS   $3,$0    ; 0BB8, 1C03
	GOTO    _LBD7    ; 0BB9, 2BD7
	MOVLW   $10      ; 0BBA, 3010
	SUBWF   $35,$0   ; 0BBB, 0235
	MOVLW   $7c      ; 0BBC, 307C
	BTFSC   $3,$2    ; 0BBD, 1903
	SUBWF   $34,$0   ; 0BBE, 0234
	BTFSS   $3,$0    ; 0BBF, 1C03
	BTFSC   $5,$6    ; 0BC0, 1B05
	GOTO    _LBC6    ; 0BC1, 2BC6
	MOVLW   $64      ; 0BC2, 3064
	SUBWF   $3c,$0   ; 0BC3, 023C
	BTFSS   $3,$0    ; 0BC4, 1C03
	GOTO    _LBD7    ; 0BC5, 2BD7

.org 0xBC6 
_LBC6:
	MOVLW   $0       ; 0BC6, 3000
	BSF     $3,$6    ; 0BC7, 1703
	SUBWF   $5b,$0   ; 0BC8, 025B
	MOVLW   $14      ; 0BC9, 3014
	BTFSC   $3,$2    ; 0BCA, 1903
	SUBWF   $5a,$0   ; 0BCB, 025A
	BTFSC   $3,$0    ; 0BCC, 1803
	GOTO    _LBD2    ; 0BCD, 2BD2
	INCF    $5a,$1   ; 0BCE, 0ADA
	BTFSC   $3,$2    ; 0BCF, 1903
	INCF    $5b,$1   ; 0BD0, 0ADB
	RET              ; 0BD1, 0008

.org 0xBD2 
_LBD2:
	CLRF    $5a      ; 0BD2, 01DA
	CLRF    $5b      ; 0BD3, 01DB
	BCF     $3,$6    ; 0BD4, 1303
	BSF     $2d,$3   ; 0BD5, 15AD
	RET              ; 0BD6, 0008

.org 0xBD7 
_LBD7:
	BSF     $3,$6    ; 0BD7, 1703
	CLRF    $5a      ; 0BD8, 01DA
	CLRF    $5b      ; 0BD9, 01DB
	RET              ; 0BDA, 0008

.org 0xBDB 
_LBDB:
	MOVF    $46,$0   ; 0BDB, 0846
	XORLW   $4       ; 0BDC, 3A04
	BTFSS   $3,$2    ; 0BDD, 1D03
	RET              ; 0BDE, 0008
	MOVF    $3c,$0   ; 0BDF, 083C
	XORLW   $64      ; 0BE0, 3A64
	BTFSS   $3,$2    ; 0BE1, 1D03
	RET              ; 0BE2, 0008
	MOVLW   $5       ; 0BE3, 3005
	MOVWF   $47      ; 0BE4, 00C7
	MOVLW   $19      ; 0BE5, 3019
	MOVWF   $48      ; 0BE6, 00C8
	MOVLW   $28      ; 0BE7, 3028
	MOVWF   $49      ; 0BE8, 00C9
	MOVLW   $43      ; 0BE9, 3043
	BCF     $a,$3    ; 0BEA, 118A
	CALL    _L3A0    ; 0BEB, 23A0
	MOVF    $3c,$0   ; 0BEC, 083C
	MOVWF   $31      ; 0BED, 00B1
	CLRF    $45      ; 0BEE, 01C5
	BSF     $3,$6    ; 0BEF, 1703
	CLRF    $5a      ; 0BF0, 01DA
	CLRF    $5b      ; 0BF1, 01DB
	BCF     $3,$6    ; 0BF2, 1303
	BCF     $2c,$3   ; 0BF3, 11AC
	CLRF    $25      ; 0BF4, 01A5
	CLRF    $26      ; 0BF5, 01A6
	RET              ; 0BF6, 0008

.org 0xBF7 
_LBF7:
	MOVF    $46,$1   ; 0BF7, 08C6
	BTFSC   $3,$2    ; 0BF8, 1903
	BTFSC   $2c,$0   ; 0BF9, 182C
	RET              ; 0BFA, 0008
	MOVLW   $1       ; 0BFB, 3001
	BSF     $3,$6    ; 0BFC, 1703
	SUBWF   $5d,$0   ; 0BFD, 025D
	MOVLW   $2c      ; 0BFE, 302C
	BTFSC   $3,$2    ; 0BFF, 1903
	SUBWF   $5c,$0   ; 0C00, 025C
	BTFSC   $3,$0    ; 0C01, 1803
	GOTO    _LC07    ; 0C02, 2C07
	INCF    $5c,$1   ; 0C03, 0ADC
	BTFSC   $3,$2    ; 0C04, 1903
	INCF    $5d,$1   ; 0C05, 0ADD
	RET              ; 0C06, 0008

.org 0xC07 
_LC07:
	BCF     $3,$6    ; 0C07, 1303
	BCF     $2d,$0   ; 0C08, 102D
	RET              ; 0C09, 0008

.org 0xC0A 
_LC0A:
	MOVWF   $47      ; 0C0A, 00C7
	MOVLW   $19      ; 0C0B, 3019
	MOVWF   $48      ; 0C0C, 00C8
	MOVLW   $14      ; 0C0D, 3014
	MOVWF   $49      ; 0C0E, 00C9
	RETLW   $43      ; 0C0F, 3443

.org 0xC10 
_LC10:
	MOVF    $46,$1   ; 0C10, 08C6
	BTFSC   $3,$2    ; 0C11, 1903
	BTFSS   $2c,$5   ; 0C12, 1EAC
	RET              ; 0C13, 0008
	BTFSS   $2d,$5   ; 0C14, 1EAD
	RET              ; 0C15, 0008
	CALL    _LC40    ; 0C16, 2440
	BSF     $a,$3    ; 0C17, 158A
	MOVLW   $2       ; 0C18, 3002
	BSF     $3,$6    ; 0C19, 1703
	MOVWF   $5c      ; 0C1A, 00DC
	CLRF    $5d      ; 0C1B, 01DD

.org 0xC1C 
_LC1C:
	BSF     $3,$6    ; 0C1C, 1703
	MOVF    $5d,$0   ; 0C1D, 085D
	IORWF   $5c,$0   ; 0C1E, 045C
	BCF     $3,$6    ; 0C1F, 1303
	BTFSC   $3,$2    ; 0C20, 1903
	GOTO    _LC2F    ; 0C21, 2C2F
	BTFSS   $2d,$6   ; 0C22, 1F2D
	GOTO    _LC1C    ; 0C23, 2C1C
	BCF     $2d,$6   ; 0C24, 132D
	CLRWDT           ; 0C25, 0064
	MOVLW   $1       ; 0C26, 3001
	BCF     $3,$5    ; 0C27, 1283
	BSF     $3,$6    ; 0C28, 1703
	SUBWF   $5c,$1   ; 0C29, 02DC
	MOVLW   $0       ; 0C2A, 3000
	BTFSS   $3,$0    ; 0C2B, 1C03
	DECF    $5d,$1   ; 0C2C, 03DD
	SUBWF   $5d,$1   ; 0C2D, 02DD
	GOTO    _LC1C    ; 0C2E, 2C1C

.org 0xC2F 
_LC2F:
	BSF     $2d,$0   ; 0C2F, 142D
	RET              ; 0C30, 0008

.org 0xC31 
_LC31:
	MOVF    $f,$0    ; 0C31, 080F
	ANDLW   $fc      ; 0C32, 39FC
	IORLW   $3       ; 0C33, 3803
	MOVWF   $f       ; 0C34, 008F
	CALL    _LC5A    ; 0C35, 245A
	BSF     $a,$3    ; 0C36, 158A
	BCF     $3,$5    ; 0C37, 1283
	BCF     $3,$6    ; 0C38, 1303
	BCF     $f,$3    ; 0C39, 118F
	CALL    _LC5A    ; 0C3A, 245A
	BSF     $a,$3    ; 0C3B, 158A
	BCF     $3,$5    ; 0C3C, 1283
	BCF     $3,$6    ; 0C3D, 1303
	BSF     $f,$2    ; 0C3E, 150F
	GOTO    _LC5A    ; 0C3F, 2C5A

.org 0xC40 
_LC40:
	BTFSC   $2d,$4   ; 0C40, 1A2D
	BCF     $2d,$4   ; 0C41, 122D
	BTFSS   $5,$6    ; 0C42, 1F05
	BTFSS   $5,$6    ; 0C43, 1F05
	RET              ; 0C44, 0008
	BSF     $11,$6   ; 0C45, 1711
	BSF     $14,$6   ; 0C46, 1714
	BSF     $15,$4   ; 0C47, 1615
	CALL    _LC6B    ; 0C48, 246B
	BSF     $a,$3    ; 0C49, 158A
	CLRF    $b       ; 0C4A, 018B
	CLRF    $d       ; 0C4B, 018D
	BSF     $f,$4    ; 0C4C, 160F
	CALL    _LC5A    ; 0C4D, 245A
	BSF     $a,$3    ; 0C4E, 158A
	SLEEP            ; 0C4F, 0063
	BCF     $3,$5    ; 0C50, 1283
	BCF     $3,$6    ; 0C51, 1303
	BCF     $f,$4    ; 0C52, 120F
	CALL    _LC5A    ; 0C53, 245A
	BSF     $a,$3    ; 0C54, 158A
	CALL    _LC92    ; 0C55, 2492
	BSF     $a,$3    ; 0C56, 158A
	CALL    _LC6B    ; 0C57, 246B
	BSF     $a,$3    ; 0C58, 158A
	GOTO    _LCAD    ; 0C59, 2CAD

.org 0xC5A 
_LC5A:
	NOP              ; 0C5A, 0000
	NOP              ; 0C5B, 0000
	NOP              ; 0C5C, 0000
	NOP              ; 0C5D, 0000
	NOP              ; 0C5E, 0000
	NOP              ; 0C5F, 0000
	NOP              ; 0C60, 0000
	NOP              ; 0C61, 0000
	NOP              ; 0C62, 0000
	NOP              ; 0C63, 0000
	NOP              ; 0C64, 0000
	NOP              ; 0C65, 0000
	NOP              ; 0C66, 0000
	NOP              ; 0C67, 0000
	NOP              ; 0C68, 0000
	NOP              ; 0C69, 0000
	RET              ; 0C6A, 0008

.org 0xC6B 
_LC6B:
	MOVLW   $e8      ; 0C6B, 30E8
	BCF     $3,$5    ; 0C6C, 1283
	BCF     $3,$6    ; 0C6D, 1303
	MOVWF   $5       ; 0C6E, 0085
	MOVLW   $89      ; 0C6F, 3089
	BSF     $3,$5    ; 0C70, 1683
	MOVWF   $8       ; 0C71, 0088
	MOVLW   $36      ; 0C72, 3036
	MOVWF   $7       ; 0C73, 0087
	MOVWF   $6       ; 0C74, 0086
	MOVLW   $11      ; 0C75, 3011
	MOVWF   $5       ; 0C76, 0085
	MOVLW   $4       ; 0C77, 3004
	BCF     $3,$5    ; 0C78, 1283
	MOVWF   $6       ; 0C79, 0086
	MOVLW   $66      ; 0C7A, 3066
	BSF     $3,$5    ; 0C7B, 1683
	MOVWF   $f       ; 0C7C, 008F
	MOVWF   $e       ; 0C7D, 008E
	MOVLW   $f0      ; 0C7E, 30F0
	MOVWF   $d       ; 0C7F, 008D
	MOVLW   $66      ; 0C80, 3066
	MOVWF   $c       ; 0C81, 008C
	BCF     $3,$5    ; 0C82, 1283
	CLRF    $7       ; 0C83, 0187
	BSF     $3,$5    ; 0C84, 1683
	MOVWF   $10      ; 0C85, 0090
	MOVLW   $d8      ; 0C86, 30D8
	BCF     $3,$5    ; 0C87, 1283
	BSF     $3,$6    ; 0C88, 1703
	ANDWF   $5,$1    ; 0C89, 0585
	MOVLW   $f8      ; 0C8A, 30F8
	BCF     $3,$6    ; 0C8B, 1303
	ANDWF   $18,$1   ; 0C8C, 0598
	MOVLW   $5       ; 0C8D, 3005
	IORWF   $18,$1   ; 0C8E, 0498
	MOVLW   $3f      ; 0C8F, 303F
	ANDWF   $19,$1   ; 0C90, 0599
	RET              ; 0C91, 0008

.org 0xC92 
_LC92:
	BCF     $3,$5    ; 0C92, 1283
	MOVLW   $f0      ; 0C93, 30F0
	BCF     $3,$6    ; 0C94, 1303
	BCF     $d,$0    ; 0C95, 100D
	BCF     $e,$0    ; 0C96, 100E
	ANDWF   $16,$1   ; 0C97, 0596
	MOVLW   $3       ; 0C98, 3003
	IORWF   $16,$1   ; 0C99, 0496
	BSF     $16,$6   ; 0C9A, 1716
	BSF     $16,$5   ; 0C9B, 1696
	BSF     $16,$4   ; 0C9C, 1616
	MOVLW   $f3      ; 0C9D, 30F3
	BSF     $3,$5    ; 0C9E, 1683
	ANDWF   $1,$1    ; 0C9F, 0581
	MOVLW   $c       ; 0CA0, 300C
	IORWF   $1,$1    ; 0CA1, 0481
	CLRWDT           ; 0CA2, 0064
	BCF     $b,$3    ; 0CA3, 118B
	BCF     $3,$5    ; 0CA4, 1283
	MOVLW   $fc      ; 0CA5, 30FC
	BCF     $3,$6    ; 0CA6, 1303
	BCF     $c,$3    ; 0CA7, 118C
	BSF     $3,$5    ; 0CA8, 1683
	ANDWF   $1,$1    ; 0CA9, 0581
	MOVLW   $3       ; 0CAA, 3003
	IORWF   $1,$1    ; 0CAB, 0481
	RET              ; 0CAC, 0008

.org 0xCAD 
_LCAD:
	BCF     $3,$5    ; 0CAD, 1283
	BSF     $11,$6   ; 0CAE, 1711
	BCF     $b,$4    ; 0CAF, 120B
	BCF     $c,$4    ; 0CB0, 120C
	BCF     $11,$4   ; 0CB1, 1211
	MOVLW   $f0      ; 0CB2, 30F0
	ANDWF   $11,$1   ; 0CB3, 0591
	BSF     $11,$1   ; 0CB4, 1491
	MOVLW   $9c      ; 0CB5, 309C
	MOVWF   $1       ; 0CB6, 0081
	MOVWF   $10      ; 0CB7, 0090
	BSF     $14,$6   ; 0CB8, 1714
	MOVLW   $f0      ; 0CB9, 30F0
	BCF     $b,$5    ; 0CBA, 128B
	BCF     $c,$5    ; 0CBB, 128C
	ANDWF   $14,$1   ; 0CBC, 0594
	MOVLW   $5       ; 0CBD, 3005
	IORWF   $14,$1   ; 0CBE, 0494
	MOVLW   $83      ; 0CBF, 3083
	MOVWF   $12      ; 0CC0, 0092
	MOVWF   $13      ; 0CC1, 0093
	BSF     $15,$4   ; 0CC2, 1615
	MOVLW   $fc      ; 0CC3, 30FC
	BCF     $b,$6    ; 0CC4, 130B
	BCF     $c,$6    ; 0CC5, 130C
	ANDWF   $15,$1   ; 0CC6, 0595
	BSF     $b,$4    ; 0CC7, 160B
	BCF     $11,$6   ; 0CC8, 1311
	RET              ; 0CC9, 0008

.org 0xCCA 
_LCCA:
	CLRWDT           ; 0CCA, 0064
	CLRF    $b       ; 0CCB, 018B
	BCF     $3,$5    ; 0CCC, 1283
	BCF     $3,$6    ; 0CCD, 1303
	CLRF    $d       ; 0CCE, 018D
	BSF     $a,$3    ; 0CCF, 158A
	CALL    _LC31    ; 0CD0, 2431
	BSF     $a,$3    ; 0CD1, 158A
	BSF     $a,$3    ; 0CD2, 158A
	CALL    _LC6B    ; 0CD3, 246B
	BSF     $a,$3    ; 0CD4, 158A
	BSF     $a,$3    ; 0CD5, 158A
	CALL    _LC92    ; 0CD6, 2492
	BSF     $a,$3    ; 0CD7, 158A
	BSF     $a,$3    ; 0CD8, 158A
	CALL    _LCAD    ; 0CD9, 24AD
	BSF     $a,$3    ; 0CDA, 158A
	BSF     $3,$6    ; 0CDB, 1703
	MOVF    $65,$0   ; 0CDC, 0865
	XORLW   $a5      ; 0CDD, 3AA5
	MOVLW   $5a      ; 0CDE, 305A
	BTFSC   $3,$2    ; 0CDF, 1903
	XORWF   $64,$0   ; 0CE0, 0664
	BTFSS   $3,$2    ; 0CE1, 1D03
	GOTO    _LD07    ; 0CE2, 2D07
	BCF     $3,$6    ; 0CE3, 1303
	BSF     $2e,$7   ; 0CE4, 17AE
	BCF     $2e,$0   ; 0CE5, 102E
	BCF     $a,$3    ; 0CE6, 118A
	CALL    _L3C0    ; 0CE7, 23C0
	BSF     $a,$3    ; 0CE8, 158A
	BCF     $a,$3    ; 0CE9, 118A
	CALL    _L397    ; 0CEA, 2397
	BSF     $a,$3    ; 0CEB, 158A
	MOVLW   $e       ; 0CEC, 300E
	MOVWF   $47      ; 0CED, 00C7
	MOVLW   $19      ; 0CEE, 3019
	MOVWF   $48      ; 0CEF, 00C8
	MOVLW   $8       ; 0CF0, 3008
	MOVWF   $49      ; 0CF1, 00C9
	MOVLW   $43      ; 0CF2, 3043
	BCF     $a,$3    ; 0CF3, 118A
	CALL    _L3A0    ; 0CF4, 23A0
	BSF     $a,$3    ; 0CF5, 158A
	BTFSC   $5,$6    ; 0CF6, 1B05
	BSF     $2d,$2   ; 0CF7, 152D
	BTFSS   $6,$2    ; 0CF8, 1D06
	GOTO    _LCFC    ; 0CF9, 2CFC
	BSF     $3,$5    ; 0CFA, 1683
	BSF     $22,$0   ; 0CFB, 1422

.org 0xCFC 
_LCFC:
	BSF     $3,$5    ; 0CFC, 1683
	CLRF    $24      ; 0CFD, 01A4
	CLRF    $25      ; 0CFE, 01A5
	BCF     $3,$5    ; 0CFF, 1283
	BCF     $2d,$4   ; 0D00, 122D
	BSF     $3,$6    ; 0D01, 1703
	CLRF    $5c      ; 0D02, 01DC
	CLRF    $5d      ; 0D03, 01DD
	BCF     $3,$6    ; 0D04, 1303
	BSF     $2d,$0   ; 0D05, 142D
	GOTO    _LD25    ; 0D06, 2D25

.org 0xD07 
_LD07:
	BCF     $a,$3    ; 0D07, 118A
	CALL    _L7D1    ; 0D08, 27D1
	BSF     $a,$3    ; 0D09, 158A
	MOVLW   $60      ; 0D0A, 3060
	BCF     $3,$6    ; 0D0B, 1303
	CLRF    $33      ; 0D0C, 01B3
	INCF    $33,$1   ; 0D0D, 0AB3
	MOVWF   $4       ; 0D0E, 0084
	BSF     $3,$7    ; 0D0F, 1783
	CLRF    $0       ; 0D10, 0180
	INCF    $4,$1    ; 0D11, 0A84
	CLRF    $0       ; 0D12, 0180
	INCF    $4,$1    ; 0D13, 0A84
	CLRF    $0       ; 0D14, 0180
	INCF    $4,$1    ; 0D15, 0A84
	CLRF    $0       ; 0D16, 0180
	BCF     $a,$3    ; 0D17, 118A
	CALL    _L397    ; 0D18, 2397
	BSF     $a,$3    ; 0D19, 158A
	MOVLW   $10      ; 0D1A, 3010
	MOVWF   $47      ; 0D1B, 00C7
	MOVLW   $19      ; 0D1C, 3019
	MOVWF   $48      ; 0D1D, 00C8
	MOVLW   $10      ; 0D1E, 3010
	MOVWF   $49      ; 0D1F, 00C9
	MOVLW   $43      ; 0D20, 3043
	BCF     $a,$3    ; 0D21, 118A
	CALL    _L3A0    ; 0D22, 23A0
	BSF     $a,$3    ; 0D23, 158A
	BSF     $2d,$4   ; 0D24, 162D

.org 0xD25 
_LD25:
	BTFSS   $2d,$6   ; 0D25, 1F2D
	GOTO    _LD9C    ; 0D26, 2D9C
	BCF     $2d,$6   ; 0D27, 132D
	CLRWDT           ; 0D28, 0064
	BCF     $3,$5    ; 0D29, 1283
	MOVLW   $e       ; 0D2A, 300E
	BCF     $3,$6    ; 0D2B, 1303
	CLRF    $47      ; 0D2C, 01C7
	INCF    $47,$1   ; 0D2D, 0AC7
	BSF     $a,$3    ; 0D2E, 158A
	CALL    _LF19    ; 0D2F, 2719
	BSF     $a,$3    ; 0D30, 158A
	MOVF    $48,$0   ; 0D31, 0848
	MOVWF   $35      ; 0D32, 00B5
	MOVF    $47,$0   ; 0D33, 0847
	MOVWF   $34      ; 0D34, 00B4
	MOVWF   $47      ; 0D35, 00C7
	MOVF    $35,$0   ; 0D36, 0835
	MOVWF   $48      ; 0D37, 00C8
	MOVLW   $4b      ; 0D38, 304B
	CLRF    $49      ; 0D39, 01C9
	CLRF    $4a      ; 0D3A, 01CA
	CLRF    $4e      ; 0D3B, 01CE
	MOVWF   $4d      ; 0D3C, 00CD
	CLRF    $4c      ; 0D3D, 01CC
	CLRF    $4b      ; 0D3E, 01CB
	BCF     $a,$3    ; 0D3F, 118A
	CALL    _L75C    ; 0D40, 275C
	BSF     $a,$3    ; 0D41, 158A
	MOVF    $48,$0   ; 0D42, 0848
	MOVWF   $35      ; 0D43, 00B5
	MOVF    $47,$0   ; 0D44, 0847
	MOVWF   $34      ; 0D45, 00B4
	BSF     $a,$3    ; 0D46, 158A
	CALL    _LDA6    ; 0D47, 25A6
	BSF     $a,$3    ; 0D48, 158A
	BCF     $3,$5    ; 0D49, 1283
	BCF     $3,$6    ; 0D4A, 1303
	BTFSC   $2d,$4   ; 0D4B, 1A2D
	GOTO    _LD8D    ; 0D4C, 2D8D
	BTFSS   $2e,$7   ; 0D4D, 1FAE
	GOTO    _LD84    ; 0D4E, 2D84
	MOVLW   $a       ; 0D4F, 300A
	SUBWF   $35,$0   ; 0D50, 0235
	MOVLW   $f0      ; 0D51, 30F0
	BTFSC   $3,$2    ; 0D52, 1903
	SUBWF   $34,$0   ; 0D53, 0234
	BTFSC   $3,$0    ; 0D54, 1803
	GOTO    _LD58    ; 0D55, 2D58
	INCF    $30,$1   ; 0D56, 0AB0
	GOTO    _LD59    ; 0D57, 2D59

.org 0xD58 
_LD58:
	CLRF    $30      ; 0D58, 01B0

.org 0xD59 
_LD59:
	MOVLW   $ea      ; 0D59, 30EA
	BSF     $3,$6    ; 0D5A, 1703
	SUBWF   $5f,$0   ; 0D5B, 025F
	MOVLW   $60      ; 0D5C, 3060
	BTFSC   $3,$2    ; 0D5D, 1903
	SUBWF   $5e,$0   ; 0D5E, 025E
	BTFSC   $3,$0    ; 0D5F, 1803
	GOTO    _LD8A    ; 0D60, 2D8A
	INCF    $5e,$1   ; 0D61, 0ADE
	BTFSC   $3,$2    ; 0D62, 1903
	INCF    $5f,$1   ; 0D63, 0ADF
	MOVLW   $0       ; 0D64, 3000
	SUBWF   $5f,$0   ; 0D65, 025F
	MOVLW   $2       ; 0D66, 3002
	BTFSC   $3,$2    ; 0D67, 1903
	SUBWF   $5e,$0   ; 0D68, 025E
	BTFSS   $3,$0    ; 0D69, 1C03
	GOTO    _LD72    ; 0D6A, 2D72
	BCF     $3,$6    ; 0D6B, 1303
	BTFSS   $2e,$1   ; 0D6C, 1CAE
	GOTO    _LD72    ; 0D6D, 2D72
	MOVF    $35,$0   ; 0D6E, 0835
	MOVWF   $37      ; 0D6F, 00B7
	MOVF    $34,$0   ; 0D70, 0834
	MOVWF   $36      ; 0D71, 00B6

.org 0xD72 
_LD72:
	BSF     $3,$6    ; 0D72, 1703
	INCF    $60,$0   ; 0D73, 0A60
	BTFSC   $3,$2    ; 0D74, 1903
	INCF    $61,$0   ; 0D75, 0A61
	BTFSC   $3,$2    ; 0D76, 1903
	INCF    $62,$0   ; 0D77, 0A62
	BTFSC   $3,$2    ; 0D78, 1903
	INCF    $63,$0   ; 0D79, 0A63
	BTFSC   $3,$2    ; 0D7A, 1903
	GOTO    _LD8A    ; 0D7B, 2D8A
	INCF    $60,$1   ; 0D7C, 0AE0
	BTFSC   $3,$2    ; 0D7D, 1903
	INCF    $61,$1   ; 0D7E, 0AE1
	BTFSC   $3,$2    ; 0D7F, 1903
	INCF    $62,$1   ; 0D80, 0AE2
	BTFSC   $3,$2    ; 0D81, 1903
	INCF    $63,$1   ; 0D82, 0AE3
	GOTO    _LD8A    ; 0D83, 2D8A

.org 0xD84 
_LD84:
	BCF     $a,$3    ; 0D84, 118A
	CALL    _L5B0    ; 0D85, 25B0
	BSF     $a,$3    ; 0D86, 158A
	BSF     $a,$3    ; 0D87, 158A
	CALL    _LBA2    ; 0D88, 23A2
	BSF     $a,$3    ; 0D89, 158A

.org 0xD8A 
_LD8A:
	BCF     $a,$3    ; 0D8A, 118A
	CALL    _L13     ; 0D8B, 2013
	BSF     $a,$3    ; 0D8C, 158A

.org 0xD8D 
_LD8D:
	BCF     $3,$5    ; 0D8D, 1283
	BCF     $3,$6    ; 0D8E, 1303
	MOVF    $45,$0   ; 0D8F, 0845
	BTFSC   $3,$2    ; 0D90, 1903
	GOTO    _LD94    ; 0D91, 2D94
	DECF    $45,$1   ; 0D92, 03C5
	GOTO    _LD99    ; 0D93, 2D99

.org 0xD94 
_LD94:
	MOVF    $43,$0   ; 0D94, 0843
	MOVWF   $45      ; 0D95, 00C5
	BCF     $a,$3    ; 0D96, 118A
	CALL    _L267    ; 0D97, 2267
	BSF     $a,$3    ; 0D98, 158A

.org 0xD99 
_LD99:
	BSF     $a,$3    ; 0D99, 158A
	CALL    _LB26    ; 0D9A, 2326
	BSF     $a,$3    ; 0D9B, 158A

.org 0xD9C 
_LD9C:
	BTFSS   $2d,$0   ; 0D9C, 1C2D
	GOTO    _LDA2    ; 0D9D, 2DA2
	BCF     $a,$3    ; 0D9E, 118A
	CALL    _LC1     ; 0D9F, 20C1
	BSF     $a,$3    ; 0DA0, 158A
	GOTO    _LD25    ; 0DA1, 2D25

.org 0xDA2 
_LDA2:
	BSF     $a,$3    ; 0DA2, 158A
	CALL    _LC10    ; 0DA3, 2410
	BSF     $a,$3    ; 0DA4, 158A
	GOTO    _LD25    ; 0DA5, 2D25

.org 0xDA6 
_LDA6:
	BTFSS   $2d,$5   ; 0DA6, 1EAD
	GOTO    _LE82    ; 0DA7, 2E82
	BTFSS   $2e,$7   ; 0DA8, 1FAE
	GOTO    _LDAF    ; 0DA9, 2DAF
	CLRF    $3d      ; 0DAA, 01BD
	CLRF    $3e      ; 0DAB, 01BE
	CLRF    $3f      ; 0DAC, 01BF
	CLRF    $40      ; 0DAD, 01C0
	RET              ; 0DAE, 0008

.org 0xDAF 
_LDAF:
	BTFSS   $2d,$2   ; 0DAF, 1D2D
	GOTO    _LE11    ; 0DB0, 2E11
	MOVF    $34,$0   ; 0DB1, 0834
	ADDLW   $14      ; 0DB2, 3E14
	MOVWF   $47      ; 0DB3, 00C7
	MOVF    $35,$0   ; 0DB4, 0835
	BTFSC   $3,$0    ; 0DB5, 1803
	ADDLW   $1       ; 0DB6, 3E01
	MOVWF   $48      ; 0DB7, 00C8
	MOVF    $42,$0   ; 0DB8, 0842
	SUBWF   $48,$0   ; 0DB9, 0248
	BTFSS   $3,$2    ; 0DBA, 1D03
	GOTO    _LDBE    ; 0DBB, 2DBE
	MOVF    $41,$0   ; 0DBC, 0841
	SUBWF   $47,$0   ; 0DBD, 0247

.org 0xDBE 
_LDBE:
	BTFSS   $3,$0    ; 0DBE, 1C03
	BTFSC   $2d,$1   ; 0DBF, 18AD
	GOTO    _LDCC    ; 0DC0, 2DCC
	CLRF    $3d      ; 0DC1, 01BD
	CLRF    $3e      ; 0DC2, 01BE
	CALL    _LEB4    ; 0DC3, 26B4
	BSF     $a,$3    ; 0DC4, 158A
	BTFSC   $3,$2    ; 0DC5, 1903
	SUBWF   $3f,$0   ; 0DC6, 023F
	BTFSS   $3,$0    ; 0DC7, 1C03
	GOTO    _LDF0    ; 0DC8, 2DF0
	CLRF    $3f      ; 0DC9, 01BF
	CLRF    $40      ; 0DCA, 01C0
	GOTO    _LDF0    ; 0DCB, 2DF0

.org 0xDCC 
_LDCC:
	CLRF    $3f      ; 0DCC, 01BF
	CLRF    $40      ; 0DCD, 01C0
	BSF     $2d,$1   ; 0DCE, 14AD
	BTFSC   $2d,$3   ; 0DCF, 19AD
	GOTO    _LDEA    ; 0DD0, 2DEA
	MOVLW   $f       ; 0DD1, 300F
	SUBWF   $35,$0   ; 0DD2, 0235
	MOVLW   $b4      ; 0DD3, 30B4
	BTFSC   $3,$2    ; 0DD4, 1903
	SUBWF   $34,$0   ; 0DD5, 0234
	BTFSC   $3,$0    ; 0DD6, 1803
	GOTO    _LDEA    ; 0DD7, 2DEA
	BCF     $3,$0    ; 0DD8, 1003
	RLF     $3c,$0   ; 0DD9, 0D3C
	CALL    _LEAD    ; 0DDA, 26AD
	BCF     $a,$3    ; 0DDB, 118A
	CALL    _L600    ; 0DDC, 2600
	BSF     $a,$3    ; 0DDD, 158A
	MOVWF   $47      ; 0DDE, 00C7
	BCF     $a,$3    ; 0DDF, 118A
	CALL    _L600    ; 0DE0, 2600
	BSF     $a,$3    ; 0DE1, 158A
	MOVWF   $48      ; 0DE2, 00C8
	SUBWF   $35,$0   ; 0DE3, 0235
	BTFSS   $3,$2    ; 0DE4, 1D03
	GOTO    _LDE8    ; 0DE5, 2DE8
	MOVF    $47,$0   ; 0DE6, 0847
	SUBWF   $34,$0   ; 0DE7, 0234

.org 0xDE8 
_LDE8:
	BTFSS   $3,$0    ; 0DE8, 1C03
	GOTO    _LDEE    ; 0DE9, 2DEE

.org 0xDEA 
_LDEA:
	INCF    $3d,$1   ; 0DEA, 0ABD
	BTFSC   $3,$2    ; 0DEB, 1903
	INCF    $3e,$1   ; 0DEC, 0ABE
	GOTO    _LDF0    ; 0DED, 2DF0

.org 0xDEE 
_LDEE:
	CLRF    $3d      ; 0DEE, 01BD
	CLRF    $3e      ; 0DEF, 01BE

.org 0xDF0 
_LDF0:
	MOVLW   $a       ; 0DF0, 300A
	SUBWF   $3c,$0   ; 0DF1, 023C
	BTFSS   $3,$0    ; 0DF2, 1C03
	GOTO    _LDFC    ; 0DF3, 2DFC
	MOVLW   $5a      ; 0DF4, 305A
	SUBWF   $3c,$0   ; 0DF5, 023C
	BTFSC   $3,$0    ; 0DF6, 1803
	GOTO    _LDFC    ; 0DF7, 2DFC
	MOVLW   $b8      ; 0DF8, 30B8
	MOVWF   $4a      ; 0DF9, 00CA
	MOVLW   $b       ; 0DFA, 300B
	GOTO    _LDFF    ; 0DFB, 2DFF

.org 0xDFC 
_LDFC:
	MOVLW   $a0      ; 0DFC, 30A0
	MOVWF   $4a      ; 0DFD, 00CA
	MOVLW   $f       ; 0DFE, 300F

.org 0xDFF 
_LDFF:
	MOVWF   $4b      ; 0DFF, 00CB
	SUBWF   $3e,$0   ; 0E00, 023E
	BTFSS   $3,$2    ; 0E01, 1D03
	GOTO    _LE05    ; 0E02, 2E05
	MOVF    $4a,$0   ; 0E03, 084A
	SUBWF   $3d,$0   ; 0E04, 023D

.org 0xE05 
_LE05:
	BTFSS   $3,$0    ; 0E05, 1C03
	RET              ; 0E06, 0008
	MOVLW   $64      ; 0E07, 3064
	CLRF    $3d      ; 0E08, 01BD
	CLRF    $3e      ; 0E09, 01BE
	SUBWF   $3c,$0   ; 0E0A, 023C
	BTFSS   $3,$0    ; 0E0B, 1C03
	INCF    $3c,$1   ; 0E0C, 0ABC
	MOVF    $3c,$0   ; 0E0D, 083C
	BTFSS   $3,$2    ; 0E0E, 1D03
	BCF     $2e,$3   ; 0E0F, 11AE
	RET              ; 0E10, 0008

.org 0xE11 
_LE11:
	MOVLW   $2       ; 0E11, 3002
	CLRF    $3d      ; 0E12, 01BD
	CLRF    $3e      ; 0E13, 01BE
	SUBWF   $3c,$0   ; 0E14, 023C
	BTFSS   $3,$0    ; 0E15, 1C03
	GOTO    _LE71    ; 0E16, 2E71
	BCF     $3,$0    ; 0E17, 1003
	RLF     $3c,$0   ; 0E18, 0D3C
	CALL    _LEAD    ; 0E19, 26AD
	BCF     $a,$3    ; 0E1A, 118A
	CALL    _L600    ; 0E1B, 2600
	BSF     $a,$3    ; 0E1C, 158A
	MOVWF   $47      ; 0E1D, 00C7
	BCF     $a,$3    ; 0E1E, 118A
	CALL    _L600    ; 0E1F, 2600
	BSF     $a,$3    ; 0E20, 158A
	MOVWF   $48      ; 0E21, 00C8
	SUBWF   $35,$0   ; 0E22, 0235
	BTFSS   $3,$2    ; 0E23, 1D03
	GOTO    _LE27    ; 0E24, 2E27
	MOVF    $47,$0   ; 0E25, 0847
	SUBWF   $34,$0   ; 0E26, 0234

.org 0xE27 
_LE27:
	BTFSC   $3,$0    ; 0E27, 1803
	GOTO    _LE2D    ; 0E28, 2E2D
	INCF    $3f,$1   ; 0E29, 0ABF
	BTFSC   $3,$2    ; 0E2A, 1903
	INCF    $40,$1   ; 0E2B, 0AC0
	GOTO    _LE2F    ; 0E2C, 2E2F

.org 0xE2D 
_LE2D:
	CLRF    $3f      ; 0E2D, 01BF
	CLRF    $40      ; 0E2E, 01C0

.org 0xE2F 
_LE2F:
	MOVLW   $0       ; 0E2F, 3000
	SUBWF   $40,$0   ; 0E30, 0240
	MOVLW   $64      ; 0E31, 3064
	BTFSC   $3,$2    ; 0E32, 1903
	SUBWF   $3f,$0   ; 0E33, 023F
	BTFSS   $3,$0    ; 0E34, 1C03
	RET              ; 0E35, 0008
	CLRF    $3f      ; 0E36, 01BF
	CLRF    $40      ; 0E37, 01C0
	MOVF    $3c,$0   ; 0E38, 083C
	MOVWF   $4c      ; 0E39, 00CC

.org 0xE3A 
_LE3A:
	MOVF    $4c,$1   ; 0E3A, 08CC
	BTFSC   $3,$2    ; 0E3B, 1903
	GOTO    _LE50    ; 0E3C, 2E50
	DECF    $4c,$1   ; 0E3D, 03CC
	BCF     $3,$0    ; 0E3E, 1003
	RLF     $4c,$0   ; 0E3F, 0D4C
	CALL    _LEAD    ; 0E40, 26AD
	BCF     $a,$3    ; 0E41, 118A
	CALL    _L600    ; 0E42, 2600
	BSF     $a,$3    ; 0E43, 158A
	MOVWF   $47      ; 0E44, 00C7
	BCF     $a,$3    ; 0E45, 118A
	CALL    _L600    ; 0E46, 2600
	BSF     $a,$3    ; 0E47, 158A
	MOVWF   $48      ; 0E48, 00C8
	SUBWF   $35,$0   ; 0E49, 0235
	BTFSS   $3,$2    ; 0E4A, 1D03
	GOTO    _LE4E    ; 0E4B, 2E4E
	MOVF    $47,$0   ; 0E4C, 0847
	SUBWF   $34,$0   ; 0E4D, 0234

.org 0xE4E 
_LE4E:
	BTFSS   $3,$0    ; 0E4E, 1C03
	GOTO    _LE3A    ; 0E4F, 2E3A

.org 0xE50 
_LE50:
	MOVF    $4c,$0   ; 0E50, 084C
	ADDLW   $1e      ; 0E51, 3E1E
	MOVWF   $47      ; 0E52, 00C7
	MOVLW   $0       ; 0E53, 3000
	BTFSC   $3,$0    ; 0E54, 1803
	MOVLW   $1       ; 0E55, 3001
	MOVWF   $48      ; 0E56, 00C8
	XORLW   $80      ; 0E57, 3A80
	MOVWF   $49      ; 0E58, 00C9
	MOVLW   $80      ; 0E59, 3080
	SUBWF   $49,$0   ; 0E5A, 0249
	BTFSS   $3,$2    ; 0E5B, 1D03
	GOTO    _LE5F    ; 0E5C, 2E5F
	MOVF    $3c,$0   ; 0E5D, 083C
	SUBWF   $47,$0   ; 0E5E, 0247

.org 0xE5F 
_LE5F:
	BTFSC   $3,$0    ; 0E5F, 1803
	RET              ; 0E60, 0008
	BCF     $3,$5    ; 0E61, 1283
	BCF     $3,$6    ; 0E62, 1303
	MOVF    $4c,$0   ; 0E63, 084C
	MOVWF   $3c      ; 0E64, 00BC
	GOTO    _LE6F    ; 0E65, 2E6F

.org 0xE66 
_LE66:
	CALL    _LEB4    ; 0E66, 26B4
	BSF     $a,$3    ; 0E67, 158A
	BTFSC   $3,$2    ; 0E68, 1903
	SUBWF   $3f,$0   ; 0E69, 023F
	BTFSS   $3,$0    ; 0E6A, 1C03
	RET              ; 0E6B, 0008
	CLRF    $3f      ; 0E6C, 01BF
	CLRF    $40      ; 0E6D, 01C0

.org 0xE6E 
_LE6E:
	CLRF    $3c      ; 0E6E, 01BC

.org 0xE6F 
_LE6F:
	BSF     $2d,$1   ; 0E6F, 14AD
	RET              ; 0E70, 0008

.org 0xE71 
_LE71:
	MOVLW   $c       ; 0E71, 300C
	SUBWF   $35,$0   ; 0E72, 0235
	MOVLW   $b2      ; 0E73, 30B2
	BTFSC   $3,$2    ; 0E74, 1903
	SUBWF   $34,$0   ; 0E75, 0234
	BTFSS   $3,$0    ; 0E76, 1C03
	GOTO    _LE66    ; 0E77, 2E66
	MOVLW   $c       ; 0E78, 300C
	CLRF    $3f      ; 0E79, 01BF
	CLRF    $40      ; 0E7A, 01C0
	SUBWF   $35,$0   ; 0E7B, 0235
	MOVLW   $e4      ; 0E7C, 30E4
	BTFSC   $3,$2    ; 0E7D, 1903
	SUBWF   $34,$0   ; 0E7E, 0234
	BTFSC   $3,$0    ; 0E7F, 1803
	RET              ; 0E80, 0008
	GOTO    _LE6E    ; 0E81, 2E6E

.org 0xE82 
_LE82:
	MOVF    $46,$0   ; 0E82, 0846
	XORLW   $10      ; 0E83, 3A10
	BTFSC   $3,$2    ; 0E84, 1903
	GOTO    _LEA8    ; 0E85, 2EA8
	BSF     $2d,$5   ; 0E86, 16AD
	CLRF    $3d      ; 0E87, 01BD
	CLRF    $3e      ; 0E88, 01BE
	CLRF    $3f      ; 0E89, 01BF
	CLRF    $40      ; 0E8A, 01C0
	BSF     $2d,$1   ; 0E8B, 14AD
	CLRF    $3c      ; 0E8C, 01BC

.org 0xE8D 
_LE8D:
	MOVLW   $64      ; 0E8D, 3064
	SUBWF   $3c,$0   ; 0E8E, 023C
	BTFSC   $3,$0    ; 0E8F, 1803
	GOTO    _LEA5    ; 0E90, 2EA5
	BCF     $3,$0    ; 0E91, 1003
	RLF     $3c,$0   ; 0E92, 0D3C
	CALL    _LEAD    ; 0E93, 26AD
	BCF     $a,$3    ; 0E94, 118A
	CALL    _L600    ; 0E95, 2600
	BSF     $a,$3    ; 0E96, 158A
	MOVWF   $47      ; 0E97, 00C7
	BCF     $a,$3    ; 0E98, 118A
	CALL    _L600    ; 0E99, 2600
	BSF     $a,$3    ; 0E9A, 158A
	MOVWF   $48      ; 0E9B, 00C8
	SUBWF   $42,$0   ; 0E9C, 0242
	BTFSS   $3,$2    ; 0E9D, 1D03
	GOTO    _LEA1    ; 0E9E, 2EA1
	MOVF    $47,$0   ; 0E9F, 0847
	SUBWF   $41,$0   ; 0EA0, 0241

.org 0xEA1 
_LEA1:
	BTFSS   $3,$0    ; 0EA1, 1C03
	GOTO    _LEA5    ; 0EA2, 2EA5
	INCF    $3c,$1   ; 0EA3, 0ABC
	GOTO    _LE8D    ; 0EA4, 2E8D

.org 0xEA5 
_LEA5:
	MOVF    $3c,$0   ; 0EA5, 083C
	MOVWF   $31      ; 0EA6, 00B1
	RET              ; 0EA7, 0008

.org 0xEA8 
_LEA8:
	MOVF    $35,$0   ; 0EA8, 0835
	MOVWF   $42      ; 0EA9, 00C2
	MOVF    $34,$0   ; 0EAA, 0834
	MOVWF   $41      ; 0EAB, 00C1
	RET              ; 0EAC, 0008

.org 0xEAD 
_LEAD:
	ADDLW   $12      ; 0EAD, 3E12
	MOVWF   $4       ; 0EAE, 0084
	MOVLW   $86      ; 0EAF, 3086
	BTFSC   $3,$0    ; 0EB0, 1803
	ADDLW   $1       ; 0EB1, 3E01
	MOVWF   $7f      ; 0EB2, 00FF
	RET              ; 0EB3, 0008

.org 0xEB4 
_LEB4:
	INCF    $3f,$1   ; 0EB4, 0ABF
	BTFSC   $3,$2    ; 0EB5, 1903
	INCF    $40,$1   ; 0EB6, 0AC0
	MOVLW   $0       ; 0EB7, 3000
	SUBWF   $40,$0   ; 0EB8, 0240
	RETLW   $64      ; 0EB9, 3464

.org 0xEBA 
_LEBA:
	BSF     $3,$5    ; 0EBA, 1683
	MOVF    $7,$0    ; 0EBB, 0807
	ANDLW   $f       ; 0EBC, 390F
	IORLW   $30      ; 0EBD, 3830
	MOVWF   $7       ; 0EBE, 0087
	BCF     $3,$5    ; 0EBF, 1283
	MOVLW   $3       ; 0EC0, 3003
	BCF     $5,$3    ; 0EC1, 1185
	CLRF    $47      ; 0EC2, 01C7
	INCF    $47,$1   ; 0EC3, 0AC7
	CALL    _LF19    ; 0EC4, 2719
	BSF     $a,$3    ; 0EC5, 158A
	MOVLW   $3       ; 0EC6, 3003
	CLRF    $47      ; 0EC7, 01C7
	INCF    $47,$1   ; 0EC8, 0AC7
	CALL    _LF19    ; 0EC9, 2719
	BSF     $a,$3    ; 0ECA, 158A
	MOVF    $48,$0   ; 0ECB, 0848
	MOVWF   $65      ; 0ECC, 00E5
	MOVF    $47,$0   ; 0ECD, 0847
	MOVWF   $64      ; 0ECE, 00E4
	BSF     $5,$3    ; 0ECF, 1585
	BSF     $3,$5    ; 0ED0, 1683
	MOVF    $7,$0    ; 0ED1, 0807
	ANDLW   $f       ; 0ED2, 390F
	IORLW   $90      ; 0ED3, 3890
	MOVWF   $7       ; 0ED4, 0087
	BCF     $3,$5    ; 0ED5, 1283
	MOVLW   $f       ; 0ED6, 300F
	BSF     $5,$3    ; 0ED7, 1585
	SUBWF   $65,$0   ; 0ED8, 0265
	MOVLW   $fa      ; 0ED9, 30FA
	BTFSC   $3,$2    ; 0EDA, 1903
	SUBWF   $64,$0   ; 0EDB, 0264
	BTFSS   $3,$0    ; 0EDC, 1C03
	GOTO    _LEE2    ; 0EDD, 2EE2
	MOVLW   $ff      ; 0EDE, 30FF
	MOVWF   $64      ; 0EDF, 00E4
	MOVWF   $65      ; 0EE0, 00E5
	GOTO    _LF14    ; 0EE1, 2F14

.org 0xEE2 
_LEE2:
	MOVLW   $0       ; 0EE2, 3000
	SUBWF   $65,$0   ; 0EE3, 0265
	MOVLW   $1e      ; 0EE4, 301E
	BTFSC   $3,$2    ; 0EE5, 1903
	SUBWF   $64,$0   ; 0EE6, 0264
	BTFSC   $3,$0    ; 0EE7, 1803
	GOTO    _LEEC    ; 0EE8, 2EEC
	CLRF    $64      ; 0EE9, 01E4
	CLRF    $65      ; 0EEA, 01E5
	GOTO    _LF14    ; 0EEB, 2F14

.org 0xEEC 
_LEEC:
	MOVLW   $10      ; 0EEC, 3010
	CLRF    $62      ; 0EED, 01E2
	MOVWF   $63      ; 0EEE, 00E3
	MOVF    $64,$0   ; 0EEF, 0864
	SUBWF   $62,$0   ; 0EF0, 0262
	MOVWF   $53      ; 0EF1, 00D3
	MOVF    $65,$0   ; 0EF2, 0865
	BTFSS   $3,$0    ; 0EF3, 1C03
	INCF    $65,$0   ; 0EF4, 0A65
	SUBWF   $63,$0   ; 0EF5, 0263
	MOVWF   $54      ; 0EF6, 00D4
	CLRF    $55      ; 0EF7, 01D5
	CLRF    $56      ; 0EF8, 01D6
	MOVF    $64,$0   ; 0EF9, 0864
	MOVWF   $47      ; 0EFA, 00C7
	MOVF    $65,$0   ; 0EFB, 0865
	MOVWF   $48      ; 0EFC, 00C8
	MOVLW   $12      ; 0EFD, 3012
	CLRF    $49      ; 0EFE, 01C9
	CLRF    $4a      ; 0EFF, 01CA
	CLRF    $4e      ; 0F00, 01CE
	CLRF    $4d      ; 0F01, 01CD
	MOVWF   $4c      ; 0F02, 00CC
	MOVLW   $5c      ; 0F03, 305C
	MOVWF   $4b      ; 0F04, 00CB
	CALL    _LF83    ; 0F05, 2783
	BSF     $a,$3    ; 0F06, 158A
	MOVF    $4a,$0   ; 0F07, 084A
	MOVWF   $5a      ; 0F08, 00DA
	MOVF    $49,$0   ; 0F09, 0849
	MOVWF   $59      ; 0F0A, 00D9
	MOVF    $48,$0   ; 0F0B, 0848
	MOVWF   $58      ; 0F0C, 00D8
	MOVF    $47,$0   ; 0F0D, 0847
	MOVWF   $57      ; 0F0E, 00D7
	CALL    _LFB6    ; 0F0F, 27B6
	MOVF    $54,$0   ; 0F10, 0854
	MOVWF   $65      ; 0F11, 00E5
	MOVF    $53,$0   ; 0F12, 0853
	MOVWF   $64      ; 0F13, 00E4

.org 0xF14 
_LF14:
	MOVF    $65,$0   ; 0F14, 0865
	MOVWF   $61      ; 0F15, 00E1
	MOVF    $64,$0   ; 0F16, 0864
	MOVWF   $60      ; 0F17, 00E0
	RET              ; 0F18, 0008

.org 0xF19 
_LF19:
	MOVWF   $4b      ; 0F19, 00CB
	MOVLW   $10      ; 0F1A, 3010
	CLRF    $4f      ; 0F1B, 01CF
	MOVWF   $50      ; 0F1C, 00D0
	MOVLW   $e0      ; 0F1D, 30E0
	CLRF    $51      ; 0F1E, 01D1
	CLRF    $52      ; 0F1F, 01D2
	CLRF    $4c      ; 0F20, 01CC
	CLRF    $4d      ; 0F21, 01CD
	CLRF    $4e      ; 0F22, 01CE
	ANDWF   $19,$1   ; 0F23, 0599
	MOVF    $4b,$0   ; 0F24, 084B
	IORWF   $19,$1   ; 0F25, 0499

.org 0xF26 
_LF26:
	BSF     $18,$3   ; 0F26, 1598

.org 0xF27 
_LF27:
	BTFSC   $18,$3   ; 0F27, 1998
	GOTO    _LF27    ; 0F28, 2F27
	MOVF    $17,$0   ; 0F29, 0817
	MOVWF   $53      ; 0F2A, 00D3
	MOVLW   $f0      ; 0F2B, 30F0
	CLRF    $54      ; 0F2C, 01D4
	SWAPF   $53,$1   ; 0F2D, 0ED3
	SWAPF   $54,$1   ; 0F2E, 0ED4
	ANDWF   $54,$1   ; 0F2F, 05D4
	MOVF    $53,$0   ; 0F30, 0853
	ANDLW   $f       ; 0F31, 390F
	IORWF   $54,$1   ; 0F32, 04D4
	MOVLW   $f0      ; 0F33, 30F0
	ANDWF   $53,$1   ; 0F34, 05D3
	SWAPF   $18,$0   ; 0F35, 0E18
	ANDLW   $f       ; 0F36, 390F
	IORWF   $53,$1   ; 0F37, 04D3
	MOVF    $50,$0   ; 0F38, 0850
	SUBWF   $54,$0   ; 0F39, 0254
	BTFSS   $3,$2    ; 0F3A, 1D03
	GOTO    _LF3E    ; 0F3B, 2F3E
	MOVF    $4f,$0   ; 0F3C, 084F
	SUBWF   $53,$0   ; 0F3D, 0253

.org 0xF3E 
_LF3E:
	BTFSC   $3,$0    ; 0F3E, 1803
	GOTO    _LF44    ; 0F3F, 2F44
	MOVF    $54,$0   ; 0F40, 0854
	MOVWF   $50      ; 0F41, 00D0
	MOVF    $53,$0   ; 0F42, 0853
	MOVWF   $4f      ; 0F43, 00CF

.org 0xF44 
_LF44:
	MOVF    $52,$0   ; 0F44, 0852
	SUBWF   $54,$0   ; 0F45, 0254
	BTFSS   $3,$2    ; 0F46, 1D03
	GOTO    _LF4A    ; 0F47, 2F4A
	MOVF    $51,$0   ; 0F48, 0851
	SUBWF   $53,$0   ; 0F49, 0253

.org 0xF4A 
_LF4A:
	BTFSS   $3,$0    ; 0F4A, 1C03
	GOTO    _LF50    ; 0F4B, 2F50
	MOVF    $54,$0   ; 0F4C, 0854
	MOVWF   $52      ; 0F4D, 00D2
	MOVF    $53,$0   ; 0F4E, 0853
	MOVWF   $51      ; 0F4F, 00D1

.org 0xF50 
_LF50:
	MOVF    $53,$0   ; 0F50, 0853
	ADDWF   $4c,$1   ; 0F51, 07CC
	BTFSC   $3,$0    ; 0F52, 1803
	INCF    $4d,$1   ; 0F53, 0ACD
	MOVF    $54,$0   ; 0F54, 0854
	ADDWF   $4d,$1   ; 0F55, 07CD
	MOVF    $47,$0   ; 0F56, 0847
	BTFSC   $3,$2    ; 0F57, 1903
	GOTO    _LF5E    ; 0F58, 2F5E
	MOVLW   $6       ; 0F59, 3006
	INCF    $4e,$1   ; 0F5A, 0ACE
	SUBWF   $4e,$0   ; 0F5B, 024E
	BTFSS   $3,$0    ; 0F5C, 1C03
	GOTO    _LF26    ; 0F5D, 2F26

.org 0xF5E 
_LF5E:
	MOVF    $47,$0   ; 0F5E, 0847
	BTFSC   $3,$2    ; 0F5F, 1903
	GOTO    _LF7E    ; 0F60, 2F7E
	MOVF    $51,$0   ; 0F61, 0851
	ADDWF   $4f,$0   ; 0F62, 074F
	MOVWF   $49      ; 0F63, 00C9
	MOVF    $52,$0   ; 0F64, 0852
	BTFSC   $3,$0    ; 0F65, 1803
	INCF    $52,$0   ; 0F66, 0A52
	ADDWF   $50,$0   ; 0F67, 0750
	MOVWF   $4a      ; 0F68, 00CA
	COMF    $49,$1   ; 0F69, 09C9
	COMF    $4a,$1   ; 0F6A, 09CA
	INCF    $49,$1   ; 0F6B, 0AC9
	BTFSC   $3,$2    ; 0F6C, 1903
	INCF    $4a,$1   ; 0F6D, 0ACA
	MOVF    $49,$0   ; 0F6E, 0849
	MOVWF   $53      ; 0F6F, 00D3
	MOVF    $4a,$0   ; 0F70, 084A
	MOVWF   $54      ; 0F71, 00D4
	MOVF    $4c,$0   ; 0F72, 084C
	ADDWF   $53,$1   ; 0F73, 07D3
	BTFSC   $3,$0    ; 0F74, 1803
	INCF    $54,$1   ; 0F75, 0AD4
	MOVF    $4d,$0   ; 0F76, 084D
	ADDWF   $54,$1   ; 0F77, 07D4
	BCF     $3,$0    ; 0F78, 1003
	RRF     $54,$1   ; 0F79, 0CD4
	RRF     $53,$1   ; 0F7A, 0CD3
	BCF     $3,$0    ; 0F7B, 1003
	RRF     $54,$1   ; 0F7C, 0CD4
	RRF     $53,$1   ; 0F7D, 0CD3

.org 0xF7E 
_LF7E:
	MOVF    $54,$0   ; 0F7E, 0854
	MOVWF   $48      ; 0F7F, 00C8
	MOVF    $53,$0   ; 0F80, 0853
	MOVWF   $47      ; 0F81, 00C7
	RET              ; 0F82, 0008

.org 0xF83 
_LF83:
	CLRF    $4f      ; 0F83, 01CF
	CLRF    $50      ; 0F84, 01D0
	CLRF    $51      ; 0F85, 01D1
	CLRF    $52      ; 0F86, 01D2

.org 0xF87 
_LF87:
	BTFSS   $47,$0   ; 0F87, 1C47
	GOTO    _LF9D    ; 0F88, 2F9D
	MOVF    $4b,$0   ; 0F89, 084B
	ADDWF   $4f,$1   ; 0F8A, 07CF
	MOVF    $4c,$0   ; 0F8B, 084C
	BCF     $3,$2    ; 0F8C, 1103
	BTFSC   $3,$0    ; 0F8D, 1803
	ADDLW   $1       ; 0F8E, 3E01
	BTFSS   $3,$2    ; 0F8F, 1D03
	ADDWF   $50,$1   ; 0F90, 07D0
	MOVF    $4d,$0   ; 0F91, 084D
	BCF     $3,$2    ; 0F92, 1103
	BTFSC   $3,$0    ; 0F93, 1803
	ADDLW   $1       ; 0F94, 3E01
	BTFSS   $3,$2    ; 0F95, 1D03
	ADDWF   $51,$1   ; 0F96, 07D1
	MOVF    $4e,$0   ; 0F97, 084E
	BCF     $3,$2    ; 0F98, 1103
	BTFSC   $3,$0    ; 0F99, 1803
	ADDLW   $1       ; 0F9A, 3E01
	BTFSS   $3,$2    ; 0F9B, 1D03
	ADDWF   $52,$1   ; 0F9C, 07D2

.org 0xF9D 
_LF9D:
	BCF     $3,$0    ; 0F9D, 1003
	RLF     $4b,$1   ; 0F9E, 0DCB
	RLF     $4c,$1   ; 0F9F, 0DCC
	RLF     $4d,$1   ; 0FA0, 0DCD
	RLF     $4e,$1   ; 0FA1, 0DCE
	BCF     $3,$0    ; 0FA2, 1003
	RRF     $4a,$1   ; 0FA3, 0CCA
	RRF     $49,$1   ; 0FA4, 0CC9
	RRF     $48,$1   ; 0FA5, 0CC8
	RRF     $47,$1   ; 0FA6, 0CC7
	MOVF    $4a,$0   ; 0FA7, 084A
	IORWF   $49,$0   ; 0FA8, 0449
	IORWF   $48,$0   ; 0FA9, 0448
	IORWF   $47,$0   ; 0FAA, 0447
	BTFSS   $3,$2    ; 0FAB, 1D03
	GOTO    _LF87    ; 0FAC, 2F87
	MOVF    $52,$0   ; 0FAD, 0852
	MOVWF   $4a      ; 0FAE, 00CA
	MOVF    $51,$0   ; 0FAF, 0851
	MOVWF   $49      ; 0FB0, 00C9
	MOVF    $50,$0   ; 0FB1, 0850
	MOVWF   $48      ; 0FB2, 00C8
	MOVF    $4f,$0   ; 0FB3, 084F
	MOVWF   $47      ; 0FB4, 00C7
	RET              ; 0FB5, 0008

.org 0xFB6 
_LFB6:
	CLRF    $5b      ; 0FB6, 01DB
	CLRF    $5c      ; 0FB7, 01DC
	CLRF    $5d      ; 0FB8, 01DD
	CLRF    $5e      ; 0FB9, 01DE
	MOVF    $56,$0   ; 0FBA, 0856
	IORWF   $55,$0   ; 0FBB, 0455
	IORWF   $54,$0   ; 0FBC, 0454
	IORWF   $53,$0   ; 0FBD, 0453
	BTFSC   $3,$2    ; 0FBE, 1903
	GOTO    _LFF5    ; 0FBF, 2FF5
	CLRF    $5f      ; 0FC0, 01DF

.org 0xFC1 
_LFC1:
	INCF    $5f,$1   ; 0FC1, 0ADF
	BTFSC   $56,$7   ; 0FC2, 1BD6
	GOTO    _LFCA    ; 0FC3, 2FCA
	BCF     $3,$0    ; 0FC4, 1003
	RLF     $53,$1   ; 0FC5, 0DD3
	RLF     $54,$1   ; 0FC6, 0DD4
	RLF     $55,$1   ; 0FC7, 0DD5
	RLF     $56,$1   ; 0FC8, 0DD6
	GOTO    _LFC1    ; 0FC9, 2FC1

.org 0xFCA 
_LFCA:
	BCF     $3,$0    ; 0FCA, 1003
	RLF     $5b,$1   ; 0FCB, 0DDB
	RLF     $5c,$1   ; 0FCC, 0DDC
	RLF     $5d,$1   ; 0FCD, 0DDD
	RLF     $5e,$1   ; 0FCE, 0DDE
	MOVF    $56,$0   ; 0FCF, 0856
	SUBWF   $5a,$0   ; 0FD0, 025A
	BTFSS   $3,$2    ; 0FD1, 1D03
	GOTO    _LFDD    ; 0FD2, 2FDD
	MOVF    $55,$0   ; 0FD3, 0855
	SUBWF   $59,$0   ; 0FD4, 0259
	BTFSS   $3,$2    ; 0FD5, 1D03
	GOTO    _LFDD    ; 0FD6, 2FDD
	MOVF    $54,$0   ; 0FD7, 0854
	SUBWF   $58,$0   ; 0FD8, 0258
	BTFSS   $3,$2    ; 0FD9, 1D03
	GOTO    _LFDD    ; 0FDA, 2FDD
	MOVF    $53,$0   ; 0FDB, 0853
	SUBWF   $57,$0   ; 0FDC, 0257

.org 0xFDD 
_LFDD:
	BTFSS   $3,$0    ; 0FDD, 1C03
	GOTO    _LFEF    ; 0FDE, 2FEF
	MOVF    $53,$0   ; 0FDF, 0853
	SUBWF   $57,$1   ; 0FE0, 02D7
	MOVF    $54,$0   ; 0FE1, 0854
	BTFSS   $3,$0    ; 0FE2, 1C03
	INCFSZ  $54,$0   ; 0FE3, 0F54
	SUBWF   $58,$1   ; 0FE4, 02D8
	MOVF    $55,$0   ; 0FE5, 0855
	BTFSS   $3,$0    ; 0FE6, 1C03
	INCFSZ  $55,$0   ; 0FE7, 0F55
	SUBWF   $59,$1   ; 0FE8, 02D9
	MOVF    $56,$0   ; 0FE9, 0856
	BTFSS   $3,$0    ; 0FEA, 1C03
	INCFSZ  $56,$0   ; 0FEB, 0F56
	SUBWF   $5a,$1   ; 0FEC, 02DA
	BSF     $5b,$0   ; 0FED, 145B
	BCF     $3,$0    ; 0FEE, 1003

.org 0xFEF 
_LFEF:
	RRF     $56,$1   ; 0FEF, 0CD6
	RRF     $55,$1   ; 0FF0, 0CD5
	RRF     $54,$1   ; 0FF1, 0CD4
	RRF     $53,$1   ; 0FF2, 0CD3
	DECFSZ  $5f,$1   ; 0FF3, 0BDF
	GOTO    _LFCA    ; 0FF4, 2FCA

.org 0xFF5 
_LFF5:
	MOVF    $5e,$0   ; 0FF5, 085E
	MOVWF   $56      ; 0FF6, 00D6
	MOVF    $5d,$0   ; 0FF7, 085D
	MOVWF   $55      ; 0FF8, 00D5
	MOVF    $5c,$0   ; 0FF9, 085C
	MOVWF   $54      ; 0FFA, 00D4
	MOVF    $5b,$0   ; 0FFB, 085B
	MOVWF   $53      ; 0FFC, 00D3
	RET              ; 0FFD, 0008
	RETLW   $0       ; 0FFE, 3400
	RETLW   $0       ; 0FFF, 3400

.end  


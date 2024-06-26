opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 10920"

opt pagewidth 120

	opt pm

	processor	16F883
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_SystemClockInit
	FNCALL	_main,_InitGpio
	FNCALL	_main,_Init_BOD_WDT
	FNCALL	_main,_MCU_INIT_TIMER
	FNCALL	_main,_KeyUpStopSmoke
	FNCALL	_main,_SetOffNotifyLED
	FNCALL	_main,_SetWarnEvent
	FNCALL	_main,_ClearAllRAM
	FNCALL	_main,_HAL_ADC_Sample
	FNCALL	_main,___aldiv
	FNCALL	_main,_UpdateElectricityGrade
	FNCALL	_main,_ReadChargerState
	FNCALL	_main,_PlugProgress
	FNCALL	_main,_PortScan
	FNCALL	_main,_ShowWarnLED
	FNCALL	_main,_ScanShowBatLxLED
	FNCALL	_main,_PowerProgress
	FNCALL	_main,_IdleProgress
	FNCALL	_IdleProgress,_EnterSleep
	FNCALL	_PowerProgress,_SetOffNotifyLED
	FNCALL	_PowerProgress,_SetShowLED
	FNCALL	_PowerProgress,_SetWarnEvent
	FNCALL	_PowerProgress,_ShowSegmentLED
	FNCALL	_PowerProgress,_SetShowBatLxLED
	FNCALL	_PowerProgress,_ReadLoadRes
	FNCALL	_PowerProgress,_KeyUpStopSmoke
	FNCALL	_PowerProgress,_HAL_ADC_Sample
	FNCALL	_PowerProgress,___lmul
	FNCALL	_PowerProgress,___lldiv
	FNCALL	_PortScan,_gearSwitch
	FNCALL	_PortScan,_KeyUpStopSmoke
	FNCALL	_PortScan,_SetOffNotifyLED
	FNCALL	_PortScan,_SetWarnEvent
	FNCALL	_PortScan,_SetShowLED
	FNCALL	_PortScan,_ShowSegmentLED
	FNCALL	_PortScan,_SetShowBatLxLED
	FNCALL	_EnterSleep,_InitGpio
	FNCALL	_EnterSleep,_Delay_16nop
	FNCALL	_EnterSleep,_Init_BOD_WDT
	FNCALL	_EnterSleep,_MCU_INIT_TIMER
	FNCALL	_ReadLoadRes,_HAL_ADC_Sample
	FNCALL	_ReadLoadRes,___lmul
	FNCALL	_ReadLoadRes,___lldiv
	FNCALL	_gearSwitch,_SetOffNotifyLED
	FNCALL	_gearSwitch,_SetShowLED
	FNCALL	_gearSwitch,_SetWarnEvent
	FNCALL	_gearSwitch,_ShowSegmentLED
	FNCALL	_gearSwitch,_SetShowBatLxLED
	FNCALL	_ShowWarnLED,_SetShowLED
	FNCALL	_ShowWarnLED,_ShowSegmentLED
	FNCALL	_ShowWarnLED,_SetShowBatLxLED
	FNCALL	_PlugProgress,_SetWarnEvent
	FNCALL	_ReadChargerState,_SetWarnEvent
	FNCALL	_ReadChargerState,_SetShowBatLxLED
	FNCALL	_SystemClockInit,_Delay_16nop
	FNROOT	_main
	FNCALL	_Interrupt_ISR,_led_matrix_run
	FNCALL	_Interrupt_ISR,_SmokeOut
	FNCALL	_led_matrix_run,_led_set_io_od
	FNCALL	_led_matrix_run,___bmul
	FNCALL	_led_matrix_run,_led_set_io_pp
	FNCALL	intlevel1,_Interrupt_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_D_BatVol_Table
psect	stringtext,class=STRCODE,delta=2,reloc=256
global __pstringtext
__pstringtext:
;	global	stringtab,__stringbase
stringtab:
;	String table - string pointers are 2 bytes each
	btfsc	(btemp+1),7
	ljmp	stringcode
	bcf	status,7
	btfsc	(btemp+1),0
	bsf	status,7
	movf	indf,w
	incf fsr
skipnz
incf btemp+1
	return
stringcode:
	movf btemp+1,w
andlw 7Fh
movwf	pclath
	movf	fsr,w
incf fsr
skipnz
incf btemp+1
	movwf pc
__stringbase:
	file	"E:\workSpace\git_work\jm\P2\code\modular.c"
	line	22
_D_BatVol_Table:
	retlw	0E4h
	retlw	0Ch

	retlw	0F2h
	retlw	0Ch

	retlw	0
	retlw	0Dh

	retlw	0Eh
	retlw	0Dh

	retlw	01Ch
	retlw	0Dh

	retlw	02Ah
	retlw	0Dh

	retlw	038h
	retlw	0Dh

	retlw	046h
	retlw	0Dh

	retlw	054h
	retlw	0Dh

	retlw	062h
	retlw	0Dh

	retlw	070h
	retlw	0Dh

	retlw	07Ah
	retlw	0Dh

	retlw	084h
	retlw	0Dh

	retlw	08Eh
	retlw	0Dh

	retlw	098h
	retlw	0Dh

	retlw	0A2h
	retlw	0Dh

	retlw	0ACh
	retlw	0Dh

	retlw	0B6h
	retlw	0Dh

	retlw	0C0h
	retlw	0Dh

	retlw	0CAh
	retlw	0Dh

	retlw	0D4h
	retlw	0Dh

	retlw	0DEh
	retlw	0Dh

	retlw	0E8h
	retlw	0Dh

	retlw	0F2h
	retlw	0Dh

	retlw	0FCh
	retlw	0Dh

	retlw	06h
	retlw	0Eh

	retlw	010h
	retlw	0Eh

	retlw	01Ah
	retlw	0Eh

	retlw	024h
	retlw	0Eh

	retlw	02Eh
	retlw	0Eh

	retlw	038h
	retlw	0Eh

	retlw	03Ch
	retlw	0Eh

	retlw	040h
	retlw	0Eh

	retlw	044h
	retlw	0Eh

	retlw	048h
	retlw	0Eh

	retlw	04Ch
	retlw	0Eh

	retlw	050h
	retlw	0Eh

	retlw	054h
	retlw	0Eh

	retlw	058h
	retlw	0Eh

	retlw	05Ch
	retlw	0Eh

	retlw	060h
	retlw	0Eh

	retlw	064h
	retlw	0Eh

	retlw	068h
	retlw	0Eh

	retlw	06Ch
	retlw	0Eh

	retlw	070h
	retlw	0Eh

	retlw	074h
	retlw	0Eh

	retlw	078h
	retlw	0Eh

	retlw	07Ch
	retlw	0Eh

	retlw	080h
	retlw	0Eh

	retlw	084h
	retlw	0Eh

	retlw	088h
	retlw	0Eh

	retlw	08Ch
	retlw	0Eh

	retlw	090h
	retlw	0Eh

	retlw	094h
	retlw	0Eh

	retlw	098h
	retlw	0Eh

	retlw	09Ch
	retlw	0Eh

	retlw	0A0h
	retlw	0Eh

	retlw	0A4h
	retlw	0Eh

	retlw	0A8h
	retlw	0Eh

	retlw	0ACh
	retlw	0Eh

	retlw	0B0h
	retlw	0Eh

	retlw	0B4h
	retlw	0Eh

	retlw	0B8h
	retlw	0Eh

	retlw	0BCh
	retlw	0Eh

	retlw	0C0h
	retlw	0Eh

	retlw	0C4h
	retlw	0Eh

	retlw	0C8h
	retlw	0Eh

	retlw	0CCh
	retlw	0Eh

	retlw	0D0h
	retlw	0Eh

	retlw	0D4h
	retlw	0Eh

	retlw	0D8h
	retlw	0Eh

	retlw	0E2h
	retlw	0Eh

	retlw	0ECh
	retlw	0Eh

	retlw	0F6h
	retlw	0Eh

	retlw	0
	retlw	0Fh

	retlw	0Ah
	retlw	0Fh

	retlw	014h
	retlw	0Fh

	retlw	01Eh
	retlw	0Fh

	retlw	028h
	retlw	0Fh

	retlw	032h
	retlw	0Fh

	retlw	03Ch
	retlw	0Fh

	retlw	046h
	retlw	0Fh

	retlw	050h
	retlw	0Fh

	retlw	05Ah
	retlw	0Fh

	retlw	064h
	retlw	0Fh

	retlw	06Eh
	retlw	0Fh

	retlw	078h
	retlw	0Fh

	retlw	082h
	retlw	0Fh

	retlw	08Ch
	retlw	0Fh

	retlw	096h
	retlw	0Fh

	retlw	0A0h
	retlw	0Fh

	retlw	0A5h
	retlw	0Fh

	retlw	0AAh
	retlw	0Fh

	retlw	0AFh
	retlw	0Fh

	retlw	0B4h
	retlw	0Fh

	retlw	0B9h
	retlw	0Fh

	retlw	0BEh
	retlw	0Fh

	retlw	0C3h
	retlw	0Fh

	retlw	0C8h
	retlw	0Fh

	retlw	0CDh
	retlw	0Fh

	retlw	02Ch
	retlw	010h

	global	_ledShowIndex
psect	stringtext
	file	"E:\workSpace\git_work\jm\P2\code\tyw_led.c"
	line	33
_ledShowIndex:
	retlw	01h
	retlw	02h
	retlw	01h
	retlw	03h
	retlw	01h
	retlw	04h
	retlw	01h
	retlw	05h
	retlw	01h
	retlw	06h
	retlw	01h
	retlw	07h
	retlw	02h
	retlw	01h
	retlw	02h
	retlw	03h
	retlw	02h
	retlw	04h
	retlw	02h
	retlw	05h
	retlw	02h
	retlw	06h
	retlw	02h
	retlw	07h
	retlw	03h
	retlw	01h
	retlw	03h
	retlw	02h
	retlw	03h
	retlw	04h
	retlw	03h
	retlw	05h
	retlw	03h
	retlw	06h
	retlw	03h
	retlw	07h
	retlw	04h
	retlw	01h
	retlw	04h
	retlw	02h
	retlw	04h
	retlw	03h
	retlw	04h
	retlw	05h
	retlw	04h
	retlw	06h
	retlw	04h
	retlw	07h
	retlw	05h
	retlw	01h
	retlw	05h
	retlw	02h
	retlw	05h
	retlw	03h
	retlw	05h
	retlw	04h
	retlw	05h
	retlw	06h
	retlw	05h
	retlw	07h
	retlw	06h
	retlw	01h
	retlw	06h
	retlw	02h
	retlw	06h
	retlw	03h
	retlw	06h
	retlw	04h
	retlw	06h
	retlw	05h
	retlw	06h
	retlw	07h
	retlw	07h
	retlw	01h
	retlw	07h
	retlw	02h
	retlw	07h
	retlw	03h
	retlw	07h
	retlw	04h
	retlw	07h
	retlw	05h
	retlw	07h
	retlw	06h
	retlw	08h
	retlw	01h
	retlw	08h
	retlw	02h
	retlw	08h
	retlw	03h
	retlw	08h
	retlw	04h
	retlw	08h
	retlw	05h
	retlw	08h
	retlw	06h
	retlw	01h
	retlw	08h
	retlw	02h
	retlw	08h
	retlw	0
	retlw	0
	retlw	08h
	retlw	07h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	global	_D_LCD_Table
psect	stringtext
	file	"E:\workSpace\git_work\jm\P2\code\LED.c"
	line	28
_D_LCD_Table:
	retlw	03Fh
	retlw	06h
	retlw	05Bh
	retlw	04Fh
	retlw	066h
	retlw	06Dh
	retlw	07Dh
	retlw	07h
	retlw	07Fh
	retlw	06Fh
	retlw	077h
	retlw	07Ch
	retlw	03Ah
	retlw	05Eh
	retlw	079h
	retlw	071h
	retlw	0
	retlw	038h
	retlw	076h
	retlw	05Ch
	global	_szTemp
	global	_szTemp_absaddr
_szTemp_absaddr	set	0xFFE
	global	_D_BatVol_Table
	global	_ledShowIndex
	global	_D_LCD_Table
	global	_szTemp
	global	_szTemp_absaddr
_szTemp_absaddr	set	0xFFE
psect	_szTemp_text,class=CODE,delta=2
global __p_szTemp_text
__p_szTemp_text:
_szTemp:
	retlw	0
	retlw	0

	global	_RunLED
	global	_RunPWM
	global	_LedsInfoFlag
	global	_SysInfoFlag
	global	_VoutInfoFlag
	global	led_matrix_run@row
	global	_ReadPort
	global	_GetADC
	global	_RunEventLED
	global	_led_duty_cycles
	global	_led_duty_cycles_tmp
	global	_TimeCnt
_TimeCnt	set	345
	DABS	1,345,11	;_TimeCnt

	global	_ADCDH
_ADCDH	set	23
	global	_ADCTL
_ADCTL	set	24
	global	_ADCTL2
_ADCTL2	set	25
	global	_CLKCTL
_CLKCTL	set	15
	global	_FSR
_FSR	set	4
	global	_INDF
_INDF	set	0
	global	_INTIE
_INTIE	set	11
	global	_INTIE1
_INTIE1	set	13
	global	_LVCTL
_LVCTL	set	22
	global	_PAD
_PAD	set	5
	global	_PBD
_PBD	set	6
	global	_PDD
_PDD	set	7
	global	_T2CTL
_T2CTL	set	21
	global	_TM0
_TM0	set	1
	global	_TM0CTL
_TM0CTL	set	17
	global	_TM0RLD
_TM0RLD	set	16
	global	_TM1
_TM1	set	18
	global	_TM1CTL
_TM1CTL	set	20
	global	_TM1RLD
_TM1RLD	set	19
	global	_ADST
_ADST	set	195
	global	_CMPIF
_CMPIF	set	116
	global	_INT0IF
_INT0IF	set	96
	global	_INT1IF
_INT1IF	set	97
	global	_INT2IF
_INT2IF	set	98
	global	_IRP
_IRP	set	31
	global	_LVDIE
_LVDIE	set	104
	global	_LVDIF
_LVDIF	set	112
	global	_PAD2
_PAD2	set	42
	global	_PAD3
_PAD3	set	43
	global	_PAD4
_PAD4	set	44
	global	_PAD6
_PAD6	set	46
	global	_PAD7
_PAD7	set	47
	global	_PBD0
_PBD0	set	48
	global	_PBD2
_PBD2	set	50
	global	_PBD3
_PBD3	set	51
	global	_PBD4
_PBD4	set	52
	global	_PBD5
_PBD5	set	53
	global	_PBD6
_PBD6	set	54
	global	_PBD7
_PBD7	set	55
	global	_PDD0
_PDD0	set	56
	global	_PDD1
_PDD1	set	57
	global	_RP0
_RP0	set	29
	global	_RP1
_RP1	set	30
	global	_T2IE
_T2IE	set	94
	global	_T2IF
_T2IF	set	102
	global	_TM0IE
_TM0IE	set	92
	global	_TM0IF
_TM0IF	set	100
	global	_TM1IE
_TM1IE	set	93
	global	_TM1IF
_TM1IF	set	101
	global	_WKTIE
_WKTIE	set	91
	global	_WKTIF
_WKTIF	set	99
	global	_OPTION
_OPTION	set	129
	global	_PAMOD10
_PAMOD10	set	133
	global	_PAMOD32
_PAMOD32	set	134
	global	_PAMOD54
_PAMOD54	set	135
	global	_PAMOD76
_PAMOD76	set	136
	global	_PBMOD10
_PBMOD10	set	140
	global	_PBMOD32
_PBMOD32	set	141
	global	_PBMOD54
_PBMOD54	set	142
	global	_PBMOD76
_PBMOD76	set	143
	global	_PDMOD10
_PDMOD10	set	144
	global	_PINMOD
_PINMOD	set	261
	global	_FlagSmoke
_FlagSmoke	set	356
	DABS	1,356,2	;_FlagSmoke

	file	"DEBUGFILE\main.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_RunLED:
       ds      7

_RunPWM:
       ds      3

_LedsInfoFlag:
       ds      1

_SysInfoFlag:
       ds      1

_VoutInfoFlag:
       ds      1

led_matrix_run@row:
       ds      1

_GetADC:
       ds      19

_RunEventLED:
       ds      4

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
_ReadPort:
       ds      9

_led_duty_cycles_tmp:
       ds      8

psect	bssBANK3,class=BANK3,space=1
global __pbssBANK3
__pbssBANK3:
_led_duty_cycles:
       ds      64

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop		;do the next byte

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+025h)
	fcall	clear_ram
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+011h)
	fcall	clear_ram
; Clear objects allocated to BANK3
psect cinit,class=CODE,delta=2
	bsf	status, 7	;select IRP bank2
	movlw	low(__pbssBANK3)
	movwf	fsr
	movlw	low((__pbssBANK3)+040h)
	fcall	clear_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_SystemClockInit
?_SystemClockInit:	; 0 bytes @ 0x0
	global	?_InitGpio
?_InitGpio:	; 0 bytes @ 0x0
	global	?_Init_BOD_WDT
?_Init_BOD_WDT:	; 0 bytes @ 0x0
	global	?_MCU_INIT_TIMER
?_MCU_INIT_TIMER:	; 0 bytes @ 0x0
	global	?_KeyUpStopSmoke
?_KeyUpStopSmoke:	; 0 bytes @ 0x0
	global	?_SetOffNotifyLED
?_SetOffNotifyLED:	; 0 bytes @ 0x0
	global	?_ClearAllRAM
?_ClearAllRAM:	; 0 bytes @ 0x0
	global	?_UpdateElectricityGrade
?_UpdateElectricityGrade:	; 0 bytes @ 0x0
	global	?_ReadChargerState
?_ReadChargerState:	; 0 bytes @ 0x0
	global	?_PlugProgress
?_PlugProgress:	; 0 bytes @ 0x0
	global	?_PortScan
?_PortScan:	; 0 bytes @ 0x0
	global	?_ShowWarnLED
?_ShowWarnLED:	; 0 bytes @ 0x0
	global	?_ScanShowBatLxLED
?_ScanShowBatLxLED:	; 0 bytes @ 0x0
	global	?_PowerProgress
?_PowerProgress:	; 0 bytes @ 0x0
	global	?_IdleProgress
?_IdleProgress:	; 0 bytes @ 0x0
	global	?_led_matrix_run
?_led_matrix_run:	; 0 bytes @ 0x0
	global	?_SmokeOut
?_SmokeOut:	; 0 bytes @ 0x0
	global	??_SmokeOut
??_SmokeOut:	; 0 bytes @ 0x0
	global	?_SetShowLED
?_SetShowLED:	; 0 bytes @ 0x0
	global	?_ShowSegmentLED
?_ShowSegmentLED:	; 0 bytes @ 0x0
	global	?_SetShowBatLxLED
?_SetShowBatLxLED:	; 0 bytes @ 0x0
	global	?_EnterSleep
?_EnterSleep:	; 0 bytes @ 0x0
	global	?_led_set_io_od
?_led_set_io_od:	; 0 bytes @ 0x0
	global	??_led_set_io_od
??_led_set_io_od:	; 0 bytes @ 0x0
	global	?_led_set_io_pp
?_led_set_io_pp:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_Interrupt_ISR
?_Interrupt_ISR:	; 0 bytes @ 0x0
	global	?_Delay_16nop
?_Delay_16nop:	; 0 bytes @ 0x0
	global	?_gearSwitch
?_gearSwitch:	; 0 bytes @ 0x0
	global	?___bmul
?___bmul:	; 1 bytes @ 0x0
	global	led_set_io_od@io_num
led_set_io_od@io_num:	; 1 bytes @ 0x0
	global	led_set_io_pp@type
led_set_io_pp@type:	; 1 bytes @ 0x0
	global	___bmul@multiplicand
___bmul@multiplicand:	; 1 bytes @ 0x0
	ds	1
	global	??_led_set_io_pp
??_led_set_io_pp:	; 0 bytes @ 0x1
	global	??___bmul
??___bmul:	; 0 bytes @ 0x1
	global	led_set_io_pp@io_num
led_set_io_pp@io_num:	; 1 bytes @ 0x1
	global	___bmul@product
___bmul@product:	; 1 bytes @ 0x1
	ds	1
	global	___bmul@multiplier
___bmul@multiplier:	; 1 bytes @ 0x2
	ds	1
	global	??_led_matrix_run
??_led_matrix_run:	; 0 bytes @ 0x3
	ds	4
	global	led_matrix_run@x
led_matrix_run@x:	; 1 bytes @ 0x7
	ds	1
	global	led_matrix_run@y
led_matrix_run@y:	; 1 bytes @ 0x8
	ds	1
	global	led_matrix_run@rowCount
led_matrix_run@rowCount:	; 1 bytes @ 0x9
	ds	1
	global	??_Interrupt_ISR
??_Interrupt_ISR:	; 0 bytes @ 0xA
	ds	4
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_SystemClockInit
??_SystemClockInit:	; 0 bytes @ 0x0
	global	??_InitGpio
??_InitGpio:	; 0 bytes @ 0x0
	global	??_Init_BOD_WDT
??_Init_BOD_WDT:	; 0 bytes @ 0x0
	global	??_MCU_INIT_TIMER
??_MCU_INIT_TIMER:	; 0 bytes @ 0x0
	global	??_KeyUpStopSmoke
??_KeyUpStopSmoke:	; 0 bytes @ 0x0
	global	??_SetOffNotifyLED
??_SetOffNotifyLED:	; 0 bytes @ 0x0
	global	?_SetWarnEvent
?_SetWarnEvent:	; 0 bytes @ 0x0
	global	??_ClearAllRAM
??_ClearAllRAM:	; 0 bytes @ 0x0
	global	??_UpdateElectricityGrade
??_UpdateElectricityGrade:	; 0 bytes @ 0x0
	global	??_ScanShowBatLxLED
??_ScanShowBatLxLED:	; 0 bytes @ 0x0
	global	??_IdleProgress
??_IdleProgress:	; 0 bytes @ 0x0
	global	??_SetShowLED
??_SetShowLED:	; 0 bytes @ 0x0
	global	??_ShowSegmentLED
??_ShowSegmentLED:	; 0 bytes @ 0x0
	global	??_SetShowBatLxLED
??_SetShowBatLxLED:	; 0 bytes @ 0x0
	global	??_EnterSleep
??_EnterSleep:	; 0 bytes @ 0x0
	global	??_Delay_16nop
??_Delay_16nop:	; 0 bytes @ 0x0
	global	?_HAL_ADC_Sample
?_HAL_ADC_Sample:	; 2 bytes @ 0x0
	global	?___lmul
?___lmul:	; 4 bytes @ 0x0
	global	?___aldiv
?___aldiv:	; 4 bytes @ 0x0
	global	SetShowBatLxLED@ShowBatLx
SetShowBatLxLED@ShowBatLx:	; 1 bytes @ 0x0
	global	SetWarnEvent@WarnEvent
SetWarnEvent@WarnEvent:	; 1 bytes @ 0x0
	global	ShowSegmentLED@temp_seg0
ShowSegmentLED@temp_seg0:	; 1 bytes @ 0x0
	global	HAL_ADC_Sample@Filter
HAL_ADC_Sample@Filter:	; 1 bytes @ 0x0
	global	___lmul@multiplier
___lmul@multiplier:	; 4 bytes @ 0x0
	global	___aldiv@divisor
___aldiv@divisor:	; 4 bytes @ 0x0
	ds	1
	global	SetWarnEvent@WarnShowTime
SetWarnEvent@WarnShowTime:	; 1 bytes @ 0x1
	global	ShowSegmentLED@temp_seg2
ShowSegmentLED@temp_seg2:	; 1 bytes @ 0x1
	ds	1
	global	??_HAL_ADC_Sample
??_HAL_ADC_Sample:	; 0 bytes @ 0x2
	global	SetWarnEvent@WarnShowCnt
SetWarnEvent@WarnShowCnt:	; 1 bytes @ 0x2
	global	ShowSegmentLED@temp_seg3
ShowSegmentLED@temp_seg3:	; 1 bytes @ 0x2
	ds	1
	global	??_SetWarnEvent
??_SetWarnEvent:	; 0 bytes @ 0x3
	global	SetWarnEvent@EmRunEvent
SetWarnEvent@EmRunEvent:	; 1 bytes @ 0x3
	global	ShowSegmentLED@ShowEvent
ShowSegmentLED@ShowEvent:	; 1 bytes @ 0x3
	global	UpdateElectricityGrade@temp_TimeUp
UpdateElectricityGrade@temp_TimeUp:	; 2 bytes @ 0x3
	ds	1
	global	??_ReadChargerState
??_ReadChargerState:	; 0 bytes @ 0x4
	global	??_PlugProgress
??_PlugProgress:	; 0 bytes @ 0x4
	global	??_PortScan
??_PortScan:	; 0 bytes @ 0x4
	global	??_ShowWarnLED
??_ShowWarnLED:	; 0 bytes @ 0x4
	global	??_gearSwitch
??_gearSwitch:	; 0 bytes @ 0x4
	global	HAL_ADC_Sample@ADC_CHx
HAL_ADC_Sample@ADC_CHx:	; 1 bytes @ 0x4
	global	___lmul@multiplicand
___lmul@multiplicand:	; 4 bytes @ 0x4
	global	___aldiv@dividend
___aldiv@dividend:	; 4 bytes @ 0x4
	ds	1
	global	UpdateElectricityGrade@temp_Percent
UpdateElectricityGrade@temp_Percent:	; 1 bytes @ 0x5
	global	HAL_ADC_Sample@Value_Sum
HAL_ADC_Sample@Value_Sum:	; 2 bytes @ 0x5
	ds	2
	global	HAL_ADC_Sample@i_max
HAL_ADC_Sample@i_max:	; 1 bytes @ 0x7
	ds	1
	global	??___lmul
??___lmul:	; 0 bytes @ 0x8
	global	??___aldiv
??___aldiv:	; 0 bytes @ 0x8
	global	___aldiv@counter
___aldiv@counter:	; 1 bytes @ 0x8
	global	HAL_ADC_Sample@Value_Min
HAL_ADC_Sample@Value_Min:	; 2 bytes @ 0x8
	global	___lmul@product
___lmul@product:	; 4 bytes @ 0x8
	ds	1
	global	___aldiv@sign
___aldiv@sign:	; 1 bytes @ 0x9
	ds	1
	global	HAL_ADC_Sample@Value_Max
HAL_ADC_Sample@Value_Max:	; 2 bytes @ 0xA
	global	___aldiv@quotient
___aldiv@quotient:	; 4 bytes @ 0xA
	ds	2
	global	?___lldiv
?___lldiv:	; 4 bytes @ 0xC
	global	HAL_ADC_Sample@Value
HAL_ADC_Sample@Value:	; 2 bytes @ 0xC
	global	___lldiv@divisor
___lldiv@divisor:	; 4 bytes @ 0xC
	ds	4
	global	___lldiv@dividend
___lldiv@dividend:	; 4 bytes @ 0x10
	ds	4
	global	??___lldiv
??___lldiv:	; 0 bytes @ 0x14
	global	___lldiv@quotient
___lldiv@quotient:	; 4 bytes @ 0x14
	ds	4
	global	___lldiv@counter
___lldiv@counter:	; 1 bytes @ 0x18
	ds	1
	global	?_ReadLoadRes
?_ReadLoadRes:	; 2 bytes @ 0x19
	ds	2
	global	??_ReadLoadRes
??_ReadLoadRes:	; 0 bytes @ 0x1B
	ds	2
	global	ReadLoadRes@LoadValue
ReadLoadRes@LoadValue:	; 2 bytes @ 0x1D
	ds	2
	global	??_PowerProgress
??_PowerProgress:	; 0 bytes @ 0x1F
	ds	4
	global	PowerProgress@AD_Temp
PowerProgress@AD_Temp:	; 2 bytes @ 0x23
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x25
;;Data sizes: Strings 0, constant 330, data 0, bss 118, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80     37      74
;; BANK1           80      0      17
;; BANK3           80      0      64
;; BANK2h          10      0       0
;; BANK2l          57      0       0

;;
;; Pointer list with targets:

;; ?_ReadLoadRes	unsigned int  size(1) Largest target is 0
;;
;; ?___lmul	unsigned long  size(1) Largest target is 0
;;
;; ?___lldiv	unsigned long  size(1) Largest target is 0
;;
;; ?___aldiv	long  size(1) Largest target is 0
;;
;; ?_HAL_ADC_Sample	unsigned int  size(1) Largest target is 0
;;
;; sp__tyw_memcpy	PTR void  size(1) Largest target is 8
;;		 -> led_duty_cycles_tmp(BANK1[8]), 
;;
;; sp__tyw_memset	PTR void  size(1) Largest target is 64
;;		 -> led_duty_cycles(BANK3[64]), 
;;
;; SetWarnEvent@EmRunEvent	PTR struct . size(1) Largest target is 4
;;		 -> RunEventLED(BANK0[4]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _Interrupt_ISR in COMMON
;;
;;   _Interrupt_ISR->_led_matrix_run
;;   _led_matrix_run->___bmul
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_PowerProgress
;;   _PowerProgress->_ReadLoadRes
;;   _PortScan->_SetWarnEvent
;;   _PortScan->_ShowSegmentLED
;;   _ReadLoadRes->___lldiv
;;   _gearSwitch->_SetWarnEvent
;;   _gearSwitch->_ShowSegmentLED
;;   _ShowWarnLED->_ShowSegmentLED
;;   _PlugProgress->_SetWarnEvent
;;   _ReadChargerState->_SetWarnEvent
;;   ___lldiv->___lmul
;;
;; Critical Paths under _Interrupt_ISR in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _Interrupt_ISR in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _Interrupt_ISR in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2h
;;
;;   None.
;;
;; Critical Paths under _Interrupt_ISR in BANK2h
;;
;;   None.
;;
;; Critical Paths under _main in BANK2l
;;
;;   None.
;;
;; Critical Paths under _Interrupt_ISR in BANK2l
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0    4300
;;                    _SystemClockInit
;;                           _InitGpio
;;                       _Init_BOD_WDT
;;                     _MCU_INIT_TIMER
;;                     _KeyUpStopSmoke
;;                    _SetOffNotifyLED
;;                       _SetWarnEvent
;;                        _ClearAllRAM
;;                     _HAL_ADC_Sample
;;                            ___aldiv
;;             _UpdateElectricityGrade
;;                   _ReadChargerState
;;                       _PlugProgress
;;                           _PortScan
;;                        _ShowWarnLED
;;                   _ScanShowBatLxLED
;;                      _PowerProgress
;;                       _IdleProgress
;; ---------------------------------------------------------------------------------
;; (1) _IdleProgress                                         0     0      0       0
;;                         _EnterSleep
;; ---------------------------------------------------------------------------------
;; (1) _PowerProgress                                        6     6      0    1882
;;                                             31 BANK0      6     6      0
;;                    _SetOffNotifyLED
;;                         _SetShowLED
;;                       _SetWarnEvent
;;                     _ShowSegmentLED
;;                    _SetShowBatLxLED
;;                        _ReadLoadRes
;;                     _KeyUpStopSmoke
;;                     _HAL_ADC_Sample
;;                             ___lmul
;;                            ___lldiv
;; ---------------------------------------------------------------------------------
;; (1) _PortScan                                             0     0      0     864
;;                         _gearSwitch
;;                     _KeyUpStopSmoke
;;                    _SetOffNotifyLED
;;                       _SetWarnEvent
;;                         _SetShowLED
;;                     _ShowSegmentLED
;;                    _SetShowBatLxLED
;; ---------------------------------------------------------------------------------
;; (2) _EnterSleep                                           0     0      0       0
;;                           _InitGpio
;;                        _Delay_16nop
;;                       _Init_BOD_WDT
;;                     _MCU_INIT_TIMER
;; ---------------------------------------------------------------------------------
;; (2) _ReadLoadRes                                          6     4      2     715
;;                                             25 BANK0      6     4      2
;;                     _HAL_ADC_Sample
;;                             ___lmul
;;                            ___lldiv
;; ---------------------------------------------------------------------------------
;; (2) _gearSwitch                                           0     0      0     432
;;                    _SetOffNotifyLED
;;                         _SetShowLED
;;                       _SetWarnEvent
;;                     _ShowSegmentLED
;;                    _SetShowBatLxLED
;; ---------------------------------------------------------------------------------
;; (1) _ShowWarnLED                                          0     0      0     256
;;                         _SetShowLED
;;                     _ShowSegmentLED
;;                    _SetShowBatLxLED
;; ---------------------------------------------------------------------------------
;; (1) _PlugProgress                                         0     0      0     176
;;                       _SetWarnEvent
;; ---------------------------------------------------------------------------------
;; (1) _ReadChargerState                                     0     0      0     187
;;                       _SetWarnEvent
;;                    _SetShowBatLxLED
;; ---------------------------------------------------------------------------------
;; (1) _SystemClockInit                                      0     0      0       0
;;                        _Delay_16nop
;; ---------------------------------------------------------------------------------
;; (1) ___aldiv                                             14     6      8     300
;;                                              0 BANK0     14     6      8
;; ---------------------------------------------------------------------------------
;; (2) ___lldiv                                             13     5      8     162
;;                                             12 BANK0     13     5      8
;;                             ___lmul (ARG)
;; ---------------------------------------------------------------------------------
;; (2) ___lmul                                              12     4      8      92
;;                                              0 BANK0     12     4      8
;; ---------------------------------------------------------------------------------
;; (2) _SetShowBatLxLED                                      1     1      0      11
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _ShowSegmentLED                                       4     4      0     245
;;                                              0 BANK0      4     4      0
;; ---------------------------------------------------------------------------------
;; (2) _SetShowLED                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) _Delay_16nop                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _ScanShowBatLxLED                                     0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _UpdateElectricityGrade                               6     6      0     114
;;                                              0 BANK0      6     6      0
;; ---------------------------------------------------------------------------------
;; (2) _HAL_ADC_Sample                                      14    12      2     345
;;                                              0 BANK0     14    12      2
;; ---------------------------------------------------------------------------------
;; (1) _ClearAllRAM                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _SetWarnEvent                                         4     1      3     176
;;                                              0 BANK0      4     1      3
;; ---------------------------------------------------------------------------------
;; (2) _SetOffNotifyLED                                      0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _KeyUpStopSmoke                                       0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) _MCU_INIT_TIMER                                       0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) _Init_BOD_WDT                                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) _InitGpio                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (4) _Interrupt_ISR                                        4     4      0     561
;;                                             10 COMMON     4     4      0
;;                     _led_matrix_run
;;                           _SmokeOut
;; ---------------------------------------------------------------------------------
;; (5) _led_matrix_run                                       7     7      0     561
;;                                              3 COMMON     7     7      0
;;                      _led_set_io_od
;;                             ___bmul
;;                      _led_set_io_pp
;; ---------------------------------------------------------------------------------
;; (6) ___bmul                                               3     2      1      68
;;                                              0 COMMON     3     2      1
;; ---------------------------------------------------------------------------------
;; (6) _led_set_io_pp                                        2     1      1     198
;;                                              0 COMMON     2     1      1
;; ---------------------------------------------------------------------------------
;; (6) _led_set_io_od                                        1     1      0      22
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (5) _SmokeOut                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 6
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _SystemClockInit
;;     _Delay_16nop
;;   _InitGpio
;;   _Init_BOD_WDT
;;   _MCU_INIT_TIMER
;;   _KeyUpStopSmoke
;;   _SetOffNotifyLED
;;   _SetWarnEvent
;;   _ClearAllRAM
;;   _HAL_ADC_Sample
;;   ___aldiv
;;   _UpdateElectricityGrade
;;   _ReadChargerState
;;     _SetWarnEvent
;;     _SetShowBatLxLED
;;   _PlugProgress
;;     _SetWarnEvent
;;   _PortScan
;;     _gearSwitch
;;       _SetOffNotifyLED
;;       _SetShowLED
;;       _SetWarnEvent
;;       _ShowSegmentLED
;;       _SetShowBatLxLED
;;     _KeyUpStopSmoke
;;     _SetOffNotifyLED
;;     _SetWarnEvent
;;     _SetShowLED
;;     _ShowSegmentLED
;;     _SetShowBatLxLED
;;   _ShowWarnLED
;;     _SetShowLED
;;     _ShowSegmentLED
;;     _SetShowBatLxLED
;;   _ScanShowBatLxLED
;;   _PowerProgress
;;     _SetOffNotifyLED
;;     _SetShowLED
;;     _SetWarnEvent
;;     _ShowSegmentLED
;;     _SetShowBatLxLED
;;     _ReadLoadRes
;;       _HAL_ADC_Sample
;;       ___lmul
;;       ___lldiv
;;         ___lmul (ARG)
;;     _KeyUpStopSmoke
;;     _HAL_ADC_Sample
;;     ___lmul
;;     ___lldiv
;;       ___lmul (ARG)
;;   _IdleProgress
;;     _EnterSleep
;;       _InitGpio
;;       _Delay_16nop
;;       _Init_BOD_WDT
;;       _MCU_INIT_TIMER
;;
;; _Interrupt_ISR (ROOT)
;;   _led_matrix_run
;;     _led_set_io_od
;;     ___bmul
;;     _led_set_io_pp
;;   _SmokeOut
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA              80      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      E       E       1      100.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       9       2        0.0%
;;BITBANK0            50      0       0       3        0.0%
;;BANK0               50     25      4A       4       92.5%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK1               50      0      11       5       21.3%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BANK3               50      0      40       6       80.0%
;;ABS                  0      0      A9       7        0.0%
;;BITBANK1            50      0       0       8        0.0%
;;BITBANK3            50      0       0       9        0.0%
;;BITBANK2h            A      0       0      10        0.0%
;;BITBANK2l           39      0       0      11        0.0%
;;BANK2h               A      0       0      12        0.0%
;;BANK2l              39      0       0      13        0.0%
;;DATA                 0      0      B2      14        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 50 in file "E:\workSpace\git_work\jm\P2\code\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3  BANK2h  BANK2l
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_SystemClockInit
;;		_InitGpio
;;		_Init_BOD_WDT
;;		_MCU_INIT_TIMER
;;		_KeyUpStopSmoke
;;		_SetOffNotifyLED
;;		_SetWarnEvent
;;		_ClearAllRAM
;;		_HAL_ADC_Sample
;;		___aldiv
;;		_UpdateElectricityGrade
;;		_ReadChargerState
;;		_PlugProgress
;;		_PortScan
;;		_ShowWarnLED
;;		_ScanShowBatLxLED
;;		_PowerProgress
;;		_IdleProgress
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\workSpace\git_work\jm\P2\code\main.c"
	line	50
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 2
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	52
	
l16545:	
# 52 "E:\workSpace\git_work\jm\P2\code\main.c"
CLRWDT ;#
psect	maintext
	line	53
	
l16547:	
;main.c: 53: INTIE = 0x00;
	clrf	(11)	;volatile
	line	54
;main.c: 54: INTIE1 = 0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(13)	;volatile
	line	57
	
l16549:	
;main.c: 57: SystemClockInit();
	fcall	_SystemClockInit
	line	58
	
l16551:	
;main.c: 58: InitGpio();
	fcall	_InitGpio
	line	81
	
l16553:	
;main.c: 81: Init_BOD_WDT();
	fcall	_Init_BOD_WDT
	line	85
	
l16555:	
;main.c: 85: MCU_INIT_TIMER();
	fcall	_MCU_INIT_TIMER
	line	88
	
l16557:	
;main.c: 88: if(FlagSmoke == 0xA55A)
	bsf	status, 6	;RP1=1, select bank2
		movf	(356+1)^0100h,w	;volatile
	xorlw	165
	movlw	90
	skipnz
	xorwf	(356)^0100h,w	;volatile

	skipz
	goto	u4461
	goto	u4460
u4461:
	goto	l16577
u4460:
	line	90
	
l16559:	
;main.c: 89: {
;main.c: 90: VoutInfoFlag.bits.b7 = 1;VoutInfoFlag.bits.b0 = 0;
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_VoutInfoFlag),7
	bcf	(_VoutInfoFlag),0
	line	91
	
l16561:	
;main.c: 91: KeyUpStopSmoke();
	fcall	_KeyUpStopSmoke
	line	92
;main.c: 92: SetOffNotifyLED();
	fcall	_SetOffNotifyLED
	line	93
	
l16563:	
;main.c: 93: SetWarnEvent(&RunEventLED,14,25,8);
	movlw	(0Eh)
	movwf	(?_SetWarnEvent)
	movlw	(019h)
	movwf	0+(?_SetWarnEvent)+01h
	movlw	(08h)
	movwf	0+(?_SetWarnEvent)+02h
	movlw	(_RunEventLED)&0ffh
	fcall	_SetWarnEvent
	line	94
	
l16565:	
;main.c: 94: if(PAD6 == 1) SysInfoFlag.bits.b2 = 1;
	btfss	(46/8),(46)&7
	goto	u4471
	goto	u4470
u4471:
	goto	l1648
u4470:
	
l16567:	
	bsf	(_SysInfoFlag),2
	
l1648:	
	line	95
;main.c: 95: if(PBD2 == 1) ReadPort.ScanOld |= 0x01;
	btfss	(50/8),(50)&7
	goto	u4481
	goto	u4480
u4481:
	goto	l16571
u4480:
	
l16569:	
	bsf	status, 5	;RP0=1, select bank1
	bsf	0+(_ReadPort)^080h+02h+(0/8),(0)&7
	line	97
	
l16571:	
;main.c: 97: ReadPort.KeyState = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	clrf	0+(_ReadPort)^080h+04h
	line	98
;main.c: 98: ReadPort.KeyNum = 0;
	clrf	0+(_ReadPort)^080h+05h
	line	99
	
l16573:	
;main.c: 99: SysInfoFlag.bits.b4 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(_SysInfoFlag),4
	line	100
;main.c: 100: TimeCnt.SleepTime = 0;
	bsf	status, 6	;RP1=1, select bank2
	clrf	0+(345)^0100h+03h
	clrf	1+(345)^0100h+03h
	line	101
	
l16575:	
;main.c: 101: SysInfoFlag.bits.b0 = 1;
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_SysInfoFlag),0
	line	102
;main.c: 102: }
	goto	l16589
	line	105
	
l16577:	
;main.c: 103: else
;main.c: 104: {
;main.c: 105: ClearAllRAM();
	fcall	_ClearAllRAM
	line	106
	
l16579:	
;main.c: 106: GetADC.Vout_Lx = 0x01;
	bcf	status, 6	;RP1=0, select bank0
	clrf	0+(_GetADC)+03h
	incf	0+(_GetADC)+03h,f
	line	107
	
l16581:	
;main.c: 107: TimeCnt.SmokeTime = 0x00;
	movlw	low(345+07h)
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	
	clrf	indf
	incf	fsr0,f
	clrf	indf
	incf	fsr0,f
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	108
	
l16583:	
;main.c: 108: SetOffNotifyLED();
	fcall	_SetOffNotifyLED
	line	109
	
l16585:	
;main.c: 109: SetWarnEvent(&RunEventLED,16,25,16);
	movlw	(010h)
	movwf	(?_SetWarnEvent)
	movlw	(019h)
	movwf	0+(?_SetWarnEvent)+01h
	movlw	(010h)
	movwf	0+(?_SetWarnEvent)+02h
	movlw	(_RunEventLED)&0ffh
	fcall	_SetWarnEvent
	line	110
	
l16587:	
;main.c: 110: SysInfoFlag.bits.b4 = 1;
	bsf	(_SysInfoFlag),4
	line	115
	
l16589:	
;main.c: 114: {
;main.c: 115: if(SysInfoFlag.bits.b6 != 0)
	btfss	(_SysInfoFlag),6
	goto	u4491
	goto	u4490
u4491:
	goto	l16631
u4490:
	line	117
	
l16591:	
;main.c: 116: {
;main.c: 117: SysInfoFlag.bits.b6 = 0;
	bcf	(_SysInfoFlag),6
	line	118
# 118 "E:\workSpace\git_work\jm\P2\code\main.c"
CLRWDT ;#
psect	maintext
	line	120
	
l16593:	
;main.c: 120: GetADC.BatteryVoltage = HAL_ADC_Sample(14,1 );
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(?_HAL_ADC_Sample)
	incf	(?_HAL_ADC_Sample),f
	movlw	(0Eh)
	fcall	_HAL_ADC_Sample
	movf	(1+(?_HAL_ADC_Sample)),w
	movwf	1+(_GetADC)+04h
	movf	(0+(?_HAL_ADC_Sample)),w
	movwf	0+(_GetADC)+04h
	line	121
;main.c: 121: GetADC.BatteryVoltage = 4915200/GetADC.BatteryVoltage;
	movf	0+(_GetADC)+04h,w
	movwf	(?___aldiv)
	movf	1+(_GetADC)+04h,w
	movwf	((?___aldiv))+1
	clrf	2+((?___aldiv))
	clrf	3+((?___aldiv))
	movlw	0
	movwf	3+(?___aldiv)+04h
	movlw	04Bh
	movwf	2+(?___aldiv)+04h
	movlw	0
	movwf	1+(?___aldiv)+04h
	movlw	0
	movwf	0+(?___aldiv)+04h

	fcall	___aldiv
	movf	1+(((0+(?___aldiv)))),w
	movwf	1+(_GetADC)+04h
	movf	0+(((0+(?___aldiv)))),w
	movwf	0+(_GetADC)+04h
	line	122
	
l16595:	
;main.c: 122: UpdateElectricityGrade();
	fcall	_UpdateElectricityGrade
	line	124
	
l16597:	
;main.c: 124: if(SysInfoFlag.bits.b4 == 0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(_SysInfoFlag),4
	goto	u4501
	goto	u4500
u4501:
	goto	l16621
u4500:
	line	126
	
l16599:	
;main.c: 125: {
;main.c: 126: if(VoutInfoFlag.bits.b7 != 0)
	btfss	(_VoutInfoFlag),7
	goto	u4511
	goto	u4510
u4511:
	goto	l16619
u4510:
	line	128
	
l16601:	
;main.c: 127: {
;main.c: 128: if(GetADC.BatteryVoltage < 2800) GetADC.LowVolCnt++;
	movlw	high(0AF0h)
	subwf	1+(_GetADC)+04h,w
	movlw	low(0AF0h)
	skipnz
	subwf	0+(_GetADC)+04h,w
	skipnc
	goto	u4521
	goto	u4520
u4521:
	goto	l16605
u4520:
	
l16603:	
	incf	(_GetADC),f
	goto	l16607
	line	129
	
l16605:	
;main.c: 129: else GetADC.LowVolCnt = 0;
	clrf	(_GetADC)
	line	131
	
l16607:	
;main.c: 131: if(TimeCnt.SmokeTask < 0xEA60 )
	movlw	high(0EA60h)
	bsf	status, 6	;RP1=1, select bank2
	subwf	1+(345)^0100h+05h,w
	movlw	low(0EA60h)
	skipnz
	subwf	0+(345)^0100h+05h,w
	skipnc
	goto	u4531
	goto	u4530
u4531:
	goto	l1661
u4530:
	line	133
	
l16609:	
;main.c: 132: {
;main.c: 133: TimeCnt.SmokeTask++;
	incf	0+(345)^0100h+05h,f
	skipnz
	incf	1+(345)^0100h+05h,f
	line	134
	
l16611:	
;main.c: 134: if(TimeCnt.SmokeTask >= 2)
	movlw	high(02h)
	subwf	1+(345)^0100h+05h,w
	movlw	low(02h)
	skipnz
	subwf	0+(345)^0100h+05h,w
	skipc
	goto	u4541
	goto	u4540
u4541:
	goto	l1658
u4540:
	line	138
	
l16613:	
;main.c: 135: {
;main.c: 138: if(VoutInfoFlag.bits.b1 != 0) GetADC.VoutVDD = GetADC.BatteryVoltage;
	bcf	status, 6	;RP1=0, select bank0
	btfss	(_VoutInfoFlag),1
	goto	u4551
	goto	u4550
u4551:
	goto	l1658
u4550:
	
l16615:	
	movf	1+(_GetADC)+04h,w
	movwf	1+(_GetADC)+06h
	movf	0+(_GetADC)+04h,w
	movwf	0+(_GetADC)+06h
	line	139
	
l1658:	
	line	141
;main.c: 139: }
;main.c: 141: if(TimeCnt.SmokeTime < 0xFFFFFFFF) TimeCnt.SmokeTime++;
	bsf	status, 6	;RP1=1, select bank2
	incf	0+(345)^0100h+07h,w
	skipnz
	incf	1+(345)^0100h+07h,w
	skipnz
	incf	2+(345)^0100h+07h,w
	skipnz
	incf	3+(345)^0100h+07h,w

	skipnz
	goto	u4561
	goto	u4560
u4561:
	goto	l1661
u4560:
	
l16617:	
	incf	0+(345)^0100h+07h,f
	skipnz
	incf	1+(345)^0100h+07h,f
	skipnz
	incf	2+(345)^0100h+07h,f
	skipnz
	incf	3+(345)^0100h+07h,f
	goto	l1661
	line	146
	
l16619:	
;main.c: 144: else
;main.c: 145: {
;main.c: 146: ReadChargerState();
	fcall	_ReadChargerState
	line	147
;main.c: 147: PlugProgress();
	fcall	_PlugProgress
	line	148
	
l1661:	
	line	151
;main.c: 148: }
;main.c: 151: PortScan();
	fcall	_PortScan
	line	154
	
l16621:	
;main.c: 152: }
;main.c: 154: if(RunEventLED.ShowTask) RunEventLED.ShowTask--;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_RunEventLED)+02h,w
	skipz
	goto	u4570
	goto	l16625
u4570:
	
l16623:	
	decf	0+(_RunEventLED)+02h,f
	goto	l16629
	line	157
	
l16625:	
;main.c: 155: else
;main.c: 156: {
;main.c: 157: RunEventLED.ShowTask = RunEventLED.ShowTime;
	movf	(_RunEventLED),w
	movwf	0+(_RunEventLED)+02h
	line	158
	
l16627:	
;main.c: 158: ShowWarnLED();
	fcall	_ShowWarnLED
	line	161
	
l16629:	
;main.c: 159: }
;main.c: 161: ScanShowBatLxLED();
	fcall	_ScanShowBatLxLED
	line	164
	
l16631:	
;main.c: 162: }
;main.c: 164: if(SysInfoFlag.bits.b0 != 0) PowerProgress();
	btfss	(_SysInfoFlag),0
	goto	u4581
	goto	u4580
u4581:
	goto	l16635
u4580:
	
l16633:	
	fcall	_PowerProgress
	goto	l16589
	line	165
	
l16635:	
;main.c: 165: else IdleProgress();
	fcall	_IdleProgress
	goto	l16589
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	167
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_IdleProgress
psect	text731,local,class=CODE,delta=2
global __ptext731
__ptext731:

;; *************** function _IdleProgress *****************
;; Defined at:
;;		line 31 in file "E:\workSpace\git_work\jm\P2\code\task.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3  BANK2h  BANK2l
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_EnterSleep
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text731
	file	"E:\workSpace\git_work\jm\P2\code\task.c"
	line	31
	global	__size_of_IdleProgress
	__size_of_IdleProgress	equ	__end_of_IdleProgress-_IdleProgress
	
_IdleProgress:	
	opt	stack 2
; Regs used in _IdleProgress: [wreg+status,2+status,0+pclath+cstack]
	line	32
	
l16529:	
;task.c: 32: if(RunEventLED.EmEvent == 0 && LedsInfoFlag.bits.b5 != 0 && SysInfoFlag.bits.b5 != 0)
	movf	0+(_RunEventLED)+03h,f
	skipz
	goto	u4411
	goto	u4410
u4411:
	goto	l10105
u4410:
	
l16531:	
	btfss	(_LedsInfoFlag),5
	goto	u4421
	goto	u4420
u4421:
	goto	l10105
u4420:
	
l16533:	
	btfss	(_SysInfoFlag),5
	goto	u4431
	goto	u4430
u4431:
	goto	l10105
u4430:
	line	34
	
l16535:	
;task.c: 33: {
;task.c: 34: EnterSleep();
	fcall	_EnterSleep
	line	35
	
l16537:	
;task.c: 35: TimeCnt.SleepTime = 2;
	movlw	02h
	bsf	status, 6	;RP1=1, select bank2
	movwf	0+(345)^0100h+03h
	clrf	1+(345)^0100h+03h
	line	36
;task.c: 36: while(TimeCnt.SleepTime)
	goto	l16543
	
l10102:	
	line	38
;task.c: 37: {
;task.c: 38: if(SysInfoFlag.bits.b6 != 0)
	bcf	status, 6	;RP1=0, select bank0
	btfss	(_SysInfoFlag),6
	goto	u4441
	goto	u4440
u4441:
	goto	l16543
u4440:
	line	40
	
l16539:	
;task.c: 39: {
;task.c: 40: SysInfoFlag.bits.b6 = 0;
	bcf	(_SysInfoFlag),6
	line	41
# 41 "E:\workSpace\git_work\jm\P2\code\task.c"
CLRWDT ;#
psect	text731
	line	42
	
l16541:	
;task.c: 42: TimeCnt.SleepTime--;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	subwf	0+(345)^0100h+03h,f
	movlw	high(01h)
	skipc
	decf	1+(345)^0100h+03h,f
	subwf	1+(345)^0100h+03h,f
	line	36
	
l16543:	
	bsf	status, 6	;RP1=1, select bank2
	movf	(1+(345)^0100h+03h),w
	iorwf	(0+(345)^0100h+03h),w
	skipz
	goto	u4451
	goto	u4450
u4451:
	goto	l10102
u4450:
	
l10104:	
	line	45
;task.c: 43: }
;task.c: 44: }
;task.c: 45: SysInfoFlag.bits.b0 = 1;
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_SysInfoFlag),0
	line	47
	
l10105:	
	return
	opt stack 0
GLOBAL	__end_of_IdleProgress
	__end_of_IdleProgress:
;; =============== function _IdleProgress ends ============

	signat	_IdleProgress,88
	global	_PowerProgress
psect	text732,local,class=CODE,delta=2
global __ptext732
__ptext732:

;; *************** function _PowerProgress *****************
;; Defined at:
;;		line 110 in file "E:\workSpace\git_work\jm\P2\code\task.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  AD_Temp         2   35[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3  BANK2h  BANK2l
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       2       0       0       0       0
;;      Temps:          0       4       0       0       0       0
;;      Totals:         0       6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_SetOffNotifyLED
;;		_SetShowLED
;;		_SetWarnEvent
;;		_ShowSegmentLED
;;		_SetShowBatLxLED
;;		_ReadLoadRes
;;		_KeyUpStopSmoke
;;		_HAL_ADC_Sample
;;		___lmul
;;		___lldiv
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text732
	file	"E:\workSpace\git_work\jm\P2\code\task.c"
	line	110
	global	__size_of_PowerProgress
	__size_of_PowerProgress	equ	__end_of_PowerProgress-_PowerProgress
	
_PowerProgress:	
	opt	stack 2
; Regs used in _PowerProgress: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	113
	
l16303:	
;task.c: 111: uint16_t AD_Temp;
;task.c: 113: if(VoutInfoFlag.bits.b0 != 0)
	btfss	(_VoutInfoFlag),0
	goto	u4101
	goto	u4100
u4101:
	goto	l10115
u4100:
	line	115
	
l16305:	
;task.c: 114: {
;task.c: 115: VoutInfoFlag.bits.b0 = 0;
	bcf	(_VoutInfoFlag),0
	line	116
	
l16307:	
;task.c: 116: if(RunEventLED.EmEvent < 7 || RunEventLED.EmEvent == 10 || RunEventLED.EmEvent == 17 )
	movlw	(07h)
	subwf	0+(_RunEventLED)+03h,w
	skipc
	goto	u4111
	goto	u4110
u4111:
	goto	l10118
u4110:
	
l16309:	
	movf	0+(_RunEventLED)+03h,w
	xorlw	0Ah
	skipnz
	goto	u4121
	goto	u4120
u4121:
	goto	l10118
u4120:
	
l16311:	
	movf	0+(_RunEventLED)+03h,w
	xorlw	011h
	skipz
	goto	u4131
	goto	u4130
u4131:
	goto	l10159
u4130:
	
l10118:	
	line	118
;task.c: 117: {
;task.c: 118: if(SysInfoFlag.bits.b7 == 0 )
	btfsc	(_SysInfoFlag),7
	goto	u4141
	goto	u4140
u4141:
	goto	l10159
u4140:
	line	120
	
l16313:	
;task.c: 119: {
;task.c: 120: if(VoutInfoFlag.bits.b7 == 0)
	btfsc	(_VoutInfoFlag),7
	goto	u4151
	goto	u4150
u4151:
	goto	l10159
u4150:
	line	122
	
l16315:	
;task.c: 121: {
;task.c: 122: if( GetADC.BatteryPercent==0 || VoutInfoFlag.bits.b3 != 0)
	movf	0+(_GetADC)+0Ch,w
	skipz
	goto	u4160
	goto	l16319
u4160:
	
l16317:	
	btfss	(_VoutInfoFlag),3
	goto	u4171
	goto	u4170
u4171:
	goto	l10121
u4170:
	line	124
	
l16319:	
;task.c: 123: {
;task.c: 124: SetOffNotifyLED();
	fcall	_SetOffNotifyLED
	line	125
;task.c: 125: SetShowLED(0x00);
	movlw	(0)
	fcall	_SetShowLED
	line	126
	
l16321:	
;task.c: 126: SetWarnEvent(&RunEventLED,7,25,20);
	movlw	(07h)
	movwf	(?_SetWarnEvent)
	movlw	(019h)
	movwf	0+(?_SetWarnEvent)+01h
	movlw	(014h)
	movwf	0+(?_SetWarnEvent)+02h
	movlw	(_RunEventLED)&0ffh
	fcall	_SetWarnEvent
	line	127
	
l16323:	
;task.c: 127: ShowSegmentLED(0x00);
	movlw	(0)
	fcall	_ShowSegmentLED
	line	128
	
l16325:	
;task.c: 128: GetADC.BatteryPercent = 0;
	clrf	0+(_GetADC)+0Ch
	line	130
	
l16327:	
;task.c: 130: if(RunEventLED.EmEvent == 1)
	decf	0+(_RunEventLED)+03h,w
	skipz
	goto	u4181
	goto	u4180
u4181:
	goto	l10159
u4180:
	line	132
	
l16329:	
;task.c: 131: {
;task.c: 132: LedsInfoFlag.bits.b3 = 0;
	bcf	(_LedsInfoFlag),3
	line	133
	
l16331:	
;task.c: 133: RunLED.ShowBatLxCnt = 0x00;
	clrf	0+(_RunLED)+05h
	line	134
;task.c: 134: RunLED.TaskBatLx = 0;
	clrf	0+(_RunLED)+06h
	line	135
	
l16333:	
;task.c: 135: SetShowBatLxLED(0x00);
	movlw	(0)
	fcall	_SetShowBatLxLED
	goto	l10159
	line	138
	
l10121:	
;task.c: 138: else if(PAD3 == 1)
	btfss	(43/8),(43)&7
	goto	u4191
	goto	u4190
u4191:
	goto	l16347
u4190:
	line	140
	
l16335:	
;task.c: 139: {
;task.c: 140: SetOffNotifyLED();
	fcall	_SetOffNotifyLED
	line	141
;task.c: 141: SetShowLED(0x00);
	movlw	(0)
	fcall	_SetShowLED
	line	142
	
l16337:	
;task.c: 142: SetWarnEvent(&RunEventLED,13,25,4);
	movlw	(0Dh)
	movwf	(?_SetWarnEvent)
	movlw	(019h)
	movwf	0+(?_SetWarnEvent)+01h
	movlw	(04h)
	movwf	0+(?_SetWarnEvent)+02h
	movlw	(_RunEventLED)&0ffh
	fcall	_SetWarnEvent
	line	143
	
l16339:	
;task.c: 143: ShowSegmentLED(0x00);
	movlw	(0)
	fcall	_ShowSegmentLED
	line	144
	
l16341:	
;task.c: 144: LedsInfoFlag.bits.b3 = 0;
	bcf	(_LedsInfoFlag),3
	line	145
	
l16343:	
;task.c: 145: RunLED.ShowBatLxCnt = 0x00;
	clrf	0+(_RunLED)+05h
	line	146
	
l16345:	
;task.c: 146: RunLED.TaskBatLx = 0;
	clrf	0+(_RunLED)+06h
	line	147
;task.c: 147: SetShowBatLxLED(0x00);
	movlw	(0)
	fcall	_SetShowBatLxLED
	line	148
;task.c: 148: }
	goto	l10159
	line	151
	
l16347:	
;task.c: 149: else
;task.c: 150: {
;task.c: 151: GetADC.LoadRes = ReadLoadRes();
	fcall	_ReadLoadRes
	movf	(1+(?_ReadLoadRes)),w
	movwf	1+(_GetADC)+0Ah
	movf	(0+(?_ReadLoadRes)),w
	movwf	0+(_GetADC)+0Ah
	line	152
	
l16349:	
;task.c: 152: if(GetADC.LoadRes < 380)
	movlw	high(017Ch)
	subwf	1+(_GetADC)+0Ah,w
	movlw	low(017Ch)
	skipnz
	subwf	0+(_GetADC)+0Ah,w
	skipnc
	goto	u4201
	goto	u4200
u4201:
	goto	l16363
u4200:
	line	154
	
l16351:	
;task.c: 153: {
;task.c: 154: SetOffNotifyLED();
	fcall	_SetOffNotifyLED
	line	155
	
l16353:	
;task.c: 155: SetWarnEvent(&RunEventLED,14,25,8);
	movlw	(0Eh)
	movwf	(?_SetWarnEvent)
	movlw	(019h)
	movwf	0+(?_SetWarnEvent)+01h
	movlw	(08h)
	movwf	0+(?_SetWarnEvent)+02h
	movlw	(_RunEventLED)&0ffh
	fcall	_SetWarnEvent
	line	156
	
l16355:	
;task.c: 156: RunEventLED.ShowTask = 0;
	clrf	0+(_RunEventLED)+02h
	line	157
	
l16357:	
;task.c: 157: LedsInfoFlag.bits.b3 = 0;
	bcf	(_LedsInfoFlag),3
	line	158
	
l16359:	
;task.c: 158: RunLED.ShowBatLxCnt = 0x00;
	clrf	0+(_RunLED)+05h
	line	159
	
l16361:	
;task.c: 159: RunLED.TaskBatLx = 0;
	clrf	0+(_RunLED)+06h
	line	160
;task.c: 160: }
	goto	l10159
	line	163
	
l16363:	
;task.c: 161: else
;task.c: 162: {
;task.c: 163: FlagSmoke = 0xA55A;
	movlw	low(0A55Ah)
	bsf	status, 6	;RP1=1, select bank2
	movwf	(356)^0100h	;volatile
	movlw	high(0A55Ah)
	movwf	((356)^0100h)+1	;volatile
	line	164
	
l16365:	
;task.c: 164: LVDIF = 0;
	bcf	status, 6	;RP1=0, select bank0
	bcf	(112/8),(112)&7
	line	165
	
l16367:	
;task.c: 165: LVDIE = 1;
	bsf	(104/8),(104)&7
	line	166
	
l16369:	
;task.c: 166: PAMOD54 = PAMOD54 & 0x0F | 0x30;
	bsf	status, 5	;RP0=1, select bank1
	movf	(135)^080h,w
	andlw	0Fh
	iorlw	030h
	movwf	(135)^080h	;volatile
	line	168
;task.c: 168: ReadPort.ChargerCnt = 0;
	clrf	(_ReadPort)^080h
	line	169
;task.c: 169: TimeCnt.RechgFullTime = 0;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	0+(345)^0100h+01h
	clrf	1+(345)^0100h+01h
	line	170
	
l16371:	
;task.c: 170: GetADC.VoutOld = GetADC.BatteryVoltage;
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(_GetADC)+04h,w
	movwf	1+(_GetADC)+08h
	movf	0+(_GetADC)+04h,w
	movwf	0+(_GetADC)+08h
	line	171
	
l16373:	
;task.c: 171: if(SysInfoFlag.bits.b1 != 0)
	btfss	(_SysInfoFlag),1
	goto	u4211
	goto	u4210
u4211:
	goto	l16379
u4210:
	line	173
	
l16375:	
;task.c: 172: {
;task.c: 173: GetADC.BatteryVoltageOld = GetADC.BatteryVoltage;
	movf	1+(_GetADC)+04h,w
	movwf	1+(_GetADC)+011h
	movf	0+(_GetADC)+04h,w
	movwf	0+(_GetADC)+011h
	line	174
	
l16377:	
;task.c: 174: SysInfoFlag.bits.b1 = 0;
	bcf	(_SysInfoFlag),1
	line	176
	
l16379:	
;task.c: 175: }
;task.c: 176: PAD4 = 0;
	bcf	(44/8),(44)&7
	line	177
;task.c: 177: RunPWM.BuckPwmDuty = RunPWM.BuckPwmDutyBuff = 200;
	movlw	(0C8h)
	movwf	0+(_RunPWM)+02h
	movwf	0+(_RunPWM)+01h
	line	178
	
l16381:	
;task.c: 178: RunPWM.BuckPwmCycleCnt = 0;
	clrf	(_RunPWM)
	line	179
	
l16383:	
;task.c: 179: GetADC.LowVolCnt = 0;
	clrf	(_GetADC)
	line	180
	
l16385:	
;task.c: 180: GetADC.VoutVDD = 0;
	clrf	0+(_GetADC)+06h
	clrf	1+(_GetADC)+06h
	line	181
	
l16387:	
;task.c: 181: VoutInfoFlag.bits.b5 = 0;VoutInfoFlag.bits.b1 = 0;
	bcf	(_VoutInfoFlag),5
	
l16389:	
	bcf	(_VoutInfoFlag),1
	line	182
	
l16391:	
;task.c: 182: TM0IE = 0;
	bcf	(92/8),(92)&7
	line	183
	
l16393:	
;task.c: 183: TimeCnt.SmokeTask = 0;
	bsf	status, 6	;RP1=1, select bank2
	clrf	0+(345)^0100h+05h
	clrf	1+(345)^0100h+05h
	line	184
;task.c: 184: TimeCnt.TimeBase = 50;
	movlw	(032h)
	movwf	(345)^0100h
	line	185
	
l16395:	
;task.c: 185: TM0IE = 1;
	bsf	(92/8),(92)&7
	line	186
	
l16397:	
;task.c: 186: VoutInfoFlag.bits.b7 = 1;
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_VoutInfoFlag),7
	goto	l10159
	line	189
	
l10120:	
	goto	l10159
	line	193
	
l10115:	
;task.c: 193: else if(VoutInfoFlag.bits.b7 != 0)
	btfss	(_VoutInfoFlag),7
	goto	u4221
	goto	u4220
u4221:
	goto	l10159
u4220:
	line	195
	
l16399:	
;task.c: 194: {
;task.c: 195: if(VoutInfoFlag.bits.b6 != 0)
	btfss	(_VoutInfoFlag),6
	goto	u4231
	goto	u4230
u4231:
	goto	l16413
u4230:
	line	197
	
l16401:	
;task.c: 196: {
;task.c: 197: KeyUpStopSmoke();
	fcall	_KeyUpStopSmoke
	line	198
;task.c: 198: SetOffNotifyLED();
	fcall	_SetOffNotifyLED
	line	199
	
l16403:	
;task.c: 199: SetWarnEvent(&RunEventLED,14,25,8);
	movlw	(0Eh)
	movwf	(?_SetWarnEvent)
	movlw	(019h)
	movwf	0+(?_SetWarnEvent)+01h
	movlw	(08h)
	movwf	0+(?_SetWarnEvent)+02h
	movlw	(_RunEventLED)&0ffh
	fcall	_SetWarnEvent
	goto	l16355
	line	205
	
l16413:	
;task.c: 205: else if(GetADC.LowVolCnt >= 10)
	movlw	(0Ah)
	subwf	(_GetADC),w
	skipc
	goto	u4241
	goto	u4240
u4241:
	goto	l16431
u4240:
	line	207
	
l16415:	
;task.c: 206: {
;task.c: 207: KeyUpStopSmoke();
	fcall	_KeyUpStopSmoke
	line	208
;task.c: 208: SetOffNotifyLED();
	fcall	_SetOffNotifyLED
	line	209
;task.c: 209: SetShowLED(0x00);
	movlw	(0)
	fcall	_SetShowLED
	line	210
	
l16417:	
;task.c: 210: SetWarnEvent(&RunEventLED,7,25,20);
	movlw	(07h)
	movwf	(?_SetWarnEvent)
	movlw	(019h)
	movwf	0+(?_SetWarnEvent)+01h
	movlw	(014h)
	movwf	0+(?_SetWarnEvent)+02h
	movlw	(_RunEventLED)&0ffh
	fcall	_SetWarnEvent
	line	211
	
l16419:	
;task.c: 211: ShowSegmentLED(0x00);
	movlw	(0)
	fcall	_ShowSegmentLED
	line	212
	
l16421:	
;task.c: 212: GetADC.BatteryPercent = 0;
	clrf	0+(_GetADC)+0Ch
	line	213
	
l16423:	
;task.c: 213: LedsInfoFlag.bits.b3 = 0;
	bcf	(_LedsInfoFlag),3
	line	214
	
l16425:	
;task.c: 214: RunLED.ShowBatLxCnt = 0x00;
	clrf	0+(_RunLED)+05h
	line	215
	
l16427:	
;task.c: 215: RunLED.TaskBatLx = 0;
	clrf	0+(_RunLED)+06h
	line	216
	
l16429:	
;task.c: 216: SetShowBatLxLED(0x00);
	movlw	(0)
	fcall	_SetShowBatLxLED
	line	218
;task.c: 218: }
	goto	l10159
	line	219
	
l16431:	
;task.c: 219: else if(TimeCnt.SmokeTask >= 1000 && (ReadPort.KeyState&0x80) == 0)
	movlw	high(03E8h)
	bsf	status, 6	;RP1=1, select bank2
	subwf	1+(345)^0100h+05h,w
	movlw	low(03E8h)
	skipnz
	subwf	0+(345)^0100h+05h,w
	skipc
	goto	u4251
	goto	u4250
u4251:
	goto	l16447
u4250:
	
l16433:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfsc	0+(_ReadPort)^080h+04h,(7)&7
	goto	u4261
	goto	u4260
u4261:
	goto	l16447
u4260:
	line	221
	
l16435:	
;task.c: 220: {
;task.c: 221: KeyUpStopSmoke();
	fcall	_KeyUpStopSmoke
	line	222
;task.c: 222: SetOffNotifyLED();
	fcall	_SetOffNotifyLED
	line	223
;task.c: 223: SetShowLED(0x00);
	movlw	(0)
	fcall	_SetShowLED
	line	224
	
l16437:	
;task.c: 224: SetWarnEvent(&RunEventLED,15,25,4);
	movlw	(0Fh)
	movwf	(?_SetWarnEvent)
	movlw	(019h)
	movwf	0+(?_SetWarnEvent)+01h
	movlw	(04h)
	movwf	0+(?_SetWarnEvent)+02h
	movlw	(_RunEventLED)&0ffh
	fcall	_SetWarnEvent
	line	225
	
l16439:	
;task.c: 225: ShowSegmentLED(0x00);
	movlw	(0)
	fcall	_ShowSegmentLED
	line	226
	
l16441:	
;task.c: 226: LedsInfoFlag.bits.b3 = 0;
	bcf	(_LedsInfoFlag),3
	line	227
	
l16443:	
;task.c: 227: RunLED.ShowBatLxCnt = 0x00;
	clrf	0+(_RunLED)+05h
	line	228
	
l16445:	
;task.c: 228: RunLED.TaskBatLx = 0;
	clrf	0+(_RunLED)+06h
	line	229
;task.c: 229: SetShowBatLxLED(0x00);
	movlw	(0)
	fcall	_SetShowBatLxLED
	line	230
;task.c: 230: }
	goto	l10159
	line	231
	
l16447:	
;task.c: 231: else if(TimeCnt.SmokeTask >= 1500 && (ReadPort.KeyState&0x80) != 0)
	movlw	high(05DCh)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	subwf	1+(345)^0100h+05h,w
	movlw	low(05DCh)
	skipnz
	subwf	0+(345)^0100h+05h,w
	skipc
	goto	u4271
	goto	u4270
u4271:
	goto	l10139
u4270:
	
l16449:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	0+(_ReadPort)^080h+04h,(7)&7
	goto	u4281
	goto	u4280
u4281:
	goto	l10139
u4280:
	line	233
	
l16451:	
;task.c: 232: {
;task.c: 233: KeyUpStopSmoke();
	fcall	_KeyUpStopSmoke
	line	234
;task.c: 234: SetOffNotifyLED();
	fcall	_SetOffNotifyLED
	line	235
;task.c: 235: SetShowLED(0x00);
	movlw	(0)
	fcall	_SetShowLED
	line	236
	
l16453:	
;task.c: 236: SetWarnEvent(&RunEventLED,0,25,0);
	clrf	(?_SetWarnEvent)
	movlw	(019h)
	movwf	0+(?_SetWarnEvent)+01h
	clrf	0+(?_SetWarnEvent)+02h
	movlw	(_RunEventLED)&0ffh
	fcall	_SetWarnEvent
	line	237
	
l16455:	
;task.c: 237: ShowSegmentLED(0x00);
	movlw	(0)
	fcall	_ShowSegmentLED
	line	238
	
l16457:	
;task.c: 238: LedsInfoFlag.bits.b3 = 0;
	bcf	(_LedsInfoFlag),3
	line	239
	
l16459:	
;task.c: 239: RunLED.ShowBatLxCnt = 0x00;
	clrf	0+(_RunLED)+05h
	line	240
	
l16461:	
;task.c: 240: RunLED.TaskBatLx = 0;
	clrf	0+(_RunLED)+06h
	line	241
;task.c: 241: SetShowBatLxLED(0x00);
	movlw	(0)
	fcall	_SetShowBatLxLED
	line	242
;task.c: 242: }
	goto	l10159
	line	243
	
l10139:	
	line	245
;task.c: 243: else
;task.c: 244: {
;task.c: 245: if(VoutInfoFlag.bits.b1 != 0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(_VoutInfoFlag),1
	goto	u4291
	goto	u4290
u4291:
	goto	l10159
u4290:
	line	247
	
l16463:	
;task.c: 246: {
;task.c: 247: GetADC.LoadRes = HAL_ADC_Sample(3,0);
	clrf	(?_HAL_ADC_Sample)
	movlw	(03h)
	fcall	_HAL_ADC_Sample
	movf	(1+(?_HAL_ADC_Sample)),w
	movwf	1+(_GetADC)+0Ah
	movf	(0+(?_HAL_ADC_Sample)),w
	movwf	0+(_GetADC)+0Ah
	line	249
	
l16465:	
;task.c: 249: if(VoutInfoFlag.bits.b1 != 0)
	btfss	(_VoutInfoFlag),1
	goto	u4301
	goto	u4300
u4301:
	goto	l10159
u4300:
	line	251
	
l16467:	
;task.c: 250: {
;task.c: 251: if(VoutInfoFlag.bits.b5 != 0)
	btfss	(_VoutInfoFlag),5
	goto	u4311
	goto	u4310
u4311:
	goto	l16497
u4310:
	line	253
	
l16469:	
;task.c: 252: {
;task.c: 253: if(GetADC.LoadRes < 3800)
	movlw	high(0ED8h)
	subwf	1+(_GetADC)+0Ah,w
	movlw	low(0ED8h)
	skipnz
	subwf	0+(_GetADC)+0Ah,w
	skipnc
	goto	u4321
	goto	u4320
u4321:
	goto	l16473
u4320:
	line	255
	
l16471:	
;task.c: 254: {
;task.c: 255: VoutInfoFlag.bits.b6 = 1;
	bsf	(_VoutInfoFlag),6
	line	256
;task.c: 256: PAD4 = 1;
	bsf	(44/8),(44)&7
	line	257
;task.c: 257: }
	goto	l10159
	line	260
	
l16473:	
;task.c: 258: else
;task.c: 259: {
;task.c: 260: if(GetADC.VoutVDD)
	movlw	(06h)
	addlw	_GetADC&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	incf	fsr0,f
	iorwf	indf,w
	skipnz
	goto	u4331
	goto	u4330
u4331:
	goto	l10120
u4330:
	line	271
	
l16475:	
;task.c: 261: {
;task.c: 271: AD_Temp = ((uint32_t)GetADC.LoadRes*GetADC.VoutVDD)/4096;
	movf	0+(_GetADC)+0Ah,w
	movwf	(?___lmul)
	movf	1+(_GetADC)+0Ah,w
	movwf	((?___lmul))+1
	clrf	2+((?___lmul))
	clrf	3+((?___lmul))
	movf	0+(_GetADC)+06h,w
	movwf	0+(?___lmul)+04h
	movf	1+(_GetADC)+06h,w
	movwf	(0+(?___lmul)+04h)+1
	clrf	2+(0+(?___lmul)+04h)
	clrf	3+(0+(?___lmul)+04h)
	fcall	___lmul
	movf	(0+?___lmul),w
	movwf	(??_PowerProgress+0)+0
	movf	(1+?___lmul),w
	movwf	((??_PowerProgress+0)+0+1)
	movf	(2+?___lmul),w
	movwf	((??_PowerProgress+0)+0+2)
	movf	(3+?___lmul),w
	movwf	((??_PowerProgress+0)+0+3)
	movlw	0Ch
u4345:
	clrc
	rrf	(??_PowerProgress+0)+3,f
	rrf	(??_PowerProgress+0)+2,f
	rrf	(??_PowerProgress+0)+1,f
	rrf	(??_PowerProgress+0)+0,f
u4340:
	addlw	-1
	skipz
	goto	u4345
	movf	1+(??_PowerProgress+0)+0,w
	movwf	(PowerProgress@AD_Temp+1)
	movf	0+(??_PowerProgress+0)+0,w
	movwf	(PowerProgress@AD_Temp)
	line	272
	
l16477:	
;task.c: 272: if(GetADC.Vout_Lx == 0x01)
	decf	0+(_GetADC)+03h,w
	skipz
	goto	u4351
	goto	u4350
u4351:
	goto	l16485
u4350:
	line	274
	
l16479:	
;task.c: 273: {
;task.c: 274: if(GetADC.VoutOld >= 4050)
	movlw	high(0FD2h)
	subwf	1+(_GetADC)+08h,w
	movlw	low(0FD2h)
	skipnz
	subwf	0+(_GetADC)+08h,w
	skipc
	goto	u4361
	goto	u4360
u4361:
	goto	l16483
u4360:
	line	276
	
l16481:	
;task.c: 275: {
;task.c: 276: AD_Temp = 610000UL/AD_Temp;
	movf	(PowerProgress@AD_Temp),w
	movwf	(?___lldiv)
	movf	(PowerProgress@AD_Temp+1),w
	movwf	((?___lldiv))+1
	clrf	2+((?___lldiv))
	clrf	3+((?___lldiv))
	movlw	0
	movwf	3+(?___lldiv)+04h
	movlw	09h
	movwf	2+(?___lldiv)+04h
	movlw	04Eh
	movwf	1+(?___lldiv)+04h
	movlw	0D0h
	movwf	0+(?___lldiv)+04h

	fcall	___lldiv
	movf	1+(((0+(?___lldiv)))),w
	movwf	(PowerProgress@AD_Temp+1)
	movf	0+(((0+(?___lldiv)))),w
	movwf	(PowerProgress@AD_Temp)
	line	277
;task.c: 277: }
	goto	l16487
	line	280
	
l16483:	
;task.c: 278: else
;task.c: 279: {
;task.c: 280: AD_Temp = 670000UL/AD_Temp;
	movf	(PowerProgress@AD_Temp),w
	movwf	(?___lldiv)
	movf	(PowerProgress@AD_Temp+1),w
	movwf	((?___lldiv))+1
	clrf	2+((?___lldiv))
	clrf	3+((?___lldiv))
	movlw	0
	movwf	3+(?___lldiv)+04h
	movlw	0Ah
	movwf	2+(?___lldiv)+04h
	movlw	039h
	movwf	1+(?___lldiv)+04h
	movlw	030h
	movwf	0+(?___lldiv)+04h

	fcall	___lldiv
	movf	1+(((0+(?___lldiv)))),w
	movwf	(PowerProgress@AD_Temp+1)
	movf	0+(((0+(?___lldiv)))),w
	movwf	(PowerProgress@AD_Temp)
	goto	l16487
	line	285
	
l16485:	
;task.c: 283: else
;task.c: 284: {
;task.c: 285: AD_Temp = 550000UL/AD_Temp;
	movf	(PowerProgress@AD_Temp),w
	movwf	(?___lldiv)
	movf	(PowerProgress@AD_Temp+1),w
	movwf	((?___lldiv))+1
	clrf	2+((?___lldiv))
	clrf	3+((?___lldiv))
	movlw	0
	movwf	3+(?___lldiv)+04h
	movlw	08h
	movwf	2+(?___lldiv)+04h
	movlw	064h
	movwf	1+(?___lldiv)+04h
	movlw	070h
	movwf	0+(?___lldiv)+04h

	fcall	___lldiv
	movf	1+(((0+(?___lldiv)))),w
	movwf	(PowerProgress@AD_Temp+1)
	movf	0+(((0+(?___lldiv)))),w
	movwf	(PowerProgress@AD_Temp)
	line	288
	
l16487:	
;task.c: 286: }
;task.c: 288: if(AD_Temp>=200) RunPWM.BuckPwmDutyBuff = 200;
	movlw	high(0C8h)
	subwf	(PowerProgress@AD_Temp+1),w
	movlw	low(0C8h)
	skipnz
	subwf	(PowerProgress@AD_Temp),w
	skipc
	goto	u4371
	goto	u4370
u4371:
	goto	l16491
u4370:
	
l16489:	
	movlw	(0C8h)
	movwf	0+(_RunPWM)+02h
	goto	l10159
	line	289
	
l16491:	
;task.c: 289: else if(AD_Temp < 60) RunPWM.BuckPwmDutyBuff = 60;
	movlw	high(03Ch)
	subwf	(PowerProgress@AD_Temp+1),w
	movlw	low(03Ch)
	skipnz
	subwf	(PowerProgress@AD_Temp),w
	skipnc
	goto	u4381
	goto	u4380
u4381:
	goto	l16495
u4380:
	
l16493:	
	movlw	(03Ch)
	movwf	0+(_RunPWM)+02h
	goto	l10159
	line	290
	
l16495:	
;task.c: 290: else RunPWM.BuckPwmDutyBuff = AD_Temp;
	movf	(PowerProgress@AD_Temp),w
	movwf	0+(_RunPWM)+02h
	goto	l10159
	line	296
	
l16497:	
;task.c: 294: else
;task.c: 295: {
;task.c: 296: if(GetADC.LoadRes < 3810)
	movlw	high(0EE2h)
	subwf	1+(_GetADC)+0Ah,w
	movlw	low(0EE2h)
	skipnz
	subwf	0+(_GetADC)+0Ah,w
	skipnc
	goto	u4391
	goto	u4390
u4391:
	goto	l10156
u4390:
	goto	l16471
	line	301
	
l10156:	
	line	303
;task.c: 301: else
;task.c: 302: {
;task.c: 303: VoutInfoFlag.bits.b5 = 1;
	bsf	(_VoutInfoFlag),5
	line	304
	
l16501:	
;task.c: 304: GetADC.VoutOpenCnt = 0;
	clrf	0+(_GetADC)+02h
	line	305
	
l16503:	
;task.c: 305: LedsInfoFlag.bits.b0 = 0;
	bcf	(_LedsInfoFlag),0
	line	306
	
l16505:	
;task.c: 306: LedsInfoFlag.bits.b6 = 0;
	bcf	(_LedsInfoFlag),6
	line	307
	
l16507:	
;task.c: 307: LedsInfoFlag.bits.b2 = 0;
	bcf	(_LedsInfoFlag),2
	line	308
	
l16509:	
;task.c: 308: LedsInfoFlag.bits.b1 = 1;
	bsf	(_LedsInfoFlag),1
	line	309
	
l16511:	
;task.c: 309: if(LedsInfoFlag.bits.b7 == 0)
	btfsc	(_LedsInfoFlag),7
	goto	u4401
	goto	u4400
u4401:
	goto	l16517
u4400:
	line	311
	
l16513:	
;task.c: 310: {
;task.c: 311: RunLED.NotifyLedDuty = 0;
	clrf	0+(_RunLED)+01h
	line	312
	
l16515:	
;task.c: 312: LedsInfoFlag.bits.b3 = 0;
	bcf	(_LedsInfoFlag),3
	line	313
;task.c: 313: RunLED.ShowBatLxCnt = 0x00;
	clrf	0+(_RunLED)+05h
	line	314
;task.c: 314: RunLED.TaskBatLx = 0;
	clrf	0+(_RunLED)+06h
	line	316
	
l16517:	
;task.c: 315: }
;task.c: 316: LedsInfoFlag.bits.b7 = 1;
	bsf	(_LedsInfoFlag),7
	line	317
	
l16519:	
;task.c: 317: LedsInfoFlag.bits.b0 = 1;
	bsf	(_LedsInfoFlag),0
	line	318
	
l16521:	
;task.c: 318: LedsInfoFlag.bits.b3 = 1;
	bsf	(_LedsInfoFlag),3
	line	319
	
l16523:	
;task.c: 319: SetWarnEvent(&RunEventLED,1,25,200);
	clrf	(?_SetWarnEvent)
	incf	(?_SetWarnEvent),f
	movlw	(019h)
	movwf	0+(?_SetWarnEvent)+01h
	movlw	(0C8h)
	movwf	0+(?_SetWarnEvent)+02h
	movlw	(_RunEventLED)&0ffh
	fcall	_SetWarnEvent
	line	320
	
l16525:	
;task.c: 320: GetADC.BatteryLevel = GetADC.BatteryPercent;
	movf	0+(_GetADC)+0Ch,w
	movwf	0+(_GetADC)+01h
	line	321
	
l16527:	
;task.c: 321: RunEventLED.ShowTask = 2;
	movlw	(02h)
	movwf	0+(_RunEventLED)+02h
	line	328
	
l10159:	
	return
	opt stack 0
GLOBAL	__end_of_PowerProgress
	__end_of_PowerProgress:
;; =============== function _PowerProgress ends ============

	signat	_PowerProgress,88
	global	_PortScan
psect	text733,local,class=CODE,delta=2
global __ptext733
__ptext733:

;; *************** function _PortScan *****************
;; Defined at:
;;		line 67 in file "E:\workSpace\git_work\jm\P2\code\key.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 20/40
;;		On exit  : 0/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3  BANK2h  BANK2l
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_gearSwitch
;;		_KeyUpStopSmoke
;;		_SetOffNotifyLED
;;		_SetWarnEvent
;;		_SetShowLED
;;		_ShowSegmentLED
;;		_SetShowBatLxLED
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text733
	file	"E:\workSpace\git_work\jm\P2\code\key.c"
	line	67
	global	__size_of_PortScan
	__size_of_PortScan	equ	__end_of_PortScan-_PortScan
	
_PortScan:	
	opt	stack 2
; Regs used in _PortScan: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	68
	
l16179:	
;key.c: 68: if(PBD2 == 1) ReadPort.ScanNew |= 0x01;
	bcf	status, 6	;RP1=0, select bank0
	btfss	(50/8),(50)&7
	goto	u3841
	goto	u3840
u3841:
	goto	l4937
u3840:
	
l16181:	
	bsf	status, 5	;RP0=1, select bank1
	bsf	0+(_ReadPort)^080h+01h+(0/8),(0)&7
	goto	l4938
	line	69
	
l4937:	
;key.c: 69: else ReadPort.ScanNew &= 0xFE;
	bsf	status, 5	;RP0=1, select bank1
	bcf	0+(_ReadPort)^080h+01h+(0/8),(0)&7
	
l4938:	
	line	71
;key.c: 71: if(PAD7 == 0) ReadPort.ScanNew |= 0x02;
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(47/8),(47)&7
	goto	u3851
	goto	u3850
u3851:
	goto	l4939
u3850:
	
l16183:	
	bsf	status, 5	;RP0=1, select bank1
	bsf	0+(_ReadPort)^080h+01h+(1/8),(1)&7
	goto	l16185
	line	72
	
l4939:	
;key.c: 72: else ReadPort.ScanNew &= 0xFD;
	bsf	status, 5	;RP0=1, select bank1
	bcf	0+(_ReadPort)^080h+01h+(1/8),(1)&7
	line	78
	
l16185:	
;key.c: 78: if(ReadPort.ScanNew != ReadPort.ScanOld)
	movf	0+(_ReadPort)^080h+01h,w
	xorwf	0+(_ReadPort)^080h+02h,w
	skipnz
	goto	u3861
	goto	u3860
u3861:
	goto	l16231
u3860:
	line	80
	
l16187:	
;key.c: 79: {
;key.c: 80: ReadPort.ScanCnt++;
	incf	0+(_ReadPort)^080h+03h,f
	line	81
	
l16189:	
;key.c: 81: if(ReadPort.ScanCnt >= 2)
	movlw	(02h)
	subwf	0+(_ReadPort)^080h+03h,w
	skipc
	goto	u3871
	goto	u3870
u3871:
	goto	l16233
u3870:
	line	83
	
l16191:	
;key.c: 82: {
;key.c: 83: if((ReadPort.ScanOld&0x02) == 0 && (ReadPort.ScanNew&0x02) != 0)
	btfsc	0+(_ReadPort)^080h+02h,(1)&7
	goto	u3881
	goto	u3880
u3881:
	goto	l4943
u3880:
	
l16193:	
	btfss	0+(_ReadPort)^080h+01h,(1)&7
	goto	u3891
	goto	u3890
u3891:
	goto	l4943
u3890:
	line	85
	
l16195:	
;key.c: 84: {
;key.c: 85: ReadPort.KeyNum++;
	incf	0+(_ReadPort)^080h+05h,f
	line	86
	
l16197:	
;key.c: 86: ReadPort.KeyIntervalTime = 50;
	movlw	(032h)
	movwf	0+(_ReadPort)^080h+06h
	line	87
	
l16199:	
;key.c: 87: ReadPort.KeyState |= 0x01;
	bsf	0+(_ReadPort)^080h+04h+(0/8),(0)&7
	line	88
	
l16201:	
;key.c: 88: ReadPort.KeyLongTime = 0;
	clrf	0+(_ReadPort)^080h+07h
	clrf	1+(_ReadPort)^080h+07h
	line	89
	
l16203:	
;key.c: 89: gearSwitch();
	fcall	_gearSwitch
	line	92
;key.c: 92: }
	goto	l4944
	line	93
	
l4943:	
;key.c: 93: else if((ReadPort.ScanOld&0x02) != 0 && (ReadPort.ScanNew&0x02) == 0)
	btfss	0+(_ReadPort)^080h+02h,(1)&7
	goto	u3901
	goto	u3900
u3901:
	goto	l4944
u3900:
	
l16205:	
	btfsc	0+(_ReadPort)^080h+01h,(1)&7
	goto	u3911
	goto	u3910
u3911:
	goto	l4944
u3910:
	line	95
	
l16207:	
;key.c: 94: {
;key.c: 95: ReadPort.KeyState &= 0xFE;
	bcf	0+(_ReadPort)^080h+04h+(0/8),(0)&7
	line	98
	
l4944:	
;key.c: 96: }
;key.c: 98: if((ReadPort.ScanOld&0x01) == 0 && (ReadPort.ScanNew&0x01) != 0)
	bsf	status, 5	;RP0=1, select bank1
	btfsc	0+(_ReadPort)^080h+02h,(0)&7
	goto	u3921
	goto	u3920
u3921:
	goto	l4946
u3920:
	
l16209:	
	btfss	0+(_ReadPort)^080h+01h,(0)&7
	goto	u3931
	goto	u3930
u3931:
	goto	l4946
u3930:
	line	100
	
l16211:	
;key.c: 99: {
;key.c: 100: if((ReadPort.KeyState&0x10) == 0)
	btfsc	0+(_ReadPort)^080h+04h,(4)&7
	goto	u3941
	goto	u3940
u3941:
	goto	l16225
u3940:
	line	102
	
l16213:	
;key.c: 101: {
;key.c: 102: ReadPort.KeyState |= 0x20;
	bsf	0+(_ReadPort)^080h+04h+(5/8),(5)&7
	line	103
;key.c: 103: VoutInfoFlag.bits.b0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(_VoutInfoFlag),0
	line	104
;key.c: 104: ReadPort.KeyState &= 0x7F;
	bsf	status, 5	;RP0=1, select bank1
	bcf	0+(_ReadPort)^080h+04h+(7/8),(7)&7
	goto	l16225
	line	107
	
l4946:	
;key.c: 107: else if((ReadPort.ScanOld&0x01) != 0 && (ReadPort.ScanNew&0x01) == 0)
	btfss	0+(_ReadPort)^080h+02h,(0)&7
	goto	u3951
	goto	u3950
u3951:
	goto	l16225
u3950:
	
l16215:	
	btfsc	0+(_ReadPort)^080h+01h,(0)&7
	goto	u3961
	goto	u3960
u3961:
	goto	l16225
u3960:
	line	109
	
l16217:	
;key.c: 108: {
;key.c: 109: if((ReadPort.KeyState&0x20) != 0)
	btfss	0+(_ReadPort)^080h+04h,(5)&7
	goto	u3971
	goto	u3970
u3971:
	goto	l16225
u3970:
	line	111
	
l16219:	
;key.c: 110: {
;key.c: 111: KeyUpStopSmoke();
	fcall	_KeyUpStopSmoke
	line	112
	
l16221:	
;key.c: 112: VoutInfoFlag.bits.b0 = 0;
	bcf	(_VoutInfoFlag),0
	line	113
	
l16223:	
;key.c: 113: ReadPort.KeyState &= 0xDF;
	bsf	status, 5	;RP0=1, select bank1
	bcf	0+(_ReadPort)^080h+04h+(5/8),(5)&7
	line	117
	
l16225:	
;key.c: 114: }
;key.c: 115: }
;key.c: 117: TimeCnt.SleepTime = 0;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	0+(345)^0100h+03h
	clrf	1+(345)^0100h+03h
	line	118
	
l16227:	
;key.c: 118: ReadPort.ScanCnt = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	0+(_ReadPort)^080h+03h
	line	119
	
l16229:	
;key.c: 119: ReadPort.ScanOld = ReadPort.ScanNew;
	movf	0+(_ReadPort)^080h+01h,w
	movwf	0+(_ReadPort)^080h+02h
	goto	l16233
	line	122
	
l16231:	
;key.c: 122: else ReadPort.ScanCnt = 0;
	clrf	0+(_ReadPort)^080h+03h
	line	124
	
l16233:	
;key.c: 124: if(ReadPort.KeyIntervalTime) ReadPort.KeyIntervalTime--;
	movf	0+(_ReadPort)^080h+06h,w
	skipz
	goto	u3980
	goto	l16237
u3980:
	
l16235:	
	decf	0+(_ReadPort)^080h+06h,f
	goto	l16263
	line	127
	
l16237:	
;key.c: 125: else
;key.c: 126: {
;key.c: 127: if((ReadPort.KeyState&0x31) == 0 && SysInfoFlag.bits.b7 == 0 && VoutInfoFlag.bits.b7 == 0)
	movf	0+(_ReadPort)^080h+04h,w
	andlw	031h
	btfss	status,2
	goto	u3991
	goto	u3990
u3991:
	goto	l16261
u3990:
	
l16239:	
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(_SysInfoFlag),7
	goto	u4001
	goto	u4000
u4001:
	goto	l16261
u4000:
	
l16241:	
	btfsc	(_VoutInfoFlag),7
	goto	u4011
	goto	u4010
u4011:
	goto	l16261
u4010:
	line	129
	
l16243:	
;key.c: 128: {
;key.c: 129: if(ReadPort.KeyNum == 1)
	bsf	status, 5	;RP0=1, select bank1
	decf	0+(_ReadPort)^080h+05h,w
	skipz
	goto	u4021
	goto	u4020
u4021:
	goto	l16261
u4020:
	line	131
	
l16245:	
;key.c: 130: {
;key.c: 131: if(RunEventLED.EmEvent < 7 || RunEventLED.EmEvent == 17)
	movlw	(07h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	0+(_RunEventLED)+03h,w
	skipc
	goto	u4031
	goto	u4030
u4031:
	goto	l16249
u4030:
	
l16247:	
	movf	0+(_RunEventLED)+03h,w
	xorlw	011h
	skipz
	goto	u4041
	goto	u4040
u4041:
	goto	l16261
u4040:
	line	133
	
l16249:	
;key.c: 132: {
;key.c: 133: SetOffNotifyLED();
	fcall	_SetOffNotifyLED
	line	134
	
l16251:	
;key.c: 134: LedsInfoFlag.bits.b3 = 0;
	bcf	(_LedsInfoFlag),3
	line	135
	
l16253:	
;key.c: 135: RunLED.ShowBatLxCnt = 0x00;
	clrf	0+(_RunLED)+05h
	line	136
	
l16255:	
;key.c: 136: RunLED.TaskBatLx = 0;
	clrf	0+(_RunLED)+06h
	line	137
	
l16257:	
;key.c: 137: SetWarnEvent(&RunEventLED,17,25,8);
	movlw	(011h)
	movwf	(?_SetWarnEvent)
	movlw	(019h)
	movwf	0+(?_SetWarnEvent)+01h
	movlw	(08h)
	movwf	0+(?_SetWarnEvent)+02h
	movlw	(_RunEventLED)&0ffh
	fcall	_SetWarnEvent
	line	138
	
l16259:	
;key.c: 138: RunEventLED.ShowTask = 0;
	clrf	0+(_RunEventLED)+02h
	line	143
	
l16261:	
;key.c: 139: }
;key.c: 140: }
;key.c: 141: }
;key.c: 143: ReadPort.KeyNum = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	0+(_ReadPort)^080h+05h
	line	146
	
l16263:	
;key.c: 144: }
;key.c: 146: if((ReadPort.KeyState&0x01) != 0)
	btfss	0+(_ReadPort)^080h+04h,(0)&7
	goto	u4051
	goto	u4050
u4051:
	goto	l16297
u4050:
	line	148
	
l16265:	
;key.c: 147: {
;key.c: 148: if(ReadPort.KeyLongTime<150)
	movlw	high(096h)
	subwf	1+(_ReadPort)^080h+07h,w
	movlw	low(096h)
	skipnz
	subwf	0+(_ReadPort)^080h+07h,w
	skipnc
	goto	u4061
	goto	u4060
u4061:
	goto	l4960
u4060:
	line	150
	
l16267:	
;key.c: 149: {
;key.c: 150: ReadPort.KeyLongTime++;
	incf	0+(_ReadPort)^080h+07h,f
	skipnz
	incf	1+(_ReadPort)^080h+07h,f
	line	151
	
l16269:	
;key.c: 151: TimeCnt.SleepTime = 0;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	0+(345)^0100h+03h
	clrf	1+(345)^0100h+03h
	line	152
;key.c: 152: }
	goto	l16297
	line	153
	
l4960:	
	line	155
;key.c: 153: else
;key.c: 154: {
;key.c: 155: ReadPort.KeyState &= 0xFE;
	bcf	0+(_ReadPort)^080h+04h+(0/8),(0)&7
	line	156
	
l16271:	
;key.c: 156: ReadPort.KeyNum = 0;
	clrf	0+(_ReadPort)^080h+05h
	line	157
	
l16273:	
;key.c: 157: KeyUpStopSmoke();
	fcall	_KeyUpStopSmoke
	line	158
	
l16275:	
;key.c: 158: VoutInfoFlag.bits.b0 = 0;
	bcf	(_VoutInfoFlag),0
	line	159
	
l16277:	
;key.c: 159: SetOffNotifyLED();
	fcall	_SetOffNotifyLED
	line	160
	
l16279:	
;key.c: 160: SetShowLED(0x00);
	movlw	(0)
	fcall	_SetShowLED
	line	161
	
l16281:	
;key.c: 161: if(SysInfoFlag.bits.b7 != 0)
	btfss	(_SysInfoFlag),7
	goto	u4071
	goto	u4070
u4071:
	goto	l4962
u4070:
	line	163
	
l16283:	
;key.c: 162: {
;key.c: 163: SysInfoFlag.bits.b7 = 0;
	bcf	(_SysInfoFlag),7
	line	164
	
l16285:	
;key.c: 164: SetWarnEvent(&RunEventLED,12,25,10);
	movlw	(0Ch)
	movwf	(?_SetWarnEvent)
	movlw	(019h)
	movwf	0+(?_SetWarnEvent)+01h
	movlw	(0Ah)
	movwf	0+(?_SetWarnEvent)+02h
	movlw	(_RunEventLED)&0ffh
	fcall	_SetWarnEvent
	line	165
;key.c: 165: }
	goto	l4963
	line	166
	
l4962:	
	line	168
;key.c: 166: else
;key.c: 167: {
;key.c: 168: SysInfoFlag.bits.b7 = 1;
	bsf	(_SysInfoFlag),7
	line	169
	
l16287:	
;key.c: 169: SetWarnEvent(&RunEventLED,11,25,10);
	movlw	(0Bh)
	movwf	(?_SetWarnEvent)
	movlw	(019h)
	movwf	0+(?_SetWarnEvent)+01h
	movlw	(0Ah)
	movwf	0+(?_SetWarnEvent)+02h
	movlw	(_RunEventLED)&0ffh
	fcall	_SetWarnEvent
	line	170
	
l4963:	
	line	171
;key.c: 170: }
;key.c: 171: ShowSegmentLED(0x00);
	movlw	(0)
	fcall	_ShowSegmentLED
	line	172
	
l16289:	
;key.c: 172: LedsInfoFlag.bits.b3 = 0;
	bcf	(_LedsInfoFlag),3
	line	173
	
l16291:	
;key.c: 173: RunLED.ShowBatLxCnt = 0x00;
	clrf	0+(_RunLED)+05h
	line	174
	
l16293:	
;key.c: 174: RunLED.TaskBatLx = 0;
	clrf	0+(_RunLED)+06h
	line	175
	
l16295:	
;key.c: 175: SetShowBatLxLED(0x00);
	movlw	(0)
	fcall	_SetShowBatLxLED
	line	180
	
l16297:	
;key.c: 176: }
;key.c: 177: }
;key.c: 180: if(ReadPort.KeyNum != 0 || (ReadPort.ScanNew&0x05) != 0) TimeCnt.SleepTime = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	0+(_ReadPort)^080h+05h,f
	skipz
	goto	u4081
	goto	u4080
u4081:
	goto	l16301
u4080:
	
l16299:	
	movf	0+(_ReadPort)^080h+01h,w
	andlw	05h
	btfsc	status,2
	goto	u4091
	goto	u4090
u4091:
	goto	l4967
u4090:
	
l16301:	
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	0+(345)^0100h+03h
	clrf	1+(345)^0100h+03h
	line	181
	
l4967:	
	return
	opt stack 0
GLOBAL	__end_of_PortScan
	__end_of_PortScan:
;; =============== function _PortScan ends ============

	signat	_PortScan,88
	global	_EnterSleep
psect	text734,local,class=CODE,delta=2
global __ptext734
__ptext734:

;; *************** function _EnterSleep *****************
;; Defined at:
;;		line 59 in file "E:\workSpace\git_work\jm\P2\code\task.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3  BANK2h  BANK2l
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_InitGpio
;;		_Delay_16nop
;;		_Init_BOD_WDT
;;		_MCU_INIT_TIMER
;; This function is called by:
;;		_IdleProgress
;; This function uses a non-reentrant model
;;
psect	text734
	file	"E:\workSpace\git_work\jm\P2\code\task.c"
	line	59
	global	__size_of_EnterSleep
	__size_of_EnterSleep	equ	__end_of_EnterSleep-_EnterSleep
	
_EnterSleep:	
	opt	stack 2
; Regs used in _EnterSleep: [wreg+status,2+status,0+pclath+cstack]
	line	60
	
l16157:	
;task.c: 60: if(SysInfoFlag.bits.b4 != 0)
	btfss	(_SysInfoFlag),4
	goto	u3811
	goto	u3810
u3811:
	goto	l10108
u3810:
	line	62
	
l16159:	
;task.c: 61: {
;task.c: 62: SysInfoFlag.bits.b4 = 0;
	bcf	(_SysInfoFlag),4
	line	74
	
l10108:	
	line	76
;task.c: 74: }
;task.c: 76: if(PAD6 == 1 || PAD6 == 0) return;
	btfsc	(46/8),(46)&7
	goto	u3821
	goto	u3820
u3821:
	goto	l10112
u3820:
	
l16161:	
	btfsc	(46/8),(46)&7
	goto	u3831
	goto	u3830
u3831:
	goto	l10109
u3830:
	goto	l10112
	
l10109:	
	line	79
;task.c: 79: TM0CTL |= 0x40;TM1CTL |= 0x40;T2CTL |= 0x10;
	bsf	(17)+(6/8),(6)&7	;volatile
	bsf	(20)+(6/8),(6)&7	;volatile
	bsf	(21)+(4/8),(4)&7	;volatile
	line	83
	
l16163:	
;task.c: 83: InitGpio();
	fcall	_InitGpio
	line	84
	
l16165:	
;task.c: 84: INTIE = 0x00;
	clrf	(11)	;volatile
	line	85
	
l16167:	
;task.c: 85: INTIE1 = 0x00;
	clrf	(13)	;volatile
	line	87
	
l16169:	
;task.c: 87: CLKCTL = (CLKCTL|0x10);
	bsf	(15)+(4/8),(4)&7	;volatile
	line	88
	
l16171:	
;task.c: 88: Delay_16nop();
	fcall	_Delay_16nop
	line	89
	
l16173:	
# 89 "E:\workSpace\git_work\jm\P2\code\task.c"
sleep ;#
psect	text734
	line	90
	
l16175:	
;task.c: 90: CLKCTL = (CLKCTL&0xEF);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(15)+(4/8),(4)&7	;volatile
	line	91
	
l16177:	
;task.c: 91: Delay_16nop();
	fcall	_Delay_16nop
	line	93
;task.c: 93: Init_BOD_WDT();
	fcall	_Init_BOD_WDT
	line	94
;task.c: 94: InitGpio();
	fcall	_InitGpio
	line	98
;task.c: 98: MCU_INIT_TIMER();
	fcall	_MCU_INIT_TIMER
	line	99
	
l10112:	
	return
	opt stack 0
GLOBAL	__end_of_EnterSleep
	__end_of_EnterSleep:
;; =============== function _EnterSleep ends ============

	signat	_EnterSleep,88
	global	_ReadLoadRes
psect	text735,local,class=CODE,delta=2
global __ptext735
__ptext735:

;; *************** function _ReadLoadRes *****************
;; Defined at:
;;		line 245 in file "E:\workSpace\git_work\jm\P2\code\modular.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  LoadValue       2   29[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;                  2   25[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3  BANK2h  BANK2l
;;      Params:         0       2       0       0       0       0
;;      Locals:         0       2       0       0       0       0
;;      Temps:          0       2       0       0       0       0
;;      Totals:         0       6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_HAL_ADC_Sample
;;		___lmul
;;		___lldiv
;; This function is called by:
;;		_PowerProgress
;; This function uses a non-reentrant model
;;
psect	text735
	file	"E:\workSpace\git_work\jm\P2\code\modular.c"
	line	245
	global	__size_of_ReadLoadRes
	__size_of_ReadLoadRes	equ	__end_of_ReadLoadRes-_ReadLoadRes
	
_ReadLoadRes:	
	opt	stack 2
; Regs used in _ReadLoadRes: [wreg+status,2+status,0+pclath+cstack]
	line	246
	
l16127:	
	line	248
	
l16129:	
;modular.c: 248: PAMOD54 = PAMOD54 & 0x0F | 0x30;
	bsf	status, 5	;RP0=1, select bank1
	movf	(135)^080h,w
	andlw	0Fh
	iorlw	030h
	movwf	(135)^080h	;volatile
	line	249
	
l16131:	
;modular.c: 249: PAD3 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(43/8),(43)&7
	line	250
	
l16133:	
	clrf	(?_HAL_ADC_Sample)
	incf	(?_HAL_ADC_Sample),f
	movlw	(03h)
	fcall	_HAL_ADC_Sample
	line	251
	
l16135:	
;modular.c: 251: LoadValue = HAL_ADC_Sample(3,1);
	clrf	(?_HAL_ADC_Sample)
	incf	(?_HAL_ADC_Sample),f
	movlw	(03h)
	fcall	_HAL_ADC_Sample
	movf	(1+(?_HAL_ADC_Sample)),w
	movwf	(ReadLoadRes@LoadValue+1)
	movf	(0+(?_HAL_ADC_Sample)),w
	movwf	(ReadLoadRes@LoadValue)
	line	252
	
l16137:	
;modular.c: 252: PAD3 = 1;
	bsf	(43/8),(43)&7
	line	253
	
l16139:	
;modular.c: 253: PAMOD54 = PAMOD54 & 0x0F | 0x90;
	bsf	status, 5	;RP0=1, select bank1
	movf	(135)^080h,w
	andlw	0Fh
	iorlw	090h
	movwf	(135)^080h	;volatile
	line	254
	
l16141:	
;modular.c: 254: PAD3 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(43/8),(43)&7
	line	256
	
l16143:	
;modular.c: 256: if(LoadValue >= 4090) LoadValue = 0xFFFF;
	movlw	high(0FFAh)
	subwf	(ReadLoadRes@LoadValue+1),w
	movlw	low(0FFAh)
	skipnz
	subwf	(ReadLoadRes@LoadValue),w
	skipc
	goto	u3791
	goto	u3790
u3791:
	goto	l16147
u3790:
	
l16145:	
	movlw	low(0FFFFh)
	movwf	(ReadLoadRes@LoadValue)
	movlw	high(0FFFFh)
	movwf	((ReadLoadRes@LoadValue))+1
	goto	l16153
	line	257
	
l16147:	
;modular.c: 257: else if(LoadValue < 30) LoadValue = 0;
	movlw	high(01Eh)
	subwf	(ReadLoadRes@LoadValue+1),w
	movlw	low(01Eh)
	skipnz
	subwf	(ReadLoadRes@LoadValue),w
	skipnc
	goto	u3801
	goto	u3800
u3801:
	goto	l16151
u3800:
	
l16149:	
	clrf	(ReadLoadRes@LoadValue)
	clrf	(ReadLoadRes@LoadValue+1)
	goto	l16153
	line	258
	
l16151:	
;modular.c: 258: else LoadValue = ((unsigned long)LoadValue*4700)/(4096-LoadValue);
	movlw	low(01000h)
	movwf	(??_ReadLoadRes+0)+0
	movlw	high(01000h)
	movwf	(??_ReadLoadRes+0)+0+1
	movf	(ReadLoadRes@LoadValue),w
	subwf	0+(??_ReadLoadRes+0)+0,w
	movwf	(?___lldiv)
	movf	(ReadLoadRes@LoadValue+1),w
	skipc
	incf	(ReadLoadRes@LoadValue+1),w
	subwf	1+(??_ReadLoadRes+0)+0,w
	movwf	1+(?___lldiv)
	clrf	2+(?___lldiv)
	clrf	3+(?___lldiv)
	movf	(ReadLoadRes@LoadValue),w
	movwf	(?___lmul)
	movf	(ReadLoadRes@LoadValue+1),w
	movwf	((?___lmul))+1
	clrf	2+((?___lmul))
	clrf	3+((?___lmul))
	movlw	0
	movwf	3+(?___lmul)+04h
	movlw	0
	movwf	2+(?___lmul)+04h
	movlw	012h
	movwf	1+(?___lmul)+04h
	movlw	05Ch
	movwf	0+(?___lmul)+04h

	fcall	___lmul
	movf	(3+(?___lmul)),w
	movwf	3+(?___lldiv)+04h
	movf	(2+(?___lmul)),w
	movwf	2+(?___lldiv)+04h
	movf	(1+(?___lmul)),w
	movwf	1+(?___lldiv)+04h
	movf	(0+(?___lmul)),w
	movwf	0+(?___lldiv)+04h

	fcall	___lldiv
	movf	1+(((0+(?___lldiv)))),w
	movwf	(ReadLoadRes@LoadValue+1)
	movf	0+(((0+(?___lldiv)))),w
	movwf	(ReadLoadRes@LoadValue)
	line	260
	
l16153:	
;modular.c: 260: return LoadValue;
	movf	(ReadLoadRes@LoadValue+1),w
	movwf	(?_ReadLoadRes+1)
	movf	(ReadLoadRes@LoadValue),w
	movwf	(?_ReadLoadRes)
	line	261
	
l8452:	
	return
	opt stack 0
GLOBAL	__end_of_ReadLoadRes
	__end_of_ReadLoadRes:
;; =============== function _ReadLoadRes ends ============

	signat	_ReadLoadRes,90
	global	_gearSwitch
psect	text736,local,class=CODE,delta=2
global __ptext736
__ptext736:

;; *************** function _gearSwitch *****************
;; Defined at:
;;		line 25 in file "E:\workSpace\git_work\jm\P2\code\key.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/20
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3  BANK2h  BANK2l
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_SetOffNotifyLED
;;		_SetShowLED
;;		_SetWarnEvent
;;		_ShowSegmentLED
;;		_SetShowBatLxLED
;; This function is called by:
;;		_PortScan
;; This function uses a non-reentrant model
;;
psect	text736
	file	"E:\workSpace\git_work\jm\P2\code\key.c"
	line	25
	global	__size_of_gearSwitch
	__size_of_gearSwitch	equ	__end_of_gearSwitch-_gearSwitch
	
_gearSwitch:	
	opt	stack 2
; Regs used in _gearSwitch: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	26
	
l16093:	
;key.c: 26: switch (GetADC.Vout_Lx)
	goto	l16101
	line	28
;key.c: 27: {
;key.c: 28: case 0x00:
	
l4924:	
	line	29
;key.c: 29: GetADC.Vout_Lx = 0x01;
	clrf	0+(_GetADC)+03h
	incf	0+(_GetADC)+03h,f
	line	30
;key.c: 30: break;
	goto	l4925
	line	32
	
l16095:	
;key.c: 32: GetADC.Vout_Lx = 0x80;
	movlw	(080h)
	movwf	0+(_GetADC)+03h
	line	33
;key.c: 33: break;
	goto	l4925
	line	35
	
l16097:	
;key.c: 35: GetADC.Vout_Lx = 0x00;
	clrf	0+(_GetADC)+03h
	line	36
;key.c: 36: break;
	goto	l4925
	line	26
	
l16101:	
	bcf	status, 5	;RP0=0, select bank0
	movf	0+(_GetADC)+03h,w
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 0 to 128
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
; jumptable            260     6 (fixed)
; rangetable           133     6 (fixed)
; spacedrange          264     9 (fixed)
; locatedrange         129     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l4924
	xorlw	1^0	; case 1
	skipnz
	goto	l16095
	xorlw	128^1	; case 128
	skipnz
	goto	l16097
	goto	l4925
	opt asmopt_on

	line	37
	
l4925:	
	line	39
;key.c: 39: SysInfoFlag.bits.b1 = 1;
	bsf	(_SysInfoFlag),1
	line	41
	
l16103:	
;key.c: 41: if(RunEventLED.EmEvent < 7 || RunEventLED.EmEvent == 10 || RunEventLED.EmEvent == 17)
	movlw	(07h)
	subwf	0+(_RunEventLED)+03h,w
	skipc
	goto	u3741
	goto	u3740
u3741:
	goto	l16109
u3740:
	
l16105:	
	movf	0+(_RunEventLED)+03h,w
	xorlw	0Ah
	skipnz
	goto	u3751
	goto	u3750
u3751:
	goto	l16109
u3750:
	
l16107:	
	movf	0+(_RunEventLED)+03h,w
	xorlw	011h
	skipz
	goto	u3761
	goto	u3760
u3761:
	goto	l4934
u3760:
	line	43
	
l16109:	
;key.c: 42: {
;key.c: 43: SetOffNotifyLED();
	fcall	_SetOffNotifyLED
	line	44
;key.c: 44: SetShowLED(0x00);
	movlw	(0)
	fcall	_SetShowLED
	line	45
	
l16111:	
;key.c: 45: SetWarnEvent(&RunEventLED,10,25,6);
	movlw	(0Ah)
	movwf	(?_SetWarnEvent)
	movlw	(019h)
	movwf	0+(?_SetWarnEvent)+01h
	movlw	(06h)
	movwf	0+(?_SetWarnEvent)+02h
	movlw	(_RunEventLED)&0ffh
	fcall	_SetWarnEvent
	line	46
	
l16113:	
;key.c: 46: if(SysInfoFlag.bits.b2 == 0 || RunEventLED.EmEvent == 17)
	btfss	(_SysInfoFlag),2
	goto	u3771
	goto	u3770
u3771:
	goto	l16117
u3770:
	
l16115:	
	movf	0+(_RunEventLED)+03h,w
	xorlw	011h
	skipz
	goto	u3781
	goto	u3780
u3781:
	goto	l4934
u3780:
	line	48
	
l16117:	
;key.c: 47: {
;key.c: 48: ShowSegmentLED(0x00);
	movlw	(0)
	fcall	_ShowSegmentLED
	line	49
	
l16119:	
;key.c: 49: LedsInfoFlag.bits.b3 = 0;
	bcf	(_LedsInfoFlag),3
	line	50
	
l16121:	
;key.c: 50: RunLED.ShowBatLxCnt = 0x00;
	clrf	0+(_RunLED)+05h
	line	51
	
l16123:	
;key.c: 51: RunLED.TaskBatLx = 0;
	clrf	0+(_RunLED)+06h
	line	52
	
l16125:	
;key.c: 52: SetShowBatLxLED(0x00);
	movlw	(0)
	fcall	_SetShowBatLxLED
	line	57
	
l4934:	
	return
	opt stack 0
GLOBAL	__end_of_gearSwitch
	__end_of_gearSwitch:
;; =============== function _gearSwitch ends ============

	signat	_gearSwitch,88
	global	_ShowWarnLED
psect	text737,local,class=CODE,delta=2
global __ptext737
__ptext737:

;; *************** function _ShowWarnLED *****************
;; Defined at:
;;		line 112 in file "E:\workSpace\git_work\jm\P2\code\LED.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3  BANK2h  BANK2l
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_SetShowLED
;;		_ShowSegmentLED
;;		_SetShowBatLxLED
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text737
	file	"E:\workSpace\git_work\jm\P2\code\LED.c"
	line	112
	global	__size_of_ShowWarnLED
	__size_of_ShowWarnLED	equ	__end_of_ShowWarnLED-_ShowWarnLED
	
_ShowWarnLED:	
	opt	stack 3
; Regs used in _ShowWarnLED: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	113
	
l15985:	
;LED.c: 113: if(RunEventLED.EmEvent != 0)
	movf	0+(_RunEventLED)+03h,w
	skipz
	goto	u3580
	goto	l6652
u3580:
	line	115
	
l15987:	
;LED.c: 114: {
;LED.c: 115: if(RunEventLED.FlashTimes)
	movf	0+(_RunEventLED)+01h,w
	skipz
	goto	u3590
	goto	l16069
u3590:
	goto	l16065
	line	120
	
l15991:	
;LED.c: 120: if(RunEventLED.FlashTimes < 9)
	movlw	(09h)
	subwf	0+(_RunEventLED)+01h,w
	skipnc
	goto	u3601
	goto	u3600
u3601:
	goto	l16067
u3600:
	line	122
	
l15993:	
;LED.c: 121: {
;LED.c: 122: SetShowLED(0x07);
	movlw	(07h)
	fcall	_SetShowLED
	line	123
	
l15995:	
;LED.c: 123: ShowSegmentLED(0xFF);
	movlw	(0FFh)
	fcall	_ShowSegmentLED
	line	124
	
l15997:	
;LED.c: 124: SetShowBatLxLED(0xFF);
	movlw	(0FFh)
	fcall	_SetShowBatLxLED
	goto	l16067
	line	128
	
l15999:	
;LED.c: 128: ShowSegmentLED(0x0E);
	movlw	(0Eh)
	fcall	_ShowSegmentLED
	line	129
;LED.c: 129: break;
	goto	l16067
	line	131
	
l16001:	
;LED.c: 131: GetADC.BatteryLevel = GetADC.BatteryPercent;
	movf	0+(_GetADC)+0Ch,w
	movwf	0+(_GetADC)+01h
	line	132
	
l16003:	
;LED.c: 132: RunLED.ShowEventOld ^= 0x01;
	movlw	(01h)
	xorwf	0+(_RunLED)+04h,f
	line	133
	
l16005:	
;LED.c: 133: ShowSegmentLED((0x0C|RunLED.ShowEventOld));
	movf	0+(_RunLED)+04h,w
	iorlw	0Ch
	fcall	_ShowSegmentLED
	line	134
	
l16007:	
;LED.c: 134: if((RunEventLED.FlashTimes&0x01) == 0)
	btfsc	0+(_RunEventLED)+01h,(0)&7
	goto	u3611
	goto	u3610
u3611:
	goto	l16067
u3610:
	line	136
	
l16009:	
;LED.c: 135: {
;LED.c: 136: RunEventLED.FlashTimes = 20;
	movlw	(014h)
	movwf	0+(_RunEventLED)+01h
	goto	l16067
	line	139
;LED.c: 139: case 7:
	
l6621:	
	line	140
;LED.c: 140: if((RunEventLED.FlashTimes&0x01) != 0)
	btfss	0+(_RunEventLED)+01h,(0)&7
	goto	u3621
	goto	u3620
u3621:
	goto	l16015
u3620:
	line	142
	
l16011:	
;LED.c: 141: {
;LED.c: 142: SetShowLED(0x00);
	movlw	(0)
	fcall	_SetShowLED
	line	143
	
l16013:	
;LED.c: 143: ShowSegmentLED(0x08);
	movlw	(08h)
	fcall	_ShowSegmentLED
	line	144
;LED.c: 144: }
	goto	l16067
	line	147
	
l16015:	
;LED.c: 145: else
;LED.c: 146: {
;LED.c: 147: SetShowLED(0x01);
	movlw	(01h)
	fcall	_SetShowLED
	line	148
	
l16017:	
;LED.c: 148: GetADC.BatteryLevel = 0x00;
	clrf	0+(_GetADC)+01h
	line	149
	
l16019:	
;LED.c: 149: ShowSegmentLED(0x0C);
	movlw	(0Ch)
	fcall	_ShowSegmentLED
	goto	l16067
	line	152
;LED.c: 152: case 15:
	
l6624:	
	line	153
;LED.c: 153: if((RunEventLED.FlashTimes&0x01) != 0)
	btfss	0+(_RunEventLED)+01h,(0)&7
	goto	u3631
	goto	u3630
u3631:
	goto	l16023
u3630:
	line	155
	
l16021:	
;LED.c: 154: {
;LED.c: 155: SetShowLED(0x00);
	movlw	(0)
	fcall	_SetShowLED
	line	156
;LED.c: 156: }
	goto	l16025
	line	159
	
l16023:	
;LED.c: 157: else
;LED.c: 158: {
;LED.c: 159: SetShowLED(GetADC.Vout_Lx);
	movf	0+(_GetADC)+03h,w
	fcall	_SetShowLED
	line	161
	
l16025:	
;LED.c: 160: }
;LED.c: 161: ShowSegmentLED(0x10);
	movlw	(010h)
	fcall	_ShowSegmentLED
	line	162
;LED.c: 162: break;
	goto	l16067
	line	164
	
l6628:	
	line	165
;LED.c: 164: case 13:
;LED.c: 165: if((RunEventLED.FlashTimes&0x01) != 0)
	btfss	0+(_RunEventLED)+01h,(0)&7
	goto	u3641
	goto	u3640
u3641:
	goto	l16041
u3640:
	line	167
	
l16027:	
;LED.c: 166: {
;LED.c: 167: if(RunEventLED.EmEvent == 14)
	movf	0+(_RunEventLED)+03h,w
	xorlw	0Eh
	skipz
	goto	u3651
	goto	u3650
u3651:
	goto	l16035
u3650:
	line	169
	
l16029:	
;LED.c: 168: {
;LED.c: 169: SetShowLED(0x07);
	movlw	(07h)
	fcall	_SetShowLED
	line	170
	
l16031:	
;LED.c: 170: ShowSegmentLED(0x0E);
	movlw	(0Eh)
	fcall	_ShowSegmentLED
	line	171
	
l16033:	
;LED.c: 171: SetShowBatLxLED(0xFF);
	movlw	(0FFh)
	fcall	_SetShowBatLxLED
	line	172
;LED.c: 172: }
	goto	l16067
	line	175
	
l16035:	
;LED.c: 173: else
;LED.c: 174: {
;LED.c: 175: SetShowLED(0x00);
	movlw	(0)
	fcall	_SetShowLED
	line	176
	
l16037:	
;LED.c: 176: ShowSegmentLED(0x00);
	movlw	(0)
	fcall	_ShowSegmentLED
	line	177
	
l16039:	
;LED.c: 177: SetShowBatLxLED(0x00);
	movlw	(0)
	fcall	_SetShowBatLxLED
	goto	l16067
	line	182
	
l16041:	
;LED.c: 180: else
;LED.c: 181: {
;LED.c: 182: SetShowLED(0x07);
	movlw	(07h)
	fcall	_SetShowLED
	line	183
	
l16043:	
;LED.c: 183: ShowSegmentLED(0x0E);
	movlw	(0Eh)
	fcall	_ShowSegmentLED
	line	184
	
l16045:	
;LED.c: 184: SetShowBatLxLED(0xFF);
	movlw	(0FFh)
	fcall	_SetShowBatLxLED
	goto	l16067
	line	189
	
l6635:	
	line	190
;LED.c: 188: case 12:
;LED.c: 189: case 11:
;LED.c: 190: if((RunEventLED.FlashTimes&0x01) != 0)
	btfss	0+(_RunEventLED)+01h,(0)&7
	goto	u3661
	goto	u3660
u3661:
	goto	l16049
u3660:
	line	192
	
l16047:	
;LED.c: 191: {
;LED.c: 192: SetShowLED(0x00);
	movlw	(0)
	fcall	_SetShowLED
	line	193
;LED.c: 193: }
	goto	l16067
	line	196
	
l16049:	
;LED.c: 194: else
;LED.c: 195: {
;LED.c: 196: SetShowLED(GetADC.Vout_Lx);
	movf	0+(_GetADC)+03h,w
	fcall	_SetShowLED
	goto	l16067
	line	200
	
l16051:	
;LED.c: 200: SetShowLED(GetADC.Vout_Lx);
	movf	0+(_GetADC)+03h,w
	fcall	_SetShowLED
	line	201
	
l16053:	
;LED.c: 201: ShowSegmentLED(0x0E);
	movlw	(0Eh)
	fcall	_ShowSegmentLED
	line	202
	
l16055:	
;LED.c: 202: SetShowBatLxLED(0xFF);
	movlw	(0FFh)
	fcall	_SetShowBatLxLED
	line	203
;LED.c: 203: break;
	goto	l16067
	line	205
	
l16057:	
;LED.c: 205: ShowSegmentLED(0x0E);
	movlw	(0Eh)
	fcall	_ShowSegmentLED
	line	206
;LED.c: 206: break;
	goto	l16067
	line	208
	
l16059:	
;LED.c: 208: ShowSegmentLED(0x0D);
	movlw	(0Dh)
	fcall	_ShowSegmentLED
	line	209
	
l16061:	
;LED.c: 209: SetShowBatLxLED(0xFF);
	movlw	(0FFh)
	fcall	_SetShowBatLxLED
	line	210
;LED.c: 210: break;
	goto	l16067
	line	117
	
l16065:	
	movf	0+(_RunEventLED)+03h,w
	; Switch size 1, requested type "space"
; Number of cases is 13, Range of values is 1 to 17
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           40    21 (average)
; direct_byte           44    10 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	1^0	; case 1
	skipnz
	goto	l15999
	xorlw	4^1	; case 4
	skipnz
	goto	l16001
	xorlw	5^4	; case 5
	skipnz
	goto	l16059
	xorlw	6^5	; case 6
	skipnz
	goto	l16057
	xorlw	7^6	; case 7
	skipnz
	goto	l6621
	xorlw	10^7	; case 10
	skipnz
	goto	l6635
	xorlw	11^10	; case 11
	skipnz
	goto	l6635
	xorlw	12^11	; case 12
	skipnz
	goto	l6635
	xorlw	13^12	; case 13
	skipnz
	goto	l6628
	xorlw	14^13	; case 14
	skipnz
	goto	l6628
	xorlw	15^14	; case 15
	skipnz
	goto	l6624
	xorlw	16^15	; case 16
	skipnz
	goto	l15991
	xorlw	17^16	; case 17
	skipnz
	goto	l16051
	goto	l16067
	opt asmopt_on

	line	215
	
l16067:	
;LED.c: 215: RunEventLED.FlashTimes--;
	decf	0+(_RunEventLED)+01h,f
	line	216
;LED.c: 216: }
	goto	l6652
	line	219
	
l16069:	
;LED.c: 217: else
;LED.c: 218: {
;LED.c: 219: if(RunEventLED.EmEvent >= 14 || RunEventLED.EmEvent < 7)
	movlw	(0Eh)
	subwf	0+(_RunEventLED)+03h,w
	skipnc
	goto	u3671
	goto	u3670
u3671:
	goto	l16073
u3670:
	
l16071:	
	movlw	(07h)
	subwf	0+(_RunEventLED)+03h,w
	skipnc
	goto	u3681
	goto	u3680
u3681:
	goto	l16075
u3680:
	line	221
	
l16073:	
;LED.c: 220: {
;LED.c: 221: ShowSegmentLED(0x00);
	movlw	(0)
	fcall	_ShowSegmentLED
	line	224
	
l16075:	
;LED.c: 222: }
;LED.c: 224: if(RunEventLED.EmEvent == 14 || RunEventLED.EmEvent == 16 || RunEventLED.EmEvent == 17)
	movf	0+(_RunEventLED)+03h,w
	xorlw	0Eh
	skipnz
	goto	u3691
	goto	u3690
u3691:
	goto	l16081
u3690:
	
l16077:	
	movf	0+(_RunEventLED)+03h,w
	xorlw	010h
	skipnz
	goto	u3701
	goto	u3700
u3701:
	goto	l16081
u3700:
	
l16079:	
	movf	0+(_RunEventLED)+03h,w
	xorlw	011h
	skipz
	goto	u3711
	goto	u3710
u3711:
	goto	l16083
u3710:
	line	226
	
l16081:	
;LED.c: 225: {
;LED.c: 226: SetShowLED(0x00);
	movlw	(0)
	fcall	_SetShowLED
	line	227
;LED.c: 227: SetShowBatLxLED(0x00);
	movlw	(0)
	fcall	_SetShowBatLxLED
	line	230
	
l16083:	
;LED.c: 228: }
;LED.c: 230: if(RunEventLED.EmEvent == 1 || RunEventLED.EmEvent == 5)
	decf	0+(_RunEventLED)+03h,w
	skipnz
	goto	u3721
	goto	u3720
u3721:
	goto	l6651
u3720:
	
l16085:	
	movf	0+(_RunEventLED)+03h,w
	xorlw	05h
	skipz
	goto	u3731
	goto	u3730
u3731:
	goto	l16091
u3730:
	
l6651:	
	line	232
;LED.c: 231: {
;LED.c: 232: LedsInfoFlag.bits.b3 = 0;
	bcf	(_LedsInfoFlag),3
	line	233
	
l16087:	
;LED.c: 233: RunLED.ShowBatLxCnt = 0x00;
	clrf	0+(_RunLED)+05h
	line	234
;LED.c: 234: RunLED.TaskBatLx = 0;
	clrf	0+(_RunLED)+06h
	line	235
	
l16089:	
;LED.c: 235: SetShowBatLxLED(0x00);
	movlw	(0)
	fcall	_SetShowBatLxLED
	line	238
	
l16091:	
;LED.c: 236: }
;LED.c: 238: RunEventLED.EmEvent = 0;
	clrf	0+(_RunEventLED)+03h
	line	241
	
l6652:	
	return
	opt stack 0
GLOBAL	__end_of_ShowWarnLED
	__end_of_ShowWarnLED:
;; =============== function _ShowWarnLED ends ============

	signat	_ShowWarnLED,88
	global	_PlugProgress
psect	text738,local,class=CODE,delta=2
global __ptext738
__ptext738:

;; *************** function _PlugProgress *****************
;; Defined at:
;;		line 341 in file "E:\workSpace\git_work\jm\P2\code\task.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 20/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3  BANK2h  BANK2l
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_SetWarnEvent
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text738
	file	"E:\workSpace\git_work\jm\P2\code\task.c"
	line	341
	global	__size_of_PlugProgress
	__size_of_PlugProgress	equ	__end_of_PlugProgress-_PlugProgress
	
_PlugProgress:	
	opt	stack 3
; Regs used in _PlugProgress: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	342
	
l15925:	
;task.c: 342: if(SysInfoFlag.bits.b2 != 0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(_SysInfoFlag),2
	goto	u3451
	goto	u3450
u3451:
	goto	l15977
u3450:
	line	344
	
l15927:	
;task.c: 343: {
;task.c: 344: if(RunEventLED.EmEvent == 0)
	movf	0+(_RunEventLED)+03h,f
	skipz
	goto	u3461
	goto	u3460
u3461:
	goto	l15937
u3460:
	line	346
	
l15929:	
;task.c: 345: {
;task.c: 346: SetWarnEvent(&RunEventLED,4,25,20);
	movlw	(04h)
	movwf	(?_SetWarnEvent)
	movlw	(019h)
	movwf	0+(?_SetWarnEvent)+01h
	movlw	(014h)
	movwf	0+(?_SetWarnEvent)+02h
	movlw	(_RunEventLED)&0ffh
	fcall	_SetWarnEvent
	line	347
	
l15931:	
;task.c: 347: RunLED.ShowEventOld = 0x00;
	clrf	0+(_RunLED)+04h
	line	348
	
l15933:	
;task.c: 348: RunEventLED.ShowTask = 0;
	clrf	0+(_RunEventLED)+02h
	line	349
	
l15935:	
;task.c: 349: LedsInfoFlag.bits.b3 = 1;
	bsf	(_LedsInfoFlag),3
	line	352
	
l15937:	
;task.c: 350: }
;task.c: 352: if(SysInfoFlag.bits.b3 == 0)
	btfsc	(_SysInfoFlag),3
	goto	u3471
	goto	u3470
u3471:
	goto	l15959
u3470:
	line	354
	
l15939:	
;task.c: 353: {
;task.c: 354: if(GetADC.BatteryVoltage >= 3950)
	movlw	high(0F6Eh)
	subwf	1+(_GetADC)+04h,w
	movlw	low(0F6Eh)
	skipnz
	subwf	0+(_GetADC)+04h,w
	skipc
	goto	u3481
	goto	u3480
u3481:
	goto	l15955
u3480:
	line	356
	
l15941:	
;task.c: 355: {
;task.c: 356: if(GetADC.BatteryVoltage >= 4220 || PAD6 == 1 || GetADC.BatteryPercent >= 100)
	movlw	high(0107Ch)
	subwf	1+(_GetADC)+04h,w
	movlw	low(0107Ch)
	skipnz
	subwf	0+(_GetADC)+04h,w
	skipnc
	goto	u3491
	goto	u3490
u3491:
	goto	l15947
u3490:
	
l15943:	
	btfsc	(46/8),(46)&7
	goto	u3501
	goto	u3500
u3501:
	goto	l15947
u3500:
	
l15945:	
	movlw	(064h)
	subwf	0+(_GetADC)+0Ch,w
	skipc
	goto	u3511
	goto	u3510
u3511:
	goto	l15955
u3510:
	line	358
	
l15947:	
;task.c: 357: {
;task.c: 358: if(TimeCnt.RechgFullTime < 20) TimeCnt.RechgFullTime++;
	movlw	high(014h)
	bsf	status, 6	;RP1=1, select bank2
	subwf	1+(345)^0100h+01h,w
	movlw	low(014h)
	skipnz
	subwf	0+(345)^0100h+01h,w
	skipnc
	goto	u3521
	goto	u3520
u3521:
	goto	l15951
u3520:
	
l15949:	
	incf	0+(345)^0100h+01h,f
	skipnz
	incf	1+(345)^0100h+01h,f
	goto	l10179
	line	361
	
l15951:	
;task.c: 359: else
;task.c: 360: {
;task.c: 361: TimeCnt.RechgFullTime = 0;
	clrf	0+(345)^0100h+01h
	clrf	1+(345)^0100h+01h
	line	362
	
l15953:	
;task.c: 362: SysInfoFlag.bits.b3 = 1;
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_SysInfoFlag),3
	goto	l10179
	line	365
	
l15955:	
;task.c: 365: else TimeCnt.RechgFullTime = 0;
	bsf	status, 6	;RP1=1, select bank2
	clrf	0+(345)^0100h+01h
	clrf	1+(345)^0100h+01h
	goto	l10179
	line	371
	
l15959:	
;task.c: 369: else
;task.c: 370: {
;task.c: 371: if(RunEventLED.EmEvent == 4 && GetADC.BatteryPercent == 100)
	movf	0+(_RunEventLED)+03h,w
	xorlw	04h
	skipz
	goto	u3531
	goto	u3530
u3531:
	goto	l10179
u3530:
	
l15961:	
	movf	0+(_GetADC)+0Ch,w
	xorlw	064h
	skipz
	goto	u3541
	goto	u3540
u3541:
	goto	l10179
u3540:
	line	373
	
l15963:	
;task.c: 372: {
;task.c: 373: SetWarnEvent(&RunEventLED,5,25,40);
	movlw	(05h)
	movwf	(?_SetWarnEvent)
	movlw	(019h)
	movwf	0+(?_SetWarnEvent)+01h
	movlw	(028h)
	movwf	0+(?_SetWarnEvent)+02h
	movlw	(_RunEventLED)&0ffh
	fcall	_SetWarnEvent
	line	374
	
l15965:	
;task.c: 374: GetADC.BatteryLevel = GetADC.BatteryPercent;
	movf	0+(_GetADC)+0Ch,w
	movwf	0+(_GetADC)+01h
	line	375
	
l15967:	
;task.c: 375: RunEventLED.ShowTask = 0;
	clrf	0+(_RunEventLED)+02h
	line	376
	
l15969:	
;task.c: 376: TimeCnt.RechgFullTime = 0;
	bsf	status, 6	;RP1=1, select bank2
	clrf	0+(345)^0100h+01h
	clrf	1+(345)^0100h+01h
	line	377
	
l15971:	
;task.c: 377: LedsInfoFlag.bits.b3 = 0;
	bcf	status, 6	;RP1=0, select bank0
	bcf	(_LedsInfoFlag),3
	line	378
	
l15973:	
;task.c: 378: RunLED.ShowBatLxCnt = 0x00;
	clrf	0+(_RunLED)+05h
	line	379
	
l15975:	
;task.c: 379: RunLED.TaskBatLx = 0;
	clrf	0+(_RunLED)+06h
	goto	l10179
	line	385
	
l15977:	
;task.c: 383: else
;task.c: 384: {
;task.c: 385: if(RunEventLED.EmEvent == 0 && LedsInfoFlag.bits.b0 == 0)
	movf	0+(_RunEventLED)+03h,f
	skipz
	goto	u3551
	goto	u3550
u3551:
	goto	l10179
u3550:
	
l15979:	
	btfsc	(_LedsInfoFlag),0
	goto	u3561
	goto	u3560
u3561:
	goto	l10179
u3560:
	line	387
	
l15981:	
;task.c: 386: {
;task.c: 387: if(TimeCnt.SleepTime<300) TimeCnt.SleepTime++;
	movlw	high(012Ch)
	bsf	status, 6	;RP1=1, select bank2
	subwf	1+(345)^0100h+03h,w
	movlw	low(012Ch)
	skipnz
	subwf	0+(345)^0100h+03h,w
	skipnc
	goto	u3571
	goto	u3570
u3571:
	goto	l10177
u3570:
	
l15983:	
	incf	0+(345)^0100h+03h,f
	skipnz
	incf	1+(345)^0100h+03h,f
	goto	l10179
	line	388
	
l10177:	
;task.c: 388: else SysInfoFlag.bits.b0 = 0;
	bcf	status, 6	;RP1=0, select bank0
	bcf	(_SysInfoFlag),0
	line	391
	
l10179:	
	return
	opt stack 0
GLOBAL	__end_of_PlugProgress
	__end_of_PlugProgress:
;; =============== function _PlugProgress ends ============

	signat	_PlugProgress,88
	global	_ReadChargerState
psect	text739,local,class=CODE,delta=2
global __ptext739
__ptext739:

;; *************** function _ReadChargerState *****************
;; Defined at:
;;		line 224 in file "E:\workSpace\git_work\jm\P2\code\key.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 0/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3  BANK2h  BANK2l
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_SetWarnEvent
;;		_SetShowBatLxLED
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text739
	file	"E:\workSpace\git_work\jm\P2\code\key.c"
	line	224
	global	__size_of_ReadChargerState
	__size_of_ReadChargerState	equ	__end_of_ReadChargerState-_ReadChargerState
	
_ReadChargerState:	
	opt	stack 3
; Regs used in _ReadChargerState: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	225
	
l15885:	
;key.c: 225: if(SysInfoFlag.bits.b2 != 0)
	btfss	(_SysInfoFlag),2
	goto	u3381
	goto	u3380
u3381:
	goto	l4974
u3380:
	line	227
	
l15887:	
;key.c: 226: {
;key.c: 227: if(PAD6 == 0)
	btfsc	(46/8),(46)&7
	goto	u3391
	goto	u3390
u3391:
	goto	l15913
u3390:
	line	229
	
l15889:	
;key.c: 228: {
;key.c: 229: ReadPort.ChargerCnt++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(_ReadPort)^080h,f
	line	230
	
l15891:	
;key.c: 230: if(ReadPort.ChargerCnt >= 3)
	movlw	(03h)
	subwf	(_ReadPort)^080h,w
	skipc
	goto	u3401
	goto	u3400
u3401:
	goto	l4985
u3400:
	line	232
	
l15893:	
;key.c: 231: {
;key.c: 232: SysInfoFlag.bits.b2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(_SysInfoFlag),2
	line	233
;key.c: 233: SysInfoFlag.bits.b3 = 0;
	bcf	(_SysInfoFlag),3
	line	234
	
l15895:	
;key.c: 234: ReadPort.ChargerCnt = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_ReadPort)^080h
	line	235
;key.c: 235: TimeCnt.SleepTime = 0;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	0+(345)^0100h+03h
	clrf	1+(345)^0100h+03h
	line	237
	
l15897:	
;key.c: 237: if(RunEventLED.EmEvent >= 4 || RunEventLED.EmEvent < 7)
	movlw	(04h)
	bcf	status, 6	;RP1=0, select bank0
	subwf	0+(_RunEventLED)+03h,w
	skipnc
	goto	u3411
	goto	u3410
u3411:
	goto	l15901
u3410:
	
l15899:	
	movlw	(07h)
	subwf	0+(_RunEventLED)+03h,w
	skipnc
	goto	u3421
	goto	u3420
u3421:
	goto	l4980
u3420:
	line	239
	
l15901:	
;key.c: 238: {
;key.c: 239: SetWarnEvent(&RunEventLED,6,25,8);
	movlw	(06h)
	movwf	(?_SetWarnEvent)
	movlw	(019h)
	movwf	0+(?_SetWarnEvent)+01h
	movlw	(08h)
	movwf	0+(?_SetWarnEvent)+02h
	movlw	(_RunEventLED)&0ffh
	fcall	_SetWarnEvent
	line	241
	
l15903:	
;key.c: 241: RunEventLED.ShowTask = 0;
	clrf	0+(_RunEventLED)+02h
	line	242
	
l15905:	
;key.c: 242: LedsInfoFlag.bits.b3 = 0;
	bcf	(_LedsInfoFlag),3
	line	243
	
l15907:	
;key.c: 243: RunLED.ShowBatLxCnt = 0x00;
	clrf	0+(_RunLED)+05h
	line	244
	
l15909:	
;key.c: 244: RunLED.TaskBatLx = 0;
	clrf	0+(_RunLED)+06h
	line	245
	
l15911:	
;key.c: 245: SetShowBatLxLED(0x00);
	movlw	(0)
	fcall	_SetShowBatLxLED
	goto	l4985
	line	249
	
l15913:	
;key.c: 249: else ReadPort.ChargerCnt = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_ReadPort)^080h
	goto	l4985
	
l4980:	
	line	250
;key.c: 250: }
	goto	l4985
	line	251
	
l4974:	
	line	253
;key.c: 251: else
;key.c: 252: {
;key.c: 253: if(PAD6 == 1)
	btfss	(46/8),(46)&7
	goto	u3431
	goto	u3430
u3431:
	goto	l15913
u3430:
	line	255
	
l15915:	
;key.c: 254: {
;key.c: 255: ReadPort.ChargerCnt++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(_ReadPort)^080h,f
	line	256
	
l15917:	
;key.c: 256: if(ReadPort.ChargerCnt >= 3)
	movlw	(03h)
	subwf	(_ReadPort)^080h,w
	skipc
	goto	u3441
	goto	u3440
u3441:
	goto	l4985
u3440:
	line	258
	
l15919:	
;key.c: 257: {
;key.c: 258: SysInfoFlag.bits.b2 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(_SysInfoFlag),2
	line	259
;key.c: 259: SysInfoFlag.bits.b3 = 0;
	bcf	(_SysInfoFlag),3
	line	260
	
l15921:	
;key.c: 260: ReadPort.ChargerCnt = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_ReadPort)^080h
	line	261
;key.c: 261: TimeCnt.RechgFullTime = 0;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	0+(345)^0100h+01h
	clrf	1+(345)^0100h+01h
	line	266
	
l4985:	
	return
	opt stack 0
GLOBAL	__end_of_ReadChargerState
	__end_of_ReadChargerState:
;; =============== function _ReadChargerState ends ============

	signat	_ReadChargerState,88
	global	_SystemClockInit
psect	text740,local,class=CODE,delta=2
global __ptext740
__ptext740:

;; *************** function _SystemClockInit *****************
;; Defined at:
;;		line 40 in file "E:\workSpace\git_work\jm\P2\code\init.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3  BANK2h  BANK2l
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_Delay_16nop
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text740
	file	"E:\workSpace\git_work\jm\P2\code\init.c"
	line	40
	global	__size_of_SystemClockInit
	__size_of_SystemClockInit	equ	__end_of_SystemClockInit-_SystemClockInit
	
_SystemClockInit:	
	opt	stack 3
; Regs used in _SystemClockInit: [wreg+status,2+status,0+pclath+cstack]
	line	46
	
l15873:	
;init.c: 46: CLKCTL = (CLKCTL&0xFC)|0x03;
	movf	(15),w
	andlw	0FCh
	iorlw	03h
	movwf	(15)	;volatile
	line	47
	
l15875:	
;init.c: 47: Delay_16nop();
	fcall	_Delay_16nop
	line	49
	
l15877:	
;init.c: 49: CLKCTL = (CLKCTL&0xF7);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(15)+(3/8),(3)&7	;volatile
	line	50
	
l15879:	
;init.c: 50: Delay_16nop();
	fcall	_Delay_16nop
	line	52
	
l15881:	
;init.c: 52: CLKCTL = (CLKCTL|0x04);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(15)+(2/8),(2)&7	;volatile
	line	53
	
l15883:	
;init.c: 53: Delay_16nop();
	fcall	_Delay_16nop
	line	54
	
l3284:	
	return
	opt stack 0
GLOBAL	__end_of_SystemClockInit
	__end_of_SystemClockInit:
;; =============== function _SystemClockInit ends ============

	signat	_SystemClockInit,88
	global	___aldiv
psect	text741,local,class=CODE,delta=2
global __ptext741
__ptext741:

;; *************** function ___aldiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\aldiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         4    0[BANK0 ] long 
;;  dividend        4    4[BANK0 ] long 
;; Auto vars:     Size  Location     Type
;;  quotient        4   10[BANK0 ] long 
;;  sign            1    9[BANK0 ] unsigned char 
;;  counter         1    8[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    0[BANK0 ] long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3  BANK2h  BANK2l
;;      Params:         0       8       0       0       0       0
;;      Locals:         0       6       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0      14       0       0       0       0
;;Total ram usage:       14 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text741
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\aldiv.c"
	line	5
	global	__size_of___aldiv
	__size_of___aldiv	equ	__end_of___aldiv-___aldiv
	
___aldiv:	
	opt	stack 4
; Regs used in ___aldiv: [wreg+status,2+status,0]
	line	9
	
l15833:	
	clrf	(___aldiv@sign)
	line	10
	
l15835:	
	btfss	(___aldiv@divisor+3),7
	goto	u3311
	goto	u3310
u3311:
	goto	l13222
u3310:
	line	11
	
l15837:	
	comf	(___aldiv@divisor),f
	comf	(___aldiv@divisor+1),f
	comf	(___aldiv@divisor+2),f
	comf	(___aldiv@divisor+3),f
	incf	(___aldiv@divisor),f
	skipnz
	incf	(___aldiv@divisor+1),f
	skipnz
	incf	(___aldiv@divisor+2),f
	skipnz
	incf	(___aldiv@divisor+3),f
	line	12
	clrf	(___aldiv@sign)
	incf	(___aldiv@sign),f
	line	13
	
l13222:	
	line	14
	btfss	(___aldiv@dividend+3),7
	goto	u3321
	goto	u3320
u3321:
	goto	l15843
u3320:
	line	15
	
l15839:	
	comf	(___aldiv@dividend),f
	comf	(___aldiv@dividend+1),f
	comf	(___aldiv@dividend+2),f
	comf	(___aldiv@dividend+3),f
	incf	(___aldiv@dividend),f
	skipnz
	incf	(___aldiv@dividend+1),f
	skipnz
	incf	(___aldiv@dividend+2),f
	skipnz
	incf	(___aldiv@dividend+3),f
	line	16
	
l15841:	
	movlw	(01h)
	xorwf	(___aldiv@sign),f
	line	18
	
l15843:	
	clrf	(___aldiv@quotient)
	clrf	(___aldiv@quotient+1)
	clrf	(___aldiv@quotient+2)
	clrf	(___aldiv@quotient+3)
	line	19
	
l15845:	
	movf	(___aldiv@divisor+3),w
	iorwf	(___aldiv@divisor+2),w
	iorwf	(___aldiv@divisor+1),w
	iorwf	(___aldiv@divisor),w
	skipnz
	goto	u3331
	goto	u3330
u3331:
	goto	l15865
u3330:
	line	20
	
l15847:	
	clrf	(___aldiv@counter)
	incf	(___aldiv@counter),f
	line	21
	goto	l15851
	line	22
	
l15849:	
	clrc
	rlf	(___aldiv@divisor),f
	rlf	(___aldiv@divisor+1),f
	rlf	(___aldiv@divisor+2),f
	rlf	(___aldiv@divisor+3),f
	line	23
	incf	(___aldiv@counter),f
	line	21
	
l15851:	
	btfss	(___aldiv@divisor+3),(31)&7
	goto	u3341
	goto	u3340
u3341:
	goto	l15849
u3340:
	line	26
	
l15853:	
	clrc
	rlf	(___aldiv@quotient),f
	rlf	(___aldiv@quotient+1),f
	rlf	(___aldiv@quotient+2),f
	rlf	(___aldiv@quotient+3),f
	line	27
	
l15855:	
	movf	(___aldiv@divisor+3),w
	subwf	(___aldiv@dividend+3),w
	skipz
	goto	u3355
	movf	(___aldiv@divisor+2),w
	subwf	(___aldiv@dividend+2),w
	skipz
	goto	u3355
	movf	(___aldiv@divisor+1),w
	subwf	(___aldiv@dividend+1),w
	skipz
	goto	u3355
	movf	(___aldiv@divisor),w
	subwf	(___aldiv@dividend),w
u3355:
	skipc
	goto	u3351
	goto	u3350
u3351:
	goto	l15861
u3350:
	line	28
	
l15857:	
	movf	(___aldiv@divisor),w
	subwf	(___aldiv@dividend),f
	movf	(___aldiv@divisor+1),w
	skipc
	incfsz	(___aldiv@divisor+1),w
	subwf	(___aldiv@dividend+1),f
	movf	(___aldiv@divisor+2),w
	skipc
	incfsz	(___aldiv@divisor+2),w
	subwf	(___aldiv@dividend+2),f
	movf	(___aldiv@divisor+3),w
	skipc
	incfsz	(___aldiv@divisor+3),w
	subwf	(___aldiv@dividend+3),f
	line	29
	
l15859:	
	bsf	(___aldiv@quotient)+(0/8),(0)&7
	line	31
	
l15861:	
	clrc
	rrf	(___aldiv@divisor+3),f
	rrf	(___aldiv@divisor+2),f
	rrf	(___aldiv@divisor+1),f
	rrf	(___aldiv@divisor),f
	line	32
	
l15863:	
	decfsz	(___aldiv@counter),f
	goto	u3361
	goto	u3360
u3361:
	goto	l15853
u3360:
	line	34
	
l15865:	
	movf	(___aldiv@sign),w
	skipz
	goto	u3370
	goto	l15869
u3370:
	line	35
	
l15867:	
	comf	(___aldiv@quotient),f
	comf	(___aldiv@quotient+1),f
	comf	(___aldiv@quotient+2),f
	comf	(___aldiv@quotient+3),f
	incf	(___aldiv@quotient),f
	skipnz
	incf	(___aldiv@quotient+1),f
	skipnz
	incf	(___aldiv@quotient+2),f
	skipnz
	incf	(___aldiv@quotient+3),f
	line	36
	
l15869:	
	movf	(___aldiv@quotient+3),w
	movwf	(?___aldiv+3)
	movf	(___aldiv@quotient+2),w
	movwf	(?___aldiv+2)
	movf	(___aldiv@quotient+1),w
	movwf	(?___aldiv+1)
	movf	(___aldiv@quotient),w
	movwf	(?___aldiv)

	line	37
	
l13232:	
	return
	opt stack 0
GLOBAL	__end_of___aldiv
	__end_of___aldiv:
;; =============== function ___aldiv ends ============

	signat	___aldiv,8316
	global	___lldiv
psect	text742,local,class=CODE,delta=2
global __ptext742
__ptext742:

;; *************** function ___lldiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lldiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         4   12[BANK0 ] unsigned long 
;;  dividend        4   16[BANK0 ] unsigned long 
;; Auto vars:     Size  Location     Type
;;  quotient        4   20[BANK0 ] unsigned long 
;;  counter         1   24[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4   12[BANK0 ] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3  BANK2h  BANK2l
;;      Params:         0       8       0       0       0       0
;;      Locals:         0       5       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0      13       0       0       0       0
;;Total ram usage:       13 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ReadLoadRes
;;		_PowerProgress
;; This function uses a non-reentrant model
;;
psect	text742
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lldiv.c"
	line	5
	global	__size_of___lldiv
	__size_of___lldiv	equ	__end_of___lldiv-___lldiv
	
___lldiv:	
	opt	stack 3
; Regs used in ___lldiv: [wreg+status,2+status,0]
	line	9
	
l15807:	
	clrf	(___lldiv@quotient)
	clrf	(___lldiv@quotient+1)
	clrf	(___lldiv@quotient+2)
	clrf	(___lldiv@quotient+3)
	line	10
	
l15809:	
	movf	(___lldiv@divisor+3),w
	iorwf	(___lldiv@divisor+2),w
	iorwf	(___lldiv@divisor+1),w
	iorwf	(___lldiv@divisor),w
	skipnz
	goto	u3271
	goto	u3270
u3271:
	goto	l15829
u3270:
	line	11
	
l15811:	
	clrf	(___lldiv@counter)
	incf	(___lldiv@counter),f
	line	12
	goto	l15815
	line	13
	
l15813:	
	clrc
	rlf	(___lldiv@divisor),f
	rlf	(___lldiv@divisor+1),f
	rlf	(___lldiv@divisor+2),f
	rlf	(___lldiv@divisor+3),f
	line	14
	incf	(___lldiv@counter),f
	line	12
	
l15815:	
	btfss	(___lldiv@divisor+3),(31)&7
	goto	u3281
	goto	u3280
u3281:
	goto	l15813
u3280:
	line	17
	
l15817:	
	clrc
	rlf	(___lldiv@quotient),f
	rlf	(___lldiv@quotient+1),f
	rlf	(___lldiv@quotient+2),f
	rlf	(___lldiv@quotient+3),f
	line	18
	
l15819:	
	movf	(___lldiv@divisor+3),w
	subwf	(___lldiv@dividend+3),w
	skipz
	goto	u3295
	movf	(___lldiv@divisor+2),w
	subwf	(___lldiv@dividend+2),w
	skipz
	goto	u3295
	movf	(___lldiv@divisor+1),w
	subwf	(___lldiv@dividend+1),w
	skipz
	goto	u3295
	movf	(___lldiv@divisor),w
	subwf	(___lldiv@dividend),w
u3295:
	skipc
	goto	u3291
	goto	u3290
u3291:
	goto	l15825
u3290:
	line	19
	
l15821:	
	movf	(___lldiv@divisor),w
	subwf	(___lldiv@dividend),f
	movf	(___lldiv@divisor+1),w
	skipc
	incfsz	(___lldiv@divisor+1),w
	subwf	(___lldiv@dividend+1),f
	movf	(___lldiv@divisor+2),w
	skipc
	incfsz	(___lldiv@divisor+2),w
	subwf	(___lldiv@dividend+2),f
	movf	(___lldiv@divisor+3),w
	skipc
	incfsz	(___lldiv@divisor+3),w
	subwf	(___lldiv@dividend+3),f
	line	20
	
l15823:	
	bsf	(___lldiv@quotient)+(0/8),(0)&7
	line	22
	
l15825:	
	clrc
	rrf	(___lldiv@divisor+3),f
	rrf	(___lldiv@divisor+2),f
	rrf	(___lldiv@divisor+1),f
	rrf	(___lldiv@divisor),f
	line	23
	
l15827:	
	decfsz	(___lldiv@counter),f
	goto	u3301
	goto	u3300
u3301:
	goto	l15817
u3300:
	line	25
	
l15829:	
	movf	(___lldiv@quotient+3),w
	movwf	(?___lldiv+3)
	movf	(___lldiv@quotient+2),w
	movwf	(?___lldiv+2)
	movf	(___lldiv@quotient+1),w
	movwf	(?___lldiv+1)
	movf	(___lldiv@quotient),w
	movwf	(?___lldiv)

	line	26
	
l13206:	
	return
	opt stack 0
GLOBAL	__end_of___lldiv
	__end_of___lldiv:
;; =============== function ___lldiv ends ============

	signat	___lldiv,8316
	global	___lmul
psect	text743,local,class=CODE,delta=2
global __ptext743
__ptext743:

;; *************** function ___lmul *****************
;; Defined at:
;;		line 3 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      4    0[BANK0 ] unsigned long 
;;  multiplicand    4    4[BANK0 ] unsigned long 
;; Auto vars:     Size  Location     Type
;;  product         4    8[BANK0 ] unsigned long 
;; Return value:  Size  Location     Type
;;                  4    0[BANK0 ] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3  BANK2h  BANK2l
;;      Params:         0       8       0       0       0       0
;;      Locals:         0       4       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0      12       0       0       0       0
;;Total ram usage:       12 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ReadLoadRes
;;		_PowerProgress
;; This function uses a non-reentrant model
;;
psect	text743
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lmul.c"
	line	3
	global	__size_of___lmul
	__size_of___lmul	equ	__end_of___lmul-___lmul
	
___lmul:	
	opt	stack 3
; Regs used in ___lmul: [wreg+status,2+status,0]
	line	4
	
l15795:	
	clrf	(___lmul@product)
	clrf	(___lmul@product+1)
	clrf	(___lmul@product+2)
	clrf	(___lmul@product+3)
	line	6
	
l13007:	
	line	7
	btfss	(___lmul@multiplier),(0)&7
	goto	u3241
	goto	u3240
u3241:
	goto	l15799
u3240:
	line	8
	
l15797:	
	movf	(___lmul@multiplicand),w
	addwf	(___lmul@product),f
	movf	(___lmul@multiplicand+1),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u3251
	addwf	(___lmul@product+1),f
u3251:
	movf	(___lmul@multiplicand+2),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u3252
	addwf	(___lmul@product+2),f
u3252:
	movf	(___lmul@multiplicand+3),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u3253
	addwf	(___lmul@product+3),f
u3253:

	line	9
	
l15799:	
	clrc
	rlf	(___lmul@multiplicand),f
	rlf	(___lmul@multiplicand+1),f
	rlf	(___lmul@multiplicand+2),f
	rlf	(___lmul@multiplicand+3),f
	line	10
	
l15801:	
	clrc
	rrf	(___lmul@multiplier+3),f
	rrf	(___lmul@multiplier+2),f
	rrf	(___lmul@multiplier+1),f
	rrf	(___lmul@multiplier),f
	line	11
	movf	(___lmul@multiplier+3),w
	iorwf	(___lmul@multiplier+2),w
	iorwf	(___lmul@multiplier+1),w
	iorwf	(___lmul@multiplier),w
	skipz
	goto	u3261
	goto	u3260
u3261:
	goto	l13007
u3260:
	line	12
	
l15803:	
	movf	(___lmul@product+3),w
	movwf	(?___lmul+3)
	movf	(___lmul@product+2),w
	movwf	(?___lmul+2)
	movf	(___lmul@product+1),w
	movwf	(?___lmul+1)
	movf	(___lmul@product),w
	movwf	(?___lmul)

	line	13
	
l13010:	
	return
	opt stack 0
GLOBAL	__end_of___lmul
	__end_of___lmul:
;; =============== function ___lmul ends ============

	signat	___lmul,8316
	global	_SetShowBatLxLED
psect	text744,local,class=CODE,delta=2
global __ptext744
__ptext744:

;; *************** function _SetShowBatLxLED *****************
;; Defined at:
;;		line 78 in file "E:\workSpace\git_work\jm\P2\code\LED.c"
;; Parameters:    Size  Location     Type
;;  ShowBatLx       1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  ShowBatLx       1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3  BANK2h  BANK2l
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       1       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_gearSwitch
;;		_PortScan
;;		_ReadChargerState
;;		_ShowWarnLED
;;		_PowerProgress
;; This function uses a non-reentrant model
;;
psect	text744
	file	"E:\workSpace\git_work\jm\P2\code\LED.c"
	line	78
	global	__size_of_SetShowBatLxLED
	__size_of_SetShowBatLxLED	equ	__end_of_SetShowBatLxLED-_SetShowBatLxLED
	
_SetShowBatLxLED:	
	opt	stack 3
; Regs used in _SetShowBatLxLED: [wreg]
	line	79
	
l15677:	
;LED.c: 80: Com4SegLED.FlagByte = ShowBatLx;
	bcf	(_LedsInfoFlag),4
	line	81
;LED.c: 81: LedsInfoFlag.bits.b4 = 1;
	bsf	(_LedsInfoFlag),4
	line	82
	
l6606:	
	return
	opt stack 0
GLOBAL	__end_of_SetShowBatLxLED
	__end_of_SetShowBatLxLED:
;; =============== function _SetShowBatLxLED ends ============

	signat	_SetShowBatLxLED,4216
	global	_ShowSegmentLED
psect	text745,local,class=CODE,delta=2
global __ptext745
__ptext745:

;; *************** function _ShowSegmentLED *****************
;; Defined at:
;;		line 252 in file "E:\workSpace\git_work\jm\P2\code\LED.c"
;; Parameters:    Size  Location     Type
;;  ShowEvent       1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  ShowEvent       1    3[BANK0 ] unsigned char 
;;  temp_seg3       1    2[BANK0 ] unsigned char 
;;  temp_seg2       1    1[BANK0 ] unsigned char 
;;  temp_seg0       1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3  BANK2h  BANK2l
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       4       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_gearSwitch
;;		_PortScan
;;		_ShowWarnLED
;;		_PowerProgress
;; This function uses a non-reentrant model
;;
psect	text745
	file	"E:\workSpace\git_work\jm\P2\code\LED.c"
	line	252
	global	__size_of_ShowSegmentLED
	__size_of_ShowSegmentLED	equ	__end_of_ShowSegmentLED-_ShowSegmentLED
	
_ShowSegmentLED:	
	opt	stack 3
; Regs used in _ShowSegmentLED: [wreg-fsr0h+status,2+status,0]
;ShowSegmentLED@ShowEvent stored from wreg
	movwf	(ShowSegmentLED@ShowEvent)
	line	253
	
l15631:	
;LED.c: 253: unsigned char temp_seg0 = 0,temp_seg2 = 0,temp_seg3 = 0;
	clrf	(ShowSegmentLED@temp_seg0)
	clrf	(ShowSegmentLED@temp_seg3)
	line	255
	
l15633:	
;LED.c: 255: LedsInfoFlag.bits.b4 = 0;
	bcf	(_LedsInfoFlag),4
	line	256
;LED.c: 256: switch(ShowEvent)
	goto	l15669
	line	293
;LED.c: 293: default:
	
l6664:	
	line	294
;LED.c: 294: if((ShowEvent & 0x04) != 0)
	btfss	(ShowSegmentLED@ShowEvent),(2)&7
	goto	u3031
	goto	u3030
u3031:
	goto	l6671
u3030:
	line	296
	
l15635:	
;LED.c: 295: {
;LED.c: 296: temp_seg3 = GetADC.BatteryLevel;
	movf	0+(_GetADC)+01h,w
	movwf	(ShowSegmentLED@temp_seg3)
	line	298
;LED.c: 298: if(temp_seg3 >= 100)
	movlw	(064h)
	subwf	(ShowSegmentLED@temp_seg3),w
	skipc
	goto	u3041
	goto	u3040
u3041:
	goto	l15641
u3040:
	line	300
	
l15637:	
;LED.c: 299: {
;LED.c: 300: temp_seg0 |= 0x06;
	movlw	(06h)
	iorwf	(ShowSegmentLED@temp_seg0),f
	line	301
	
l15639:	
	line	302
;LED.c: 302: }
	goto	l6671
	line	305
	
l15641:	
;LED.c: 303: else
;LED.c: 304: {
;LED.c: 305: for(temp_seg2=0;temp_seg2<10;temp_seg2++)
	clrf	(ShowSegmentLED@temp_seg2)
	line	307
	
l15647:	
;LED.c: 306: {
;LED.c: 307: if(temp_seg3 < 10) break;
	movlw	(0Ah)
	subwf	(ShowSegmentLED@temp_seg3),w
	skipnc
	goto	u3051
	goto	u3050
u3051:
	goto	l15651
u3050:
	goto	l6671
	line	308
	
l15651:	
;LED.c: 308: temp_seg3 -= 10;
	movlw	low(0Ah)
	subwf	(ShowSegmentLED@temp_seg3),f
	line	305
	
l15653:	
	incf	(ShowSegmentLED@temp_seg2),f
	movlw	(0Ah)
	subwf	(ShowSegmentLED@temp_seg2),w
	skipc
	goto	u3061
	goto	u3060
u3061:
	goto	l15647
u3060:
	line	319
	
l6671:	
	line	321
;LED.c: 319: }
;LED.c: 321: if((ShowEvent & 0x08) != 0)
	btfss	(ShowSegmentLED@ShowEvent),(3)&7
	goto	u3071
	goto	u3070
u3071:
	goto	l6672
u3070:
	line	323
	
l15655:	
;LED.c: 322: {
;LED.c: 323: temp_seg0 |= 0x01;
	bsf	(ShowSegmentLED@temp_seg0)+(0/8),(0)&7
	line	324
	
l6672:	
	line	326
;LED.c: 324: }
;LED.c: 326: if((ShowEvent & 0x01) != 0)
	btfss	(ShowSegmentLED@ShowEvent),(0)&7
	goto	u3081
	goto	u3080
u3081:
	goto	l6673
u3080:
	line	328
	
l15657:	
;LED.c: 327: {
;LED.c: 328: temp_seg0 |= 0x80;
	bsf	(ShowSegmentLED@temp_seg0)+(7/8),(7)&7
	line	329
	
l6673:	
	line	331
;LED.c: 329: }
;LED.c: 331: if((ShowEvent & 0x02) != 0)
	btfss	(ShowSegmentLED@ShowEvent),(1)&7
	goto	u3091
	goto	u3090
u3091:
	goto	l15671
u3090:
	line	333
	
l15659:	
;LED.c: 332: {
;LED.c: 333: if(TimeCnt.SmokeTime < (200UL*275)) temp_seg0 |= 0x70;
	movlw	0
	bsf	status, 6	;RP1=1, select bank2
	subwf	3+(345)^0100h+07h,w
	skipz
	goto	u3105
	movlw	0
	subwf	2+(345)^0100h+07h,w
	skipz
	goto	u3105
	movlw	0D6h
	subwf	1+(345)^0100h+07h,w
	skipz
	goto	u3105
	movlw	0D8h
	subwf	0+(345)^0100h+07h,w
u3105:
	skipnc
	goto	u3101
	goto	u3100
u3101:
	goto	l15663
u3100:
	
l15661:	
	movlw	(070h)
	bcf	status, 6	;RP1=0, select bank0
	iorwf	(ShowSegmentLED@temp_seg0),f
	goto	l15671
	line	334
	
l15663:	
;LED.c: 334: else if(TimeCnt.SmokeTime < (200UL*510)) temp_seg0 |= 0x30;
	movlw	0
	subwf	3+(345)^0100h+07h,w
	skipz
	goto	u3115
	movlw	01h
	subwf	2+(345)^0100h+07h,w
	skipz
	goto	u3115
	movlw	08Eh
	subwf	1+(345)^0100h+07h,w
	skipz
	goto	u3115
	movlw	070h
	subwf	0+(345)^0100h+07h,w
u3115:
	skipnc
	goto	u3111
	goto	u3110
u3111:
	goto	l6677
u3110:
	
l15665:	
	movlw	(030h)
	bcf	status, 6	;RP1=0, select bank0
	iorwf	(ShowSegmentLED@temp_seg0),f
	goto	l15671
	line	335
	
l6677:	
;LED.c: 335: else temp_seg0 |= 0x10;
	bcf	status, 6	;RP1=0, select bank0
	bsf	(ShowSegmentLED@temp_seg0)+(4/8),(4)&7
	goto	l15671
	line	256
	
l15669:	
	movf	(ShowSegmentLED@ShowEvent),w
	; Switch size 1, requested type "space"
; Number of cases is 7, Range of values is 0 to 255
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           22    12 (average)
; jumptable            260     6 (fixed)
; rangetable           260     6 (fixed)
; spacedrange          518     9 (fixed)
; locatedrange         256     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l15671
	xorlw	15^0	; case 15
	skipnz
	goto	l15671
	xorlw	16^15	; case 16
	skipnz
	goto	l15671
	xorlw	64^16	; case 64
	skipnz
	goto	l15671
	xorlw	128^64	; case 128
	skipnz
	goto	l15671
	xorlw	192^128	; case 192
	skipnz
	goto	l15671
	xorlw	255^192	; case 255
	skipnz
	goto	l15671
	goto	l6664
	opt asmopt_on

	line	341
	
l15671:	
;LED.c: 341: RunLED.DisplayCnt = 0;
	clrf	0+(_RunLED)+03h
	line	342
	
l15673:	
;LED.c: 342: LedsInfoFlag.bits.b5 = 0;
	bcf	(_LedsInfoFlag),5
	line	343
	
l15675:	
;LED.c: 343: LedsInfoFlag.bits.b4 = 1;
	bsf	(_LedsInfoFlag),4
	line	344
	
l6679:	
	return
	opt stack 0
GLOBAL	__end_of_ShowSegmentLED
	__end_of_ShowSegmentLED:
;; =============== function _ShowSegmentLED ends ============

	signat	_ShowSegmentLED,4216
	global	_SetShowLED
psect	text746,local,class=CODE,delta=2
global __ptext746
__ptext746:

;; *************** function _SetShowLED *****************
;; Defined at:
;;		line 46 in file "E:\workSpace\git_work\jm\P2\code\LED.c"
;; Parameters:    Size  Location     Type
;;  LED_color       1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFFFFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3  BANK2h  BANK2l
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_gearSwitch
;;		_PortScan
;;		_ShowWarnLED
;;		_PowerProgress
;; This function uses a non-reentrant model
;;
psect	text746
	file	"E:\workSpace\git_work\jm\P2\code\LED.c"
	line	46
	global	__size_of_SetShowLED
	__size_of_SetShowLED	equ	__end_of_SetShowLED-_SetShowLED
	
_SetShowLED:	
	opt	stack 3
; Regs used in _SetShowLED: [wreg]
	line	48
	
l6600:	
	return
	opt stack 0
GLOBAL	__end_of_SetShowLED
	__end_of_SetShowLED:
;; =============== function _SetShowLED ends ============

	signat	_SetShowLED,4216
	global	_Delay_16nop
psect	text747,local,class=CODE,delta=2
global __ptext747
__ptext747:

;; *************** function _Delay_16nop *****************
;; Defined at:
;;		line 23 in file "E:\workSpace\git_work\jm\P2\code\init.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3  BANK2h  BANK2l
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_SystemClockInit
;;		_EnterSleep
;; This function uses a non-reentrant model
;;
psect	text747
	file	"E:\workSpace\git_work\jm\P2\code\init.c"
	line	23
	global	__size_of_Delay_16nop
	__size_of_Delay_16nop	equ	__end_of_Delay_16nop-_Delay_16nop
	
_Delay_16nop:	
	opt	stack 2
; Regs used in _Delay_16nop: []
	line	24
	
l15629:	
# 24 "E:\workSpace\git_work\jm\P2\code\init.c"
nop ;#
# 24 "E:\workSpace\git_work\jm\P2\code\init.c"
nop ;#
# 24 "E:\workSpace\git_work\jm\P2\code\init.c"
nop ;#
# 24 "E:\workSpace\git_work\jm\P2\code\init.c"
nop ;#
	line	25
# 25 "E:\workSpace\git_work\jm\P2\code\init.c"
nop ;#
# 25 "E:\workSpace\git_work\jm\P2\code\init.c"
nop ;#
# 25 "E:\workSpace\git_work\jm\P2\code\init.c"
nop ;#
# 25 "E:\workSpace\git_work\jm\P2\code\init.c"
nop ;#
	line	26
# 26 "E:\workSpace\git_work\jm\P2\code\init.c"
nop ;#
# 26 "E:\workSpace\git_work\jm\P2\code\init.c"
nop ;#
# 26 "E:\workSpace\git_work\jm\P2\code\init.c"
nop ;#
# 26 "E:\workSpace\git_work\jm\P2\code\init.c"
nop ;#
	line	27
# 27 "E:\workSpace\git_work\jm\P2\code\init.c"
nop ;#
# 27 "E:\workSpace\git_work\jm\P2\code\init.c"
nop ;#
# 27 "E:\workSpace\git_work\jm\P2\code\init.c"
nop ;#
# 27 "E:\workSpace\git_work\jm\P2\code\init.c"
nop ;#
psect	text747
	line	28
	
l3281:	
	return
	opt stack 0
GLOBAL	__end_of_Delay_16nop
	__end_of_Delay_16nop:
;; =============== function _Delay_16nop ends ============

	signat	_Delay_16nop,88
	global	_ScanShowBatLxLED
psect	text748,local,class=CODE,delta=2
global __ptext748
__ptext748:

;; *************** function _ScanShowBatLxLED *****************
;; Defined at:
;;		line 715 in file "E:\workSpace\git_work\jm\P2\code\LED.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3  BANK2h  BANK2l
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text748
	file	"E:\workSpace\git_work\jm\P2\code\LED.c"
	line	715
	global	__size_of_ScanShowBatLxLED
	__size_of_ScanShowBatLxLED	equ	__end_of_ScanShowBatLxLED-_ScanShowBatLxLED
	
_ScanShowBatLxLED:	
	opt	stack 4
; Regs used in _ScanShowBatLxLED: [wreg-fsr0h+status,2+status,0]
	line	716
	
l15497:	
;LED.c: 716: if(LedsInfoFlag.bits.b3 != 0)
	btfss	(_LedsInfoFlag),3
	goto	u2681
	goto	u2680
u2681:
	goto	l6789
u2680:
	line	718
	
l15499:	
;LED.c: 717: {
;LED.c: 718: if(RunLED.TaskBatLx) RunLED.TaskBatLx--;
	movf	0+(_RunLED)+06h,w
	skipz
	goto	u2690
	goto	l15503
u2690:
	
l15501:	
	decf	0+(_RunLED)+06h,f
	goto	l6789
	line	721
	
l15503:	
;LED.c: 719: else
;LED.c: 720: {
;LED.c: 721: RunLED.TaskBatLx = 10;
	movlw	(0Ah)
	movwf	0+(_RunLED)+06h
	line	723
;LED.c: 723: switch(RunLED.ShowBatLxCnt)
	goto	l15509
	line	751
	
l15505:	
;LED.c: 751: RunLED.ShowBatLxCnt = 0x00;
	clrf	0+(_RunLED)+05h
	line	752
;LED.c: 752: break;
	goto	l6771
	line	723
	
l15509:	
	movf	0+(_RunLED)+05h,w
	; Switch size 1, requested type "space"
; Number of cases is 8, Range of values is 1 to 8
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           25    13 (average)
; direct_byte           26    10 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	1^0	; case 1
	skipnz
	goto	l6771
	xorlw	2^1	; case 2
	skipnz
	goto	l6771
	xorlw	3^2	; case 3
	skipnz
	goto	l6771
	xorlw	4^3	; case 4
	skipnz
	goto	l6771
	xorlw	5^4	; case 5
	skipnz
	goto	l6771
	xorlw	6^5	; case 6
	skipnz
	goto	l6771
	xorlw	7^6	; case 7
	skipnz
	goto	l6771
	xorlw	8^7	; case 8
	skipnz
	goto	l6771
	goto	l15505
	opt asmopt_on

	line	753
	
l6771:	
	line	755
;LED.c: 755: if(LedsInfoFlag.bits.b7 != 0 && LedsInfoFlag.bits.b1 != 0)
	btfss	(_LedsInfoFlag),7
	goto	u2701
	goto	u2700
u2701:
	goto	l6780
u2700:
	
l15511:	
	btfss	(_LedsInfoFlag),1
	goto	u2711
	goto	u2710
u2711:
	goto	l6780
u2710:
	line	757
	
l15513:	
;LED.c: 756: {
;LED.c: 757: if(RunLED.ShowBatLxCnt < 8) RunLED.ShowBatLxCnt++;
	movlw	(08h)
	subwf	0+(_RunLED)+05h,w
	skipnc
	goto	u2721
	goto	u2720
u2721:
	goto	l6789
u2720:
	
l15515:	
	incf	0+(_RunLED)+05h,f
	goto	l6789
	line	759
	
l6780:	
;LED.c: 759: else if(LedsInfoFlag.bits.b7 != 0 && LedsInfoFlag.bits.b2 != 0)
	btfss	(_LedsInfoFlag),7
	goto	u2731
	goto	u2730
u2731:
	goto	l6783
u2730:
	
l15517:	
	btfss	(_LedsInfoFlag),2
	goto	u2741
	goto	u2740
u2741:
	goto	l6783
u2740:
	line	761
	
l15519:	
;LED.c: 760: {
;LED.c: 761: if(RunLED.ShowBatLxCnt) RunLED.ShowBatLxCnt--;
	movf	0+(_RunLED)+05h,w
	skipz
	goto	u2750
	goto	l6789
u2750:
	
l15521:	
	decf	0+(_RunLED)+05h,f
	goto	l6789
	line	763
	
l6783:	
;LED.c: 763: else if(SysInfoFlag.bits.b2 != 0)
	btfss	(_SysInfoFlag),2
	goto	u2761
	goto	u2760
u2761:
	goto	l6768
u2760:
	line	765
	
l15523:	
;LED.c: 764: {
;LED.c: 765: if(RunLED.ShowBatLxCnt < 8) RunLED.ShowBatLxCnt++;
	movlw	(08h)
	subwf	0+(_RunLED)+05h,w
	skipnc
	goto	u2771
	goto	u2770
u2771:
	goto	l15527
u2770:
	goto	l15515
	line	766
	
l15527:	
;LED.c: 766: else RunLED.ShowBatLxCnt = 0x00;
	clrf	0+(_RunLED)+05h
	goto	l6789
	line	768
	
l6768:	
	line	770
	
l6789:	
	return
	opt stack 0
GLOBAL	__end_of_ScanShowBatLxLED
	__end_of_ScanShowBatLxLED:
;; =============== function _ScanShowBatLxLED ends ============

	signat	_ScanShowBatLxLED,88
	global	_UpdateElectricityGrade
psect	text749,local,class=CODE,delta=2
global __ptext749
__ptext749:

;; *************** function _UpdateElectricityGrade *****************
;; Defined at:
;;		line 88 in file "E:\workSpace\git_work\jm\P2\code\modular.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  temp_TimeUp     2    3[BANK0 ] unsigned int 
;;  temp_Percent    1    5[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3  BANK2h  BANK2l
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       3       0       0       0       0
;;      Temps:          0       3       0       0       0       0
;;      Totals:         0       6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text749
	file	"E:\workSpace\git_work\jm\P2\code\modular.c"
	line	88
	global	__size_of_UpdateElectricityGrade
	__size_of_UpdateElectricityGrade	equ	__end_of_UpdateElectricityGrade-_UpdateElectricityGrade
	
_UpdateElectricityGrade:	
	opt	stack 4
; Regs used in _UpdateElectricityGrade: [wreg-fsr0h+status,2+status,0+btemp+1+pclath]
	line	91
	
l15377:	
;modular.c: 89: uint8_t temp_Percent;
;modular.c: 90: uint16_t temp_TimeUp;
;modular.c: 91: if(SysInfoFlag.bits.b5 != 0)
	btfss	(_SysInfoFlag),5
	goto	u2421
	goto	u2420
u2421:
	goto	l15477
u2420:
	line	97
	
l15379:	
;modular.c: 92: {
;modular.c: 97: if(VoutInfoFlag.bits.b7 != 0)
	btfss	(_VoutInfoFlag),7
	goto	u2431
	goto	u2430
u2431:
	goto	l8408
u2430:
	line	99
	
l15381:	
;modular.c: 98: {
;modular.c: 99: GetADC.PercentAddCount = 0;
	clrf	0+(_GetADC)+0Dh
	clrf	1+(_GetADC)+0Dh
	line	100
;modular.c: 100: GetADC.PercentSubCount = 0;
	clrf	0+(_GetADC)+0Fh
	clrf	1+(_GetADC)+0Fh
	line	102
;modular.c: 102: }
	goto	l8445
	line	103
	
l8408:	
	line	105
;modular.c: 103: else
;modular.c: 104: {
;modular.c: 105: if(SysInfoFlag.bits.b2 != 0)
	btfss	(_SysInfoFlag),2
	goto	u2441
	goto	u2440
u2441:
	goto	l15429
u2440:
	line	107
	
l15383:	
;modular.c: 106: {
;modular.c: 107: if((GetADC.BatteryVoltage + 20) < GetADC.BatteryVoltageOld && SysInfoFlag.bits.b1 == 0)
	movf	0+(_GetADC)+04h,w
	addlw	low(014h)
	movwf	(??_UpdateElectricityGrade+0)+0
	movf	1+(_GetADC)+04h,w
	skipnc
	addlw	1
	addlw	high(014h)
	movwf	1+(??_UpdateElectricityGrade+0)+0
	movf	1+(_GetADC)+011h,w
	subwf	1+(??_UpdateElectricityGrade+0)+0,w
	skipz
	goto	u2455
	movf	0+(_GetADC)+011h,w
	subwf	0+(??_UpdateElectricityGrade+0)+0,w
u2455:
	skipnc
	goto	u2451
	goto	u2450
u2451:
	goto	l15395
u2450:
	
l15385:	
	btfsc	(_SysInfoFlag),1
	goto	u2461
	goto	u2460
u2461:
	goto	l15395
u2460:
	line	109
	
l15387:	
;modular.c: 108: {
;modular.c: 109: GetADC.PercentAddCount = 0;
	clrf	0+(_GetADC)+0Dh
	clrf	1+(_GetADC)+0Dh
	line	110
	
l15389:	
;modular.c: 110: GetADC.PercentSubCount++;
	incf	0+(_GetADC)+0Fh,f
	skipnz
	incf	1+(_GetADC)+0Fh,f
	line	111
	
l15391:	
;modular.c: 111: if(GetADC.PercentSubCount >= 100)
	movlw	high(064h)
	subwf	1+(_GetADC)+0Fh,w
	movlw	low(064h)
	skipnz
	subwf	0+(_GetADC)+0Fh,w
	skipc
	goto	u2471
	goto	u2470
u2471:
	goto	l15411
u2470:
	line	113
	
l15393:	
;modular.c: 112: {
;modular.c: 113: GetADC.PercentSubCount = 0;
	clrf	0+(_GetADC)+0Fh
	clrf	1+(_GetADC)+0Fh
	goto	l15411
	line	119
	
l15395:	
;modular.c: 117: else
;modular.c: 118: {
;modular.c: 119: GetADC.PercentSubCount = 0;
	clrf	0+(_GetADC)+0Fh
	clrf	1+(_GetADC)+0Fh
	line	121
	
l15397:	
;modular.c: 121: SysInfoFlag.bits.b1 = 1;
	bsf	(_SysInfoFlag),1
	line	123
	
l15399:	
;modular.c: 123: if(SysInfoFlag.bits.b3 == 0 && GetADC.BatteryVoltage < 4020)
	btfsc	(_SysInfoFlag),3
	goto	u2481
	goto	u2480
u2481:
	goto	l15405
u2480:
	
l15401:	
	movlw	high(0FB4h)
	subwf	1+(_GetADC)+04h,w
	movlw	low(0FB4h)
	skipnz
	subwf	0+(_GetADC)+04h,w
	skipnc
	goto	u2491
	goto	u2490
u2491:
	goto	l15405
u2490:
	line	125
	
l15403:	
;modular.c: 124: {
;modular.c: 125: if(GetADC.BatteryVoltage >= (D_BatVol_Table[GetADC.BatteryPercent] ))
	clrc
	rlf	0+(_GetADC)+0Ch,w
	addlw	low(_D_BatVol_Table|8000h)
	movwf	fsr0
	movlw	high(_D_BatVol_Table|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	(??_UpdateElectricityGrade+0)+0
	fcall	stringtab
	movwf	(??_UpdateElectricityGrade+0)+0+1
	movf	1+(??_UpdateElectricityGrade+0)+0,w
	subwf	1+(_GetADC)+04h,w
	skipz
	goto	u2505
	movf	0+(??_UpdateElectricityGrade+0)+0,w
	subwf	0+(_GetADC)+04h,w
u2505:
	skipc
	goto	u2501
	goto	u2500
u2501:
	goto	l15407
u2500:
	line	127
	
l15405:	
;modular.c: 126: {
;modular.c: 127: GetADC.PercentAddCount++;
	incf	0+(_GetADC)+0Dh,f
	skipnz
	incf	1+(_GetADC)+0Dh,f
	line	128
;modular.c: 128: }
	goto	l15411
	line	131
	
l15407:	
;modular.c: 129: else
;modular.c: 130: {
;modular.c: 131: GetADC.PercentAddCount = 0;
	clrf	0+(_GetADC)+0Dh
	clrf	1+(_GetADC)+0Dh
	line	140
	
l15411:	
;modular.c: 137: }
;modular.c: 138: }
;modular.c: 140: if(GetADC.BatteryPercent >= 10 && GetADC.BatteryPercent < 90) temp_TimeUp = 3000;
	movlw	(0Ah)
	subwf	0+(_GetADC)+0Ch,w
	skipc
	goto	u2511
	goto	u2510
u2511:
	goto	l15417
u2510:
	
l15413:	
	movlw	(05Ah)
	subwf	0+(_GetADC)+0Ch,w
	skipnc
	goto	u2521
	goto	u2520
u2521:
	goto	l15417
u2520:
	
l15415:	
	movlw	low(0BB8h)
	movwf	(UpdateElectricityGrade@temp_TimeUp)
	movlw	high(0BB8h)
	movwf	((UpdateElectricityGrade@temp_TimeUp))+1
	goto	l8419
	line	141
	
l15417:	
;modular.c: 141: else temp_TimeUp = 4000;
	movlw	low(0FA0h)
	movwf	(UpdateElectricityGrade@temp_TimeUp)
	movlw	high(0FA0h)
	movwf	((UpdateElectricityGrade@temp_TimeUp))+1
	
l8419:	
	line	142
;modular.c: 142: if(GetADC.PercentAddCount >= temp_TimeUp)
	movf	(UpdateElectricityGrade@temp_TimeUp+1),w
	subwf	1+(_GetADC)+0Dh,w
	skipz
	goto	u2535
	movf	(UpdateElectricityGrade@temp_TimeUp),w
	subwf	0+(_GetADC)+0Dh,w
u2535:
	skipc
	goto	u2531
	goto	u2530
u2531:
	goto	l8445
u2530:
	line	144
	
l15419:	
;modular.c: 143: {
;modular.c: 144: GetADC.PercentAddCount = 0;
	clrf	0+(_GetADC)+0Dh
	clrf	1+(_GetADC)+0Dh
	line	145
	
l15421:	
;modular.c: 145: if(GetADC.BatteryPercent < 100) GetADC.BatteryPercent++;
	movlw	(064h)
	subwf	0+(_GetADC)+0Ch,w
	skipnc
	goto	u2541
	goto	u2540
u2541:
	goto	l15425
u2540:
	
l15423:	
	incf	0+(_GetADC)+0Ch,f
	line	147
	
l15425:	
;modular.c: 147: if(GetADC.BatteryPercent) VoutInfoFlag.bits.b3 = 0;
	movf	0+(_GetADC)+0Ch,w
	skipz
	goto	u2550
	goto	l8409
u2550:
	
l15427:	
	bcf	(_VoutInfoFlag),3
	goto	l8445
	line	152
	
l15429:	
;modular.c: 150: else
;modular.c: 151: {
;modular.c: 152: GetADC.PercentAddCount = 0;
	clrf	0+(_GetADC)+0Dh
	clrf	1+(_GetADC)+0Dh
	line	154
	
l15431:	
;modular.c: 154: if(GetADC.BatteryPercent >= 2)
	movlw	(02h)
	subwf	0+(_GetADC)+0Ch,w
	skipc
	goto	u2561
	goto	u2560
u2561:
	goto	l15459
u2560:
	line	156
	
l15433:	
;modular.c: 155: {
;modular.c: 156: if(GetADC.BatteryVoltage < D_BatVol_Table[GetADC.BatteryPercent])
	clrc
	rlf	0+(_GetADC)+0Ch,w
	addlw	low(_D_BatVol_Table|8000h)
	movwf	fsr0
	movlw	high(_D_BatVol_Table|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	(??_UpdateElectricityGrade+0)+0
	fcall	stringtab
	movwf	(??_UpdateElectricityGrade+0)+0+1
	movf	1+(??_UpdateElectricityGrade+0)+0,w
	subwf	1+(_GetADC)+04h,w
	skipz
	goto	u2575
	movf	0+(??_UpdateElectricityGrade+0)+0,w
	subwf	0+(_GetADC)+04h,w
u2575:
	skipnc
	goto	u2571
	goto	u2570
u2571:
	goto	l15437
u2570:
	line	158
	
l15435:	
;modular.c: 157: {
;modular.c: 158: GetADC.PercentSubCount++;
	incf	0+(_GetADC)+0Fh,f
	skipnz
	incf	1+(_GetADC)+0Fh,f
	line	159
;modular.c: 159: }
	goto	l15439
	line	162
	
l15437:	
;modular.c: 160: else
;modular.c: 161: {
;modular.c: 162: GetADC.PercentSubCount = 0;
	clrf	0+(_GetADC)+0Fh
	clrf	1+(_GetADC)+0Fh
	line	165
	
l15439:	
;modular.c: 163: }
;modular.c: 165: if(GetADC.PercentSubCount >= 100)
	movlw	high(064h)
	subwf	1+(_GetADC)+0Fh,w
	movlw	low(064h)
	skipnz
	subwf	0+(_GetADC)+0Fh,w
	skipc
	goto	u2581
	goto	u2580
u2581:
	goto	l8445
u2580:
	line	167
	
l15441:	
;modular.c: 166: {
;modular.c: 167: GetADC.PercentSubCount = 0;
	clrf	0+(_GetADC)+0Fh
	clrf	1+(_GetADC)+0Fh
	line	169
	
l15443:	
;modular.c: 169: temp_Percent = GetADC.BatteryPercent;
	movf	0+(_GetADC)+0Ch,w
	movwf	(UpdateElectricityGrade@temp_Percent)
	line	170
;modular.c: 170: while(temp_Percent)
	goto	l15451
	line	172
	
l15445:	
;modular.c: 171: {
;modular.c: 172: temp_Percent--;
	decf	(UpdateElectricityGrade@temp_Percent),f
	line	173
	
l15447:	
;modular.c: 173: if(GetADC.BatteryVoltage >= D_BatVol_Table[temp_Percent]) break;
	clrc
	rlf	(UpdateElectricityGrade@temp_Percent),w
	addlw	low(_D_BatVol_Table|8000h)
	movwf	fsr0
	movlw	high(_D_BatVol_Table|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	(??_UpdateElectricityGrade+0)+0
	fcall	stringtab
	movwf	(??_UpdateElectricityGrade+0)+0+1
	movf	1+(??_UpdateElectricityGrade+0)+0,w
	subwf	1+(_GetADC)+04h,w
	skipz
	goto	u2595
	movf	0+(??_UpdateElectricityGrade+0)+0,w
	subwf	0+(_GetADC)+04h,w
u2595:
	skipc
	goto	u2591
	goto	u2590
u2591:
	goto	l15451
u2590:
	goto	l15453
	line	170
	
l15451:	
	movf	(UpdateElectricityGrade@temp_Percent),f
	skipz
	goto	u2601
	goto	u2600
u2601:
	goto	l15445
u2600:
	line	176
	
l15453:	
;modular.c: 174: }
;modular.c: 176: if((temp_Percent + 30) < GetADC.BatteryPercent)
	movf	(UpdateElectricityGrade@temp_Percent),w
	addlw	low(01Eh)
	movwf	(??_UpdateElectricityGrade+0)+0
	movlw	high(01Eh)
	skipnc
	movlw	(high(01Eh)+1)&0ffh
	movwf	((??_UpdateElectricityGrade+0)+0)+1
	movf	1+(??_UpdateElectricityGrade+0)+0,w
	xorlw	80h
	movwf	(??_UpdateElectricityGrade+2)+0
	movlw	80h
	subwf	(??_UpdateElectricityGrade+2)+0,w
	skipz
	goto	u2615
	movf	0+(_GetADC)+0Ch,w
	subwf	0+(??_UpdateElectricityGrade+0)+0,w
u2615:

	skipnc
	goto	u2611
	goto	u2610
u2611:
	goto	l8409
u2610:
	line	178
	
l15455:	
;modular.c: 177: {
;modular.c: 178: GetADC.BatteryPercent = temp_Percent;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(UpdateElectricityGrade@temp_Percent),w
	movwf	0+(_GetADC)+0Ch
	line	180
	
l15457:	
;modular.c: 180: SysInfoFlag.bits.b1 = 1;
	bsf	(_SysInfoFlag),1
	goto	l8445
	line	188
	
l15459:	
;modular.c: 186: else
;modular.c: 187: {
;modular.c: 188: if(GetADC.BatteryVoltage < 3250)
	movlw	high(0CB2h)
	subwf	1+(_GetADC)+04h,w
	movlw	low(0CB2h)
	skipnz
	subwf	0+(_GetADC)+04h,w
	skipnc
	goto	u2621
	goto	u2620
u2621:
	goto	l15469
u2620:
	line	190
	
l15461:	
;modular.c: 189: {
;modular.c: 190: GetADC.PercentSubCount++;
	incf	0+(_GetADC)+0Fh,f
	skipnz
	incf	1+(_GetADC)+0Fh,f
	line	191
	
l15463:	
;modular.c: 191: if(GetADC.PercentSubCount >= 100)
	movlw	high(064h)
	subwf	1+(_GetADC)+0Fh,w
	movlw	low(064h)
	skipnz
	subwf	0+(_GetADC)+0Fh,w
	skipc
	goto	u2631
	goto	u2630
u2631:
	goto	l8409
u2630:
	line	193
	
l15465:	
;modular.c: 192: {
;modular.c: 193: GetADC.PercentSubCount = 0;
	clrf	0+(_GetADC)+0Fh
	clrf	1+(_GetADC)+0Fh
	line	194
;modular.c: 194: GetADC.BatteryPercent = 0;
	clrf	0+(_GetADC)+0Ch
	goto	l15457
	line	201
	
l15469:	
;modular.c: 199: else
;modular.c: 200: {
;modular.c: 201: GetADC.PercentSubCount = 0;
	clrf	0+(_GetADC)+0Fh
	clrf	1+(_GetADC)+0Fh
	line	202
	
l15471:	
;modular.c: 202: if(GetADC.BatteryVoltage < 3300 )
	movlw	high(0CE4h)
	subwf	1+(_GetADC)+04h,w
	movlw	low(0CE4h)
	skipnz
	subwf	0+(_GetADC)+04h,w
	skipnc
	goto	u2641
	goto	u2640
u2641:
	goto	l8409
u2640:
	line	204
	
l15473:	
;modular.c: 203: {
;modular.c: 204: GetADC.BatteryPercent = 0;
	clrf	0+(_GetADC)+0Ch
	goto	l15457
	line	211
	
l8409:	
	line	212
;modular.c: 207: }
;modular.c: 208: }
;modular.c: 209: }
;modular.c: 210: }
;modular.c: 211: }
;modular.c: 212: }
	goto	l8445
	line	215
	
l15477:	
;modular.c: 213: else
;modular.c: 214: {
;modular.c: 215: if(RunEventLED.EmEvent != 16)
	movf	0+(_RunEventLED)+03h,w
	xorlw	010h
	skipnz
	goto	u2651
	goto	u2650
u2651:
	goto	l15495
u2650:
	line	217
	
l15479:	
;modular.c: 216: {
;modular.c: 217: SysInfoFlag.bits.b5 = 1;
	bsf	(_SysInfoFlag),5
	line	218
	
l15481:	
;modular.c: 218: GetADC.PercentAddCount = 0;
	clrf	0+(_GetADC)+0Dh
	clrf	1+(_GetADC)+0Dh
	line	219
;modular.c: 219: GetADC.PercentSubCount = 0;
	clrf	0+(_GetADC)+0Fh
	clrf	1+(_GetADC)+0Fh
	line	220
	
l15483:	
;modular.c: 220: SysInfoFlag.bits.b1 = 1;
	bsf	(_SysInfoFlag),1
	line	221
;modular.c: 221: for(GetADC.BatteryPercent = 0;GetADC.BatteryPercent<100;GetADC.BatteryPercent++)
	clrf	0+(_GetADC)+0Ch
	goto	l15491
	line	223
	
l15485:	
;modular.c: 222: {
;modular.c: 223: if(GetADC.BatteryVoltageOld < D_BatVol_Table[GetADC.BatteryPercent]) break;
	clrc
	rlf	0+(_GetADC)+0Ch,w
	addlw	low(_D_BatVol_Table|8000h)
	movwf	fsr0
	movlw	high(_D_BatVol_Table|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	(??_UpdateElectricityGrade+0)+0
	fcall	stringtab
	movwf	(??_UpdateElectricityGrade+0)+0+1
	movf	1+(??_UpdateElectricityGrade+0)+0,w
	subwf	1+(_GetADC)+011h,w
	skipz
	goto	u2665
	movf	0+(??_UpdateElectricityGrade+0)+0,w
	subwf	0+(_GetADC)+011h,w
u2665:
	skipnc
	goto	u2661
	goto	u2660
u2661:
	goto	l15489
u2660:
	goto	l15493
	line	221
	
l15489:	
	incf	0+(_GetADC)+0Ch,f
	
l15491:	
	movlw	(064h)
	subwf	0+(_GetADC)+0Ch,w
	skipc
	goto	u2671
	goto	u2670
u2671:
	goto	l15485
u2670:
	line	226
	
l15493:	
;modular.c: 224: }
;modular.c: 226: GetADC.BatteryLevel = GetADC.BatteryPercent;
	movf	0+(_GetADC)+0Ch,w
	movwf	0+(_GetADC)+01h
	line	227
;modular.c: 227: }
	goto	l8445
	line	230
	
l15495:	
;modular.c: 228: else
;modular.c: 229: {
;modular.c: 230: GetADC.BatteryVoltageOld = GetADC.BatteryVoltage;
	movf	1+(_GetADC)+04h,w
	movwf	1+(_GetADC)+011h
	movf	0+(_GetADC)+04h,w
	movwf	0+(_GetADC)+011h
	line	233
	
l8445:	
	return
	opt stack 0
GLOBAL	__end_of_UpdateElectricityGrade
	__end_of_UpdateElectricityGrade:
;; =============== function _UpdateElectricityGrade ends ============

	signat	_UpdateElectricityGrade,88
	global	_HAL_ADC_Sample
psect	text750,local,class=CODE,delta=2
global __ptext750
__ptext750:

;; *************** function _HAL_ADC_Sample *****************
;; Defined at:
;;		line 47 in file "E:\workSpace\git_work\jm\P2\code\modular.c"
;; Parameters:    Size  Location     Type
;;  ADC_CHx         1    wreg     unsigned char 
;;  Filter          1    0[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  ADC_CHx         1    4[BANK0 ] unsigned char 
;;  Value           2   12[BANK0 ] unsigned int 
;;  Value_Max       2   10[BANK0 ] unsigned int 
;;  Value_Min       2    8[BANK0 ] unsigned int 
;;  Value_Sum       2    5[BANK0 ] unsigned int 
;;  i_max           1    7[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3  BANK2h  BANK2l
;;      Params:         0       2       0       0       0       0
;;      Locals:         0      10       0       0       0       0
;;      Temps:          0       2       0       0       0       0
;;      Totals:         0      14       0       0       0       0
;;Total ram usage:       14 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_ReadLoadRes
;;		_PowerProgress
;; This function uses a non-reentrant model
;;
psect	text750
	file	"E:\workSpace\git_work\jm\P2\code\modular.c"
	line	47
	global	__size_of_HAL_ADC_Sample
	__size_of_HAL_ADC_Sample	equ	__end_of_HAL_ADC_Sample-_HAL_ADC_Sample
	
_HAL_ADC_Sample:	
	opt	stack 3
; Regs used in _HAL_ADC_Sample: [wreg+status,2+status,0]
;HAL_ADC_Sample@ADC_CHx stored from wreg
	movwf	(HAL_ADC_Sample@ADC_CHx)
	line	48
	
l15335:	
	
l15337:	
	movlw	low(01000h)
	movwf	(HAL_ADC_Sample@Value_Min)
	movlw	high(01000h)
	movwf	((HAL_ADC_Sample@Value_Min))+1
	
l15339:	
	clrf	(HAL_ADC_Sample@Value_Max)
	clrf	(HAL_ADC_Sample@Value_Max+1)
	
l15341:	
	clrf	(HAL_ADC_Sample@Value_Sum)
	clrf	(HAL_ADC_Sample@Value_Sum+1)
	line	49
	
l15343:	
;modular.c: 49: unsigned char i_max = 0;
	clrf	(HAL_ADC_Sample@i_max)
	line	51
	
l15345:	
;modular.c: 51: ADCTL2 &= 0xE0;
	movlw	(0E0h)
	andwf	(25),f	;volatile
	line	52
	
l15347:	
;modular.c: 52: ADCTL2 |= ADC_CHx;
	movf	(HAL_ADC_Sample@ADC_CHx),w
	iorwf	(25),f	;volatile
	line	56
	
l15349:	
;modular.c: 55: {
;modular.c: 56: ADST = 1;
	bsf	(195/8),(195)&7
	line	57
;modular.c: 57: while(ADST != 0);
	
l8393:	
	btfsc	(195/8),(195)&7
	goto	u2361
	goto	u2360
u2361:
	goto	l8393
u2360:
	line	58
	
l15351:	
;modular.c: 58: Value = ADCDH;
	movf	(23),w	;volatile
	movwf	(HAL_ADC_Sample@Value)
	clrf	(HAL_ADC_Sample@Value+1)
	line	59
;modular.c: 59: Value <<= 4;
	swapf	(HAL_ADC_Sample@Value),f
	swapf	(HAL_ADC_Sample@Value+1),f
	movlw	0f0h
	andwf	(HAL_ADC_Sample@Value+1),f
	movf	(HAL_ADC_Sample@Value),w
	andlw	0fh
	iorwf	(HAL_ADC_Sample@Value+1),f
	movlw	0f0h
	andwf	(HAL_ADC_Sample@Value),f
	line	60
	
l15353:	
;modular.c: 60: Value |= (ADCTL>>4);
	swapf	(24),w	;volatile
	andlw	(0ffh shr 4) & 0ffh
	iorwf	(HAL_ADC_Sample@Value),f
	line	62
	
l15355:	
;modular.c: 62: if(Value < Value_Min) Value_Min = Value;
	movf	(HAL_ADC_Sample@Value_Min+1),w
	subwf	(HAL_ADC_Sample@Value+1),w
	skipz
	goto	u2375
	movf	(HAL_ADC_Sample@Value_Min),w
	subwf	(HAL_ADC_Sample@Value),w
u2375:
	skipnc
	goto	u2371
	goto	u2370
u2371:
	goto	l8396
u2370:
	
l15357:	
	movf	(HAL_ADC_Sample@Value+1),w
	movwf	(HAL_ADC_Sample@Value_Min+1)
	movf	(HAL_ADC_Sample@Value),w
	movwf	(HAL_ADC_Sample@Value_Min)
	
l8396:	
	line	63
;modular.c: 63: if(Value >= Value_Max) Value_Max = Value;
	movf	(HAL_ADC_Sample@Value_Max+1),w
	subwf	(HAL_ADC_Sample@Value+1),w
	skipz
	goto	u2385
	movf	(HAL_ADC_Sample@Value_Max),w
	subwf	(HAL_ADC_Sample@Value),w
u2385:
	skipc
	goto	u2381
	goto	u2380
u2381:
	goto	l8397
u2380:
	
l15359:	
	movf	(HAL_ADC_Sample@Value+1),w
	movwf	(HAL_ADC_Sample@Value_Max+1)
	movf	(HAL_ADC_Sample@Value),w
	movwf	(HAL_ADC_Sample@Value_Max)
	
l8397:	
	line	64
;modular.c: 64: Value_Sum += Value;
	movf	(HAL_ADC_Sample@Value),w
	addwf	(HAL_ADC_Sample@Value_Sum),f
	skipnc
	incf	(HAL_ADC_Sample@Value_Sum+1),f
	movf	(HAL_ADC_Sample@Value+1),w
	addwf	(HAL_ADC_Sample@Value_Sum+1),f
	line	66
;modular.c: 66: if(Filter != 0)
	movf	(HAL_ADC_Sample@Filter),w
	skipz
	goto	u2390
	goto	l15367
u2390:
	line	68
	
l15361:	
;modular.c: 67: {
;modular.c: 68: i_max++;
	incf	(HAL_ADC_Sample@i_max),f
	line	69
	
l15363:	
;modular.c: 69: if(i_max>=6) break;
	movlw	(06h)
	subwf	(HAL_ADC_Sample@i_max),w
	skipc
	goto	u2401
	goto	u2400
u2401:
	goto	l15349
u2400:
	line	74
	
l15367:	
;modular.c: 72: }
;modular.c: 74: if(Filter != 0) Value = (Value_Sum-Value_Min-Value_Max)>>2;
	movf	(HAL_ADC_Sample@Filter),w
	skipz
	goto	u2410
	goto	l15373
u2410:
	
l15369:	
	movf	(HAL_ADC_Sample@Value_Max),w
	addwf	(HAL_ADC_Sample@Value_Min),w
	movwf	(??_HAL_ADC_Sample+0)+0
	movf	(HAL_ADC_Sample@Value_Max+1),w
	skipnc
	incf	(HAL_ADC_Sample@Value_Max+1),w
	addwf	(HAL_ADC_Sample@Value_Min+1),w
	movwf	1+(??_HAL_ADC_Sample+0)+0
	comf	(??_HAL_ADC_Sample+0)+0,f
	comf	(??_HAL_ADC_Sample+0)+1,f
	incf	(??_HAL_ADC_Sample+0)+0,f
	skipnz
	incf	(??_HAL_ADC_Sample+0)+1,f
	movf	0+(??_HAL_ADC_Sample+0)+0,w
	movwf	(HAL_ADC_Sample@Value)
	movf	1+(??_HAL_ADC_Sample+0)+0,w
	movwf	(HAL_ADC_Sample@Value+1)
	
l15371:	
	movf	(HAL_ADC_Sample@Value_Sum),w
	addwf	(HAL_ADC_Sample@Value),f
	skipnc
	incf	(HAL_ADC_Sample@Value+1),f
	movf	(HAL_ADC_Sample@Value_Sum+1),w
	addwf	(HAL_ADC_Sample@Value+1),f
	clrc
	rrf	(HAL_ADC_Sample@Value+1),f
	rrf	(HAL_ADC_Sample@Value),f
	clrc
	rrf	(HAL_ADC_Sample@Value+1),f
	rrf	(HAL_ADC_Sample@Value),f
	line	76
	
l15373:	
;modular.c: 76: return Value;
	movf	(HAL_ADC_Sample@Value+1),w
	movwf	(?_HAL_ADC_Sample+1)
	movf	(HAL_ADC_Sample@Value),w
	movwf	(?_HAL_ADC_Sample)
	line	77
	
l8404:	
	return
	opt stack 0
GLOBAL	__end_of_HAL_ADC_Sample
	__end_of_HAL_ADC_Sample:
;; =============== function _HAL_ADC_Sample ends ============

	signat	_HAL_ADC_Sample,8314
	global	_ClearAllRAM
psect	text751,local,class=CODE,delta=2
global __ptext751
__ptext751:

;; *************** function _ClearAllRAM *****************
;; Defined at:
;;		line 247 in file "E:\workSpace\git_work\jm\P2\code\init.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/40
;;		On exit  : 20/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3  BANK2h  BANK2l
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text751
	file	"E:\workSpace\git_work\jm\P2\code\init.c"
	line	247
	global	__size_of_ClearAllRAM
	__size_of_ClearAllRAM	equ	__end_of_ClearAllRAM-_ClearAllRAM
	
_ClearAllRAM:	
	opt	stack 4
; Regs used in _ClearAllRAM: [wreg+status,2+status,0]
	line	248
	
l15303:	
;init.c: 248: IRP = 0;
	bcf	(31/8),(31)&7
	line	249
	
l15305:	
;init.c: 249: for(FSR = 0x20; FSR < 0x80; FSR++)
	movlw	(020h)
	movwf	(4)	;volatile
	movlw	(080h)
	subwf	(4),w	;volatile
	skipc
	goto	u2301
	goto	u2300
u2301:
	goto	l15309
u2300:
	goto	l15315
	line	251
	
l15309:	
;init.c: 250: {
;init.c: 251: INDF = 0;
	bcf	status, 6	;RP1=0, select bank0
	clrf	(0)	;volatile
	line	249
	
l15311:	
	incf	(4),f	;volatile
	
l15313:	
	movlw	(080h)
	subwf	(4),w	;volatile
	skipc
	goto	u2311
	goto	u2310
u2311:
	goto	l15309
u2310:
	line	254
	
l15315:	
;init.c: 252: }
;init.c: 254: for(FSR = 0xA0; FSR < 0xF0; FSR++)
	movlw	(0A0h)
	movwf	(4)	;volatile
	movlw	(0F0h)
	subwf	(4),w	;volatile
	skipc
	goto	u2321
	goto	u2320
u2321:
	goto	l15319
u2320:
	goto	l3299
	line	256
	
l15319:	
;init.c: 255: {
;init.c: 256: INDF = 0;
	bcf	status, 6	;RP1=0, select bank0
	clrf	(0)	;volatile
	line	254
	
l15321:	
	incf	(4),f	;volatile
	
l15323:	
	movlw	(0F0h)
	subwf	(4),w	;volatile
	skipc
	goto	u2331
	goto	u2330
u2331:
	goto	l15319
u2330:
	
l3299:	
	line	259
;init.c: 257: }
;init.c: 259: IRP = 1;
	bsf	(31/8),(31)&7
	line	260
	
l15325:	
;init.c: 260: for(FSR = 0x20; FSR < 0x60; FSR++)
	movlw	(020h)
	movwf	(4)	;volatile
	movlw	(060h)
	subwf	(4),w	;volatile
	skipc
	goto	u2341
	goto	u2340
u2341:
	goto	l15329
u2340:
	goto	l3301
	line	262
	
l15329:	
;init.c: 261: {
;init.c: 262: INDF = 0;
	bcf	status, 6	;RP1=0, select bank0
	clrf	(0)	;volatile
	line	260
	
l15331:	
	incf	(4),f	;volatile
	
l15333:	
	movlw	(060h)
	subwf	(4),w	;volatile
	skipc
	goto	u2351
	goto	u2350
u2351:
	goto	l15329
u2350:
	
l3301:	
	line	266
;init.c: 263: }
;init.c: 266: IRP = 0;RP0 = 0;RP1 = 0;
	bcf	(31/8),(31)&7
	bcf	(29/8),(29)&7
	bcf	(30/8),(30)&7
	line	267
	
l3302:	
	return
	opt stack 0
GLOBAL	__end_of_ClearAllRAM
	__end_of_ClearAllRAM:
;; =============== function _ClearAllRAM ends ============

	signat	_ClearAllRAM,88
	global	_SetWarnEvent
psect	text752,local,class=CODE,delta=2
global __ptext752
__ptext752:

;; *************** function _SetWarnEvent *****************
;; Defined at:
;;		line 96 in file "E:\workSpace\git_work\jm\P2\code\LED.c"
;; Parameters:    Size  Location     Type
;;  EmRunEvent      1    wreg     PTR struct .
;;		 -> RunEventLED(4), 
;;  WarnEvent       1    0[BANK0 ] unsigned char 
;;  WarnShowTime    1    1[BANK0 ] unsigned char 
;;  WarnShowCnt     1    2[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  EmRunEvent      1    3[BANK0 ] PTR struct .
;;		 -> RunEventLED(4), 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3  BANK2h  BANK2l
;;      Params:         0       3       0       0       0       0
;;      Locals:         0       1       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_gearSwitch
;;		_PortScan
;;		_ReadChargerState
;;		_PowerProgress
;;		_PlugProgress
;; This function uses a non-reentrant model
;;
psect	text752
	file	"E:\workSpace\git_work\jm\P2\code\LED.c"
	line	96
	global	__size_of_SetWarnEvent
	__size_of_SetWarnEvent	equ	__end_of_SetWarnEvent-_SetWarnEvent
	
_SetWarnEvent:	
	opt	stack 3
; Regs used in _SetWarnEvent: [wregfsr0]
;SetWarnEvent@EmRunEvent stored from wreg
	movwf	(SetWarnEvent@EmRunEvent)
	line	97
	
l15301:	
;LED.c: 97: EmRunEvent->EmEvent = WarnEvent;
	movf	(SetWarnEvent@EmRunEvent),w
	addlw	03h
	movwf	fsr0
	movf	(SetWarnEvent@WarnEvent),w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	98
;LED.c: 98: EmRunEvent->FlashTimes = WarnShowCnt;
	movf	(SetWarnEvent@EmRunEvent),w
	addlw	01h
	movwf	fsr0
	movf	(SetWarnEvent@WarnShowCnt),w
	movwf	indf
	line	99
;LED.c: 99: EmRunEvent->ShowTime = WarnShowTime;
	movf	(SetWarnEvent@EmRunEvent),w
	movwf	fsr0
	movf	(SetWarnEvent@WarnShowTime),w
	movwf	indf
	line	100
;LED.c: 100: EmRunEvent->ShowTask = WarnShowTime;
	movf	(SetWarnEvent@EmRunEvent),w
	addlw	02h
	movwf	fsr0
	movf	(SetWarnEvent@WarnShowTime),w
	movwf	indf
	line	101
	
l6609:	
	return
	opt stack 0
GLOBAL	__end_of_SetWarnEvent
	__end_of_SetWarnEvent:
;; =============== function _SetWarnEvent ends ============

	signat	_SetWarnEvent,16504
	global	_SetOffNotifyLED
psect	text753,local,class=CODE,delta=2
global __ptext753
__ptext753:

;; *************** function _SetOffNotifyLED *****************
;; Defined at:
;;		line 59 in file "E:\workSpace\git_work\jm\P2\code\LED.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3  BANK2h  BANK2l
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_gearSwitch
;;		_PortScan
;;		_PowerProgress
;; This function uses a non-reentrant model
;;
psect	text753
	file	"E:\workSpace\git_work\jm\P2\code\LED.c"
	line	59
	global	__size_of_SetOffNotifyLED
	__size_of_SetOffNotifyLED	equ	__end_of_SetOffNotifyLED-_SetOffNotifyLED
	
_SetOffNotifyLED:	
	opt	stack 3
; Regs used in _SetOffNotifyLED: [wreg+status,2]
	line	60
	
l15295:	
;LED.c: 60: LedsInfoFlag.bits.b0 = 0;
	bcf	(_LedsInfoFlag),0
	line	61
;LED.c: 61: LedsInfoFlag.bits.b6 = 0;
	bcf	(_LedsInfoFlag),6
	line	62
;LED.c: 62: LedsInfoFlag.bits.b7 = 0;
	bcf	(_LedsInfoFlag),7
	line	63
;LED.c: 63: LedsInfoFlag.bits.b2 = 0;
	bcf	(_LedsInfoFlag),2
	line	64
;LED.c: 64: LedsInfoFlag.bits.b1 = 1;
	bsf	(_LedsInfoFlag),1
	line	65
	
l15297:	
;LED.c: 65: RunLED.NotifyLedCycle = 100;
	movlw	(064h)
	movwf	0+(_RunLED)+02h
	line	66
	
l15299:	
;LED.c: 66: RunLED.NotifyLedDuty = 0;
	clrf	0+(_RunLED)+01h
	line	67
	
l6603:	
	return
	opt stack 0
GLOBAL	__end_of_SetOffNotifyLED
	__end_of_SetOffNotifyLED:
;; =============== function _SetOffNotifyLED ends ============

	signat	_SetOffNotifyLED,88
	global	_KeyUpStopSmoke
psect	text754,local,class=CODE,delta=2
global __ptext754
__ptext754:

;; *************** function _KeyUpStopSmoke *****************
;; Defined at:
;;		line 192 in file "E:\workSpace\git_work\jm\P2\code\key.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 40/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3  BANK2h  BANK2l
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_PortScan
;;		_PowerProgress
;; This function uses a non-reentrant model
;;
psect	text754
	file	"E:\workSpace\git_work\jm\P2\code\key.c"
	line	192
	global	__size_of_KeyUpStopSmoke
	__size_of_KeyUpStopSmoke	equ	__end_of_KeyUpStopSmoke-_KeyUpStopSmoke
	
_KeyUpStopSmoke:	
	opt	stack 3
; Regs used in _KeyUpStopSmoke: [wreg+status,2+status,0]
	line	193
	
l15267:	
;key.c: 193: if(VoutInfoFlag.bits.b7 != 0)
	bcf	status, 5	;RP0=0, select bank0
	btfss	(_VoutInfoFlag),7
	goto	u2291
	goto	u2290
u2291:
	goto	l4971
u2290:
	line	195
	
l15269:	
;key.c: 194: {
;key.c: 195: VoutInfoFlag.bits.b7 = 0;
	bcf	(_VoutInfoFlag),7
	line	196
;key.c: 196: LVDIE = 0;
	bcf	(104/8),(104)&7
	line	197
;key.c: 197: VoutInfoFlag.bits.b6 = 0;
	bcf	(_VoutInfoFlag),6
	line	198
;key.c: 198: PAD4 = 1;
	bsf	(44/8),(44)&7
	line	199
	
l15271:	
;key.c: 199: FlagSmoke = 0x0000;
	bsf	status, 6	;RP1=1, select bank2
	clrf	(356)^0100h	;volatile
	clrf	(356+1)^0100h	;volatile
	line	200
	
l15273:	
;key.c: 200: ReadPort.KeyState &= 0x4F;
	movlw	(04Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	andwf	0+(_ReadPort)^080h+04h,f
	line	201
	
l15275:	
;key.c: 201: PAMOD54 = PAMOD54 & 0x0F | 0x90;
	movf	(135)^080h,w
	andlw	0Fh
	iorlw	090h
	movwf	(135)^080h	;volatile
	line	202
	
l15277:	
;key.c: 202: PAD3 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(43/8),(43)&7
	line	203
	
l15279:	
;key.c: 203: LedsInfoFlag.bits.b0 = 0;
	bcf	(_LedsInfoFlag),0
	line	204
	
l15281:	
;key.c: 204: LedsInfoFlag.bits.b6 = 0;
	bcf	(_LedsInfoFlag),6
	line	205
	
l15283:	
;key.c: 205: LedsInfoFlag.bits.b1 = 0;
	bcf	(_LedsInfoFlag),1
	line	206
	
l15285:	
;key.c: 206: LedsInfoFlag.bits.b2 = 1;
	bsf	(_LedsInfoFlag),2
	line	207
	
l15287:	
;key.c: 207: LedsInfoFlag.bits.b7 = 1;
	bsf	(_LedsInfoFlag),7
	line	208
	
l15289:	
;key.c: 208: LedsInfoFlag.bits.b0 = 1;
	bsf	(_LedsInfoFlag),0
	line	209
	
l15291:	
;key.c: 209: RunEventLED.FlashTimes = 8;
	movlw	(08h)
	movwf	0+(_RunEventLED)+01h
	line	210
	
l15293:	
;key.c: 210: RunEventLED.ShowTask = 0;
	clrf	0+(_RunEventLED)+02h
	line	213
	
l4971:	
	return
	opt stack 0
GLOBAL	__end_of_KeyUpStopSmoke
	__end_of_KeyUpStopSmoke:
;; =============== function _KeyUpStopSmoke ends ============

	signat	_KeyUpStopSmoke,88
	global	_MCU_INIT_TIMER
psect	text755,local,class=CODE,delta=2
global __ptext755
__ptext755:

;; *************** function _MCU_INIT_TIMER *****************
;; Defined at:
;;		line 139 in file "E:\workSpace\git_work\jm\P2\code\init.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 40/20
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3  BANK2h  BANK2l
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_EnterSleep
;; This function uses a non-reentrant model
;;
psect	text755
	file	"E:\workSpace\git_work\jm\P2\code\init.c"
	line	139
	global	__size_of_MCU_INIT_TIMER
	__size_of_MCU_INIT_TIMER	equ	__end_of_MCU_INIT_TIMER-_MCU_INIT_TIMER
	
_MCU_INIT_TIMER:	
	opt	stack 2
; Regs used in _MCU_INIT_TIMER: [wreg+status,2+status,0]
	line	141
	
l15237:	
;init.c: 141: TM0CTL |= 0x40;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(17)+(6/8),(6)&7	;volatile
	line	142
;init.c: 142: TM0IE = 0;
	bcf	(92/8),(92)&7
	line	143
;init.c: 143: TM0IF = 0;
	bcf	(100/8),(100)&7
	line	144
;init.c: 144: TM0CTL &= 0xEF;
	bcf	(17)+(4/8),(4)&7	;volatile
	line	145
	
l15239:	
;init.c: 145: TM0CTL &= 0xF0;TM0CTL |= 0x02;
	movlw	(0F0h)
	andwf	(17),f	;volatile
	
l15241:	
	bsf	(17)+(1/8),(1)&7	;volatile
	line	146
	
l15243:	
;init.c: 146: TM0 = 256 - 100;
	movlw	(09Ch)
	movwf	(1)	;volatile
	line	147
	
l15245:	
;init.c: 147: TM0RLD = 256 - 100;
	movlw	(09Ch)
	movwf	(16)	;volatile
	line	150
	
l15247:	
;init.c: 150: TM1CTL |= 0x40;
	bsf	(20)+(6/8),(6)&7	;volatile
	line	151
	
l15249:	
;init.c: 151: TM1IE = 0;
	bcf	(93/8),(93)&7
	line	152
	
l15251:	
;init.c: 152: TM1IF = 0;
	bcf	(101/8),(101)&7
	line	153
;init.c: 153: TM1CTL &= 0xF0;TM1CTL |= 0x05;
	movlw	(0F0h)
	andwf	(20),f	;volatile
	movlw	(05h)
	iorwf	(20),f	;volatile
	line	154
	
l15253:	
;init.c: 154: TM1 = 256 - 125;
	movlw	(083h)
	movwf	(18)	;volatile
	line	155
	
l15255:	
;init.c: 155: TM1RLD = 256 - 125;
	movlw	(083h)
	movwf	(19)	;volatile
	line	158
	
l15257:	
;init.c: 158: T2CTL |= 0x10;
	bsf	(21)+(4/8),(4)&7	;volatile
	line	159
	
l15259:	
;init.c: 159: T2IE = 0;
	bcf	(94/8),(94)&7
	line	160
	
l15261:	
;init.c: 160: T2IF = 0;
	bcf	(102/8),(102)&7
	line	161
;init.c: 161: T2CTL &= 0xFC;
	movlw	(0FCh)
	andwf	(21),f	;volatile
	line	164
	
l15263:	
;init.c: 164: TM0IE = 1;
	bsf	(92/8),(92)&7
	line	165
	
l15265:	
;init.c: 165: TM0CTL &= 0xBF;
	bcf	(17)+(6/8),(6)&7	;volatile
	line	172
	
l3293:	
	return
	opt stack 0
GLOBAL	__end_of_MCU_INIT_TIMER
	__end_of_MCU_INIT_TIMER:
;; =============== function _MCU_INIT_TIMER ends ============

	signat	_MCU_INIT_TIMER,88
	global	_Init_BOD_WDT
psect	text756,local,class=CODE,delta=2
global __ptext756
__ptext756:

;; *************** function _Init_BOD_WDT *****************
;; Defined at:
;;		line 65 in file "E:\workSpace\git_work\jm\P2\code\init.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/20
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3  BANK2h  BANK2l
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_EnterSleep
;; This function uses a non-reentrant model
;;
psect	text756
	file	"E:\workSpace\git_work\jm\P2\code\init.c"
	line	65
	global	__size_of_Init_BOD_WDT
	__size_of_Init_BOD_WDT	equ	__end_of_Init_BOD_WDT-_Init_BOD_WDT
	
_Init_BOD_WDT:	
	opt	stack 2
; Regs used in _Init_BOD_WDT: [wreg+status,2+status,0]
	line	67
	
l15221:	
;init.c: 67: LVDIE = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(104/8),(104)&7
	line	68
;init.c: 68: LVDIF = 0;
	bcf	(112/8),(112)&7
	line	69
	
l15223:	
;init.c: 69: LVCTL &= 0xF0;LVCTL |= 0x03;
	movlw	(0F0h)
	andwf	(22),f	;volatile
	movlw	(03h)
	iorwf	(22),f	;volatile
	line	70
	
l15225:	
;init.c: 70: LVCTL |= 0x40;
	bsf	(22)+(6/8),(6)&7	;volatile
	line	71
	
l15227:	
;init.c: 71: LVCTL |= 0x20;
	bsf	(22)+(5/8),(5)&7	;volatile
	line	72
	
l15229:	
;init.c: 72: LVCTL |= 0x10;
	bsf	(22)+(4/8),(4)&7	;volatile
	line	75
;init.c: 75: OPTION &= 0xF3;
	movlw	(0F3h)
	bsf	status, 5	;RP0=1, select bank1
	andwf	(129)^080h,f	;volatile
	line	76
;init.c: 76: OPTION |= 0x0C;
	movlw	(0Ch)
	iorwf	(129)^080h,f	;volatile
	line	77
	
l15231:	
# 77 "E:\workSpace\git_work\jm\P2\code\init.c"
CLRWDT ;#
psect	text756
	line	79
	
l15233:	
;init.c: 79: WKTIE = 0;
	bcf	(91/8),(91)&7
	line	80
	
l15235:	
;init.c: 80: WKTIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(99/8),(99)&7
	line	81
;init.c: 81: OPTION &= 0xFC;
	movlw	(0FCh)
	bsf	status, 5	;RP0=1, select bank1
	andwf	(129)^080h,f	;volatile
	line	82
;init.c: 82: OPTION |= 0x03;
	movlw	(03h)
	iorwf	(129)^080h,f	;volatile
	line	83
	
l3287:	
	return
	opt stack 0
GLOBAL	__end_of_Init_BOD_WDT
	__end_of_Init_BOD_WDT:
;; =============== function _Init_BOD_WDT ends ============

	signat	_Init_BOD_WDT,88
	global	_InitGpio
psect	text757,local,class=CODE,delta=2
global __ptext757
__ptext757:

;; *************** function _InitGpio *****************
;; Defined at:
;;		line 94 in file "E:\workSpace\git_work\jm\P2\code\init.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3  BANK2h  BANK2l
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_EnterSleep
;; This function uses a non-reentrant model
;;
psect	text757
	file	"E:\workSpace\git_work\jm\P2\code\init.c"
	line	94
	global	__size_of_InitGpio
	__size_of_InitGpio	equ	__end_of_InitGpio-_InitGpio
	
_InitGpio:	
	opt	stack 2
; Regs used in _InitGpio: [wreg+status,2+status,0]
	line	96
	
l15207:	
;init.c: 96: PAD = 0xE8;
	movlw	(0E8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(5)	;volatile
	line	97
;init.c: 97: PAMOD76 = PAMOD76 & 0x00 | 0x80 | 0x09;
	movlw	(089h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(136)^080h	;volatile
	line	98
;init.c: 98: PAMOD54 = PAMOD54 & 0x00 | 0x30 | 0x06;
	movlw	(036h)
	movwf	(135)^080h	;volatile
	line	99
;init.c: 99: PAMOD32 = PAMOD32 & 0x00 | 0x30 | 0x06;
	movlw	(036h)
	movwf	(134)^080h	;volatile
	line	100
;init.c: 100: PAMOD10 = PAMOD10 & 0x00 | 0x10 | 0x01;
	movlw	(011h)
	movwf	(133)^080h	;volatile
	line	103
;init.c: 103: PBD = 0x04;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(6)	;volatile
	line	104
;init.c: 104: PBMOD76 = PBMOD76 & 0x00 | 0x60 | 0x06;
	movlw	(066h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h	;volatile
	line	105
;init.c: 105: PBMOD54 = PBMOD54 & 0x00 | 0x60 | 0x06;
	movlw	(066h)
	movwf	(142)^080h	;volatile
	line	106
;init.c: 106: PBMOD32 = PBMOD32 & 0x00 | 0x60 | 0x90;
	movlw	(0F0h)
	movwf	(141)^080h	;volatile
	line	107
;init.c: 107: PBMOD10 = PBMOD10 & 0x00 | 0x60 | 0x06;
	movlw	(066h)
	movwf	(140)^080h	;volatile
	line	109
	
l15209:	
;init.c: 109: PDD = 0x00;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(7)	;volatile
	line	110
	
l15211:	
;init.c: 110: PDMOD10 = PDMOD10 & 0x00 | 0x60 | 0x06;
	movlw	(066h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	112
	
l15213:	
;init.c: 112: PINMOD &= 0xD8;
	movlw	(0D8h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	andwf	(261)^0100h,f	;volatile
	line	125
	
l15215:	
;init.c: 125: ADCTL &= 0xF8;
	movlw	(0F8h)
	bcf	status, 6	;RP1=0, select bank0
	andwf	(24),f	;volatile
	line	126
	
l15217:	
;init.c: 126: ADCTL |= 0x05;
	movlw	(05h)
	iorwf	(24),f	;volatile
	line	127
	
l15219:	
;init.c: 127: ADCTL2 &= 0x3F;
	movlw	(03Fh)
	andwf	(25),f	;volatile
	line	128
	
l3290:	
	return
	opt stack 0
GLOBAL	__end_of_InitGpio
	__end_of_InitGpio:
;; =============== function _InitGpio ends ============

	signat	_InitGpio,88
	global	_Interrupt_ISR
psect	text758,local,class=CODE,delta=2
global __ptext758
__ptext758:

;; *************** function _Interrupt_ISR *****************
;; Defined at:
;;		line 180 in file "E:\workSpace\git_work\jm\P2\code\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3  BANK2h  BANK2l
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0
;;      Temps:          4       0       0       0       0       0
;;      Totals:         4       0       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_led_matrix_run
;;		_SmokeOut
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text758
	file	"E:\workSpace\git_work\jm\P2\code\main.c"
	line	180
	global	__size_of_Interrupt_ISR
	__size_of_Interrupt_ISR	equ	__end_of_Interrupt_ISR-_Interrupt_ISR
	
_Interrupt_ISR:	
	opt	stack 2
; Regs used in _Interrupt_ISR: [allreg]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_Interrupt_ISR+0)
	movf	fsr0,w
	movwf	(??_Interrupt_ISR+1)
	movf	pclath,w
	movwf	(??_Interrupt_ISR+2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_Interrupt_ISR+3)
	ljmp	_Interrupt_ISR
psect	text758
	line	181
	
i1l15529:	
;main.c: 181: if(CMPIF != 0)
	btfss	(116/8),(116)&7
	goto	u278_21
	goto	u278_20
u278_21:
	goto	i1l1671
u278_20:
	line	183
	
i1l15531:	
;main.c: 182: {
;main.c: 183: if(VoutInfoFlag.bits.b7 != 0 && VoutInfoFlag.bits.b6 == 0)
	btfss	(_VoutInfoFlag),7
	goto	u279_21
	goto	u279_20
u279_21:
	goto	i1l1672
u279_20:
	
i1l15533:	
	btfsc	(_VoutInfoFlag),6
	goto	u280_21
	goto	u280_20
u280_21:
	goto	i1l1672
u280_20:
	line	185
	
i1l15535:	
;main.c: 184: {
;main.c: 185: PAD4 = 1;
	bsf	(44/8),(44)&7
	line	186
;main.c: 186: PAD2 = 1;
	bsf	(42/8),(42)&7
	line	187
;main.c: 187: VoutInfoFlag.bits.b6 = 1;
	bsf	(_VoutInfoFlag),6
	line	188
	
i1l1672:	
	line	190
;main.c: 188: }
;main.c: 190: CMPIF = 0;
	bcf	(116/8),(116)&7
	line	191
;main.c: 191: }
	goto	i1l1690
	line	192
	
i1l1671:	
;main.c: 192: else if(LVDIF != 0)
	btfss	(112/8),(112)&7
	goto	u281_21
	goto	u281_20
u281_21:
	goto	i1l1674
u281_20:
	line	194
	
i1l15537:	
;main.c: 193: {
;main.c: 194: if(((VoutInfoFlag.bits.b7 != 0) || (LVDIE != 0)) && VoutInfoFlag.bits.b6 == 0)
	btfsc	(_VoutInfoFlag),7
	goto	u282_21
	goto	u282_20
u282_21:
	goto	i1l1677
u282_20:
	
i1l15539:	
	btfss	(104/8),(104)&7
	goto	u283_21
	goto	u283_20
u283_21:
	goto	i1l1675
u283_20:
	
i1l1677:	
	btfsc	(_VoutInfoFlag),6
	goto	u284_21
	goto	u284_20
u284_21:
	goto	i1l1675
u284_20:
	line	196
	
i1l15541:	
;main.c: 195: {
;main.c: 196: PAD4 = 1;
	bsf	(44/8),(44)&7
	line	197
;main.c: 197: PAD2 = 1;
	bsf	(42/8),(42)&7
	line	198
;main.c: 198: VoutInfoFlag.bits.b6 = 1;
	bsf	(_VoutInfoFlag),6
	line	199
	
i1l1675:	
	line	201
;main.c: 199: }
;main.c: 201: LVDIF = 0;
	bcf	(112/8),(112)&7
	line	202
;main.c: 202: }
	goto	i1l1690
	line	203
	
i1l1674:	
;main.c: 203: else if(TM0IF != 0)
	btfss	(100/8),(100)&7
	goto	u285_21
	goto	u285_20
u285_21:
	goto	i1l1679
u285_20:
	line	205
	
i1l15543:	
;main.c: 204: {
;main.c: 205: TimeCnt.TimeBase++;
	bsf	status, 6	;RP1=1, select bank2
	incf	(345)^0100h,f
	line	206
	
i1l15545:	
;main.c: 206: if(TimeCnt.TimeBase >= 100)
	movlw	(064h)
	subwf	(345)^0100h,w
	skipc
	goto	u286_21
	goto	u286_20
u286_21:
	goto	i1l15551
u286_20:
	line	208
	
i1l15547:	
;main.c: 207: {
;main.c: 208: TimeCnt.TimeBase = 0;
	clrf	(345)^0100h
	line	209
	
i1l15549:	
;main.c: 209: SysInfoFlag.bits.b6 = 1;
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_SysInfoFlag),6
	line	217
	
i1l15551:	
;main.c: 210: }
;main.c: 217: led_matrix_run();
	fcall	_led_matrix_run
	line	218
	
i1l15553:	
;main.c: 218: if(VoutInfoFlag.bits.b7 != 0 && VoutInfoFlag.bits.b6 == 0) SmokeOut();
	btfss	(_VoutInfoFlag),7
	goto	u287_21
	goto	u287_20
u287_21:
	goto	i1l15559
u287_20:
	
i1l15555:	
	btfsc	(_VoutInfoFlag),6
	goto	u288_21
	goto	u288_20
u288_21:
	goto	i1l15559
u288_20:
	
i1l15557:	
	fcall	_SmokeOut
	line	222
	
i1l15559:	
;main.c: 222: TM0IF = 0;
	bcf	(100/8),(100)&7
	line	223
;main.c: 223: }
	goto	i1l1690
	line	224
	
i1l1679:	
;main.c: 224: else if(INT0IF != 0)
	btfss	(96/8),(96)&7
	goto	u289_21
	goto	u289_20
u289_21:
	goto	i1l1683
u289_20:
	line	226
	
i1l15561:	
;main.c: 225: {
;main.c: 226: INT0IF = 0;
	bcf	(96/8),(96)&7
	line	227
;main.c: 227: }
	goto	i1l1690
	line	228
	
i1l1683:	
;main.c: 228: else if(INT1IF != 0)
	btfss	(97/8),(97)&7
	goto	u290_21
	goto	u290_20
u290_21:
	goto	i1l1685
u290_20:
	line	230
	
i1l15563:	
;main.c: 229: {
;main.c: 230: INT1IF = 0;
	bcf	(97/8),(97)&7
	line	231
;main.c: 231: }
	goto	i1l1690
	line	232
	
i1l1685:	
;main.c: 232: else if(INT2IF != 0)
	btfss	(98/8),(98)&7
	goto	u291_21
	goto	u291_20
u291_21:
	goto	i1l1687
u291_20:
	line	234
	
i1l15565:	
;main.c: 233: {
;main.c: 234: INT2IF = 0;
	bcf	(98/8),(98)&7
	line	235
;main.c: 235: }
	goto	i1l1690
	line	236
	
i1l1687:	
;main.c: 236: else if (WKTIF != 0)
	btfss	(99/8),(99)&7
	goto	u292_21
	goto	u292_20
u292_21:
	goto	i1l1684
u292_20:
	line	238
	
i1l15567:	
;main.c: 237: {
;main.c: 238: WKTIF = 0;
	bcf	(99/8),(99)&7
	goto	i1l1690
	line	240
	
i1l1684:	
	
i1l1690:	
	movf	(??_Interrupt_ISR+3),w
	movwf	btemp+1
	movf	(??_Interrupt_ISR+2),w
	movwf	pclath
	movf	(??_Interrupt_ISR+1),w
	movwf	fsr0
	swapf	(??_Interrupt_ISR+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_Interrupt_ISR
	__end_of_Interrupt_ISR:
;; =============== function _Interrupt_ISR ends ============

	signat	_Interrupt_ISR,88
	global	_led_matrix_run
psect	text759,local,class=CODE,delta=2
global __ptext759
__ptext759:

;; *************** function _led_matrix_run *****************
;; Defined at:
;;		line 58 in file "E:\workSpace\git_work\jm\P2\code\tyw_led.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  rowCount        1    9[COMMON] unsigned char 
;;  y               1    8[COMMON] unsigned char 
;;  x               1    7[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 20/40
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3  BANK2h  BANK2l
;;      Params:         0       0       0       0       0       0
;;      Locals:         3       0       0       0       0       0
;;      Temps:          4       0       0       0       0       0
;;      Totals:         7       0       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_led_set_io_od
;;		___bmul
;;		_led_set_io_pp
;; This function is called by:
;;		_Interrupt_ISR
;; This function uses a non-reentrant model
;;
psect	text759
	file	"E:\workSpace\git_work\jm\P2\code\tyw_led.c"
	line	58
	global	__size_of_led_matrix_run
	__size_of_led_matrix_run	equ	__end_of_led_matrix_run-_led_matrix_run
	
_led_matrix_run:	
	opt	stack 2
; Regs used in _led_matrix_run: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	60
	
i1l15569:	
	clrf	(led_matrix_run@y)
	line	62
;tyw_led.c: 62: uint8_t rowCount = 0;
	clrf	(led_matrix_run@rowCount)
	line	64
;tyw_led.c: 64: for (rowCount = 0; rowCount < 8; rowCount++)
	clrf	(led_matrix_run@rowCount)
	line	66
	
i1l15575:	
;tyw_led.c: 65: {
;tyw_led.c: 66: led_set_io_od(rowCount);
	movf	(led_matrix_run@rowCount),w
	fcall	_led_set_io_od
	line	64
	
i1l15577:	
	incf	(led_matrix_run@rowCount),f
	
i1l15579:	
	movlw	(08h)
	subwf	(led_matrix_run@rowCount),w
	skipc
	goto	u293_21
	goto	u293_20
u293_21:
	goto	i1l15575
u293_20:
	line	69
	
i1l15581:	
;tyw_led.c: 67: }
;tyw_led.c: 69: for (rowCount = 0; rowCount < 3; rowCount++)
	clrf	(led_matrix_run@rowCount)
	line	72
	
i1l15587:	
;tyw_led.c: 70: {
;tyw_led.c: 72: if (ledShowIndex[row][rowCount][0] == 0)
	movlw	(06h)
	movwf	(?___bmul)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(led_matrix_run@row),w
	fcall	___bmul
	addlw	low(_ledShowIndex|8000h)
	movwf	(??_led_matrix_run+0)+0
	movlw	high(_ledShowIndex|8000h)
	skipnc
	addlw	1
	movwf	1+((??_led_matrix_run+0)+0)
	clrc
	rlf	(led_matrix_run@rowCount),w
	addwf	0+(??_led_matrix_run+0)+0,w
	movwf	fsr0
	movf	1+(??_led_matrix_run+0)+0,w
	skipnc
	incf	1+(??_led_matrix_run+0)+0,w
	movwf	btemp+1
	fcall	stringtab
	iorlw	0
	skipz
	goto	u294_21
	goto	u294_20
u294_21:
	goto	i1l15591
u294_20:
	goto	i1l15601
	line	75
	
i1l15591:	
;tyw_led.c: 75: x = ledShowIndex[row][rowCount][0] - 1;
	movlw	(06h)
	movwf	(?___bmul)
	movf	(led_matrix_run@row),w
	fcall	___bmul
	addlw	low(_ledShowIndex|8000h)
	movwf	(??_led_matrix_run+0)+0
	movlw	high(_ledShowIndex|8000h)
	skipnc
	addlw	1
	movwf	1+((??_led_matrix_run+0)+0)
	clrc
	rlf	(led_matrix_run@rowCount),w
	addwf	0+(??_led_matrix_run+0)+0,w
	movwf	fsr0
	movf	1+(??_led_matrix_run+0)+0,w
	skipnc
	incf	1+(??_led_matrix_run+0)+0,w
	movwf	btemp+1
	fcall	stringtab
	addlw	0FFh
	movwf	(led_matrix_run@x)
	line	76
;tyw_led.c: 76: y = ledShowIndex[row][rowCount][1] - 1;
	movlw	(06h)
	movwf	(?___bmul)
	movf	(led_matrix_run@row),w
	fcall	___bmul
	addlw	low(_ledShowIndex|8000h)
	movwf	(??_led_matrix_run+0)+0
	movlw	high(_ledShowIndex|8000h)
	skipnc
	addlw	1
	movwf	1+((??_led_matrix_run+0)+0)
	clrc
	rlf	(led_matrix_run@rowCount),w
	addwf	0+(??_led_matrix_run+0)+0,w
	movwf	(??_led_matrix_run+2)+0
	movf	1+(??_led_matrix_run+0)+0,w
	skipnc
	addlw	1
	movwf	1+((??_led_matrix_run+2)+0)
	movlw	01h
	addwf	0+(??_led_matrix_run+2)+0,w
	movwf	fsr0
	movf	1+(??_led_matrix_run+2)+0,w
	skipnc
	incf	1+(??_led_matrix_run+2)+0,w
	movwf	btemp+1
	fcall	stringtab
	addlw	0FFh
	movwf	(led_matrix_run@y)
	line	78
	
i1l15593:	
;tyw_led.c: 78: if(led_duty_cycles[x][y])
	movf	(led_matrix_run@x),w
	movwf	(??_led_matrix_run+0)+0
	clrc
	rlf	(??_led_matrix_run+0)+0,f
	clrc
	rlf	(??_led_matrix_run+0)+0,f
	clrc
	rlf	(??_led_matrix_run+0)+0,f
	movlw	(_led_duty_cycles)&0ffh
	addwf	0+(??_led_matrix_run+0)+0,w
	movwf	(??_led_matrix_run+1)+0
	movf	(led_matrix_run@y),w
	addwf	0+(??_led_matrix_run+1)+0,w
	movwf	(??_led_matrix_run+2)+0
	movf	0+(??_led_matrix_run+2)+0,w
	movwf	fsr0
	bsf	status, 7	;select IRP bank3
	movf	indf
	skipnz
	goto	u295_21
	goto	u295_20
u295_21:
	goto	i1l15597
u295_20:
	line	80
	
i1l15595:	
;tyw_led.c: 79: {
;tyw_led.c: 80: led_set_io_pp(x, 0);
	clrf	(?_led_set_io_pp)
	movf	(led_matrix_run@x),w
	fcall	_led_set_io_pp
	line	81
;tyw_led.c: 81: led_set_io_pp(y, 1);
	clrf	(?_led_set_io_pp)
	incf	(?_led_set_io_pp),f
	movf	(led_matrix_run@y),w
	fcall	_led_set_io_pp
	line	69
	
i1l15597:	
	incf	(led_matrix_run@rowCount),f
	
i1l15599:	
	movlw	(03h)
	subwf	(led_matrix_run@rowCount),w
	skipc
	goto	u296_21
	goto	u296_20
u296_21:
	goto	i1l15587
u296_20:
	line	85
	
i1l15601:	
;tyw_led.c: 82: }
;tyw_led.c: 84: }
;tyw_led.c: 85: row++;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(led_matrix_run@row),f
	line	86
	
i1l15603:	
;tyw_led.c: 86: if (row == 18)
	movf	(led_matrix_run@row),w
	xorlw	012h
	skipz
	goto	u297_21
	goto	u297_20
u297_21:
	goto	i1l11815
u297_20:
	line	88
	
i1l15605:	
;tyw_led.c: 87: {
;tyw_led.c: 88: row = 0;
	clrf	(led_matrix_run@row)
	line	90
	
i1l11815:	
	return
	opt stack 0
GLOBAL	__end_of_led_matrix_run
	__end_of_led_matrix_run:
;; =============== function _led_matrix_run ends ============

	signat	_led_matrix_run,88
	global	___bmul
psect	text760,local,class=CODE,delta=2
global __ptext760
__ptext760:

;; *************** function ___bmul *****************
;; Defined at:
;;		line 3 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\bmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      1    wreg     unsigned char 
;;  multiplicand    1    0[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  multiplier      1    2[COMMON] unsigned char 
;;  product         1    1[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3  BANK2h  BANK2l
;;      Params:         1       0       0       0       0       0
;;      Locals:         2       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         3       0       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_led_matrix_run
;; This function uses a non-reentrant model
;;
psect	text760
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\bmul.c"
	line	3
	global	__size_of___bmul
	__size_of___bmul	equ	__end_of___bmul-___bmul
	
___bmul:	
	opt	stack 2
; Regs used in ___bmul: [wreg+status,2+status,0]
;___bmul@multiplier stored from wreg
	movwf	(___bmul@multiplier)
	line	4
	
i1l15763:	
	clrf	(___bmul@product)
	line	7
	
i1l15765:	
	btfss	(___bmul@multiplier),(0)&7
	goto	u320_21
	goto	u320_20
u320_21:
	goto	i1l15769
u320_20:
	line	8
	
i1l15767:	
	movf	(___bmul@multiplicand),w
	addwf	(___bmul@product),f
	line	9
	
i1l15769:	
	clrc
	rlf	(___bmul@multiplicand),f
	line	10
	
i1l15771:	
	clrc
	rrf	(___bmul@multiplier),f
	line	11
	
i1l15773:	
	movf	(___bmul@multiplier),f
	skipz
	goto	u321_21
	goto	u321_20
u321_21:
	goto	i1l15765
u321_20:
	line	12
	
i1l15775:	
	movf	(___bmul@product),w
	line	13
	
i1l12929:	
	return
	opt stack 0
GLOBAL	__end_of___bmul
	__end_of___bmul:
;; =============== function ___bmul ends ============

	signat	___bmul,8313
	global	_led_set_io_pp
psect	text761,local,class=CODE,delta=2
global __ptext761
__ptext761:

;; *************** function _led_set_io_pp *****************
;; Defined at:
;;		line 210 in file "E:\workSpace\git_work\jm\P2\code\tyw_led.c"
;; Parameters:    Size  Location     Type
;;  io_num          1    wreg     unsigned char 
;;  type            1    0[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  io_num          1    1[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 100/100
;;		On exit  : 100/100
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3  BANK2h  BANK2l
;;      Params:         1       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_led_matrix_run
;; This function uses a non-reentrant model
;;
psect	text761
	file	"E:\workSpace\git_work\jm\P2\code\tyw_led.c"
	line	210
	global	__size_of_led_set_io_pp
	__size_of_led_set_io_pp	equ	__end_of_led_set_io_pp-_led_set_io_pp
	
_led_set_io_pp:	
	opt	stack 2
; Regs used in _led_set_io_pp: [wreg-fsr0h+status,2+status,0]
;led_set_io_pp@io_num stored from wreg
	movwf	(led_set_io_pp@io_num)
	line	211
	
i1l15705:	
;tyw_led.c: 211: switch(io_num)
	goto	i1l15757
	line	214
	
i1l15707:	
;tyw_led.c: 214: {PBMOD32= PBMOD32 & 0x0F | 0x60; if(type)PBD3=1;else PBD3=0;};
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(141)^080h,w
	andlw	0Fh
	iorlw	060h
	movwf	(141)^080h	;volatile
	
i1l15709:	
	movf	(led_set_io_pp@type),w
	skipz
	goto	u312_20
	goto	i1l11883
u312_20:
	
i1l15711:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(51/8),(51)&7
	goto	i1l11908
	
i1l11883:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(51/8),(51)&7
	goto	i1l11908
	line	218
	
i1l15713:	
;tyw_led.c: 218: {PDMOD10= PDMOD10 & 0xF0 | 0x06; if(type)PDD0=1;else PDD0=0;};
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(144)^080h,w
	andlw	0F0h
	iorlw	06h
	movwf	(144)^080h	;volatile
	
i1l15715:	
	movf	(led_set_io_pp@type),w
	skipz
	goto	u313_20
	goto	i1l11887
u313_20:
	
i1l15717:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(56/8),(56)&7
	goto	i1l11908
	
i1l11887:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(56/8),(56)&7
	goto	i1l11908
	line	221
	
i1l15719:	
;tyw_led.c: 221: {PDMOD10= PDMOD10 & 0x0F | 0x60; if(type)PDD1=1;else PDD1=0;};
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(144)^080h,w
	andlw	0Fh
	iorlw	060h
	movwf	(144)^080h	;volatile
	
i1l15721:	
	movf	(led_set_io_pp@type),w
	skipz
	goto	u314_20
	goto	i1l11890
u314_20:
	
i1l15723:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(57/8),(57)&7
	goto	i1l11908
	
i1l11890:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(57/8),(57)&7
	goto	i1l11908
	line	224
	
i1l15725:	
;tyw_led.c: 224: {PBMOD54= PBMOD54 & 0xF0 | 0x06; if(type)PBD4=1;else PBD4=0;};
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(142)^080h,w
	andlw	0F0h
	iorlw	06h
	movwf	(142)^080h	;volatile
	
i1l15727:	
	movf	(led_set_io_pp@type),w
	skipz
	goto	u315_20
	goto	i1l11893
u315_20:
	
i1l15729:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(52/8),(52)&7
	goto	i1l11908
	
i1l11893:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(52/8),(52)&7
	goto	i1l11908
	line	227
	
i1l15731:	
;tyw_led.c: 227: {PBMOD54= PBMOD54 & 0x0F | 0x60; if(type)PBD5=1;else PBD5=0;};
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(142)^080h,w
	andlw	0Fh
	iorlw	060h
	movwf	(142)^080h	;volatile
	
i1l15733:	
	movf	(led_set_io_pp@type),w
	skipz
	goto	u316_20
	goto	i1l11896
u316_20:
	
i1l15735:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(53/8),(53)&7
	goto	i1l11908
	
i1l11896:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(53/8),(53)&7
	goto	i1l11908
	line	230
	
i1l15737:	
;tyw_led.c: 230: {PBMOD76= PBMOD76 & 0xF0 | 0x06; if(type)PBD6=1;else PBD6=0;};
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(143)^080h,w
	andlw	0F0h
	iorlw	06h
	movwf	(143)^080h	;volatile
	
i1l15739:	
	movf	(led_set_io_pp@type),w
	skipz
	goto	u317_20
	goto	i1l11899
u317_20:
	
i1l15741:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(54/8),(54)&7
	goto	i1l11908
	
i1l11899:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(54/8),(54)&7
	goto	i1l11908
	line	233
	
i1l15743:	
;tyw_led.c: 233: {PBMOD76= PBMOD76 & 0x0F | 0x60; if(type)PBD7=1;else PBD7=0;};
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(143)^080h,w
	andlw	0Fh
	iorlw	060h
	movwf	(143)^080h	;volatile
	
i1l15745:	
	movf	(led_set_io_pp@type),w
	skipz
	goto	u318_20
	goto	i1l11902
u318_20:
	
i1l15747:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(55/8),(55)&7
	goto	i1l11908
	
i1l11902:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(55/8),(55)&7
	goto	i1l11908
	line	236
	
i1l15749:	
;tyw_led.c: 236: {PBMOD10= PBMOD10 & 0xF0 | 0x06; if(type)PBD0=1;else PBD0=0;};
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(140)^080h,w
	andlw	0F0h
	iorlw	06h
	movwf	(140)^080h	;volatile
	
i1l15751:	
	movf	(led_set_io_pp@type),w
	skipz
	goto	u319_20
	goto	i1l11905
u319_20:
	
i1l15753:	
	bcf	status, 5	;RP0=0, select bank0
	bsf	(48/8),(48)&7
	goto	i1l11908
	
i1l11905:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(48/8),(48)&7
	goto	i1l11908
	line	211
	
i1l15757:	
	movf	(led_set_io_pp@io_num),w
	; Switch size 1, requested type "space"
; Number of cases is 8, Range of values is 0 to 7
; switch strategies available:
; Name         Instructions Cycles
; direct_byte           23     7 (fixed)
; simple_byte           25    13 (average)
; jumptable            260     6 (fixed)
; rangetable            12     6 (fixed)
; spacedrange           22     9 (fixed)
; locatedrange           8     3 (fixed)
;	Chosen strategy is direct_byte

	movwf fsr
	movlw	8
	subwf	fsr,w
skipnc
goto i1l11908
movlw high(i1S16677)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(i1S16677)
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
i1S16677:
	ljmp	i1l15707
	ljmp	i1l15713
	ljmp	i1l15719
	ljmp	i1l15725
	ljmp	i1l15731
	ljmp	i1l15737
	ljmp	i1l15743
	ljmp	i1l15749
psect	text761

	line	242
	
i1l11908:	
	return
	opt stack 0
GLOBAL	__end_of_led_set_io_pp
	__end_of_led_set_io_pp:
;; =============== function _led_set_io_pp ends ============

	signat	_led_set_io_pp,8312
	global	_led_set_io_od
psect	text762,local,class=CODE,delta=2
global __ptext762
__ptext762:

;; *************** function _led_set_io_od *****************
;; Defined at:
;;		line 175 in file "E:\workSpace\git_work\jm\P2\code\tyw_led.c"
;; Parameters:    Size  Location     Type
;;  io_num          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  io_num          1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/40
;;		On exit  : 0/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3  BANK2h  BANK2l
;;      Params:         0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         1       0       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_led_matrix_run
;; This function uses a non-reentrant model
;;
psect	text762
	file	"E:\workSpace\git_work\jm\P2\code\tyw_led.c"
	line	175
	global	__size_of_led_set_io_od
	__size_of_led_set_io_od	equ	__end_of_led_set_io_od-_led_set_io_od
	
_led_set_io_od:	
	opt	stack 2
; Regs used in _led_set_io_od: [wreg-fsr0h+status,2+status,0]
;led_set_io_od@io_num stored from wreg
	movwf	(led_set_io_od@io_num)
	line	176
	
i1l15679:	
;tyw_led.c: 176: switch(io_num)
	goto	i1l15699
	line	178
;tyw_led.c: 177: {
;tyw_led.c: 178: case 0:
	
i1l11868:	
	line	179
;tyw_led.c: 179: {PBD3=1;PBMOD32= PBMOD32 & 0x0F | 0x10; };
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(51/8),(51)&7
	
i1l15681:	
	bsf	status, 5	;RP0=1, select bank1
	movf	(141)^080h,w
	andlw	0Fh
	iorlw	010h
	movwf	(141)^080h	;volatile
	line	180
;tyw_led.c: 180: break;
	goto	i1l11878
	line	181
;tyw_led.c: 181: case 1:
	
i1l11870:	
	line	182
;tyw_led.c: 182: {PDD0=1; PDMOD10= PDMOD10 & 0xF0 | 0x01; };
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(56/8),(56)&7
	
i1l15683:	
	bsf	status, 5	;RP0=1, select bank1
	movf	(144)^080h,w
	andlw	0F0h
	iorlw	01h
	movwf	(144)^080h	;volatile
	line	183
;tyw_led.c: 183: break;
	goto	i1l11878
	line	184
;tyw_led.c: 184: case 2:
	
i1l11871:	
	line	185
;tyw_led.c: 185: {PDD1=1; PDMOD10= PDMOD10 & 0x0F | 0x10; };
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(57/8),(57)&7
	
i1l15685:	
	bsf	status, 5	;RP0=1, select bank1
	movf	(144)^080h,w
	andlw	0Fh
	iorlw	010h
	movwf	(144)^080h	;volatile
	line	186
;tyw_led.c: 186: break;
	goto	i1l11878
	line	187
;tyw_led.c: 187: case 3:
	
i1l11872:	
	line	188
;tyw_led.c: 188: {PBD4=1; PBMOD54= PBMOD54 & 0xF0 | 0x01; };
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(52/8),(52)&7
	
i1l15687:	
	bsf	status, 5	;RP0=1, select bank1
	movf	(142)^080h,w
	andlw	0F0h
	iorlw	01h
	movwf	(142)^080h	;volatile
	line	189
;tyw_led.c: 189: break;
	goto	i1l11878
	line	190
;tyw_led.c: 190: case 4:
	
i1l11873:	
	line	191
;tyw_led.c: 191: {PBD5=1; PBMOD54= PBMOD54 & 0x0F| 0x10; };
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(53/8),(53)&7
	
i1l15689:	
	bsf	status, 5	;RP0=1, select bank1
	movf	(142)^080h,w
	andlw	0Fh
	iorlw	010h
	movwf	(142)^080h	;volatile
	line	192
;tyw_led.c: 192: break;
	goto	i1l11878
	line	193
;tyw_led.c: 193: case 5:
	
i1l11874:	
	line	194
;tyw_led.c: 194: {PBD6=1; PBMOD76= PBMOD76 & 0xF0 | 0x01; };
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(54/8),(54)&7
	
i1l15691:	
	bsf	status, 5	;RP0=1, select bank1
	movf	(143)^080h,w
	andlw	0F0h
	iorlw	01h
	movwf	(143)^080h	;volatile
	line	195
;tyw_led.c: 195: break;
	goto	i1l11878
	line	196
;tyw_led.c: 196: case 6:
	
i1l11875:	
	line	197
;tyw_led.c: 197: {PBD7=1; PBMOD76= PBMOD76 & 0x0F | 0x10; };
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(55/8),(55)&7
	
i1l15693:	
	bsf	status, 5	;RP0=1, select bank1
	movf	(143)^080h,w
	andlw	0Fh
	iorlw	010h
	movwf	(143)^080h	;volatile
	line	198
;tyw_led.c: 198: break;
	goto	i1l11878
	line	199
;tyw_led.c: 199: case 7:
	
i1l11876:	
	line	200
;tyw_led.c: 200: {PBD0=1; PBMOD10= PBMOD10 & 0xF0 | 0x01; };
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(48/8),(48)&7
	
i1l15695:	
	bsf	status, 5	;RP0=1, select bank1
	movf	(140)^080h,w
	andlw	0F0h
	iorlw	01h
	movwf	(140)^080h	;volatile
	line	201
;tyw_led.c: 201: break;
	goto	i1l11878
	line	176
	
i1l15699:	
	movf	(led_set_io_od@io_num),w
	; Switch size 1, requested type "space"
; Number of cases is 8, Range of values is 0 to 7
; switch strategies available:
; Name         Instructions Cycles
; direct_byte           23     7 (fixed)
; simple_byte           25    13 (average)
; jumptable            260     6 (fixed)
; rangetable            12     6 (fixed)
; spacedrange           22     9 (fixed)
; locatedrange           8     3 (fixed)
;	Chosen strategy is direct_byte

	movwf fsr
	movlw	8
	subwf	fsr,w
skipnc
goto i1l11878
movlw high(i1S16679)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(i1S16679)
	movwf pc
psect	swtext2,local,class=CONST,delta=2
global __pswtext2
__pswtext2:
i1S16679:
	ljmp	i1l11868
	ljmp	i1l11870
	ljmp	i1l11871
	ljmp	i1l11872
	ljmp	i1l11873
	ljmp	i1l11874
	ljmp	i1l11875
	ljmp	i1l11876
psect	text762

	line	206
	
i1l11878:	
	return
	opt stack 0
GLOBAL	__end_of_led_set_io_od
	__end_of_led_set_io_od:
;; =============== function _led_set_io_od ends ============

	signat	_led_set_io_od,4216
	global	_SmokeOut
psect	text763,local,class=CODE,delta=2
global __ptext763
__ptext763:

;; *************** function _SmokeOut *****************
;; Defined at:
;;		line 273 in file "E:\workSpace\git_work\jm\P2\code\modular.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3  BANK2h  BANK2l
;;      Params:         0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_Interrupt_ISR
;; This function uses a non-reentrant model
;;
psect	text763
	file	"E:\workSpace\git_work\jm\P2\code\modular.c"
	line	273
	global	__size_of_SmokeOut
	__size_of_SmokeOut	equ	__end_of_SmokeOut-_SmokeOut
	
_SmokeOut:	
	opt	stack 3
; Regs used in _SmokeOut: [wreg+status,2+status,0]
	line	274
	
i1l15607:	
;modular.c: 274: if(RunPWM.BuckPwmCycleCnt >= 200)
	movlw	(0C8h)
	subwf	(_RunPWM),w
	skipc
	goto	u298_21
	goto	u298_20
u298_21:
	goto	i1l15617
u298_20:
	line	276
	
i1l15609:	
;modular.c: 275: {
;modular.c: 276: RunPWM.BuckPwmCycleCnt = 0;
	clrf	(_RunPWM)
	line	277
	
i1l15611:	
;modular.c: 277: RunPWM.BuckPwmDuty = RunPWM.BuckPwmDutyBuff;
	movf	0+(_RunPWM)+02h,w
	movwf	0+(_RunPWM)+01h
	line	279
	
i1l15613:	
;modular.c: 279: if(RunPWM.BuckPwmDuty) PAD4 = 0;
	movf	0+(_RunPWM)+01h,w
	skipz
	goto	u299_20
	goto	i1l8456
u299_20:
	
i1l15615:	
	bcf	(44/8),(44)&7
	goto	i1l15627
	line	280
	
i1l8456:	
;modular.c: 280: else PAD4 = 1;
	bsf	(44/8),(44)&7
	goto	i1l15627
	line	282
	
i1l15617:	
;modular.c: 282: else if(RunPWM.BuckPwmCycleCnt)
	movf	(_RunPWM),w
	skipz
	goto	u300_20
	goto	i1l15627
u300_20:
	line	284
	
i1l15619:	
;modular.c: 283: {
;modular.c: 284: if(RunPWM.BuckPwmCycleCnt < RunPWM.BuckPwmDuty)
	movf	0+(_RunPWM)+01h,w
	subwf	(_RunPWM),w
	skipnc
	goto	u301_21
	goto	u301_20
u301_21:
	goto	i1l15623
u301_20:
	line	286
	
i1l15621:	
;modular.c: 285: {
;modular.c: 286: VoutInfoFlag.bits.b1 = 1;
	bsf	(_VoutInfoFlag),1
	line	287
;modular.c: 287: }
	goto	i1l15627
	line	288
	
i1l15623:	
;modular.c: 288: else if(RunPWM.BuckPwmCycleCnt == RunPWM.BuckPwmDuty)
	movf	0+(_RunPWM)+01h,w
	xorwf	(_RunPWM),w
	skipz
	goto	u302_21
	goto	u302_20
u302_21:
	goto	i1l15627
u302_20:
	line	290
	
i1l15625:	
;modular.c: 289: {
;modular.c: 290: VoutInfoFlag.bits.b1 = 0;
	bcf	(_VoutInfoFlag),1
	line	291
;modular.c: 291: PAD4 = 1;
	bsf	(44/8),(44)&7
	line	294
	
i1l15627:	
;modular.c: 292: }
;modular.c: 293: }
;modular.c: 294: RunPWM.BuckPwmCycleCnt++;
	incf	(_RunPWM),f
	line	295
	
i1l8463:	
	return
	opt stack 0
GLOBAL	__end_of_SmokeOut
	__end_of_SmokeOut:
;; =============== function _SmokeOut ends ============

	signat	_SmokeOut,88
psect	text764,local,class=CODE,delta=2
global __ptext764
__ptext764:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end

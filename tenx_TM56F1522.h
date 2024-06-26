/*
**************************************************************
Chip Name : TM56F1522
Build Date : 2022/01/25
By: Automatic generator (Version 2.4.0)
Modify Date : 2022/10/11 jy
Modify Date : 2022/11/22 Chen
**************************************************************
*/
#ifndef __TM56F1522_H
#define __TM56F1522_H
/*
*****************************************************************************************************************
*/
volatile unsigned char INDF                @ 0x000;  //
//

volatile unsigned char TM0                 @ 0x001;  //Timer0
//

volatile unsigned char PCL                 @ 0x002;  //Program Counter 7~0
//

volatile unsigned char STATUS              @ 0x003;  //
//
    volatile bit IRP                       @ ((unsigned)&STATUS*8)+7; //Register Bank Select bit for INDF access
    volatile bit RP1                       @ ((unsigned)&STATUS*8)+6; //Register Bank Select bit 1 for direct addressing 
    volatile bit RP0                       @ ((unsigned)&STATUS*8)+5; //Register Bank Select bit 0 for direct addressing 
    volatile bit TO                        @ ((unsigned)&STATUS*8)+4; //WDT Time Out Flag
    volatile bit PD                        @ ((unsigned)&STATUS*8)+3; //Power Down Flag
    volatile bit Z                         @ ((unsigned)&STATUS*8)+2; //Zero Flag
    volatile bit DC                        @ ((unsigned)&STATUS*8)+1; //Decimal Carry Flag
    volatile bit C                         @ ((unsigned)&STATUS*8)+0; //Carry Flag

       #ifndef _LIB_BUILD
        volatile union {
             struct {
                unsigned    C                 :1;
                unsigned    DC                :1;
                unsigned    Z                 :1;
                unsigned    PD                :1;
                unsigned    TO                :1;
                unsigned    RP                  : 2;
                unsigned    IRP                 : 1;
            };
            struct {
                unsigned                        : 5;
                unsigned    RP0                 : 1;
                unsigned    RP1                 : 1;
            };
        } STATUSbits @ 0x003;
        #endif
volatile unsigned char FSR                 @ 0x004;  //
//

volatile unsigned char PAD                 @ 0x005;
    //PAD
    volatile bit PAD7                      @ ((unsigned)&PAD*8)+7;
    volatile bit PAD6                      @ ((unsigned)&PAD*8)+6;
    volatile bit PAD5                      @ ((unsigned)&PAD*8)+5;
    volatile bit PAD4                      @ ((unsigned)&PAD*8)+4;
    volatile bit PAD3                      @ ((unsigned)&PAD*8)+3;
    volatile bit PAD2                      @ ((unsigned)&PAD*8)+2;
    volatile bit PAD1                      @ ((unsigned)&PAD*8)+1;
    volatile bit PAD0                      @ ((unsigned)&PAD*8)+0;
    //PA
    volatile bit PA7                       @ ((unsigned)&PAD*8)+7;
    volatile bit PA6                       @ ((unsigned)&PAD*8)+6;
    volatile bit PA5                       @ ((unsigned)&PAD*8)+5;
    volatile bit PA4                       @ ((unsigned)&PAD*8)+4;
    volatile bit PA3                       @ ((unsigned)&PAD*8)+3;
    volatile bit PA2                       @ ((unsigned)&PAD*8)+2;
    volatile bit PA1                       @ ((unsigned)&PAD*8)+1;
    volatile bit PA0                       @ ((unsigned)&PAD*8)+0;

volatile unsigned char PBD                 @ 0x006;
    //PBD
    volatile bit PBD7                      @ ((unsigned)&PBD*8)+7;
    volatile bit PBD6                      @ ((unsigned)&PBD*8)+6;
    volatile bit PBD5                      @ ((unsigned)&PBD*8)+5;
    volatile bit PBD4                      @ ((unsigned)&PBD*8)+4;
    volatile bit PBD3                      @ ((unsigned)&PBD*8)+3;
    volatile bit PBD2                      @ ((unsigned)&PBD*8)+2;
    volatile bit PBD1                      @ ((unsigned)&PBD*8)+1;
    volatile bit PBD0                      @ ((unsigned)&PBD*8)+0;
    //PB
    volatile bit PB7                       @ ((unsigned)&PBD*8)+7;
    volatile bit PB6                       @ ((unsigned)&PBD*8)+6;
    volatile bit PB5                       @ ((unsigned)&PBD*8)+5;
    volatile bit PB4                       @ ((unsigned)&PBD*8)+4;
    volatile bit PB3                       @ ((unsigned)&PBD*8)+3;
    volatile bit PB2                       @ ((unsigned)&PBD*8)+2;
    volatile bit PB1                       @ ((unsigned)&PBD*8)+1;
    volatile bit PB0                       @ ((unsigned)&PBD*8)+0;

volatile unsigned char PDD                 @ 0x007;
    //PDD
    volatile bit PDD1                      @ ((unsigned)&PDD*8)+1;
    volatile bit PDD0                      @ ((unsigned)&PDD*8)+0;
    //PD
    volatile bit PD1                       @ ((unsigned)&PDD*8)+1;
    volatile bit PD0                       @ ((unsigned)&PDD*8)+0;

volatile unsigned char PCLATH              @ 0x00A;  //
//
    volatile bit GPR3                      @ ((unsigned)&PCLATH*8)+7; //general purpose register
    volatile bit GPR2                      @ ((unsigned)&PCLATH*8)+6; //general purpose register
    volatile bit GPR1                      @ ((unsigned)&PCLATH*8)+5; //general purpose register
    volatile bit GPR0                      @ ((unsigned)&PCLATH*8)+4; //general 4K/8K ROM   (ROM BANK)
    volatile bit PCLATH3                   @ ((unsigned)&PCLATH*8)+3; //for 4K/8K ROM   (ROM BANK)
    volatile bit PCLATH2                   @ ((unsigned)&PCLATH*8)+2; //Write Buffer for the upper 3 bits of the Program Counter
    volatile bit PCLATH1                   @ ((unsigned)&PCLATH*8)+1; //Write Buffer for the upper 3 bits of the Program Counter
    volatile bit PCLATH0                   @ ((unsigned)&PCLATH*8)+0; //Write Buffer for the upper 3 bits of the Program Counter

       #ifndef _LIB_BUILD
        volatile union {
             struct {
                unsigned    PCLATH            :4;
                unsigned    GPR               :4;
            };
            struct {
                unsigned    PCLATH0             :1;
                unsigned    PCLATH1             :1;
                unsigned    PCLATH2             :1;
                unsigned    PCLATH3             :1;
                unsigned    GPR0                :1;
                unsigned    GPR1                :1;
                unsigned    GPR2                :1;
                unsigned    GPR3                :1;
            };
        } PCLATHbits @ 0x00A;
        #endif
volatile unsigned char INTIE               @ 0x00B;  //
//
    volatile bit ADCIE                     @ ((unsigned)&INTIE*8)+7; //ADC Interrupt Enable
    volatile bit T2IE                      @ ((unsigned)&INTIE*8)+6; //Timer2 Interrupt Enable
    volatile bit TM1IE                     @ ((unsigned)&INTIE*8)+5; //TImer1 Interrupt Enable
    volatile bit TM0IE                     @ ((unsigned)&INTIE*8)+4; //TImer0 Interrupt Enable
    volatile bit WKTIE                     @ ((unsigned)&INTIE*8)+3; //WKT Interrupt Enable
    volatile bit INT2IE                    @ ((unsigned)&INTIE*8)+2; //XINT2 Interrupt Enable, PA7 or PB5
    volatile bit INT1IE                    @ ((unsigned)&INTIE*8)+1; //XINT1 Interrupt Enable, PA1 or PB1
    volatile bit INT0IE                    @ ((unsigned)&INTIE*8)+0; //XINT0 Interrupt Enable, PA3 or PB2

       #ifndef _LIB_BUILD
        volatile union {
             struct {
                unsigned    INT0IE            :1;
                unsigned    INT1IE            :1;
                unsigned    INT2IE            :1;
                unsigned    WKTIE             :1;
                unsigned    TM0IE             :1;
                unsigned    TM1IE             :1;
                unsigned    T2IE              :1;
                unsigned    ADCIE             :1;
            };
        } INTIEbits @ 0x00B;
        #endif
volatile unsigned char INTIF               @ 0x00C;  //
//
    volatile bit ADCIF                     @ ((unsigned)&INTIF*8)+7; //ADC Interrupt Flag
    volatile bit T2IF                      @ ((unsigned)&INTIF*8)+6; //Timer2 Interrupt Flag
    volatile bit TM1IF                     @ ((unsigned)&INTIF*8)+5; //TImer1 Interrupt Flag
    volatile bit TM0IF                     @ ((unsigned)&INTIF*8)+4; //TImer0 Interrupt Flag
    volatile bit WKTIF                     @ ((unsigned)&INTIF*8)+3; //WKT Interrupt Flag
    volatile bit INT2IF                    @ ((unsigned)&INTIF*8)+2; //XINT2 Interrupt Flag
    volatile bit INT1IF                    @ ((unsigned)&INTIF*8)+1; //XINT1 Interrupt Flag
    volatile bit INT0IF                    @ ((unsigned)&INTIF*8)+0; //XINT0 Interrupt Flag

       #ifndef _LIB_BUILD
        volatile union {
             struct {
                unsigned    INT0IF            :1;
                unsigned    INT1IF            :1;
                unsigned    INT2IF            :1;
                unsigned    WKTIF             :1;
                unsigned    TM0IF             :1;
                unsigned    TM1IF             :1;
                unsigned    T2IF              :1;
                unsigned    ADCIF             :1;
            };
        } INTIFbits @ 0x00C;
        #endif
volatile unsigned char INTIE1              @ 0x00D;  //
//
    volatile bit CMPIE                     @ ((unsigned)&INTIE1*8)+4; //Comparator interrupt enable 0: disable 1: enable
    volatile bit TKIE                      @ ((unsigned)&INTIE1*8)+2; //Touch Key Interrupt Enable
    volatile bit PWMIE                     @ ((unsigned)&INTIE1*8)+1; //PWM0 Interrupt Enable
    volatile bit LVDIE                     @ ((unsigned)&INTIE1*8)+0; //LVD Interrupt Enable

       #ifndef _LIB_BUILD
        volatile union {
             struct {
                unsigned    LVDIE             :1;
                unsigned    PWMIE             :1;
                unsigned    TKIE              :1;
                unsigned                      :1;
                unsigned    CMPIE             :1;
                unsigned                      :3;
            };
        } INTIE1bits @ 0x00D;
        #endif
volatile unsigned char INTIF1              @ 0x00E;  //
//
    volatile bit CMPIF                     @ ((unsigned)&INTIF1*8)+4; //Comparator interrupt flag This bit is set by H/W while compare a new data, write 0 to this bit will clear this flag
    volatile bit TKIF                      @ ((unsigned)&INTIF1*8)+2; //Touch Key Interrupt Flag
    volatile bit PWMIF                     @ ((unsigned)&INTIF1*8)+1; //PWM0 Interrupt Flag
    volatile bit LVDIF                     @ ((unsigned)&INTIF1*8)+0; //LVD Interrupt Flag

       #ifndef _LIB_BUILD
        volatile union {
             struct {
                unsigned    LVDIF             :1;
                unsigned    PWMIF             :1;
                unsigned    TKIF              :1;
                unsigned                      :1;
                unsigned    CMPIF             :1;
                unsigned                      :3;
            };
        } INTIF1bits @ 0x00E;
        #endif
volatile unsigned char CLKCTL              @ 0x00F;  //
//
    volatile bit SCKTYPE                   @ ((unsigned)&CLKCTL*8)+7; //Slow Clock Type, 0: SIRC, 1: SXT
    volatile bit FCKTYPE                   @ ((unsigned)&CLKCTL*8)+6; //Fast Clock Type, 0: FIRC, 1: FXT
    volatile bit SLOWSTP                   @ ((unsigned)&CLKCTL*8)+4; //Stop Slow Clock in Stop Mode
    volatile bit FASTSTP                   @ ((unsigned)&CLKCTL*8)+3; //Stop Fast Clock
    volatile bit CPUCKS                    @ ((unsigned)&CLKCTL*8)+2; //Seleck Fast Clock
    volatile bit CPUPSC1                   @ ((unsigned)&CLKCTL*8)+1; //CPUCLK Prescaler, 0: div 8, 1: div 4, 2: div 2, 3: div 1
    volatile bit CPUPSC0                   @ ((unsigned)&CLKCTL*8)+0; //CPUCLK Prescaler, 0: div 8, 1: div 4, 2: div 2, 3: div 1

       #ifndef _LIB_BUILD
        volatile union {
             struct {
                unsigned    CPUPSC            :2;
                unsigned    CPUCKS            :1;
                unsigned    FASTSTP           :1;
                unsigned    SLOWSTP           :1;
                unsigned                      :1;
                unsigned    FCKTYPE           :1;
                unsigned    SCKTYPE           :1;
            };
            struct {
                unsigned    CPUPSC0             :1;
                unsigned    CPUPSC1             :1;
            };
        } CLKCTLbits @ 0x00F;
        #endif
volatile unsigned char TM0RLD              @ 0x010;  //Timer0 Reload Counter
//

volatile unsigned char TM0CTL              @ 0x011;  //
//
    volatile bit TM0STP                    @ ((unsigned)&TM0CTL*8)+6; //Stop Timer0. 0: Timer0 enable, 1: Timer0 disable
    volatile bit TM0EDG                    @ ((unsigned)&TM0CTL*8)+5; //T0I (PA2) edge, 0: rising edge, 1: falling edge
    volatile bit TM0CKS                    @ ((unsigned)&TM0CTL*8)+4; //Timer0 Clock, 0: Instruction Cycle, 1: T0I (PA2)
    volatile bit TM0PSC3                   @ ((unsigned)&TM0CTL*8)+3; //Timer0 Prescale, 0: div 1, 7: div 128, 8: div 256
    volatile bit TM0PSC2                   @ ((unsigned)&TM0CTL*8)+2; //Timer0 Prescale, 0: div 1, 7: div 128, 8: div 256
    volatile bit TM0PSC1                   @ ((unsigned)&TM0CTL*8)+1; //Timer0 Prescale, 0: div 1, 7: div 128, 8: div 256
    volatile bit TM0PSC0                   @ ((unsigned)&TM0CTL*8)+0; //Timer0 Prescale, 0: div 1, 7: div 128, 8: div 256

       #ifndef _LIB_BUILD
        volatile union {
             struct {
                unsigned    TM0PSC            :4;
                unsigned    TM0CKS            :1;
                unsigned    TM0EDG            :1;
                unsigned    TM0STP            :1;
                unsigned                      :1;
            };
            struct {
                unsigned    TM0PSC0             :1;
                unsigned    TM0PSC1             :1;
                unsigned    TM0PSC2             :1;
                unsigned    TM0PSC3             :1;
            };
        } TM0CTLbits @ 0x011;
        #endif
volatile unsigned char TM1                 @ 0x012;  //Timer1 content 
//

volatile unsigned char TM1RLD              @ 0x013;  //Timer1 Reload Counter
//

volatile unsigned char TM1CTL              @ 0x014;  //
//
    volatile bit TM1STP                    @ ((unsigned)&TM1CTL*8)+6; //Stop Timer1. 0: Timer1 enable, 1: Timer1 disable
    volatile bit TM1PSC3                   @ ((unsigned)&TM1CTL*8)+3; //Timer1 Prescale, 0: div 1, 7: div 128, 8: div 256
    volatile bit TM1PSC2                   @ ((unsigned)&TM1CTL*8)+2; //Timer1 Prescale, 0: div 1, 7: div 128, 8: div 256
    volatile bit TM1PSC1                   @ ((unsigned)&TM1CTL*8)+1; //Timer1 Prescale, 0: div 1, 7: div 128, 8: div 256
    volatile bit TM1PSC0                   @ ((unsigned)&TM1CTL*8)+0; //Timer1 Prescale, 0: div 1, 7: div 128, 8: div 256

       #ifndef _LIB_BUILD
        volatile union {
             struct {
                unsigned    TM1PSC            :4;
                unsigned                      :2;
                unsigned    TM1STP            :1;
                unsigned                      :1;
            };
            struct {
                unsigned    TM1PSC0             :1;
                unsigned    TM1PSC1             :1;
                unsigned    TM1PSC2             :1;
                unsigned    TM1PSC3             :1;
            };
        } TM1CTLbits @ 0x014;
        #endif
volatile unsigned char T2CTL               @ 0x015;  //
//
    volatile bit T2CLR                     @ ((unsigned)&T2CTL*8)+4; //T2 counter clear 0: Release 1: Clear and hold
    volatile bit T2CKS1                    @ ((unsigned)&T2CTL*8)+3; //Timer2 Clock Source.     0:'Slow-clcok'      1:Fcpuclk/128 (Fsys/128)                                      2: FRC/512         3:FRC/512
    volatile bit T2CKS0                    @ ((unsigned)&T2CTL*8)+2; //Timer2 Clock Source.     0:'Slow-clcok'      1:Fcpuclk/128 (Fsys/128)                                      2: FRC/512         3:FRC/512
    volatile bit T2PSC1                    @ ((unsigned)&T2CTL*8)+1; //Timer2 clock div 00: 2^15(32768) 01: 2^14(16384)  10: 2^13(8192)  11: 2^7(128)
    volatile bit T2PSC0                    @ ((unsigned)&T2CTL*8)+0; //Timer2 clock div 00: 2^15(32768) 01: 2^14(16384)  10: 2^13(8192)  11: 2^7(128)

       #ifndef _LIB_BUILD
        volatile union {
             struct {
                unsigned    T2PSC             :2;
                unsigned    T2CKS             :2;
                unsigned    T2CLR             :1;
                unsigned                      :3;
            };
            struct {
                unsigned    T2PSC0              :1;
                unsigned    T2PSC1              :1;
                unsigned    T2CKS0              :1;
                unsigned    T2CKS1              :1;
            };
        } T2CTLbits @ 0x015;
        #endif
volatile unsigned char LVCTL               @ 0x016;  //
//
    volatile bit LVDF                      @ ((unsigned)&LVCTL*8)+7; //LVD Flag
    volatile bit LVDHYS                    @ ((unsigned)&LVCTL*8)+6; //LVD Hystertsis, 25mV@LVD=2.19V, 70mV@LVD=4.15V (tt) 0: disable 1: enable
    volatile bit LVRSAV                    @ ((unsigned)&LVCTL*8)+5; //POR/LVR auto power off in STOP/IDLE mode 0: POR/LVR enable 1: POR/LVR enable in Slow/Fast mode, disable in STOP/IDLE mode (PORPD=1, POR force disable. LVRPD=1, LVR force disable)
    volatile bit LVDSAV                    @ ((unsigned)&LVCTL*8)+4; //LVD auto power off in STOP/IDLE mode 0: LVD enable 1: LVD enable in Slow/Fast mode, disable in STOP/IDLE mode
    volatile bit LVDS3                     @ ((unsigned)&LVCTL*8)+3; //LVD select  0000: Disable   0001: 2.19V  ??1111: 4.15V (TBD)
    volatile bit LVDS2                     @ ((unsigned)&LVCTL*8)+2; //LVD select  0000: Disable   0001: 2.19V  ??1111: 4.15V (TBD)
    volatile bit LVDS1                     @ ((unsigned)&LVCTL*8)+1; //LVD select  0000: Disable   0001: 2.19V  ??1111: 4.15V (TBD)
    volatile bit LVDS0                     @ ((unsigned)&LVCTL*8)+0; //LVD select  0000: Disable   0001: 2.19V  ??1111: 4.15V (TBD)

       #ifndef _LIB_BUILD
        volatile union {
             struct {
                unsigned    LVDS              :4;
                unsigned    LVDSAV            :1;
                unsigned    LVRSAV            :1;
                unsigned    LVDHYS            :1;
                unsigned    LVDF              :1;
            };
            struct {
                unsigned    LVDS0               :1;
                unsigned    LVDS1               :1;
                unsigned    LVDS2               :1;
                unsigned    LVDS3               :1;
            };
        } LVCTLbits @ 0x016;
        #endif
volatile unsigned char ADCDH               @ 0x017;  //ADC[11:4] output data Msb
//

volatile unsigned char ADCTL               @ 0x018;  //
//
    volatile bit ADCDL3                    @ ((unsigned)&ADCTL*8)+7; //ADC[3:0] output data Lsb
    volatile bit ADCDL2                    @ ((unsigned)&ADCTL*8)+6; //ADC[3:0] output data Lsb
    volatile bit ADCDL1                    @ ((unsigned)&ADCTL*8)+5; //ADC[3:0] output data Lsb
    volatile bit ADCDL0                    @ ((unsigned)&ADCTL*8)+4; //ADC[3:0] output data Lsb
    volatile bit ADST                      @ ((unsigned)&ADCTL*8)+3; //ADC Start, H/W clear after end of conversion
    volatile bit ADCKS2                    @ ((unsigned)&ADCTL*8)+2; //0: Fsys/256, 1: Fsys/128, 2: Fsys/64, 3: Fsys/32 4: Fsys/16,   5: Fysy/8,    6: Fsys/4,   7: Fsys/2 (TC)
    volatile bit ADCKS1                    @ ((unsigned)&ADCTL*8)+1; //0: Fsys/256, 1: Fsys/128, 2: Fsys/64, 3: Fsys/32 4: Fsys/16,   5: Fysy/8,    6: Fsys/4,   7: Fsys/2 (TC)
    volatile bit ADCKS0                    @ ((unsigned)&ADCTL*8)+0; //0: Fsys/256, 1: Fsys/128, 2: Fsys/64, 3: Fsys/32 4: Fsys/16,   5: Fysy/8,    6: Fsys/4,   7: Fsys/2 (TC)

       #ifndef _LIB_BUILD
        volatile union {
             struct {
                unsigned    ADCKS             :3;
                unsigned    ADST              :1;
                unsigned    ADCDL             :4;
            };
            struct {
                unsigned    ADCKS0              :1;
                unsigned    ADCKS1              :1;
                unsigned    ADCKS2              :1;
                unsigned                        :1;
                unsigned    ADCDL0              :1;
                unsigned    ADCDL1              :1;
                unsigned    ADCDL2              :1;
                unsigned    ADCDL3              :1;
            };
        } ADCTLbits @ 0x018;
        #endif
volatile unsigned char ADCTL2              @ 0x019;  //
//
    volatile bit ADVREFS1                  @ ((unsigned)&ADCTL2*8)+7; //ADC Vref select. 00: VCC, 01: 2.5207V, 10: 3.0379V, 11: 4.0646V
    volatile bit ADVREFS0                  @ ((unsigned)&ADCTL2*8)+6; //ADC Vref select. 00: VCC, 01: 2.5207V, 10: 3.0379V, 11: 4.0646V
    volatile bit ADCHS4                    @ ((unsigned)&ADCTL2*8)+4; //ADC channel select 14: VBGO 15: OPO 23: 1/4VCC
    volatile bit ADCHS3                    @ ((unsigned)&ADCTL2*8)+3; //ADC channel select 14: VBGO 15: OPO 23: 1/4VCC
    volatile bit ADCHS2                    @ ((unsigned)&ADCTL2*8)+2; //ADC channel select 14: VBGO 15: OPO 23: 1/4VCC
    volatile bit ADCHS1                    @ ((unsigned)&ADCTL2*8)+1; //ADC channel select 14: VBGO 15: OPO 23: 1/4VCC
    volatile bit ADCHS0                    @ ((unsigned)&ADCTL2*8)+0; //ADC channel select 14: VBGO 15: OPO 23: 1/4VCC

       #ifndef _LIB_BUILD
        volatile union {
             struct {
                unsigned    ADCHS             :5;
                unsigned                      :1;
                unsigned    ADVREFS           :2;
            };
            struct {
                unsigned    ADCHS0              :1;
                unsigned    ADCHS1              :1;
                unsigned    ADCHS2              :1;
                unsigned    ADCHS3              :1;
                unsigned    ADCHS4              :1;
                unsigned                        :1;
                unsigned    ADVREFS0            :1;
                unsigned    ADVREFS1            :1;
            };
        } ADCTL2bits @ 0x019;
        #endif
volatile unsigned char TKDL                @ 0x01A;  //Touch Key Counter Data 7~0
//

volatile unsigned char TKDH                @ 0x01B;  //
//
    volatile bit TKDH3                     @ ((unsigned)&TKDH*8)+3; //Touch Key Counter Data 11~8
    volatile bit TKDH2                     @ ((unsigned)&TKDH*8)+2; //Touch Key Counter Data 11~8
    volatile bit TKDH1                     @ ((unsigned)&TKDH*8)+1; //Touch Key Counter Data 11~8
    volatile bit TKDH0                     @ ((unsigned)&TKDH*8)+0; //Touch Key Counter Data 11~8

       #ifndef _LIB_BUILD
        volatile union {
             struct {
                unsigned    TKDH              :4;
                unsigned                      :4;
            };
            struct {
                unsigned    TKDH0               :1;
                unsigned    TKDH1               :1;
                unsigned    TKDH2               :1;
                unsigned    TKDH3               :1;
            };
        } TKDHbits @ 0x01B;
        #endif
volatile unsigned char TKCTL               @ 0x01E;  //Using at CTK
//
    volatile bit TKFJMP                    @ ((unsigned)&TKCTL*8)+7; //CTK clock frequency auto change select;     0: disable, determin by SFR JMPVAL   1: enable, auto-change
    volatile bit JMPVAL2                   @ ((unsigned)&TKCTL*8)+6; //(only available in TKFJMP=0) CTK clock  frequency select
    volatile bit JMPVAL1                   @ ((unsigned)&TKCTL*8)+5; //(only available in TKFJMP=0) CTK clock  frequency select
    volatile bit JMPVAL0                   @ ((unsigned)&TKCTL*8)+4; //(only available in TKFJMP=0) CTK clock  frequency select
    volatile bit CTKREFC2                  @ ((unsigned)&TKCTL*8)+2; //CTK conversion time (CX2, CX1, CX0):    0: smallest   7: longest
    volatile bit CTKREFC1                  @ ((unsigned)&TKCTL*8)+1; //CTK conversion time (CX2, CX1, CX0):    0: smallest   7: longest
    volatile bit CTKREFC0                  @ ((unsigned)&TKCTL*8)+0; //CTK conversion time (CX2, CX1, CX0):    0: smallest   7: longest

       #ifndef _LIB_BUILD
        volatile union {
             struct {
                unsigned    CTKREFC           :3;
                unsigned                      :1;
                unsigned    JMPVAL            :3;
                unsigned    TKFJMP            :1;
            };
            struct {
                unsigned    CTKREFC0            :1;
                unsigned    CTKREFC1            :1;
                unsigned    CTKREFC2            :1;
                unsigned                        :1;
                unsigned    JMPVAL0             :1;
                unsigned    JMPVAL1             :1;
                unsigned    JMPVAL2             :1;
            };
        } TKCTLbits @ 0x01E;
        #endif
volatile unsigned char TKCTL2              @ 0x01F;  //
//
    volatile bit CTKPD                     @ ((unsigned)&TKCTL2*8)+7; //CTK Touch Key Power Down   0: CTK enable   1: CTK disable
    volatile bit TKSOC                     @ ((unsigned)&TKCTL2*8)+6; //Touch Key Start of Conversion, HW clear while end of conversion
    volatile bit TKEOC                     @ ((unsigned)&TKCTL2*8)+5; //Touch Key End of Conversion
    volatile bit TKCHS3                    @ ((unsigned)&TKCTL2*8)+3; //Touch Key Channel Select
    volatile bit TKCHS2                    @ ((unsigned)&TKCTL2*8)+2; //Touch Key Channel Select
    volatile bit TKCHS1                    @ ((unsigned)&TKCTL2*8)+1; //Touch Key Channel Select
    volatile bit TKCHS0                    @ ((unsigned)&TKCTL2*8)+0; //Touch Key Channel Select

       #ifndef _LIB_BUILD
        volatile union {
             struct {
                unsigned    TKCHS             :4;
                unsigned                      :1;
                unsigned    TKEOC             :1;
                unsigned    TKSOC             :1;
                unsigned    CTKPD             :1;
            };
            struct {
                unsigned    TKCHS0              :1;
                unsigned    TKCHS1              :1;
                unsigned    TKCHS2              :1;
                unsigned    TKCHS3              :1;
            };
        } TKCTL2bits @ 0x01F;
        #endif
volatile unsigned char OPTION              @ 0x081;  //
//
    volatile bit HWAUTO                    @ ((unsigned)&OPTION*8)+7; //Save/Restore STATUS w/o TO, PD   (Hi-tech C don?™t need, set this bit = 0)
    volatile bit INT0EDG                   @ ((unsigned)&OPTION*8)+6; //INT0 interrupt trigger edge, 0: falling edge, 1: rising edge
    volatile bit INT1EDG                   @ ((unsigned)&OPTION*8)+5; //INT1 interrupt trigger edge, 0: falling edge, 1: rising edge
    volatile bit WDTPSC1                   @ ((unsigned)&OPTION*8)+3; //WDT Period, 0: 102ms, 1: 205ms, 2: 819ms, 3: 1638ms  @5V
    volatile bit WDTPSC0                   @ ((unsigned)&OPTION*8)+2; //WDT Period, 0: 102ms, 1: 205ms, 2: 819ms, 3: 1638ms  @5V
    volatile bit WKTPSC1                   @ ((unsigned)&OPTION*8)+1; //WKT Period, 0: 13ms, 1: 26ms, 2: 51ms, 3: 102ms  @3V
    volatile bit WKTPSC0                   @ ((unsigned)&OPTION*8)+0; //WKT Period, 0: 13ms, 1: 26ms, 2: 51ms, 3: 102ms  @3V

       #ifndef _LIB_BUILD
        volatile union {
             struct {
                unsigned    WKTPSC            :2;
                unsigned    WDTPSC            :2;
                unsigned                      :1;
                unsigned    INT1EDG           :1;
                unsigned    INT0EDG           :1;
                unsigned    HWAUTO            :1;
            };
            struct {
                unsigned    WKTPSC0             :1;
                unsigned    WKTPSC1             :1;
                unsigned    WDTPSC0             :1;
                unsigned    WDTPSC1             :1;
            };
        } OPTIONbits @ 0x081;
        #endif
volatile unsigned char PAMOD10             @ 0x085;  //PA1~PA0 Pin Mode Control
//
    volatile bit PA1MOD3                   @ ((unsigned)&PAMOD10*8)+7; //
    volatile bit PA1MOD2                   @ ((unsigned)&PAMOD10*8)+6; //
    volatile bit PA1MOD1                   @ ((unsigned)&PAMOD10*8)+5; //
    volatile bit PA1MOD0                   @ ((unsigned)&PAMOD10*8)+4; //
    volatile bit PA0MOD3                   @ ((unsigned)&PAMOD10*8)+3; //
    volatile bit PA0MOD2                   @ ((unsigned)&PAMOD10*8)+2; //
    volatile bit PA0MOD1                   @ ((unsigned)&PAMOD10*8)+1; //
    volatile bit PA0MOD0                   @ ((unsigned)&PAMOD10*8)+0; //

       #ifndef _LIB_BUILD
        volatile union {
             struct {
                unsigned    PA0MOD            :4;
                unsigned    PA1MOD            :4;
            };
            struct {
                unsigned    PA0MOD0             :1;
                unsigned    PA0MOD1             :1;
                unsigned    PA0MOD2             :1;
                unsigned    PA0MOD3             :1;
                unsigned    PA1MOD0             :1;
                unsigned    PA1MOD1             :1;
                unsigned    PA1MOD2             :1;
                unsigned    PA1MOD3             :1;
            };
        } PAMOD10bits @ 0x085;
        #endif
volatile unsigned char PAMOD32             @ 0x086;  //PA3~PA2 Pin Mode Control
//
    volatile bit PA3MOD3                   @ ((unsigned)&PAMOD32*8)+7; //
    volatile bit PA3MOD2                   @ ((unsigned)&PAMOD32*8)+6; //
    volatile bit PA3MOD1                   @ ((unsigned)&PAMOD32*8)+5; //
    volatile bit PA3MOD0                   @ ((unsigned)&PAMOD32*8)+4; //
    volatile bit PA2MOD3                   @ ((unsigned)&PAMOD32*8)+3; //
    volatile bit PA2MOD2                   @ ((unsigned)&PAMOD32*8)+2; //
    volatile bit PA2MOD1                   @ ((unsigned)&PAMOD32*8)+1; //
    volatile bit PA2MOD0                   @ ((unsigned)&PAMOD32*8)+0; //

       #ifndef _LIB_BUILD
        volatile union {
             struct {
                unsigned    PA2MOD            :4;
                unsigned    PA3MOD            :4;
            };
            struct {
                unsigned    PA2MOD0             :1;
                unsigned    PA2MOD1             :1;
                unsigned    PA2MOD2             :1;
                unsigned    PA2MOD3             :1;
                unsigned    PA3MOD0             :1;
                unsigned    PA3MOD1             :1;
                unsigned    PA3MOD2             :1;
                unsigned    PA3MOD3             :1;
            };
        } PAMOD32bits @ 0x086;
        #endif
volatile unsigned char PAMOD54             @ 0x087;  //PA5~PA4 Pin Mode Control
//
    volatile bit PA5MOD3                   @ ((unsigned)&PAMOD54*8)+7; //
    volatile bit PA5MOD2                   @ ((unsigned)&PAMOD54*8)+6; //
    volatile bit PA5MOD1                   @ ((unsigned)&PAMOD54*8)+5; //
    volatile bit PA5MOD0                   @ ((unsigned)&PAMOD54*8)+4; //
    volatile bit PA4MOD3                   @ ((unsigned)&PAMOD54*8)+3; //
    volatile bit PA4MOD2                   @ ((unsigned)&PAMOD54*8)+2; //
    volatile bit PA4MOD1                   @ ((unsigned)&PAMOD54*8)+1; //
    volatile bit PA4MOD0                   @ ((unsigned)&PAMOD54*8)+0; //

       #ifndef _LIB_BUILD
        volatile union {
             struct {
                unsigned    PA4MOD            :4;
                unsigned    PA5MOD            :4;
            };
            struct {
                unsigned    PA4MOD0             :1;
                unsigned    PA4MOD1             :1;
                unsigned    PA4MOD2             :1;
                unsigned    PA4MOD3             :1;
                unsigned    PA5MOD0             :1;
                unsigned    PA5MOD1             :1;
                unsigned    PA5MOD2             :1;
                unsigned    PA5MOD3             :1;
            };
        } PAMOD54bits @ 0x087;
        #endif
volatile unsigned char PAMOD76             @ 0x088;  //PA7~PA6 Pin Mode Control
//
    volatile bit PA7MOD3                   @ ((unsigned)&PAMOD76*8)+7; //
    volatile bit PA7MOD2                   @ ((unsigned)&PAMOD76*8)+6; //
    volatile bit PA7MOD1                   @ ((unsigned)&PAMOD76*8)+5; //
    volatile bit PA7MOD0                   @ ((unsigned)&PAMOD76*8)+4; //
    volatile bit PA6MOD3                   @ ((unsigned)&PAMOD76*8)+3; //
    volatile bit PA6MOD2                   @ ((unsigned)&PAMOD76*8)+2; //
    volatile bit PA6MOD1                   @ ((unsigned)&PAMOD76*8)+1; //
    volatile bit PA6MOD0                   @ ((unsigned)&PAMOD76*8)+0; //

       #ifndef _LIB_BUILD
        volatile union {
             struct {
                unsigned    PA6MOD            :4;
                unsigned    PA7MOD            :4;
            };
            struct {
                unsigned    PA6MOD0             :1;
                unsigned    PA6MOD1             :1;
                unsigned    PA6MOD2             :1;
                unsigned    PA6MOD3             :1;
                unsigned    PA7MOD0             :1;
                unsigned    PA7MOD1             :1;
                unsigned    PA7MOD2             :1;
                unsigned    PA7MOD3             :1;
            };
        } PAMOD76bits @ 0x088;
        #endif
volatile unsigned char PWMCTL              @ 0x089;  //
//
    volatile bit PWMEN                     @ ((unsigned)&PWMCTL*8)+7; //PWM Clock Enable. 0: Disable, 1: Enable
    volatile bit PWM0OM1                   @ ((unsigned)&PWMCTL*8)+5; //PWM0 output mode.  00 ~ 11: Mode0 ~ Mode3
    volatile bit PWM0OM0                   @ ((unsigned)&PWMCTL*8)+4; //PWM0 output mode.  00 ~ 11: Mode0 ~ Mode3
    volatile bit PWM0DZ3                   @ ((unsigned)&PWMCTL*8)+3; //PWM0 Dead Zone.   0000 ~ 1111: 0 ~ 14, 16*Tpwmclk
    volatile bit PWM0DZ2                   @ ((unsigned)&PWMCTL*8)+2; //PWM0 Dead Zone.   0000 ~ 1111: 0 ~ 14, 16*Tpwmclk
    volatile bit PWM0DZ1                   @ ((unsigned)&PWMCTL*8)+1; //PWM0 Dead Zone.   0000 ~ 1111: 0 ~ 14, 16*Tpwmclk
    volatile bit PWM0DZ0                   @ ((unsigned)&PWMCTL*8)+0; //PWM0 Dead Zone.   0000 ~ 1111: 0 ~ 14, 16*Tpwmclk

       #ifndef _LIB_BUILD
        volatile union {
             struct {
                unsigned    PWM0DZ            :4;
                unsigned    PWM0OM            :2;
                unsigned                      :1;
                unsigned    PWMEN             :1;
            };
            struct {
                unsigned    PWM0DZ0             :1;
                unsigned    PWM0DZ1             :1;
                unsigned    PWM0DZ2             :1;
                unsigned    PWM0DZ3             :1;
                unsigned    PWM0OM0             :1;
                unsigned    PWM0OM1             :1;
            };
        } PWMCTLbits @ 0x089;
        #endif
volatile unsigned char PBMOD10             @ 0x08C;  //PB1~PB0 Pin Mode Control
//
    volatile bit PB1MOD3                   @ ((unsigned)&PBMOD10*8)+7; //
    volatile bit PB1MOD2                   @ ((unsigned)&PBMOD10*8)+6; //
    volatile bit PB1MOD1                   @ ((unsigned)&PBMOD10*8)+5; //
    volatile bit PB1MOD0                   @ ((unsigned)&PBMOD10*8)+4; //
    volatile bit PB0MOD3                   @ ((unsigned)&PBMOD10*8)+3; //
    volatile bit PB0MOD2                   @ ((unsigned)&PBMOD10*8)+2; //
    volatile bit PB0MOD1                   @ ((unsigned)&PBMOD10*8)+1; //
    volatile bit PB0MOD0                   @ ((unsigned)&PBMOD10*8)+0; //

       #ifndef _LIB_BUILD
        volatile union {
             struct {
                unsigned    PB0MOD            :4;
                unsigned    PB1MOD            :4;
            };
            struct {
                unsigned    PB0MOD0             :1;
                unsigned    PB0MOD1             :1;
                unsigned    PB0MOD2             :1;
                unsigned    PB0MOD3             :1;
                unsigned    PB1MOD0             :1;
                unsigned    PB1MOD1             :1;
                unsigned    PB1MOD2             :1;
                unsigned    PB1MOD3             :1;
            };
        } PBMOD10bits @ 0x08C;
        #endif
volatile unsigned char PBMOD32             @ 0x08D;  //PB3~PB2 Pin Mode Control
//
    volatile bit PB3MOD3                   @ ((unsigned)&PBMOD32*8)+7; //
    volatile bit PB3MOD2                   @ ((unsigned)&PBMOD32*8)+6; //
    volatile bit PB3MOD1                   @ ((unsigned)&PBMOD32*8)+5; //
    volatile bit PB3MOD0                   @ ((unsigned)&PBMOD32*8)+4; //
    volatile bit PB2MOD3                   @ ((unsigned)&PBMOD32*8)+3; //
    volatile bit PB2MOD2                   @ ((unsigned)&PBMOD32*8)+2; //
    volatile bit PB2MOD1                   @ ((unsigned)&PBMOD32*8)+1; //
    volatile bit PB2MOD0                   @ ((unsigned)&PBMOD32*8)+0; //

       #ifndef _LIB_BUILD
        volatile union {
             struct {
                unsigned    PB2MOD            :4;
                unsigned    PB3MOD            :4;
            };
            struct {
                unsigned    PB2MOD0             :1;
                unsigned    PB2MOD1             :1;
                unsigned    PB2MOD2             :1;
                unsigned    PB2MOD3             :1;
                unsigned    PB3MOD0             :1;
                unsigned    PB3MOD1             :1;
                unsigned    PB3MOD2             :1;
                unsigned    PB3MOD3             :1;
            };
        } PBMOD32bits @ 0x08D;
        #endif
volatile unsigned char PBMOD54             @ 0x08E;  //PB5~PB4 Pin Mode Control
//
    volatile bit PB5MOD3                   @ ((unsigned)&PBMOD54*8)+7; //
    volatile bit PB5MOD2                   @ ((unsigned)&PBMOD54*8)+6; //
    volatile bit PB5MOD1                   @ ((unsigned)&PBMOD54*8)+5; //
    volatile bit PB5MOD0                   @ ((unsigned)&PBMOD54*8)+4; //
    volatile bit PB4MOD3                   @ ((unsigned)&PBMOD54*8)+3; //
    volatile bit PB4MOD2                   @ ((unsigned)&PBMOD54*8)+2; //
    volatile bit PB4MOD1                   @ ((unsigned)&PBMOD54*8)+1; //
    volatile bit PB4MOD0                   @ ((unsigned)&PBMOD54*8)+0; //

       #ifndef _LIB_BUILD
        volatile union {
             struct {
                unsigned    PB4MOD            :4;
                unsigned    PB5MOD            :4;
            };
            struct {
                unsigned    PB4MOD0             :1;
                unsigned    PB4MOD1             :1;
                unsigned    PB4MOD2             :1;
                unsigned    PB4MOD3             :1;
                unsigned    PB5MOD0             :1;
                unsigned    PB5MOD1             :1;
                unsigned    PB5MOD2             :1;
                unsigned    PB5MOD3             :1;
            };
        } PBMOD54bits @ 0x08E;
        #endif
volatile unsigned char PBMOD76             @ 0x08F;  //PB7~PB6 Pin Mode Control
//
    volatile bit PB7MOD3                   @ ((unsigned)&PBMOD76*8)+7; //
    volatile bit PB7MOD2                   @ ((unsigned)&PBMOD76*8)+6; //
    volatile bit PB7MOD1                   @ ((unsigned)&PBMOD76*8)+5; //
    volatile bit PB7MOD0                   @ ((unsigned)&PBMOD76*8)+4; //
    volatile bit PB6MOD3                   @ ((unsigned)&PBMOD76*8)+3; //
    volatile bit PB6MOD2                   @ ((unsigned)&PBMOD76*8)+2; //
    volatile bit PB6MOD1                   @ ((unsigned)&PBMOD76*8)+1; //
    volatile bit PB6MOD0                   @ ((unsigned)&PBMOD76*8)+0; //

       #ifndef _LIB_BUILD
        volatile union {
             struct {
                unsigned    PB6MOD            :4;
                unsigned    PB7MOD            :4;
            };
            struct {
                unsigned    PB6MOD0             :1;
                unsigned    PB6MOD1             :1;
                unsigned    PB6MOD2             :1;
                unsigned    PB6MOD3             :1;
                unsigned    PB7MOD0             :1;
                unsigned    PB7MOD1             :1;
                unsigned    PB7MOD2             :1;
                unsigned    PB7MOD3             :1;
            };
        } PBMOD76bits @ 0x08F;
        #endif
volatile unsigned char PDMOD10             @ 0x090;  //PD1~PD0 Pin Mode Control
//
    volatile bit PD1MOD3                   @ ((unsigned)&PDMOD10*8)+7; //
    volatile bit PD1MOD2                   @ ((unsigned)&PDMOD10*8)+6; //
    volatile bit PD1MOD1                   @ ((unsigned)&PDMOD10*8)+5; //
    volatile bit PD1MOD0                   @ ((unsigned)&PDMOD10*8)+4; //
    volatile bit PD0MOD3                   @ ((unsigned)&PDMOD10*8)+3; //
    volatile bit PD0MOD2                   @ ((unsigned)&PDMOD10*8)+2; //
    volatile bit PD0MOD1                   @ ((unsigned)&PDMOD10*8)+1; //
    volatile bit PD0MOD0                   @ ((unsigned)&PDMOD10*8)+0; //

       #ifndef _LIB_BUILD
        volatile union {
             struct {
                unsigned    PD0MOD            :4;
                unsigned    PD1MOD            :4;
            };
            struct {
                unsigned    PD0MOD0             :1;
                unsigned    PD0MOD1             :1;
                unsigned    PD0MOD2             :1;
                unsigned    PD0MOD3             :1;
                unsigned    PD1MOD0             :1;
                unsigned    PD1MOD1             :1;
                unsigned    PD1MOD2             :1;
                unsigned    PD1MOD3             :1;
            };
        } PDMOD10bits @ 0x090;
        #endif
volatile unsigned char OPTION2             @ 0x091;  //
//
    volatile bit PWMCKS1                   @ ((unsigned)&OPTION2*8)+5; //PWM Clock Source. 00/01: CPUCLK, 10: FRC16M, 11: FRC32M
    volatile bit PWMCKS0                   @ ((unsigned)&OPTION2*8)+4; //PWM Clock Source. 00/01: CPUCLK, 10: FRC16M, 11: FRC32M
    volatile bit INT2SEL                   @ ((unsigned)&OPTION2*8)+2; //INT2 PIN select ,  0 : PA7   1:PB5
    volatile bit INT1SEL                   @ ((unsigned)&OPTION2*8)+1; //INT1 PIN select ,  0 : PA1   1:PB1
    volatile bit INT0SEL                   @ ((unsigned)&OPTION2*8)+0; //INT0 PIN select ,  0 : PA3   1:PB2

       #ifndef _LIB_BUILD
        volatile union {
             struct {
                unsigned    INT0SEL           :1;
                unsigned    INT1SEL           :1;
                unsigned    INT2SEL           :1;
                unsigned                      :1;
                unsigned    PWMCKS            :2;
                unsigned                      :2;
            };
            struct {
                unsigned    INTx_SEL          :3;
                unsigned                      :1; 
                unsigned    PWMCKS0           :1;
                unsigned    PWMCKS1           :1;
            };
        } OPTION2bits @ 0x091;
        #endif
volatile unsigned char PWMPRDH             @ 0x092;  //PWM0 Period Msb 8bit
//

volatile unsigned char PWMPRDL             @ 0x093;  //PWM0 Period Lsb 8bit
//

volatile unsigned char PWM0DH              @ 0x094;  //PWM0 Duty Msb 8bit
//

volatile unsigned char PWM0DL              @ 0x095;  //PWM0 Duty Lsb 8bit
//

volatile unsigned char PWM1DH              @ 0x096;  //PWM1 Duty Msb 8bit
//

volatile unsigned char PWM1DL              @ 0x097;  //PWM1 Duty Lsb 8bit
//

volatile unsigned char PWM2DH              @ 0x098;  //PWM2 Duty Msb 8bit
//

volatile unsigned char PWM2DL              @ 0x099;  //PWM2 Duty Lsb 8bit
//

volatile unsigned char PWM3DH              @ 0x09A;  //PWM3 Duty Msb 8bit
//

volatile unsigned char PWM3DL              @ 0x09B;  //PWM3 Duty Lsb 8bit
//

volatile unsigned char PWM4DH              @ 0x09C;  //PWM4 Duty Msb 8bit
//

volatile unsigned char PWM4DL              @ 0x09D;  //PWM4 Duty Lsb 8bit
//

volatile unsigned char PWM5DH              @ 0x09E;  //PWM5 Duty Msb 8bit
//

volatile unsigned char PWM5DL              @ 0x09F;  //PWM5 Duty Lsb 8bit
//
volatile unsigned char PINMOD              @ 0x105;  //
    volatile bit HSINK                     @ ((unsigned)&PINMOD*8)+2; //
    volatile bit OPOE                      @ ((unsigned)&PINMOD*8)+1; //
    volatile bit VBGOE                     @ ((unsigned)&PINMOD*8)+0; //

       #ifndef _LIB_BUILD
        volatile union {
             struct {
                unsigned    VBGOE           :1;
                unsigned    OPOE            :1;
                unsigned    HSINK           :1;
                unsigned                    :5;
            };
        } PINMODbits @ 0x105;
        #endif

volatile unsigned char OPCTL               @ 0x108;  //
//
    volatile bit PDOPA                     @ ((unsigned)&OPCTL*8)+7; //OPA power down enable control 0: OPA enable 1: OPA disable
    volatile bit SOPP1                     @ ((unsigned)&OPCTL*8)+6; //OPA P input select  00: OPP input source is PD0 01: OPP input source is PD1 10: OPP input source is PA2 11: OPP input source is AVSS
    volatile bit SOPP0                     @ ((unsigned)&OPCTL*8)+5; //OPA P input select  00: OPP input source is PD0 01: OPP input source is PD1 10: OPP input source is PA2 11: OPP input source is AVSS
    volatile bit SOTV                      @ ((unsigned)&OPCTL*8)+4; //SOTV:  OPA N port voltage select when OPA at Trim 1 mode or comparator mode  0: AVSS 1: VBG
    volatile bit SOPG1                     @ ((unsigned)&OPCTL*8)+3; //select OPA gain 00: 1X 01: 20X 10: 50X 11: 100X
    volatile bit SOPG0                     @ ((unsigned)&OPCTL*8)+2; //select OPA gain 00: 1X 01: 20X 10: 50X 11: 100X
    volatile bit SOPM1                     @ ((unsigned)&OPCTL*8)+1; //select OPA operating mode 00: normal mode 01: Trim 1 mode 10: Trim 2 mode 11: comparator mode
    volatile bit SOPM0                     @ ((unsigned)&OPCTL*8)+0; //select OPA operating mode 00: normal mode 01: Trim 1 mode 10: Trim 2 mode 11: comparator mode

       #ifndef _LIB_BUILD
        volatile union {
             struct {
                unsigned    SOPM              :2;
                unsigned    SOPG              :2;
                unsigned    SOTV              :1;
                unsigned    SOPP              :2;
                unsigned    PDOPA             :1;
            };
            struct {
                unsigned    SOPM0               :1;
                unsigned    SOPM1               :1;
                unsigned    SOPG0               :1;
                unsigned    SOPG1               :1;
                unsigned                        :1;
                unsigned    SOPP0               :1;
                unsigned    SOPP1               :1;
            };
        } OPCTLbits @ 0x108;
        #endif
volatile unsigned char LVRPD               @ 0x109;  //Write 0x37 to force LVR+POR Disable Write 0x38 to force LVR Disable, POR still Enable Write 0x39 to force POR Disable, LVR still Enable
//
    volatile bit PORPDF                    @ ((unsigned)&LVRPD*8)+1; //
    volatile bit LVRPDF                    @ ((unsigned)&LVRPD*8)+0; //

       #ifndef _LIB_BUILD
        volatile union {
             struct {
                unsigned    LVRPDF            :1;
                unsigned    PORPDF            :1;
                unsigned                      :6;
            };
        } LVRPDbits @ 0x109;
        #endif
volatile unsigned char PCH                 @ 0x10C;  //
//
    volatile bit PCH3                      @ ((unsigned)&PCH*8)+3; //Program Counter 11~8
    volatile bit PCH2                      @ ((unsigned)&PCH*8)+2; //Program Counter 11~8
    volatile bit PCH1                      @ ((unsigned)&PCH*8)+1; //Program Counter 11~8
    volatile bit PCH0                      @ ((unsigned)&PCH*8)+0; //Program Counter 11~8

       #ifndef _LIB_BUILD
        volatile union {
             struct {
                unsigned    PCH               :4;
                unsigned                      :4;
            };
            struct {
                unsigned    PCH0                :1;
                unsigned    PCH1                :1;
                unsigned    PCH2                :1;
                unsigned    PCH3                :1;
            };
        } PCHbits @ 0x10C;
        #endif
volatile unsigned char OPTRIM              @ 0x10D;  //OPA trim value
//

volatile unsigned char BGTRIM              @ 0x10E;  //VBG trim value
//

volatile unsigned char IRCF                @ 0x10F;  //FIRC trim value
//

volatile unsigned char CFG0B               @ 0x110;  //Reserved
//

volatile unsigned char DPL                 @ 0x185;  //TBL Data Pointer 7~0
//

volatile unsigned char DPH                 @ 0x186;  //TBL Data Pointer 11~8
//

volatile unsigned char CRCDL               @ 0x187;  //CRC16 Data 7~0
//

volatile unsigned char CRCDH               @ 0x188;  //CRC16 Data 15~8
//

volatile unsigned char CRCIN               @ 0x189;  //CRC input 
//

volatile unsigned char TABR                @ 0x18C;  //1. TABR write 1 =  opcode TABRL 2. TABR write 2 = opcode TABRH 3. afer step.1 or step.2, read TABR to get table read value
//

volatile unsigned char CMPCTL              @ 0x18D;  //
//
    volatile bit PDCMP                     @ ((unsigned)&CMPCTL*8)+7; //Comparator power down enable control 0: CMP enable 1: CMP disable
    volatile bit CMPOX                     @ ((unsigned)&CMPCTL*8)+6; //Comparator Output 0: CIP < CIN 1: CIP > CIN or PDCMP=1
    volatile bit CMPOE                     @ ((unsigned)&CMPCTL*8)+5; //1: CMPO output to PA5 (after CMPINV)
    volatile bit CMPINV                    @ ((unsigned)&CMPCTL*8)+4; //Comparator output (CMPO) invert 0: disable 1: enable
    volatile bit CMPTRIG1                  @ ((unsigned)&CMPCTL*8)+3; //Comparator interrupts trigger direction 00: rising edge trigger  (When CMPINV=0) 01: falling edge trigger (When CMPINV=0) 10: both edge trigger    (When CMPINV=0) 11: high level trigger    (When CMPINV=0)
    volatile bit CMPTRIG0                  @ ((unsigned)&CMPCTL*8)+2; //Comparator interrupts trigger direction 00: rising edge trigger  (When CMPINV=0) 01: falling edge trigger (When CMPINV=0) 10: both edge trigger    (When CMPINV=0) 11: high level trigger    (When CMPINV=0)
    volatile bit CMPDBS1                   @ ((unsigned)&CMPCTL*8)+1; //Comparator output debounce time 00: None 01: 4 Fsys 10: 8 Fsys 11: 16 Fsys
    volatile bit CMPDBS0                   @ ((unsigned)&CMPCTL*8)+0; //Comparator output debounce time 00: None 01: 4 Fsys 10: 8 Fsys 11: 16 Fsys

       #ifndef _LIB_BUILD
        volatile union {
             struct {
                unsigned    CMPDBS            :2;
                unsigned    CMPTRIG           :2;
                unsigned    CMPINV            :1;
                unsigned    CMPOE             :1;
                unsigned    CMPOX             :1;
                unsigned    PDCMP             :1;
            };
            struct {
                unsigned    CMPDBS0             :1;
                unsigned    CMPDBS1             :1;
                unsigned    CMPTRIG0            :1;
                unsigned    CMPTRIG1            :1;
            };
            struct {
                unsigned                        :2;
                unsigned    INVTRIG             :3;
            };
        } CMPCTLbits @ 0x18D;
        #endif
volatile unsigned char CMPPNS              @ 0x18E;  //
//
    volatile bit SCMPN                     @ ((unsigned)&CMPPNS*8)+7; //SCMPN: internal DAC output connect to Comparator control 0: CINx connect to comparator N port 1: internal DAC output connect to comparator N port
    volatile bit SCIN2                     @ ((unsigned)&CMPPNS*8)+6; //Comparator N input select 000: CIN1 connect to comparator N port 001: CIN2 connect to comparator N port 010: CIN3 connect to comparator N port 011: CIN4 connect to comparator N port 1xx: NC
    volatile bit SCIN1                     @ ((unsigned)&CMPPNS*8)+5; //Comparator N input select 000: CIN1 connect to comparator N port 001: CIN2 connect to comparator N port 010: CIN3 connect to comparator N port 011: CIN4 connect to comparator N port 1xx: NC
    volatile bit SCIN0                     @ ((unsigned)&CMPPNS*8)+4; //Comparator N input select 000: CIN1 connect to comparator N port 001: CIN2 connect to comparator N port 010: CIN3 connect to comparator N port 011: CIN4 connect to comparator N port 1xx: NC
    volatile bit OPOF                      @ ((unsigned)&CMPPNS*8)+3; //OPOF: OPA output (OPO) connect to Comparator control 0: OPO connect to comparator P port 1: OPO disconnect to comparator P port
    volatile bit SCIP2                     @ ((unsigned)&CMPPNS*8)+2; //Comparator P input select 000: CIP1 connect to comparator P port 001: CIP2 connect to comparator P port 010: CIP3 connect to comparator P port 011: CIP4 connect to comparator P port 1xx: NC
    volatile bit SCIP1                     @ ((unsigned)&CMPPNS*8)+1; //Comparator P input select 000: CIP1 connect to comparator P port 001: CIP2 connect to comparator P port 010: CIP3 connect to comparator P port 011: CIP4 connect to comparator P port 1xx: NC
    volatile bit SCIP0                     @ ((unsigned)&CMPPNS*8)+0; //Comparator P input select 000: CIP1 connect to comparator P port 001: CIP2 connect to comparator P port 010: CIP3 connect to comparator P port 011: CIP4 connect to comparator P port 1xx: NC

       #ifndef _LIB_BUILD
        volatile union {
             struct {
                unsigned    SCIP              :3;
                unsigned    OPOF              :1;
                unsigned    SCIN              :3;
                unsigned    SCMPN             :1;
            };
            struct {
                unsigned    SCIP0               :1;
                unsigned    SCIP1               :1;
                unsigned    SCIP2               :1;
                unsigned                        :1;
                unsigned    SCIN0               :1;
                unsigned    SCIN1               :1;
                unsigned    SCIN2               :1;
            };
            struct {
                unsigned    CINP              :4;                
                unsigned    CINN              :4;               
            };
        } CMPPNSbits @ 0x18E;
        #endif
volatile unsigned char DACTL               @ 0x18F;  //
//
    volatile bit SVRF                      @ ((unsigned)&DACTL*8)+7; //Select comparator reference voltage level 0: VDDA 1: VBGO
    volatile bit SVL6                      @ ((unsigned)&DACTL*8)+6; //Select DAC output voltage  reference source can be selected as VDDA or VBGO 000_0000: 0/128 * reference source 000_0001: 1/128 * referencee source ??111_1101: 125/128 * reference source 111_1110: Reserved 111_1111: Reserved  
    volatile bit SVL5                      @ ((unsigned)&DACTL*8)+5; //Select DAC output voltage  reference source can be selected as VDDA or VBGO 000_0000: 0/128 * reference source 000_0001: 1/128 * referencee source ??111_1101: 125/128 * reference source 111_1110: Reserved 111_1111: Reserved  
    volatile bit SVL4                      @ ((unsigned)&DACTL*8)+4; //Select DAC output voltage  reference source can be selected as VDDA or VBGO 000_0000: 0/128 * reference source 000_0001: 1/128 * referencee source ??111_1101: 125/128 * reference source 111_1110: Reserved 111_1111: Reserved  
    volatile bit SVL3                      @ ((unsigned)&DACTL*8)+3; //Select DAC output voltage  reference source can be selected as VDDA or VBGO 000_0000: 0/128 * reference source 000_0001: 1/128 * referencee source ??111_1101: 125/128 * reference source 111_1110: Reserved 111_1111: Reserved  
    volatile bit SVL2                      @ ((unsigned)&DACTL*8)+2; //Select DAC output voltage  reference source can be selected as VDDA or VBGO 000_0000: 0/128 * reference source 000_0001: 1/128 * referencee source ??111_1101: 125/128 * reference source 111_1110: Reserved 111_1111: Reserved  
    volatile bit SVL1                      @ ((unsigned)&DACTL*8)+1; //Select DAC output voltage  reference source can be selected as VDDA or VBGO 000_0000: 0/128 * reference source 000_0001: 1/128 * referencee source ??111_1101: 125/128 * reference source 111_1110: Reserved 111_1111: Reserved  
    volatile bit SVL0                      @ ((unsigned)&DACTL*8)+0; //Select DAC output voltage  reference source can be selected as VDDA or VBGO 000_0000: 0/128 * reference source 000_0001: 1/128 * referencee source ??111_1101: 125/128 * reference source 111_1110: Reserved 111_1111: Reserved  

       #ifndef _LIB_BUILD
        volatile union {
             struct {
                unsigned    SVL               :7;
                unsigned    SVRF              :1;
            };
            struct {
                unsigned    SVL0                :1;
                unsigned    SVL1                :1;
                unsigned    SVL2                :1;
                unsigned    SVL3                :1;
                unsigned    SVL4                :1;
                unsigned    SVL5                :1;
                unsigned    SVL6                :1;
            };
        } DACTLbits @ 0x18F;
        #endif
volatile unsigned char EEPCTL              @ 0x190;  //
//
    volatile bit EEPTO                     @ ((unsigned)&EEPCTL*8)+7; //EEPROM Write Time-Out Flag
    volatile bit EEPTE1                    @ ((unsigned)&EEPCTL*8)+1; //EEPROM Write Time-Out Enable. 00: Disable, 01: 1.5ms, 10: 5.8ms, 11: 11.7ms
    volatile bit EEPTE0                    @ ((unsigned)&EEPCTL*8)+0; //EEPROM Write Time-Out Enable. 00: Disable, 01: 1.5ms, 10: 5.8ms, 11: 11.7ms

       #ifndef _LIB_BUILD
        volatile union {
             struct {
                unsigned    EEPTE             :2;
                unsigned                      :5;
                unsigned    EEPTO             :1;
            };
            struct {
                unsigned    EEPTE0              :1;
                unsigned    EEPTE1              :1;
            };
        } EEPCTLbits @ 0x190;
        #endif
volatile unsigned char EEPEN               @ 0x191;  //
//
    volatile bit EEPEN0                    @ ((unsigned)&EEPEN*8)+0; //EEPROM Enable. 0xE2: Enable, others: Disable

       #ifndef _LIB_BUILD
        volatile union {
             struct {
                unsigned    EEPEN             :8;
            };
        } EEPENbits @ 0x191;
        #endif
volatile unsigned char EEPDT               @ 0x192;  //
//
    volatile bit EEPDT7                    @ ((unsigned)&EEPDT*8)+7; //EEPROM Data to Write
    volatile bit EEPDT6                    @ ((unsigned)&EEPDT*8)+6; //EEPROM Data to Write
    volatile bit EEPDT5                    @ ((unsigned)&EEPDT*8)+5; //EEPROM Data to Write
    volatile bit EEPDT4                    @ ((unsigned)&EEPDT*8)+4; //EEPROM Data to Write
    volatile bit EEPDT3                    @ ((unsigned)&EEPDT*8)+3; //EEPROM Data to Write
    volatile bit EEPDT2                    @ ((unsigned)&EEPDT*8)+2; //EEPROM Data to Write
    volatile bit EEPDT1                    @ ((unsigned)&EEPDT*8)+1; //EEPROM Data to Write
    volatile bit EEPDT0                    @ ((unsigned)&EEPDT*8)+0; //EEPROM Data to Write

       #ifndef _LIB_BUILD
        volatile union {
             struct {
                unsigned    EEPDT             :8;
            };
            struct {
                unsigned    EEPDT0              :1;
                unsigned    EEPDT1              :1;
                unsigned    EEPDT2              :1;
                unsigned    EEPDT3              :1;
                unsigned    EEPDT4              :1;
                unsigned    EEPDT5              :1;
                unsigned    EEPDT6              :1;
                unsigned    EEPDT7              :1;
            };
        } EEPDTbits @ 0x192;
        #endif
//======================================================================================
//Lower Case
//======================================================================================
volatile unsigned char indf                @ 0x000;  //
//

volatile unsigned char tm0                 @ 0x001;  //timer0
//

volatile unsigned char pcl                 @ 0x002;  //program counter 7~0
//

volatile unsigned char status              @ 0x003;  //
//
    volatile bit irp                       @ ((unsigned)&status*8)+7; //register bank select bit for indf access
    volatile bit rp1                       @ ((unsigned)&status*8)+6; //register bank select bit 1 for direct addressing 
    volatile bit rp0                       @ ((unsigned)&status*8)+5; //register bank select bit 0 for direct addressing 
    volatile bit to                        @ ((unsigned)&status*8)+4; //wdt time out flag
    volatile bit pd                        @ ((unsigned)&status*8)+3; //power down flag
    volatile bit z                         @ ((unsigned)&status*8)+2; //zero flag
    volatile bit dc                        @ ((unsigned)&status*8)+1; //decimal carry flag
    volatile bit c                         @ ((unsigned)&status*8)+0; //carry flag

       #ifndef _lib_build
        volatile union {
             struct {
                unsigned    c                 :1;
                unsigned    dc                :1;
                unsigned    z                 :1;
                unsigned    pd                :1;
                unsigned    to                :1;
                unsigned    rp                  : 2;
                unsigned    irp                 : 1;
            };
            struct {
                unsigned                        : 5;
                unsigned    rp0                 : 1;
                unsigned    rp1                 : 1;
            };
        } statusbits @ 0x003;
        #endif
volatile unsigned char fsr                 @ 0x004;  //
//

volatile unsigned char pad                 @ 0x005;
    //pad
    volatile bit pad7                      @ ((unsigned)&pad*8)+7;
    volatile bit pad6                      @ ((unsigned)&pad*8)+6;
    volatile bit pad5                      @ ((unsigned)&pad*8)+5;
    volatile bit pad4                      @ ((unsigned)&pad*8)+4;
    volatile bit pad3                      @ ((unsigned)&pad*8)+3;
    volatile bit pad2                      @ ((unsigned)&pad*8)+2;
    volatile bit pad1                      @ ((unsigned)&pad*8)+1;
    volatile bit pad0                      @ ((unsigned)&pad*8)+0;
    //pa
    volatile bit pa7                       @ ((unsigned)&pad*8)+7;
    volatile bit pa6                       @ ((unsigned)&pad*8)+6;
    volatile bit pa5                       @ ((unsigned)&pad*8)+5;
    volatile bit pa4                       @ ((unsigned)&pad*8)+4;
    volatile bit pa3                       @ ((unsigned)&pad*8)+3;
    volatile bit pa2                       @ ((unsigned)&pad*8)+2;
    volatile bit pa1                       @ ((unsigned)&pad*8)+1;
    volatile bit pa0                       @ ((unsigned)&pad*8)+0;

volatile unsigned char pbd                 @ 0x006;
    //pbd
    volatile bit pbd7                      @ ((unsigned)&pbd*8)+7;
    volatile bit pbd6                      @ ((unsigned)&pbd*8)+6;
    volatile bit pbd5                      @ ((unsigned)&pbd*8)+5;
    volatile bit pbd4                      @ ((unsigned)&pbd*8)+4;
    volatile bit pbd3                      @ ((unsigned)&pbd*8)+3;
    volatile bit pbd2                      @ ((unsigned)&pbd*8)+2;
    volatile bit pbd1                      @ ((unsigned)&pbd*8)+1;
    volatile bit pbd0                      @ ((unsigned)&pbd*8)+0;
    //pb
    volatile bit pb7                       @ ((unsigned)&pbd*8)+7;
    volatile bit pb6                       @ ((unsigned)&pbd*8)+6;
    volatile bit pb5                       @ ((unsigned)&pbd*8)+5;
    volatile bit pb4                       @ ((unsigned)&pbd*8)+4;
    volatile bit pb3                       @ ((unsigned)&pbd*8)+3;
    volatile bit pb2                       @ ((unsigned)&pbd*8)+2;
    volatile bit pb1                       @ ((unsigned)&pbd*8)+1;
    volatile bit pb0                       @ ((unsigned)&pbd*8)+0;

volatile unsigned char pdd                 @ 0x007;
    //pdd
    volatile bit pdd1                      @ ((unsigned)&pdd*8)+1;
    volatile bit pdd0                      @ ((unsigned)&pdd*8)+0;
    //pd
    volatile bit pd1                       @ ((unsigned)&pdd*8)+1;
    volatile bit pd0                       @ ((unsigned)&pdd*8)+0;

volatile unsigned char pclath              @ 0x00a;  //
//
    volatile bit gpr3                      @ ((unsigned)&pclath*8)+7; //general purpose register
    volatile bit gpr2                      @ ((unsigned)&pclath*8)+6; //general purpose register
    volatile bit gpr1                      @ ((unsigned)&pclath*8)+5; //general purpose register
    volatile bit gpr0                      @ ((unsigned)&pclath*8)+4; //general 4k/8k rom   (rom bank)
    volatile bit pclath3                   @ ((unsigned)&pclath*8)+3; //for 4k/8k rom   (rom bank)
    volatile bit pclath2                   @ ((unsigned)&pclath*8)+2; //write buffer for the upper 3 bits of the program counter
    volatile bit pclath1                   @ ((unsigned)&pclath*8)+1; //write buffer for the upper 3 bits of the program counter
    volatile bit pclath0                   @ ((unsigned)&pclath*8)+0; //write buffer for the upper 3 bits of the program counter

       #ifndef _lib_build
        volatile union {
             struct {
                unsigned    pclath            :4;
                unsigned    gpr               :4;
            };
            struct {
                unsigned    pclath0             :1;
                unsigned    pclath1             :1;
                unsigned    pclath2             :1;
                unsigned    pclath3             :1;
                unsigned    gpr0                :1;
                unsigned    gpr1                :1;
                unsigned    gpr2                :1;
                unsigned    gpr3                :1;
            };
        } pclathbits @ 0x00a;
        #endif
volatile unsigned char intie               @ 0x00b;  //
//
    volatile bit adcie                     @ ((unsigned)&intie*8)+7; //adc interrupt enable
    volatile bit t2ie                      @ ((unsigned)&intie*8)+6; //timer2 interrupt enable
    volatile bit tm1ie                     @ ((unsigned)&intie*8)+5; //timer1 interrupt enable
    volatile bit tm0ie                     @ ((unsigned)&intie*8)+4; //timer0 interrupt enable
    volatile bit wktie                     @ ((unsigned)&intie*8)+3; //wkt interrupt enable
    volatile bit int2ie                    @ ((unsigned)&intie*8)+2; //xint2 interrupt enable, pa7 or pb5
    volatile bit int1ie                    @ ((unsigned)&intie*8)+1; //xint1 interrupt enable, pa1 or pb1
    volatile bit int0ie                    @ ((unsigned)&intie*8)+0; //xint0 interrupt enable, pa3 or pb2

       #ifndef _lib_build
        volatile union {
             struct {
                unsigned    int0ie            :1;
                unsigned    int1ie            :1;
                unsigned    int2ie            :1;
                unsigned    wktie             :1;
                unsigned    tm0ie             :1;
                unsigned    tm1ie             :1;
                unsigned    t2ie              :1;
                unsigned    adcie             :1;
            };
        } intiebits @ 0x00b;
        #endif
volatile unsigned char intif               @ 0x00c;  //
//
    volatile bit adcif                     @ ((unsigned)&intif*8)+7; //adc interrupt flag
    volatile bit t2if                      @ ((unsigned)&intif*8)+6; //timer2 interrupt flag
    volatile bit tm1if                     @ ((unsigned)&intif*8)+5; //timer1 interrupt flag
    volatile bit tm0if                     @ ((unsigned)&intif*8)+4; //timer0 interrupt flag
    volatile bit wktif                     @ ((unsigned)&intif*8)+3; //wkt interrupt flag
    volatile bit int2if                    @ ((unsigned)&intif*8)+2; //xint2 interrupt flag
    volatile bit int1if                    @ ((unsigned)&intif*8)+1; //xint1 interrupt flag
    volatile bit int0if                    @ ((unsigned)&intif*8)+0; //xint0 interrupt flag

       #ifndef _lib_build
        volatile union {
             struct {
                unsigned    int0if            :1;
                unsigned    int1if            :1;
                unsigned    int2if            :1;
                unsigned    wktif             :1;
                unsigned    tm0if             :1;
                unsigned    tm1if             :1;
                unsigned    t2if              :1;
                unsigned    adcif             :1;
            };
        } intifbits @ 0x00c;
        #endif
volatile unsigned char intie1              @ 0x00d;  //
//
    volatile bit cmpie                     @ ((unsigned)&intie1*8)+4; //comparator interrupt enable 0: disable 1: enable
    volatile bit tkie                      @ ((unsigned)&intie1*8)+2; //touch key interrupt enable
    volatile bit pwmie                     @ ((unsigned)&intie1*8)+1; //pwm0 interrupt enable
    volatile bit lvdie                     @ ((unsigned)&intie1*8)+0; //lvd interrupt enable

       #ifndef _lib_build
        volatile union {
             struct {
                unsigned    lvdie             :1;
                unsigned    pwmie             :1;
                unsigned    tkie              :1;
                unsigned                      :1;
                unsigned    cmpie             :1;
                unsigned                      :3;
            };
        } intie1bits @ 0x00d;
        #endif
volatile unsigned char intif1              @ 0x00e;  //
//
    volatile bit cmpif                     @ ((unsigned)&intif1*8)+4; //comparator interrupt flag this bit is set by h/w while compare a new data, write 0 to this bit will clear this flag
    volatile bit tkif                      @ ((unsigned)&intif1*8)+2; //touch key interrupt flag
    volatile bit pwmif                     @ ((unsigned)&intif1*8)+1; //pwm0 interrupt flag
    volatile bit lvdif                     @ ((unsigned)&intif1*8)+0; //lvd interrupt flag

       #ifndef _lib_build
        volatile union {
             struct {
                unsigned    lvdif             :1;
                unsigned    pwmif             :1;
                unsigned    tkif              :1;
                unsigned                      :1;
                unsigned    cmpif             :1;
                unsigned                      :3;
            };
        } intif1bits @ 0x00e;
        #endif
volatile unsigned char clkctl              @ 0x00f;  //
//
    volatile bit scktype                   @ ((unsigned)&clkctl*8)+7; //slow clock type, 0: sirc, 1: sxt
    volatile bit fcktype                   @ ((unsigned)&clkctl*8)+6; //fast clock type, 0: firc, 1: fxt
    volatile bit slowstp                   @ ((unsigned)&clkctl*8)+4; //stop slow clock in stop mode
    volatile bit faststp                   @ ((unsigned)&clkctl*8)+3; //stop fast clock
    volatile bit cpucks                    @ ((unsigned)&clkctl*8)+2; //seleck fast clock
    volatile bit cpupsc1                   @ ((unsigned)&clkctl*8)+1; //cpuclk prescaler, 0: div 8, 1: div 4, 2: div 2, 3: div 1
    volatile bit cpupsc0                   @ ((unsigned)&clkctl*8)+0; //cpuclk prescaler, 0: div 8, 1: div 4, 2: div 2, 3: div 1

       #ifndef _lib_build
        volatile union {
             struct {
                unsigned    cpupsc            :2;
                unsigned    cpucks            :1;
                unsigned    faststp           :1;
                unsigned    slowstp           :1;
                unsigned                      :1;
                unsigned    fcktype           :1;
                unsigned    scktype           :1;
            };
            struct {
                unsigned    cpupsc0             :1;
                unsigned    cpupsc1             :1;
            };
        } clkctlbits @ 0x00f;
        #endif
volatile unsigned char tm0rld              @ 0x010;  //timer0 reload counter
//

volatile unsigned char tm0ctl              @ 0x011;  //
//
    volatile bit tm0stp                    @ ((unsigned)&tm0ctl*8)+6; //stop timer0. 0: timer0 enable, 1: timer0 disable
    volatile bit tm0edg                    @ ((unsigned)&tm0ctl*8)+5; //t0i (pa2) edge, 0: rising edge, 1: falling edge
    volatile bit tm0cks                    @ ((unsigned)&tm0ctl*8)+4; //timer0 clock, 0: instruction cycle, 1: t0i (pa2)
    volatile bit tm0psc3                   @ ((unsigned)&tm0ctl*8)+3; //timer0 prescale, 0: div 1, 7: div 128, 8: div 256
    volatile bit tm0psc2                   @ ((unsigned)&tm0ctl*8)+2; //timer0 prescale, 0: div 1, 7: div 128, 8: div 256
    volatile bit tm0psc1                   @ ((unsigned)&tm0ctl*8)+1; //timer0 prescale, 0: div 1, 7: div 128, 8: div 256
    volatile bit tm0psc0                   @ ((unsigned)&tm0ctl*8)+0; //timer0 prescale, 0: div 1, 7: div 128, 8: div 256

       #ifndef _lib_build
        volatile union {
             struct {
                unsigned    tm0psc            :4;
                unsigned    tm0cks            :1;
                unsigned    tm0edg            :1;
                unsigned    tm0stp            :1;
                unsigned                      :1;
            };
            struct {
                unsigned    tm0psc0             :1;
                unsigned    tm0psc1             :1;
                unsigned    tm0psc2             :1;
                unsigned    tm0psc3             :1;
            };
        } tm0ctlbits @ 0x011;
        #endif
volatile unsigned char tm1                 @ 0x012;  //timer1 content 
//

volatile unsigned char tm1rld              @ 0x013;  //timer1 reload counter
//

volatile unsigned char tm1ctl              @ 0x014;  //
//
    volatile bit tm1stp                    @ ((unsigned)&tm1ctl*8)+6; //stop timer1. 0: timer1 enable, 1: timer1 disable
    volatile bit tm1psc3                   @ ((unsigned)&tm1ctl*8)+3; //timer1 prescale, 0: div 1, 7: div 128, 8: div 256
    volatile bit tm1psc2                   @ ((unsigned)&tm1ctl*8)+2; //timer1 prescale, 0: div 1, 7: div 128, 8: div 256
    volatile bit tm1psc1                   @ ((unsigned)&tm1ctl*8)+1; //timer1 prescale, 0: div 1, 7: div 128, 8: div 256
    volatile bit tm1psc0                   @ ((unsigned)&tm1ctl*8)+0; //timer1 prescale, 0: div 1, 7: div 128, 8: div 256

       #ifndef _lib_build
        volatile union {
             struct {
                unsigned    tm1psc            :4;
                unsigned                      :2;
                unsigned    tm1stp            :1;
                unsigned                      :1;
            };
            struct {
                unsigned    tm1psc0             :1;
                unsigned    tm1psc1             :1;
                unsigned    tm1psc2             :1;
                unsigned    tm1psc3             :1;
            };
        } tm1ctlbits @ 0x014;
        #endif
volatile unsigned char t2ctl               @ 0x015;  //
//
    volatile bit t2clr                     @ ((unsigned)&t2ctl*8)+4; //t2 counter clear 0: release 1: clear and hold
    volatile bit t2cks1                    @ ((unsigned)&t2ctl*8)+3; //timer2 clock source.     0:'slow-clcok'      1:fcpuclk/128 (fsys/128)                                      2: frc/512         3:frc/512
    volatile bit t2cks0                    @ ((unsigned)&t2ctl*8)+2; //timer2 clock source.     0:'slow-clcok'      1:fcpuclk/128 (fsys/128)                                      2: frc/512         3:frc/512
    volatile bit t2psc1                    @ ((unsigned)&t2ctl*8)+1; //timer2 clock div 00: 2^15(32768) 01: 2^14(16384)  10: 2^13(8192)  11: 2^7(128)
    volatile bit t2psc0                    @ ((unsigned)&t2ctl*8)+0; //timer2 clock div 00: 2^15(32768) 01: 2^14(16384)  10: 2^13(8192)  11: 2^7(128)

       #ifndef _lib_build
        volatile union {
             struct {
                unsigned    t2psc             :2;
                unsigned    t2cks             :2;
                unsigned    t2clr             :1;
                unsigned                      :3;
            };
            struct {
                unsigned    t2psc0              :1;
                unsigned    t2psc1              :1;
                unsigned    t2cks0              :1;
                unsigned    t2cks1              :1;
            };
        } t2ctlbits @ 0x015;
        #endif
volatile unsigned char lvctl               @ 0x016;  //
//
    volatile bit lvdf                      @ ((unsigned)&lvctl*8)+7; //lvd flag
    volatile bit lvdhys                    @ ((unsigned)&lvctl*8)+6; //lvd hystertsis, 25mv@lvd=2.19v, 70mv@lvd=4.15v (tt) 0: disable 1: enable
    volatile bit lvrsav                    @ ((unsigned)&lvctl*8)+5; //por/lvr auto power off in stop/idle mode 0: por/lvr enable 1: por/lvr enable in slow/fast mode, disable in stop/idle mode (porpd=1, por force disable. lvrpd=1, lvr force disable)
    volatile bit lvdsav                    @ ((unsigned)&lvctl*8)+4; //lvd auto power off in stop/idle mode 0: lvd enable 1: lvd enable in slow/fast mode, disable in stop/idle mode
    volatile bit lvds3                     @ ((unsigned)&lvctl*8)+3; //lvd select  0000: disable   0001: 2.19v  ??1111: 4.15v (tbd)
    volatile bit lvds2                     @ ((unsigned)&lvctl*8)+2; //lvd select  0000: disable   0001: 2.19v  ??1111: 4.15v (tbd)
    volatile bit lvds1                     @ ((unsigned)&lvctl*8)+1; //lvd select  0000: disable   0001: 2.19v  ??1111: 4.15v (tbd)
    volatile bit lvds0                     @ ((unsigned)&lvctl*8)+0; //lvd select  0000: disable   0001: 2.19v  ??1111: 4.15v (tbd)

       #ifndef _lib_build
        volatile union {
             struct {
                unsigned    lvds              :4;
                unsigned    lvdsav            :1;
                unsigned    lvrsav            :1;
                unsigned    lvdhys            :1;
                unsigned    lvdf              :1;
            };
            struct {
                unsigned    lvds0               :1;
                unsigned    lvds1               :1;
                unsigned    lvds2               :1;
                unsigned    lvds3               :1;
            };
        } lvctlbits @ 0x016;
        #endif
volatile unsigned char adcdh               @ 0x017;  //adc[11:4] output data msb
//

volatile unsigned char adctl               @ 0x018;  //
//
    volatile bit adcdl3                    @ ((unsigned)&adctl*8)+7; //adc[3:0] output data lsb
    volatile bit adcdl2                    @ ((unsigned)&adctl*8)+6; //adc[3:0] output data lsb
    volatile bit adcdl1                    @ ((unsigned)&adctl*8)+5; //adc[3:0] output data lsb
    volatile bit adcdl0                    @ ((unsigned)&adctl*8)+4; //adc[3:0] output data lsb
    volatile bit adst                      @ ((unsigned)&adctl*8)+3; //adc start, h/w clear after end of conversion
    volatile bit adcks2                    @ ((unsigned)&adctl*8)+2; //0: fsys/256, 1: fsys/128, 2: fsys/64, 3: fsys/32 4: fsys/16,   5: fysy/8,    6: fsys/4,   7: fsys/2 (tc)
    volatile bit adcks1                    @ ((unsigned)&adctl*8)+1; //0: fsys/256, 1: fsys/128, 2: fsys/64, 3: fsys/32 4: fsys/16,   5: fysy/8,    6: fsys/4,   7: fsys/2 (tc)
    volatile bit adcks0                    @ ((unsigned)&adctl*8)+0; //0: fsys/256, 1: fsys/128, 2: fsys/64, 3: fsys/32 4: fsys/16,   5: fysy/8,    6: fsys/4,   7: fsys/2 (tc)

       #ifndef _lib_build
        volatile union {
             struct {
                unsigned    adcks             :3;
                unsigned    adst              :1;
                unsigned    adcdl             :4;
            };
            struct {
                unsigned    adcks0              :1;
                unsigned    adcks1              :1;
                unsigned    adcks2              :1;
                unsigned                        :1;
                unsigned    adcdl0              :1;
                unsigned    adcdl1              :1;
                unsigned    adcdl2              :1;
                unsigned    adcdl3              :1;
            };
        } adctlbits @ 0x018;
        #endif
volatile unsigned char adctl2              @ 0x019;  //
//
    volatile bit advrefs1                  @ ((unsigned)&adctl2*8)+7; //adc vref select. 00: vcc, 01: 2.5207v, 10: 3.0379v, 11: 4.0646v
    volatile bit advrefs0                  @ ((unsigned)&adctl2*8)+6; //adc vref select. 00: vcc, 01: 2.5207v, 10: 3.0379v, 11: 4.0646v
    volatile bit adchs4                    @ ((unsigned)&adctl2*8)+4; //adc channel select 14: vbgo 15: opo 23: 1/4vcc
    volatile bit adchs3                    @ ((unsigned)&adctl2*8)+3; //adc channel select 14: vbgo 15: opo 23: 1/4vcc
    volatile bit adchs2                    @ ((unsigned)&adctl2*8)+2; //adc channel select 14: vbgo 15: opo 23: 1/4vcc
    volatile bit adchs1                    @ ((unsigned)&adctl2*8)+1; //adc channel select 14: vbgo 15: opo 23: 1/4vcc
    volatile bit adchs0                    @ ((unsigned)&adctl2*8)+0; //adc channel select 14: vbgo 15: opo 23: 1/4vcc

       #ifndef _lib_build
        volatile union {
             struct {
                unsigned    adchs             :5;
                unsigned                      :1;
                unsigned    advrefs           :2;
            };
            struct {
                unsigned    adchs0              :1;
                unsigned    adchs1              :1;
                unsigned    adchs2              :1;
                unsigned    adchs3              :1;
                unsigned    adchs4              :1;
                unsigned                        :1;
                unsigned    advrefs0            :1;
                unsigned    advrefs1            :1;
            };
        } adctl2bits @ 0x019;
        #endif
volatile unsigned char tkdl                @ 0x01a;  //touch key counter data 7~0
//

volatile unsigned char tkdh                @ 0x01b;  //
//
    volatile bit tkdh3                     @ ((unsigned)&tkdh*8)+3; //touch key counter data 11~8
    volatile bit tkdh2                     @ ((unsigned)&tkdh*8)+2; //touch key counter data 11~8
    volatile bit tkdh1                     @ ((unsigned)&tkdh*8)+1; //touch key counter data 11~8
    volatile bit tkdh0                     @ ((unsigned)&tkdh*8)+0; //touch key counter data 11~8

       #ifndef _lib_build
        volatile union {
             struct {
                unsigned    tkdh              :4;
                unsigned                      :4;
            };
            struct {
                unsigned    tkdh0               :1;
                unsigned    tkdh1               :1;
                unsigned    tkdh2               :1;
                unsigned    tkdh3               :1;
            };
        } tkdhbits @ 0x01b;
        #endif
volatile unsigned char tkctl               @ 0x01e;  //using at ctk
//
    volatile bit tkfjmp                    @ ((unsigned)&tkctl*8)+7; //ctk clock frequency auto change select;     0: disable, determin by sfr jmpval   1: enable, auto-change
    volatile bit jmpval2                   @ ((unsigned)&tkctl*8)+6; //(only available in tkfjmp=0) ctk clock  frequency select
    volatile bit jmpval1                   @ ((unsigned)&tkctl*8)+5; //(only available in tkfjmp=0) ctk clock  frequency select
    volatile bit jmpval0                   @ ((unsigned)&tkctl*8)+4; //(only available in tkfjmp=0) ctk clock  frequency select
    volatile bit ctkrefc2                  @ ((unsigned)&tkctl*8)+2; //ctk conversion time (cx2, cx1, cx0):    0: smallest   7: longest
    volatile bit ctkrefc1                  @ ((unsigned)&tkctl*8)+1; //ctk conversion time (cx2, cx1, cx0):    0: smallest   7: longest
    volatile bit ctkrefc0                  @ ((unsigned)&tkctl*8)+0; //ctk conversion time (cx2, cx1, cx0):    0: smallest   7: longest

       #ifndef _lib_build
        volatile union {
             struct {
                unsigned    ctkrefc           :3;
                unsigned                      :1;
                unsigned    jmpval            :3;
                unsigned    tkfjmp            :1;
            };
            struct {
                unsigned    ctkrefc0            :1;
                unsigned    ctkrefc1            :1;
                unsigned    ctkrefc2            :1;
                unsigned                        :1;
                unsigned    jmpval0             :1;
                unsigned    jmpval1             :1;
                unsigned    jmpval2             :1;
            };
        } tkctlbits @ 0x01e;
        #endif
volatile unsigned char tkctl2              @ 0x01f;  //
//
    volatile bit ctkpd                     @ ((unsigned)&tkctl2*8)+7; //ctk touch key power down   0: ctk enable   1: ctk disable
    volatile bit tksoc                     @ ((unsigned)&tkctl2*8)+6; //touch key start of conversion, hw clear while end of conversion
    volatile bit tkeoc                     @ ((unsigned)&tkctl2*8)+5; //touch key end of conversion
    volatile bit tkchs3                    @ ((unsigned)&tkctl2*8)+3; //touch key channel select
    volatile bit tkchs2                    @ ((unsigned)&tkctl2*8)+2; //touch key channel select
    volatile bit tkchs1                    @ ((unsigned)&tkctl2*8)+1; //touch key channel select
    volatile bit tkchs0                    @ ((unsigned)&tkctl2*8)+0; //touch key channel select

       #ifndef _lib_build
        volatile union {
             struct {
                unsigned    tkchs             :4;
                unsigned                      :1;
                unsigned    tkeoc             :1;
                unsigned    tksoc             :1;
                unsigned    ctkpd             :1;
            };
            struct {
                unsigned    tkchs0              :1;
                unsigned    tkchs1              :1;
                unsigned    tkchs2              :1;
                unsigned    tkchs3              :1;
            };
        } tkctl2bits @ 0x01f;
        #endif
volatile unsigned char option              @ 0x081;  //
//
    volatile bit hwauto                    @ ((unsigned)&option*8)+7; //save/restore status w/o to, pd   (hi-tech c don?™t need, set this bit = 0)
    volatile bit int0edg                   @ ((unsigned)&option*8)+6; //int0 interrupt trigger edge, 0: falling edge, 1: rising edge
    volatile bit int1edg                   @ ((unsigned)&option*8)+5; //int1 interrupt trigger edge, 0: falling edge, 1: rising edge
    volatile bit wdtpsc1                   @ ((unsigned)&option*8)+3; //wdt period, 0: 102ms, 1: 205ms, 2: 819ms, 3: 1638ms  @5v
    volatile bit wdtpsc0                   @ ((unsigned)&option*8)+2; //wdt period, 0: 102ms, 1: 205ms, 2: 819ms, 3: 1638ms  @5v
    volatile bit wktpsc1                   @ ((unsigned)&option*8)+1; //wkt period, 0: 13ms, 1: 26ms, 2: 51ms, 3: 102ms  @3v
    volatile bit wktpsc0                   @ ((unsigned)&option*8)+0; //wkt period, 0: 13ms, 1: 26ms, 2: 51ms, 3: 102ms  @3v

       #ifndef _lib_build
        volatile union {
             struct {
                unsigned    wktpsc            :2;
                unsigned    wdtpsc            :2;
                unsigned                      :1;
                unsigned    int1edg           :1;
                unsigned    int0edg           :1;
                unsigned    hwauto            :1;
            };
            struct {
                unsigned    wktpsc0             :1;
                unsigned    wktpsc1             :1;
                unsigned    wdtpsc0             :1;
                unsigned    wdtpsc1             :1;
            };
        } optionbits @ 0x081;
        #endif
volatile unsigned char pamod10             @ 0x085;  //pa1~pa0 pin mode control
//
    volatile bit pa1mod3                   @ ((unsigned)&pamod10*8)+7; //
    volatile bit pa1mod2                   @ ((unsigned)&pamod10*8)+6; //
    volatile bit pa1mod1                   @ ((unsigned)&pamod10*8)+5; //
    volatile bit pa1mod0                   @ ((unsigned)&pamod10*8)+4; //
    volatile bit pa0mod3                   @ ((unsigned)&pamod10*8)+3; //
    volatile bit pa0mod2                   @ ((unsigned)&pamod10*8)+2; //
    volatile bit pa0mod1                   @ ((unsigned)&pamod10*8)+1; //
    volatile bit pa0mod0                   @ ((unsigned)&pamod10*8)+0; //

       #ifndef _lib_build
        volatile union {
             struct {
                unsigned    pa0mod            :4;
                unsigned    pa1mod            :4;
            };
            struct {
                unsigned    pa0mod0             :1;
                unsigned    pa0mod1             :1;
                unsigned    pa0mod2             :1;
                unsigned    pa0mod3             :1;
                unsigned    pa1mod0             :1;
                unsigned    pa1mod1             :1;
                unsigned    pa1mod2             :1;
                unsigned    pa1mod3             :1;
            };
        } pamod10bits @ 0x085;
        #endif
volatile unsigned char pamod32             @ 0x086;  //pa3~pa2 pin mode control
//
    volatile bit pa3mod3                   @ ((unsigned)&pamod32*8)+7; //
    volatile bit pa3mod2                   @ ((unsigned)&pamod32*8)+6; //
    volatile bit pa3mod1                   @ ((unsigned)&pamod32*8)+5; //
    volatile bit pa3mod0                   @ ((unsigned)&pamod32*8)+4; //
    volatile bit pa2mod3                   @ ((unsigned)&pamod32*8)+3; //
    volatile bit pa2mod2                   @ ((unsigned)&pamod32*8)+2; //
    volatile bit pa2mod1                   @ ((unsigned)&pamod32*8)+1; //
    volatile bit pa2mod0                   @ ((unsigned)&pamod32*8)+0; //

       #ifndef _lib_build
        volatile union {
             struct {
                unsigned    pa2mod            :4;
                unsigned    pa3mod            :4;
            };
            struct {
                unsigned    pa2mod0             :1;
                unsigned    pa2mod1             :1;
                unsigned    pa2mod2             :1;
                unsigned    pa2mod3             :1;
                unsigned    pa3mod0             :1;
                unsigned    pa3mod1             :1;
                unsigned    pa3mod2             :1;
                unsigned    pa3mod3             :1;
            };
        } pamod32bits @ 0x086;
        #endif
volatile unsigned char pamod54             @ 0x087;  //pa5~pa4 pin mode control
//
    volatile bit pa5mod3                   @ ((unsigned)&pamod54*8)+7; //
    volatile bit pa5mod2                   @ ((unsigned)&pamod54*8)+6; //
    volatile bit pa5mod1                   @ ((unsigned)&pamod54*8)+5; //
    volatile bit pa5mod0                   @ ((unsigned)&pamod54*8)+4; //
    volatile bit pa4mod3                   @ ((unsigned)&pamod54*8)+3; //
    volatile bit pa4mod2                   @ ((unsigned)&pamod54*8)+2; //
    volatile bit pa4mod1                   @ ((unsigned)&pamod54*8)+1; //
    volatile bit pa4mod0                   @ ((unsigned)&pamod54*8)+0; //

       #ifndef _lib_build
        volatile union {
             struct {
                unsigned    pa4mod            :4;
                unsigned    pa5mod            :4;
            };
            struct {
                unsigned    pa4mod0             :1;
                unsigned    pa4mod1             :1;
                unsigned    pa4mod2             :1;
                unsigned    pa4mod3             :1;
                unsigned    pa5mod0             :1;
                unsigned    pa5mod1             :1;
                unsigned    pa5mod2             :1;
                unsigned    pa5mod3             :1;
            };
        } pamod54bits @ 0x087;
        #endif
volatile unsigned char pamod76             @ 0x088;  //pa7~pa6 pin mode control
//
    volatile bit pa7mod3                   @ ((unsigned)&pamod76*8)+7; //
    volatile bit pa7mod2                   @ ((unsigned)&pamod76*8)+6; //
    volatile bit pa7mod1                   @ ((unsigned)&pamod76*8)+5; //
    volatile bit pa7mod0                   @ ((unsigned)&pamod76*8)+4; //
    volatile bit pa6mod3                   @ ((unsigned)&pamod76*8)+3; //
    volatile bit pa6mod2                   @ ((unsigned)&pamod76*8)+2; //
    volatile bit pa6mod1                   @ ((unsigned)&pamod76*8)+1; //
    volatile bit pa6mod0                   @ ((unsigned)&pamod76*8)+0; //

       #ifndef _lib_build
        volatile union {
             struct {
                unsigned    pa6mod            :4;
                unsigned    pa7mod            :4;
            };
            struct {
                unsigned    pa6mod0             :1;
                unsigned    pa6mod1             :1;
                unsigned    pa6mod2             :1;
                unsigned    pa6mod3             :1;
                unsigned    pa7mod0             :1;
                unsigned    pa7mod1             :1;
                unsigned    pa7mod2             :1;
                unsigned    pa7mod3             :1;
            };
        } pamod76bits @ 0x088;
        #endif
volatile unsigned char pwmctl              @ 0x089;  //
//
    volatile bit pwmen                     @ ((unsigned)&pwmctl*8)+7; //pwm clock enable. 0: disable, 1: enable
    volatile bit pwm0om1                   @ ((unsigned)&pwmctl*8)+5; //pwm0 output mode.  00 ~ 11: mode0 ~ mode3
    volatile bit pwm0om0                   @ ((unsigned)&pwmctl*8)+4; //pwm0 output mode.  00 ~ 11: mode0 ~ mode3
    volatile bit pwm0dz3                   @ ((unsigned)&pwmctl*8)+3; //pwm0 dead zone.   0000 ~ 1111: 0 ~ 14, 16*tpwmclk
    volatile bit pwm0dz2                   @ ((unsigned)&pwmctl*8)+2; //pwm0 dead zone.   0000 ~ 1111: 0 ~ 14, 16*tpwmclk
    volatile bit pwm0dz1                   @ ((unsigned)&pwmctl*8)+1; //pwm0 dead zone.   0000 ~ 1111: 0 ~ 14, 16*tpwmclk
    volatile bit pwm0dz0                   @ ((unsigned)&pwmctl*8)+0; //pwm0 dead zone.   0000 ~ 1111: 0 ~ 14, 16*tpwmclk

       #ifndef _lib_build
        volatile union {
             struct {
                unsigned    pwm0dz            :4;
                unsigned    pwm0om            :2;
                unsigned                      :1;
                unsigned    pwmen             :1;
            };
            struct {
                unsigned    pwm0dz0             :1;
                unsigned    pwm0dz1             :1;
                unsigned    pwm0dz2             :1;
                unsigned    pwm0dz3             :1;
                unsigned    pwm0om0             :1;
                unsigned    pwm0om1             :1;
            };
        } pwmctlbits @ 0x089;
        #endif
volatile unsigned char pbmod10             @ 0x08c;  //pb1~pb0 pin mode control
//
    volatile bit pb1mod3                   @ ((unsigned)&pbmod10*8)+7; //
    volatile bit pb1mod2                   @ ((unsigned)&pbmod10*8)+6; //
    volatile bit pb1mod1                   @ ((unsigned)&pbmod10*8)+5; //
    volatile bit pb1mod0                   @ ((unsigned)&pbmod10*8)+4; //
    volatile bit pb0mod3                   @ ((unsigned)&pbmod10*8)+3; //
    volatile bit pb0mod2                   @ ((unsigned)&pbmod10*8)+2; //
    volatile bit pb0mod1                   @ ((unsigned)&pbmod10*8)+1; //
    volatile bit pb0mod0                   @ ((unsigned)&pbmod10*8)+0; //

       #ifndef _lib_build
        volatile union {
             struct {
                unsigned    pb0mod            :4;
                unsigned    pb1mod            :4;
            };
            struct {
                unsigned    pb0mod0             :1;
                unsigned    pb0mod1             :1;
                unsigned    pb0mod2             :1;
                unsigned    pb0mod3             :1;
                unsigned    pb1mod0             :1;
                unsigned    pb1mod1             :1;
                unsigned    pb1mod2             :1;
                unsigned    pb1mod3             :1;
            };
        } pbmod10bits @ 0x08c;
        #endif
volatile unsigned char pbmod32             @ 0x08d;  //pb3~pb2 pin mode control
//
    volatile bit pb3mod3                   @ ((unsigned)&pbmod32*8)+7; //
    volatile bit pb3mod2                   @ ((unsigned)&pbmod32*8)+6; //
    volatile bit pb3mod1                   @ ((unsigned)&pbmod32*8)+5; //
    volatile bit pb3mod0                   @ ((unsigned)&pbmod32*8)+4; //
    volatile bit pb2mod3                   @ ((unsigned)&pbmod32*8)+3; //
    volatile bit pb2mod2                   @ ((unsigned)&pbmod32*8)+2; //
    volatile bit pb2mod1                   @ ((unsigned)&pbmod32*8)+1; //
    volatile bit pb2mod0                   @ ((unsigned)&pbmod32*8)+0; //

       #ifndef _lib_build
        volatile union {
             struct {
                unsigned    pb2mod            :4;
                unsigned    pb3mod            :4;
            };
            struct {
                unsigned    pb2mod0             :1;
                unsigned    pb2mod1             :1;
                unsigned    pb2mod2             :1;
                unsigned    pb2mod3             :1;
                unsigned    pb3mod0             :1;
                unsigned    pb3mod1             :1;
                unsigned    pb3mod2             :1;
                unsigned    pb3mod3             :1;
            };
        } pbmod32bits @ 0x08d;
        #endif
volatile unsigned char pbmod54             @ 0x08e;  //pb5~pb4 pin mode control
//
    volatile bit pb5mod3                   @ ((unsigned)&pbmod54*8)+7; //
    volatile bit pb5mod2                   @ ((unsigned)&pbmod54*8)+6; //
    volatile bit pb5mod1                   @ ((unsigned)&pbmod54*8)+5; //
    volatile bit pb5mod0                   @ ((unsigned)&pbmod54*8)+4; //
    volatile bit pb4mod3                   @ ((unsigned)&pbmod54*8)+3; //
    volatile bit pb4mod2                   @ ((unsigned)&pbmod54*8)+2; //
    volatile bit pb4mod1                   @ ((unsigned)&pbmod54*8)+1; //
    volatile bit pb4mod0                   @ ((unsigned)&pbmod54*8)+0; //

       #ifndef _lib_build
        volatile union {
             struct {
                unsigned    pb4mod            :4;
                unsigned    pb5mod            :4;
            };
            struct {
                unsigned    pb4mod0             :1;
                unsigned    pb4mod1             :1;
                unsigned    pb4mod2             :1;
                unsigned    pb4mod3             :1;
                unsigned    pb5mod0             :1;
                unsigned    pb5mod1             :1;
                unsigned    pb5mod2             :1;
                unsigned    pb5mod3             :1;
            };
        } pbmod54bits @ 0x08e;
        #endif
volatile unsigned char pbmod76             @ 0x08f;  //pb7~pb6 pin mode control
//
    volatile bit pb7mod3                   @ ((unsigned)&pbmod76*8)+7; //
    volatile bit pb7mod2                   @ ((unsigned)&pbmod76*8)+6; //
    volatile bit pb7mod1                   @ ((unsigned)&pbmod76*8)+5; //
    volatile bit pb7mod0                   @ ((unsigned)&pbmod76*8)+4; //
    volatile bit pb6mod3                   @ ((unsigned)&pbmod76*8)+3; //
    volatile bit pb6mod2                   @ ((unsigned)&pbmod76*8)+2; //
    volatile bit pb6mod1                   @ ((unsigned)&pbmod76*8)+1; //
    volatile bit pb6mod0                   @ ((unsigned)&pbmod76*8)+0; //

       #ifndef _lib_build
        volatile union {
             struct {
                unsigned    pb6mod            :4;
                unsigned    pb7mod            :4;
            };
            struct {
                unsigned    pb6mod0             :1;
                unsigned    pb6mod1             :1;
                unsigned    pb6mod2             :1;
                unsigned    pb6mod3             :1;
                unsigned    pb7mod0             :1;
                unsigned    pb7mod1             :1;
                unsigned    pb7mod2             :1;
                unsigned    pb7mod3             :1;
            };
        } pbmod76bits @ 0x08f;
        #endif
volatile unsigned char pdmod10             @ 0x090;  //pd1~pd0 pin mode control
//
    volatile bit pd1mod3                   @ ((unsigned)&pdmod10*8)+7; //
    volatile bit pd1mod2                   @ ((unsigned)&pdmod10*8)+6; //
    volatile bit pd1mod1                   @ ((unsigned)&pdmod10*8)+5; //
    volatile bit pd1mod0                   @ ((unsigned)&pdmod10*8)+4; //
    volatile bit pd0mod3                   @ ((unsigned)&pdmod10*8)+3; //
    volatile bit pd0mod2                   @ ((unsigned)&pdmod10*8)+2; //
    volatile bit pd0mod1                   @ ((unsigned)&pdmod10*8)+1; //
    volatile bit pd0mod0                   @ ((unsigned)&pdmod10*8)+0; //

       #ifndef _lib_build
        volatile union {
             struct {
                unsigned    pd0mod            :4;
                unsigned    pd1mod            :4;
            };
            struct {
                unsigned    pd0mod0             :1;
                unsigned    pd0mod1             :1;
                unsigned    pd0mod2             :1;
                unsigned    pd0mod3             :1;
                unsigned    pd1mod0             :1;
                unsigned    pd1mod1             :1;
                unsigned    pd1mod2             :1;
                unsigned    pd1mod3             :1;
            };
        } pdmod10bits @ 0x090;
        #endif
volatile unsigned char option2             @ 0x091;  //
//
    volatile bit pwmcks1                   @ ((unsigned)&option2*8)+5; //pwm clock source. 00/01: cpuclk, 10: frc16m, 11: frc32m
    volatile bit pwmcks0                   @ ((unsigned)&option2*8)+4; //pwm clock source. 00/01: cpuclk, 10: frc16m, 11: frc32m
    volatile bit int2sel                   @ ((unsigned)&option2*8)+2; //int2 pin select ,  0 : pa7   1:pb5
    volatile bit int1sel                   @ ((unsigned)&option2*8)+1; //int1 pin select ,  0 : pa1   1:pb1
    volatile bit int0sel                   @ ((unsigned)&option2*8)+0; //int0 pin select ,  0 : pa3   1:pb2

       #ifndef _lib_build
        volatile union {
             struct {
                unsigned    int0sel           :1;
                unsigned    int1sel           :1;
                unsigned    int2sel           :1;
                unsigned                      :1;
                unsigned    pwmcks            :2;
                unsigned                      :2;
            };
            struct {
                unsigned    intxsel             :3;
                unsigned                        :1;
                unsigned    pwmcks0             :1;
                unsigned    pwmcks1             :1;
            };
        } option2bits @ 0x091;
        #endif
volatile unsigned char pwmprdh             @ 0x092;  //pwm0 period msb 8bit
//

volatile unsigned char pwmprdl             @ 0x093;  //pwm0 period lsb 8bit
//

volatile unsigned char pwm0dh              @ 0x094;  //pwm0 duty msb 8bit
//

volatile unsigned char pwm0dl              @ 0x095;  //pwm0 duty lsb 8bit
//

volatile unsigned char pwm1dh              @ 0x096;  //pwm1 duty msb 8bit
//

volatile unsigned char pwm1dl              @ 0x097;  //pwm1 duty lsb 8bit
//

volatile unsigned char pwm2dh              @ 0x098;  //pwm2 duty msb 8bit
//

volatile unsigned char pwm2dl              @ 0x099;  //pwm2 duty lsb 8bit
//

volatile unsigned char pwm3dh              @ 0x09a;  //pwm3 duty msb 8bit
//

volatile unsigned char pwm3dl              @ 0x09b;  //pwm3 duty lsb 8bit
//

volatile unsigned char pwm4dh              @ 0x09c;  //pwm4 duty msb 8bit
//

volatile unsigned char pwm4dl              @ 0x09d;  //pwm4 duty lsb 8bit
//

volatile unsigned char pwm5dh              @ 0x09e;  //pwm5 duty msb 8bit
//

volatile unsigned char pwm5dl              @ 0x09f;  //pwm5 duty lsb 8bit
//
volatile unsigned char pinmod              @ 0x105;  //
    volatile bit hsink                     @ ((unsigned)&pinmod*8)+2; //
    volatile bit opoe                      @ ((unsigned)&pinmod*8)+1; //
    volatile bit vbgoe                     @ ((unsigned)&pinmod*8)+0; //

       #ifndef _lib_build
        volatile union {
             struct {
                unsigned    vbgoe           :1;
                unsigned    opoe            :1;
                unsigned    hsink           :1;
                unsigned                    :5;
            };
        } pinmodbits @ 0x105;
        #endif

volatile unsigned char opctl               @ 0x108;  //
//
    volatile bit pdopa                     @ ((unsigned)&opctl*8)+7; //opa power down enable control 0: opa enable 1: opa disable
    volatile bit sopp1                     @ ((unsigned)&opctl*8)+6; //opa p input select  00: opp input source is pd0 01: opp input source is pd1 10: opp input source is pa2 11: opp input source is avss
    volatile bit sopp0                     @ ((unsigned)&opctl*8)+5; //opa p input select  00: opp input source is pd0 01: opp input source is pd1 10: opp input source is pa2 11: opp input source is avss
    volatile bit sotv                      @ ((unsigned)&opctl*8)+4; //sotv:  opa n port voltage select when opa at trim 1 mode or comparator mode  0: avss 1: vbg
    volatile bit sopg1                     @ ((unsigned)&opctl*8)+3; //select opa gain 00: 1x 01: 20x 10: 50x 11: 100x
    volatile bit sopg0                     @ ((unsigned)&opctl*8)+2; //select opa gain 00: 1x 01: 20x 10: 50x 11: 100x
    volatile bit sopm1                     @ ((unsigned)&opctl*8)+1; //select opa operating mode 00: normal mode 01: trim 1 mode 10: trim 2 mode 11: comparator mode
    volatile bit sopm0                     @ ((unsigned)&opctl*8)+0; //select opa operating mode 00: normal mode 01: trim 1 mode 10: trim 2 mode 11: comparator mode

       #ifndef _lib_build
        volatile union {
             struct {
                unsigned    sopm              :2;
                unsigned    sopg              :2;
                unsigned    sotv              :1;
                unsigned    sopp              :2;
                unsigned    pdopa             :1;
            };
            struct {
                unsigned    sopm0               :1;
                unsigned    sopm1               :1;
                unsigned    sopg0               :1;
                unsigned    sopg1               :1;
                unsigned                        :1;
                unsigned    sopp0               :1;
                unsigned    sopp1               :1;
            };
        } opctlbits @ 0x108;
        #endif
volatile unsigned char lvrpd               @ 0x109;  //write 0x37 to force lvr+por disable write 0x38 to force lvr disable, por still enable write 0x39 to force por disable, lvr still enable
//
    volatile bit porpdf                    @ ((unsigned)&lvrpd*8)+1; //
    volatile bit lvrpdf                    @ ((unsigned)&lvrpd*8)+0; //

       #ifndef _lib_build
        volatile union {
             struct {
                unsigned    lvrpdf            :1;
                unsigned    porpdf            :1;
                unsigned                      :6;
            };
        } lvrpdbits @ 0x109;
        #endif
volatile unsigned char pch                 @ 0x10c;  //
//
    volatile bit pch3                      @ ((unsigned)&pch*8)+3; //program counter 11~8
    volatile bit pch2                      @ ((unsigned)&pch*8)+2; //program counter 11~8
    volatile bit pch1                      @ ((unsigned)&pch*8)+1; //program counter 11~8
    volatile bit pch0                      @ ((unsigned)&pch*8)+0; //program counter 11~8

       #ifndef _lib_build
        volatile union {
             struct {
                unsigned    pch               :4;
                unsigned                      :4;
            };
            struct {
                unsigned    pch0                :1;
                unsigned    pch1                :1;
                unsigned    pch2                :1;
                unsigned    pch3                :1;
            };
        } pchbits @ 0x10c;
        #endif
volatile unsigned char optrim              @ 0x10d;  //opa trim value
//

volatile unsigned char bgtrim              @ 0x10e;  //vbg trim value
//

volatile unsigned char ircf                @ 0x10f;  //firc trim value
//

volatile unsigned char cfg0b               @ 0x110;  //reserved
//

volatile unsigned char dpl                 @ 0x185;  //tbl data pointer 7~0
//

volatile unsigned char dph                 @ 0x186;  //tbl data pointer 11~8
//

volatile unsigned char crcdl               @ 0x187;  //crc16 data 7~0
//

volatile unsigned char crcdh               @ 0x188;  //crc16 data 15~8
//

volatile unsigned char crcin               @ 0x189;  //crc input 
//

volatile unsigned char tabr                @ 0x18c;  //1. tabr write 1 =  opcode tabrl 2. tabr write 2 = opcode tabrh 3. afer step.1 or step.2, read tabr to get table read value
//

volatile unsigned char cmpctl              @ 0x18d;  //
//
    volatile bit pdcmp                     @ ((unsigned)&cmpctl*8)+7; //comparator power down enable control 0: cmp enable 1: cmp disable
    volatile bit cmpox                     @ ((unsigned)&cmpctl*8)+6; //comparator output 0: cip < cin 1: cip > cin or pdcmp=1
    volatile bit cmpoe                     @ ((unsigned)&cmpctl*8)+5; //1: cmpo output to pa5 (after cmpinv)
    volatile bit cmpinv                    @ ((unsigned)&cmpctl*8)+4; //comparator output (cmpo) invert 0: disable 1: enable
    volatile bit cmptrig1                  @ ((unsigned)&cmpctl*8)+3; //comparator interrupts trigger direction 00: rising edge trigger  (when cmpinv=0) 01: falling edge trigger (when cmpinv=0) 10: both edge trigger    (when cmpinv=0) 11: high level trigger    (when cmpinv=0)
    volatile bit cmptrig0                  @ ((unsigned)&cmpctl*8)+2; //comparator interrupts trigger direction 00: rising edge trigger  (when cmpinv=0) 01: falling edge trigger (when cmpinv=0) 10: both edge trigger    (when cmpinv=0) 11: high level trigger    (when cmpinv=0)
    volatile bit cmpdbs1                   @ ((unsigned)&cmpctl*8)+1; //comparator output debounce time 00: none 01: 4 fsys 10: 8 fsys 11: 16 fsys
    volatile bit cmpdbs0                   @ ((unsigned)&cmpctl*8)+0; //comparator output debounce time 00: none 01: 4 fsys 10: 8 fsys 11: 16 fsys

       #ifndef _lib_build
        volatile union {
             struct {
                unsigned    cmpdbs            :2;
                unsigned    cmptrig           :2;
                unsigned    cmpinv            :1;
                unsigned    cmpoe             :1;
                unsigned    cmpox             :1;
                unsigned    pdcmp             :1;
            };
            struct {
                unsigned    cmpdbs0             :1;
                unsigned    cmpdbs1             :1;
                unsigned    cmptrig0            :1;
                unsigned    cmptrig1            :1;
            };
        } cmpctlbits @ 0x18d;
        #endif
volatile unsigned char cmppns              @ 0x18e;  //
//
    volatile bit scmpn                     @ ((unsigned)&cmppns*8)+7; //scmpn: internal dac output connect to comparator control 0: cinx connect to comparator n port 1: internal dac output connect to comparator n port
    volatile bit scin2                     @ ((unsigned)&cmppns*8)+6; //comparator n input select 000: cin1 connect to comparator n port 001: cin2 connect to comparator n port 010: cin3 connect to comparator n port 011: cin4 connect to comparator n port 1xx: nc
    volatile bit scin1                     @ ((unsigned)&cmppns*8)+5; //comparator n input select 000: cin1 connect to comparator n port 001: cin2 connect to comparator n port 010: cin3 connect to comparator n port 011: cin4 connect to comparator n port 1xx: nc
    volatile bit scin0                     @ ((unsigned)&cmppns*8)+4; //comparator n input select 000: cin1 connect to comparator n port 001: cin2 connect to comparator n port 010: cin3 connect to comparator n port 011: cin4 connect to comparator n port 1xx: nc
    volatile bit opof                      @ ((unsigned)&cmppns*8)+3; //opof: opa output (opo) connect to comparator control 0: opo connect to comparator p port 1: opo disconnect to comparator p port
    volatile bit scip2                     @ ((unsigned)&cmppns*8)+2; //comparator p input select 000: cip1 connect to comparator p port 001: cip2 connect to comparator p port 010: cip3 connect to comparator p port 011: cip4 connect to comparator p port 1xx: nc
    volatile bit scip1                     @ ((unsigned)&cmppns*8)+1; //comparator p input select 000: cip1 connect to comparator p port 001: cip2 connect to comparator p port 010: cip3 connect to comparator p port 011: cip4 connect to comparator p port 1xx: nc
    volatile bit scip0                     @ ((unsigned)&cmppns*8)+0; //comparator p input select 000: cip1 connect to comparator p port 001: cip2 connect to comparator p port 010: cip3 connect to comparator p port 011: cip4 connect to comparator p port 1xx: nc

       #ifndef _lib_build
        volatile union {
             struct {
                unsigned    scip              :3;
                unsigned    opof              :1;
                unsigned    scin              :3;
                unsigned    scmpn             :1;
            };
            struct {
                unsigned    scip0               :1;
                unsigned    scip1               :1;
                unsigned    scip2               :1;
                unsigned                        :1;
                unsigned    scin0               :1;
                unsigned    scin1               :1;
                unsigned    scin2               :1;
            };
            struct {
                unsigned    cinp              :4;                
                unsigned    cinn              :4;               
            };
        } cmppnsbits @ 0x18e;
        #endif
volatile unsigned char dactl               @ 0x18f;  //
//
    volatile bit svrf                      @ ((unsigned)&dactl*8)+7; //select comparator reference voltage level 0: vdda 1: vbgo
    volatile bit svl6                      @ ((unsigned)&dactl*8)+6; //select dac output voltage  reference source can be selected as vdda or vbgo 000_0000: 0/128 * reference source 000_0001: 1/128 * referencee source ??111_1101: 125/128 * reference source 111_1110: reserved 111_1111: reserved  
    volatile bit svl5                      @ ((unsigned)&dactl*8)+5; //select dac output voltage  reference source can be selected as vdda or vbgo 000_0000: 0/128 * reference source 000_0001: 1/128 * referencee source ??111_1101: 125/128 * reference source 111_1110: reserved 111_1111: reserved  
    volatile bit svl4                      @ ((unsigned)&dactl*8)+4; //select dac output voltage  reference source can be selected as vdda or vbgo 000_0000: 0/128 * reference source 000_0001: 1/128 * referencee source ??111_1101: 125/128 * reference source 111_1110: reserved 111_1111: reserved  
    volatile bit svl3                      @ ((unsigned)&dactl*8)+3; //select dac output voltage  reference source can be selected as vdda or vbgo 000_0000: 0/128 * reference source 000_0001: 1/128 * referencee source ??111_1101: 125/128 * reference source 111_1110: reserved 111_1111: reserved  
    volatile bit svl2                      @ ((unsigned)&dactl*8)+2; //select dac output voltage  reference source can be selected as vdda or vbgo 000_0000: 0/128 * reference source 000_0001: 1/128 * referencee source ??111_1101: 125/128 * reference source 111_1110: reserved 111_1111: reserved  
    volatile bit svl1                      @ ((unsigned)&dactl*8)+1; //select dac output voltage  reference source can be selected as vdda or vbgo 000_0000: 0/128 * reference source 000_0001: 1/128 * referencee source ??111_1101: 125/128 * reference source 111_1110: reserved 111_1111: reserved  
    volatile bit svl0                      @ ((unsigned)&dactl*8)+0; //select dac output voltage  reference source can be selected as vdda or vbgo 000_0000: 0/128 * reference source 000_0001: 1/128 * referencee source ??111_1101: 125/128 * reference source 111_1110: reserved 111_1111: reserved  

       #ifndef _lib_build
        volatile union {
             struct {
                unsigned    svl               :7;
                unsigned    svrf              :1;
            };
            struct {
                unsigned    svl0                :1;
                unsigned    svl1                :1;
                unsigned    svl2                :1;
                unsigned    svl3                :1;
                unsigned    svl4                :1;
                unsigned    svl5                :1;
                unsigned    svl6                :1;
            };
        } dactlbits @ 0x18f;
        #endif
volatile unsigned char eepctl              @ 0x190;  //
//
    volatile bit eepto                     @ ((unsigned)&eepctl*8)+7; //eeprom write time-out flag
    volatile bit eepte1                    @ ((unsigned)&eepctl*8)+1; //eeprom write time-out enable. 00: disable, 01: 1.5ms, 10: 5.8ms, 11: 11.7ms
    volatile bit eepte0                    @ ((unsigned)&eepctl*8)+0; //eeprom write time-out enable. 00: disable, 01: 1.5ms, 10: 5.8ms, 11: 11.7ms

       #ifndef _lib_build
        volatile union {
             struct {
                unsigned    eepte             :2;
                unsigned                      :5;
                unsigned    eepto             :1;
            };
            struct {
                unsigned    eepte0              :1;
                unsigned    eepte1              :1;
            };
        } eepctlbits @ 0x190;
        #endif
volatile unsigned char eepen               @ 0x191;  //
//
    volatile bit eepen0                    @ ((unsigned)&eepen*8)+0; //eeprom enable. 0xe2: enable, others: disable

       #ifndef _lib_build
        volatile union { 
             struct {
                unsigned    eepen             :8;
            };
        } eepenbits @ 0x191;
        #endif
volatile unsigned char eepdt               @ 0x192;  //
//
    volatile bit eepdt7                    @ ((unsigned)&eepdt*8)+7; //eeprom data to write
    volatile bit eepdt6                    @ ((unsigned)&eepdt*8)+6; //eeprom data to write
    volatile bit eepdt5                    @ ((unsigned)&eepdt*8)+5; //eeprom data to write
    volatile bit eepdt4                    @ ((unsigned)&eepdt*8)+4; //eeprom data to write
    volatile bit eepdt3                    @ ((unsigned)&eepdt*8)+3; //eeprom data to write
    volatile bit eepdt2                    @ ((unsigned)&eepdt*8)+2; //eeprom data to write
    volatile bit eepdt1                    @ ((unsigned)&eepdt*8)+1; //eeprom data to write
    volatile bit eepdt0                    @ ((unsigned)&eepdt*8)+0; //eeprom data to write

       #ifndef _lib_build
        volatile union {
             struct {
                unsigned    eepdt             :8;
            };
            struct {
                unsigned    eepdt0              :1;
                unsigned    eepdt1              :1;
                unsigned    eepdt2              :1;
                unsigned    eepdt3              :1;
                unsigned    eepdt4              :1;
                unsigned    eepdt5              :1;
                unsigned    eepdt6              :1;
                unsigned    eepdt7              :1;
            };
        } eepdtbits @ 0x192;
        #endif


#endif

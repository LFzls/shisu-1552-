/******************************************************************************
 ** Define to prevent recursive inclusion
 ******************************************************************************/
#ifndef  _Func_H_
#define  _Func_H_


/**************************** USER CODE BEGIN Private typedef ****************/
//-------------------------- ���������ض��� -----------------------------------               								 
typedef  unsigned char    	uint8_t;	//�޷����ַ��ͣ�8 bit��
typedef  unsigned int     	uint16_t;   //�޷������ͣ�16 bit��
typedef  unsigned long    	uint32_t;	//�޷��ų����ͣ�32 bit��

typedef  unsigned char    	u8;     	//�޷����ַ��ͣ�8 bit��
typedef  unsigned int     	u16;    	//�޷������ͣ�16 bit��
typedef  unsigned long    	u32;    	//�޷��ų����ͣ�32 bit��

//-------------------------- λ�������������ض��� ------------------------------
typedef  union
{
	unsigned char  FlagByte;
	struct
	{
		unsigned char  b0	:1;
		unsigned char  b1	:1;
		unsigned char  b2	:1;
		unsigned char  b3	:1;
		unsigned char  b4	:1;
		unsigned char  b5	:1;
		unsigned char  b6	:1;
		unsigned char  b7	:1;
	}bits;	
}FlagBits_TypeDef;

//-------------------------- ��ʱ�������������ض��� ----------------------------
typedef  struct
{
	unsigned char	TimeBase;			//��ʱ��ʱ��
	unsigned int	RechgFullTime;		//��⵽������4.05V��ʱ
    unsigned int   	SleepTime;  		//����ʱ���ʱ
    unsigned int   	SmokeTask;  		//��������ʱ���ʱ
	unsigned long	SmokeTime;			//������ʱ����ʱ	
}Time_TypeDef;

//-------------------------- ADC��ر������������ض��� -------------------------
typedef struct 
{
	unsigned char   LowVolCnt;        	//��ѹ����
	unsigned char	BatteryLevel;		//��ص���
//	unsigned char	BatteryLevelOld;	//��ص���δ����ֵ
//	unsigned char	BatteryLxCnt;    	//��ص����ı����	
	unsigned char	VoutOpenCnt;		//��·����
	unsigned char	Vout_Lx;			//�����λ
    unsigned int	BatteryVoltage;   	//��ص�ѹ����ֵ����ص�ѹ
    unsigned int    VoutVDD;  		  	//���ʱVDD��ѹ
    unsigned int    VoutOld;   	  	    //�����ѹ��ʼֵ 
	unsigned int    LoadRes;   	  	  	//������ֵ����ֵ��������ֵ
//	unsigned int    LoadResOld;			//ʵ�ʸ�����ֵ	
//	unsigned int	USB_Voltage;
	
	unsigned char	BatteryPercent;
	unsigned int	PercentAddCount;
	unsigned int	PercentSubCount;

    unsigned int	BatteryVoltageOld;  //
}ADC_TypeDef;

/**************************** USER CODE END Private typedef ******************/


/******************************************************************************
 **	Global variables with extern
 ******************************************************************************/
extern  FlagBits_TypeDef		SysInfoFlag;
extern  FlagBits_TypeDef		VoutInfoFlag;
extern  FlagBits_TypeDef		LedsInfoFlag;
extern	Time_TypeDef			TimeCnt;
extern	ADC_TypeDef				GetADC;
extern	volatile  uint16_t		FlagSmoke;		//�����б�־�Ĵ���

extern  FlagBits_TypeDef		Com1SegLED;
extern  FlagBits_TypeDef		Com2SegLED;
extern  FlagBits_TypeDef		Com3SegLED;
extern  FlagBits_TypeDef		Com4SegLED;


/**************************** USER CODE BEGIN Private defines ****************/
//------------------------- �궨����/��(1/0) ----------------------------------
#define	 True					1
#define	 False          		0

#define	 Set					1
#define	 Clr          			0


//-------------------------- ϵͳ����״̬��־λ SysInfoFlag --------------------
//ϵͳ����ģʽת����־λ
#define  SetExeMode				SysInfoFlag.bits.b0 = Set
#define  ClrExeMode				SysInfoFlag.bits.b0 = Clr
#define  F_ExeMode				SysInfoFlag.bits.b0

//ADCռ��״̬��־λ
// #define  SetStartADC			SysInfoFlag.bits.b1 = Set
// #define  ClrStartADC			SysInfoFlag.bits.b1 = Clr
// #define  F_StartADC				SysInfoFlag.bits.b1

#define  SetFirePercent			SysInfoFlag.bits.b1 = Set
#define  ClrFirePercent			SysInfoFlag.bits.b1 = Clr
#define  F_FirePercent			SysInfoFlag.bits.b1

//������������ʶλ
#define  SetCharger       		SysInfoFlag.bits.b2 = Set
#define  ClrCharger       		SysInfoFlag.bits.b2 = Clr
#define  F_Charger    	  		SysInfoFlag.bits.b2

//�������־λ
#define  SetBatFull       		SysInfoFlag.bits.b3 = Set
#define  ClrBatFull       		SysInfoFlag.bits.b3 = Clr
#define  F_BatFull        		SysInfoFlag.bits.b3

//�ϵ�����״̬��־λ
#define  SetResetFlag		  	SysInfoFlag.bits.b4 = Set
#define  ClrResetFlag     		SysInfoFlag.bits.b4 = Clr
#define  F_ResetFlag    		SysInfoFlag.bits.b4

//������ʼ����־λ
#define  SetPercentInit    		SysInfoFlag.bits.b5 = Set
#define  ClrPercentInit			SysInfoFlag.bits.b5 = Clr
#define  F_PercentInit 			SysInfoFlag.bits.b5

//10ms��ʱ��־λ
#define  SetFlag10ms      		SysInfoFlag.bits.b6 = Set
#define  ClrFlag10ms      		SysInfoFlag.bits.b6 = Clr
#define  F_Cnt10ms       		SysInfoFlag.bits.b6

//���ػ�״̬��־λ
#define  SetTurnOff				SysInfoFlag.bits.b7 = Set
#define  ClrTurnOff				SysInfoFlag.bits.b7 = Clr
#define  F_TurnOff				SysInfoFlag.bits.b7

//-------------------------- ���״̬��־λ VoutInfoFlag ---------------------
//���̴�����־λ
#define  SetEnSmoke				VoutInfoFlag.bits.b0 = Set
#define  ClrEnSmoke				VoutInfoFlag.bits.b0 = Clr
#define  F_EnSmoke				VoutInfoFlag.bits.b0

//�����״̬��־λ
#define  SetLoadWork		  	VoutInfoFlag.bits.b1 = Set
#define  ClrLoadWork     		VoutInfoFlag.bits.b1 = Clr
#define  F_LoadWork    			VoutInfoFlag.bits.b1

//�����״̬��־λ
#define  SetLoadWorkCh2		  	VoutInfoFlag.bits.b2 = Set
#define  ClrLoadWorkCh2    		VoutInfoFlag.bits.b2 = Clr
#define  F_LoadWorkCh2 			VoutInfoFlag.bits.b2

//��ص�ѹ��־λ
#define  SetLowBat	       		VoutInfoFlag.bits.b3 = Set
#define  ClrLowBat	       		VoutInfoFlag.bits.b3 = Clr
#define  F_LowBat        		VoutInfoFlag.bits.b3


#define  SetheatPwmReg			VoutInfoFlag.bits.b4 = Set
#define  ClrheatPwmReg			VoutInfoFlag.bits.b4 = Clr
#define  heatPwmRegFlag			VoutInfoFlag.bits.b4


//��·��־λ
#define  SetLoadOpen      		VoutInfoFlag.bits.b5 = Set
#define  ClrLoadOpen   			VoutInfoFlag.bits.b5 = Clr
#define  F_LoadOpen    			VoutInfoFlag.bits.b5

//��·��־λ
#define  SetLoadShort      		VoutInfoFlag.bits.b6 = Set
#define  ClrLoadShort	      	VoutInfoFlag.bits.b6 = Clr
#define  F_LoadShort	       	VoutInfoFlag.bits.b6

//����/���״̬��־λ
#define  SetFiring				VoutInfoFlag.bits.b7 = Set
#define  ClrFiring				VoutInfoFlag.bits.b7 = Clr
#define  F_Firing				VoutInfoFlag.bits.b7

//--------------------- LED��ʾ״̬��־λ LedsInfoFlag ---------------------
//����ɨ��ʹ��״̬��־λ
#define  SetEnSegLED      		LedsInfoFlag.bits.b4 = Set
#define  ClrEnSegLED      		LedsInfoFlag.bits.b4 = Clr
#define  F_EnSegLED   	  		LedsInfoFlag.bits.b4

//����ɨ��һ����ɱ�־λ
#define  SetScanLedOK      		LedsInfoFlag.bits.b5 = Set
#define  ClrScanLedOK      		LedsInfoFlag.bits.b5 = Clr
#define  F_ScanLedOK   	  		LedsInfoFlag.bits.b5

//������ʾʹ�ܱ�־λ
#define  SetEnBatLxLED        	LedsInfoFlag.bits.b3 = Set
#define  ClrEnBatLxLED       	LedsInfoFlag.bits.b3 = Clr
#define  F_EnBatLxLED     	  	LedsInfoFlag.bits.b3

//������ʹ��״̬��־λ
#define  SetNotifyLED      		LedsInfoFlag.bits.b0 = Set
#define  ClrNotifyLED      		LedsInfoFlag.bits.b0 = Clr
#define  F_NotifyLED   	  		LedsInfoFlag.bits.b0

//�����ƽ�����ʶ
#define  SetLedRise        		LedsInfoFlag.bits.b1 = Set
#define  ClrLedRise        		LedsInfoFlag.bits.b1 = Clr
#define  F_LedRise     	  		LedsInfoFlag.bits.b1

//�����ƽ����ʶ
#define  SetLedFall        		LedsInfoFlag.bits.b2 = Set
#define  ClrLedFall        		LedsInfoFlag.bits.b2 = Clr
#define  F_LedFall     	  		LedsInfoFlag.bits.b2

//���ؽ���γ�������ʹ�ܱ�־λ
// #define  SetLoadUpDnLED    		LedsInfoFlag.bits.b4 = Set
// #define  ClrLoadUpDnLED    		LedsInfoFlag.bits.b4 = Clr
// #define  F_LoadUpDnLED 	  		LedsInfoFlag.bits.b4

//Ԥ�Ⱥ�����ʹ�ܱ�־λ
// #define  SetPreHotLED        	LedsInfoFlag.bits.b5 = Set
// #define  ClrPreHotLED    		LedsInfoFlag.bits.b5 = Clr
// #define  F_PreHotLED 	  		LedsInfoFlag.bits.b5

//��������ʹ�ܱ�־λ
#define  SetChargeLED      		LedsInfoFlag.bits.b6 = Set
#define  ClrChargeLED      		LedsInfoFlag.bits.b6 = Clr
#define  F_ChargeLED   	  		LedsInfoFlag.bits.b6

//���̺�����ʹ�ܱ�־λ
#define  SetSmokeLED       		LedsInfoFlag.bits.b7 = Set
#define  ClrSmokeLED       		LedsInfoFlag.bits.b7 = Clr
#define  F_SmokeLED    	  		LedsInfoFlag.bits.b7


//--------------------- ������ʾ״̬��־λ ComxSegLED ----------------------
#define	 F_bSegA1				Com1SegLED.bits.b0
#define	 F_bSegB1				Com1SegLED.bits.b1
#define	 F_bSegC1				Com1SegLED.bits.b2
#define	 F_bSegD1				Com1SegLED.bits.b3
#define	 F_bSegE1				Com1SegLED.bits.b4
#define	 F_bSegF1				Com1SegLED.bits.b5
#define	 F_bSegG1				Com1SegLED.bits.b6
	
#define	 F_bSegA2				Com2SegLED.bits.b0
#define	 F_bSegB2				Com2SegLED.bits.b1
#define	 F_bSegC2				Com2SegLED.bits.b2
#define	 F_bSegD2				Com2SegLED.bits.b3
#define	 F_bSegE2				Com2SegLED.bits.b4
#define	 F_bSegF2				Com2SegLED.bits.b5
#define	 F_bSegG2				Com2SegLED.bits.b6
#define	 F_bSegK3				Com2SegLED.bits.b7	//"%"����

#define	 F_bSegL1				Com3SegLED.bits.b0
#define	 F_bSegKB1				Com3SegLED.bits.b1	//"1"��	 "B" �϶�
#define	 F_bSegKC1				Com3SegLED.bits.b2	//"1"��	 "C" �¶�
#define	 F_bSegH5				Com3SegLED.bits.b4
#define	 F_bSegH6				Com3SegLED.bits.b5
#define	 F_bSegH7				Com3SegLED.bits.b6
#define	 F_bSegK1				Com3SegLED.bits.b7	//����ͼ��

#define	 F_bSegL2				Com4SegLED.bits.b0
#define	 F_bSegL3				Com4SegLED.bits.b1
#define	 F_bSegL4				Com4SegLED.bits.b2
#define	 F_bSegL5				Com4SegLED.bits.b3
#define	 F_bSegL6				Com4SegLED.bits.b4
#define	 F_bSegL7				Com4SegLED.bits.b5
#define	 F_bSegH1				Com4SegLED.bits.b6
#define	 F_bSegH2				Com4SegLED.bits.b7

			
//---------------------------- ʱ������ ---------------------------------------
#define  SleepOutTime 		    300        	//����ʱ��(��λ10ms)
#define  HourOutTime 		    360000      //1Сʱʱ��(��λ10ms)
#define  ScanLoadTime           5     		//��������ʱ����(��λ10ms)
#define  SmokeOverTimeKey       1500   		//�������̳�ʱʱ��(��λ10ms)
#define  SmokeOverTimeMic       1000   		//��ͷ���̳�ʱʱ��(��λ10ms)
#define  ScanBatLxTime          10     		//�������¼��ʱ����(��λ10ms)

#define	 OilTimePerUnit			200UL
#define	 OilTime_75_100			(OilTimePerUnit*75)
#define	 OilTime_66_100			(OilTimePerUnit*6667/100)
#define	 OilTime_50_100			(OilTimePerUnit*50)
#define	 OilTime_33_100			(OilTimePerUnit*3333/100)
#define	 OilTime_25_100			(OilTimePerUnit*25)
#define	 OilTime_100_100		(OilTimePerUnit*100)//(OilTimePerUnit*100+5000UL)

#define	 OilTime_L3				(OilTimePerUnit*275)
#define	 OilTime_L2				(OilTimePerUnit*510)
#define	 OilTime_L1				(OilTimePerUnit*510)

/**************************** USER CODE END Private defines ******************/


/******************************************************************************
 *******
 *******  					��������
 *******
*******************************************************************************/
void  IdleProgress(void);   //����ģʽ
void  PowerProgress(void);
void  PlugProgress(void);   
void  EnterSleep(void);




#endif
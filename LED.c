/******************************************************************************
 **	Function :	LED.c �ļ�
 ******************************************************************************/


/******************************************************************************
 ** Include files
 ******************************************************************************/
// #include 	<pic.h>
#include 	<htc.h>
#include  	"Func.h"
#include  	"init.h"
#include  	"modular.h"
#include  	"LED.h"


/******************************************************************************
 ** Global variable definitions (declared in header file with 'extern')
 ******************************************************************************/
RunEvent_TypeDef	RunEventLED;
// RunEvent_TypeDef	RunEventBuzz;
LED_TypeDef    		RunLED;
FlagBits_TypeDef	Com1SegLED;
FlagBits_TypeDef	Com2SegLED;
FlagBits_TypeDef	Com3SegLED;
FlagBits_TypeDef	Com4SegLED;

const unsigned char  D_LCD_Table[] = 													
{											//  ----A----																	
	//0~9��A��b��C��d��E��F��NULL��L��H��o	  // |		   |	  			  
	0x3F,0x06,0x5B,0x4F,0x66,				// F	     B		
	0x6D,0x7D,0x07,0x7F,0x6F,				// |----G----|		
	0x77,0x7C,0x3A,0x5E,0x79,				// E	     C 		// H
	0x71,0x00,0x38,0x76,0x5C				// |	     | 		
};											//  ----D----  		


/*******************************************************************************
 * \brief   void  SetShowLED(uint8_t LED_color)
 *          ������ʾ��ɫ.
 * \param   [in]  uint8_t LED_color	��ʾ�ĵ�ɫ
 * \retval  void
 * \note
 ******************************************************************************/
void  SetShowLED(uint8_t LED_color)
{

}


/*******************************************************************************
 * \brief   void  SetOffNotifyLED(void)
 *          �����������.
 * \param   [in]  void
 * \retval  void
 * \note
 ******************************************************************************/
void  SetOffNotifyLED(void)
{
	ClrNotifyLED;
	ClrChargeLED;
	ClrSmokeLED;
	ClrLedFall;		//������Ʊ�־
	SetLedRise;   	//��λ������״̬
	RunLED.NotifyLedCycle = 100;	//����������1000ms
	RunLED.NotifyLedDuty = 0;  	//���������¿�ʼ
}


/*******************************************************************************
 * \brief   void  SetShowBatLxLED(void)
 *          �����������ʾ.
 * \param   [in]  ShowBatLx		//��ʾ����ȼ�
 * \retval  void
 * \note
 ******************************************************************************/
void  SetShowBatLxLED(uint8_t ShowBatLx)
{
	ClrEnSegLED;
	Com4SegLED.FlagByte = ShowBatLx;
	SetEnSegLED;
}


/*******************************************************************************
 * \brief   void  SetWarnEvent(RunEvent_TypeDef *EmRunEvent,uint8_t WarnEvent,uint8_t WarnShowTime,uint8_t WarnShowCnt)
 *          �쳣��ʾģ�����ú���.
 * \param   [in]  RunEvent_TypeDef *EmRunEvent	ģ������
 * \param   [in]  uint8_t WarnEvent		��������
 * \param   [in]  uint8_t WarnShowTime	��ʾʱ����
 * \param   [in]  uint8_t WarnShowCnt	��ʾ����*2
 * \retval  void
 * \note
 ******************************************************************************/
void  SetWarnEvent(RunEvent_TypeDef *EmRunEvent,uint8_t WarnEvent,uint8_t WarnShowTime,uint8_t WarnShowCnt)
{
	EmRunEvent->EmEvent = WarnEvent;		//��������	    
	EmRunEvent->FlashTimes = WarnShowCnt;   //��˸����*2    
	EmRunEvent->ShowTime = WarnShowTime;    //��ʾʱ����       
	EmRunEvent->ShowTask = WarnShowTime;   	//��ʼ��ʾǰά��ʱ�� 
}


/*******************************************************************************
 * \brief   void  ShowWarnLED(void)
 *          LED����ʾ��ʾ����.
 * \param   [in]  void
 * \retval  void
 * \note
 ******************************************************************************/
void  ShowWarnLED(void)
{
	if(RunEventLED.EmEvent != IdleLED)
	{      
    	if(RunEventLED.FlashTimes)
    	{
			switch(RunEventLED.EmEvent)
			{
				case  PowerOnReset:	//�ϵ�������ʱ2S��ȫ�����з���/�׵Ƴ���2S
					if(RunEventLED.FlashTimes < 9)
					{					
						SetShowLED(White_color);	//�׵Ƴ���
						ShowSegmentLED(0xFF);	//����ȫ��
						SetShowBatLxLED(0xFF);	//�����ȫ��						
					}					
					break;
				case  SmokeShow:	//������ʾ�����ٷֱȡ�������λ����1��+ͣ���ӳ���ʾ2S	//����ǰ�����������в����µ���	//��2������
					ShowSegmentLED(0x0E);	//�����ٷֱ�+������λ+��1��
					break;	
				case  Rechg:	//��� ��ʾ�����ٷֱȣ����������˸����1����
					GetADC.BatteryLevel = GetADC.BatteryPercent;	//������ʾ�ĵ���
					RunLED.ShowEventOld ^= 0x01;
					ShowSegmentLED((0x0C|RunLED.ShowEventOld));	//�����ٷֱ�+��1+���������˸
					if((RunEventLED.FlashTimes&0x01) == 0)
					{
						RunEventLED.FlashTimes = 20;
					}					
					break;
				case  LowVol:	//��ѹ�����˸10�Σ�Ϩ��
					if((RunEventLED.FlashTimes&0x01) != 0)	//���������	
					{
						SetShowLED(0x00);
						ShowSegmentLED(0x08);
					}
					else	//ż��������
					{
						SetShowLED(Red_color);	//�����
						GetADC.BatteryLevel = 0x00;
						ShowSegmentLED(0x0C);			
					}
					break;
				case  OverTime:	//��ʱ��λ����˸2�Σ�ͬʱ��Ļ��ʾ "10"
					if((RunEventLED.FlashTimes&0x01) != 0)		
					{
						SetShowLED(0x00);	//���������						
					}
					else	//ż��������
					{
						SetShowLED(GetADC.Vout_Lx);	//��ǰ��λ����			
					}
					ShowSegmentLED(0x10);	//��Ļ��ʾ "10"									
					break;
				case  LowRes:	//��·/����׵Ƴ���2S��ͬʱ��ʾ��1�ơ���2�ơ�����+����
				case  HighRes:	//��·/����׵���˸2�Σ�ͬʱ��ʾ��1�ơ���2�ơ�����+���� ��˸2��
					if((RunEventLED.FlashTimes&0x01) != 0)	//���������		
					{
						if(RunEventLED.EmEvent == LowRes)	//��·/������ʾ
						{
							SetShowLED(White_color);	//�׵���
							ShowSegmentLED(0x0E);
							SetShowBatLxLED(0xFF);
						}
						else	//��·/������ʾ
						{
							SetShowLED(0x00);	
							ShowSegmentLED(0x00);
							SetShowBatLxLED(0x00);
						}												
					}
					else	//ż��������
					{
						SetShowLED(White_color);	//�׵���
						ShowSegmentLED(0x0E);
						SetShowBatLxLED(0xFF);									
					}
					break;
				case  ChangeGears:	//�л������λ��ǰ��λ����˸3��
				case  PowerOn:	//�ػ�ת������ǰ��λ����˸5��
				case  PowerOff:	//����ת�ػ���ǰ��λ����˸5��
					if((RunEventLED.FlashTimes&0x01) != 0)	//���������	
					{
						SetShowLED(0x00);
					}
					else	//ż��������
					{
						SetShowLED(GetADC.Vout_Lx);	//��ǰ��λ����			
					}
					break;
				case  ShowOil:	//���������������������������λ����1����2��ʾ2S
					SetShowLED(GetADC.Vout_Lx);	//��ǰ��λ����									
					ShowSegmentLED(0x0E);	//�����ٷֱ�+������λ+��1��
					SetShowBatLxLED(0xFF);	//��2����
					break;
				case  PullCharger:	//�γ����������������������1��ʾ2S								
					ShowSegmentLED(0x0E);	//�����ٷֱ�+������λ+��1��
					break;
				case  RechgFull:	//�����磬��������1����2��������� ��ʾ10S								
					ShowSegmentLED(0x0D);	//�����ٷֱ�+����+��1��
					SetShowBatLxLED(0xFF);	//��2����
					break;										
				default:
					break;
			}

			RunEventLED.FlashTimes--;     // ��˸����--
		}
	    else   //�������������ƾ���,���
	    {	
			if(RunEventLED.EmEvent >= LowRes || RunEventLED.EmEvent < LowVol)
			{
				ShowSegmentLED(0x00);	//����
			}
			
			if(RunEventLED.EmEvent == LowRes || RunEventLED.EmEvent == PowerOnReset || RunEventLED.EmEvent == ShowOil)
			{
				SetShowLED(0x00);	//��RGB��
				SetShowBatLxLED(0x00);	//��������
			}

			if(RunEventLED.EmEvent == SmokeShow || RunEventLED.EmEvent == RechgFull)
			{
				ClrEnBatLxLED;	//��ֹ�����
				RunLED.ShowBatLxCnt = 0x00;
				RunLED.TaskBatLx = 0;	//����������ʾ
				SetShowBatLxLED(0x00);	//��������				
			}

			RunEventLED.EmEvent = IdleLED;	//�쳣��ʾ���					      
	    }		     		
    }
}


/*******************************************************************************
 * \brief   void  ShowSegmentLED(void)
 *          ������ʾ���ú���.
 * \param   [in]  void
 * \retval  void
 * \note
 ******************************************************************************/
void  ShowSegmentLED(uint8_t ShowEvent)
{
	unsigned char temp_seg0 = 0,temp_seg2 = 0,temp_seg3 = 0;

	ClrEnSegLED;
	switch(ShowEvent)
	{
		case  0x00:	//��������ʾ	
			Com1SegLED.FlagByte = 0x00;
			Com2SegLED.FlagByte = 0x00;
			Com3SegLED.FlagByte = 0x00;				
			break;
		case  0xFF:	//ȫ����ʾ	
			Com1SegLED.FlagByte = 0xFF;
			Com2SegLED.FlagByte = 0xFF;
			Com3SegLED.FlagByte = 0xFF;
			break;
		case  0x10:	//��ʾʮλ����λ"10"	
			Com1SegLED.FlagByte = D_LCD_Table[1];
			Com2SegLED.FlagByte = D_LCD_Table[0];
			Com3SegLED.FlagByte = 0x00;				
			break;
		case  0x0F:	//��ʾ0������	
			Com1SegLED.FlagByte = 0x00;
			Com2SegLED.FlagByte = 0x00;
			Com3SegLED.FlagByte = 0x0F;				
			break;            			
		case  0x40:	//��ʾ1������	
			Com1SegLED.FlagByte = 0x00;
			Com2SegLED.FlagByte = 0x00;
			Com3SegLED.FlagByte = 0x1F;				
			break;
		case  0x80:	//��ʾ2������	
			Com1SegLED.FlagByte = 0x00;
			Com2SegLED.FlagByte = 0x00;
			Com3SegLED.FlagByte = 0x3F;				
			break;
		case  0xC0:	//��ʾ3������	
			Com1SegLED.FlagByte = 0x00;
			Com2SegLED.FlagByte = 0x00;
			Com3SegLED.FlagByte = 0x7F;				
			break;
		default:	//��ʾ�ٷֱ�0%~100%	//�͵�����
			if((ShowEvent & 0x04) != 0)	//��ʾ�ٷֱ�
			{
				temp_seg3 = GetADC.BatteryLevel;

				if(temp_seg3 >= 100)	//�����ٷֱ�100%
				{
					temp_seg0 |= 0x06;	//��ʾ�ٷ�λ"1"
					temp_seg3 = 0;			
				}	
				else	//�����ٷֱ�00%~99%
				{
					for(temp_seg2=0;temp_seg2<10;temp_seg2++)
					{
						if(temp_seg3 < 10)	break;
						temp_seg3 -= 10;			
					}
				}

				Com1SegLED.FlagByte = D_LCD_Table[temp_seg2];
				Com2SegLED.FlagByte = D_LCD_Table[temp_seg3] | 0x80;	//��ʾ"%"����
			}
			else
			{
				Com1SegLED.FlagByte = D_LCD_Table[16];	//"NULL"
				Com2SegLED.FlagByte = D_LCD_Table[16];	//"NULL"
			}

			if((ShowEvent & 0x08) != 0)	//��ʾ��1 "L1"
			{
				temp_seg0 |= 0x01;	
			}			

			if((ShowEvent & 0x01) != 0)	//��ʾ������
			{
				temp_seg0 |= 0x80;	
			}	

			if((ShowEvent & 0x02) != 0)	//��ʾ�͵�����
			{
				if(TimeCnt.SmokeTime < OilTime_L3)		temp_seg0 |= 0x70;
				else if(TimeCnt.SmokeTime < OilTime_L2)	temp_seg0 |= 0x30;
				else 	temp_seg0 |= 0x10;
			}

			Com3SegLED.FlagByte = temp_seg0;		
			break;
	}
	RunLED.DisplayCnt = 0;
	ClrScanLedOK;
	SetEnSegLED;	
}


/*******************************************************************************
 * \brief   void  ScanSegmentLED(void)
 *          ����LEDɨ����ʾ��������.
 * \param   [in]  void
 * \retval  void
 * \note		
 ******************************************************************************/
void  ScanSegmentLED(void)
{
	if(F_EnSegLED != False)	//����ɨ�������ʾ����
	{
		//�����е�GPIO��Ϊ��������ģʽ�����
		PBD	   |= 0xF0;
		PBMOD76	= PBMOD76 & 0x00 | PIN_H_Mode_OD | PIN_L_Mode_OD;
		PBMOD54	= PBMOD54 & 0x00 | PIN_H_Mode_OD | PIN_L_Mode_OD;			
		GPIO_SEG_LED1 = Set;
		PAMOD32	= PAMOD32 & 0xF0 | PIN_L_Mode_OD;
		GPIO_SEG_LED6 = Set;
		PDMOD10	= PDMOD10 & 0x0F | PIN_H_Mode_OD;

		switch(RunLED.DisplayCnt)
		{
			case  0:	//PIN1---COM				
				if(F_bSegF1 != False)	//��һ��8��F����
				{					
					PAMOD32	= PAMOD32 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED1 = Clr;
					PBMOD76	= PBMOD76 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED2 = Set;					
				}
				break;
			case  1:	//PIN1---COM
				if(F_bSegD2 != False)	//�ڶ���8��D����
				{
					PAMOD32	= PAMOD32 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED1 = Clr;
					PBMOD76	= PBMOD76 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED3 = Set;					
				}
				break;
			case  2:	//PIN1---COM				
				if(F_bSegH2 != False)	//H2����	��2��λ
				{					
					PAMOD32	= PAMOD32 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED1 = Clr;
					PBMOD54	= PBMOD54 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED4 = Set;					
				}
				break;
			case  3:	//PIN1---COM				
				if(F_bSegH7 != False)	//H7����	"�͵�"���ţ�����L3
				{
					PAMOD32	= PAMOD32 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED1 = Clr;				
					PBMOD54	= PBMOD54 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED5 = Set;					
				}		
				break;
			case  4:	//PIN1---COM				
				if(F_bSegL3 != False)	//L3����	��2��λ
				{
					PAMOD32	= PAMOD32 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED1 = Clr;				
					PDMOD10	= PDMOD10 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED6 = Set;					
				}		
				break;
			case  5:	//PIN2---COM				
				if(F_bSegA1 != False)	//��һ��8��A����
				{
					PBMOD76	= PBMOD76 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED2 = Clr;
					PAMOD32	= PAMOD32 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED1 = Set;				
				}
				break;
			case  6:	//PIN2---COM				
				if(F_bSegE2 != False)	//�ڶ���8��E����
				{
					PBMOD76	= PBMOD76 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED2 = Clr;
					PBMOD76	= PBMOD76 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED3 = Set;					
				}
				break;
			case  7:	//PIN2---COM								
				if(F_bSegKB1 != False)	//"1"����	B/C
				{
					PBMOD76	= PBMOD76 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED2 = Clr;
					PBMOD54	= PBMOD54 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED4 = Set;					
				}
				break;
			case  8:	//PIN2---COM				
				if(F_bSegH6 != False)	//H6����	"�͵�"���ţ�����L2
				{
					PBMOD76	= PBMOD76 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED2 = Clr;			
					PBMOD54	= PBMOD54 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED5 = Set;					
				}					
				break;
			case  9:	//PIN2---COM								
				if(F_bSegL4 != False)	//L4����	��2��λ
				{
					PBMOD76	= PBMOD76 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED2 = Clr;
					PDMOD10	= PDMOD10 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED6 = Set;					
				}
				break;
			case  10:	//PIN3---COM
				if(F_bSegB1 != False)	//��һ��8��B����
				{
					PBMOD76	= PBMOD76 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED3 = Clr;
					PAMOD32	= PAMOD32 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED1 = Set;				
				}
				break;
			case  11:	//PIN3---COM				
				if(F_bSegG1 != False)	//��һ��8��G����
				{
					PBMOD76	= PBMOD76 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED3 = Clr;					
					PBMOD76	= PBMOD76 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED2 = Set;					
				}
				break;
			case  12:	//PIN3---COM
				if(F_bSegKC1 != False)	//"1"����	B/C				
				{
					PBMOD76	= PBMOD76 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED3 = Clr;
					PBMOD54	= PBMOD54 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED4 = Set;					
				}
				break;
			case  13:	//PIN3---COM				
				if(F_bSegH5 != False)	//H5����	"�͵�"���ţ�����L1
				{
					PBMOD76	= PBMOD76 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED3 = Clr;			
					PBMOD54	= PBMOD54 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED5 = Set;					
				}							
				break;
			case  14:	//PIN3---COM
				if(F_bSegL5 != False)	//L5����	��2��λ			
				{
					PBMOD76	= PBMOD76 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED3 = Clr;
					PDMOD10	= PDMOD10 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED6 = Set;					
				}
				break;
			case  15:	//PIN4---COM				
				if(F_bSegC1 != False)	//��һ��8��C����
				{
					PBMOD54	= PBMOD54 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED4 = Clr;	
					PAMOD32	= PAMOD32 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED1 = Set;				
				}
				break;			
			case  16:	//PIN4---COM								
				if(F_bSegA2 != False)	//�ڶ���8��A����
				{
					PBMOD54	= PBMOD54 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED4 = Clr;						
					PBMOD76	= PBMOD76 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED2 = Set;					
				}
				break;
			case  17:	//PIN4---COM				
				if(F_bSegF2 != False)	//�ڶ���8��F����
				{
					PBMOD54	= PBMOD54 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED4 = Clr;						
					PBMOD76	= PBMOD76 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED3 = Set;					
				}										
				break;
			case  18:	//PIN4---COM				
				if(F_bSegL1 != False)	//L1����	��1��λ
				{
					PBMOD54	= PBMOD54 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED4 = Clr;				
					PBMOD54	= PBMOD54 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED5 = Set;					
				}		
				break;
			case  19:	//PIN4---COM				
				if(F_bSegL6 != False)	//L6����	��2��λ
				{
					PBMOD54	= PBMOD54 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED4 = Clr;				
					PDMOD10	= PDMOD10 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED6 = Set;					
				}		
				break;
			case  20:	//PIN5---COM				
				if(F_bSegD1 != False)	//��һ��8��D����
				{
					PBMOD54	= PBMOD54 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED5 = Clr;	
					PAMOD32	= PAMOD32 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED1 = Set;				
				}
				break;
			case  21:	//PIN5---COM				
				if(F_bSegB2 != False)	//�ڶ���8��B����
				{
					PBMOD54	= PBMOD54 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED5 = Clr;					
					PBMOD76	= PBMOD76 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED2 = Set;					
				}
				break;
			case  22:	//PIN5---COM				
				if(F_bSegG2 != False)	//�ڶ���8��G����
				{
					PBMOD54	= PBMOD54 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED5 = Clr;					
					PBMOD76	= PBMOD76 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED3 = Set;					
				}
				break;
			case  23:	//PIN5---COM				
				if(F_bSegK1 != False)	//K1����	"����"����				
				{
					PBMOD54	= PBMOD54 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED5 = Clr;						
					PBMOD54	= PBMOD54 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED4 = Set;							
				}													
				break;
			case  24:	//PIN5---COM				
				if(F_bSegL7 != False)	//L7����	��2��λ
				{
					PBMOD10	= PBMOD10 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED5 = Clr;				
					PDMOD10	= PDMOD10 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED6 = Set;					
				}		
				break;
			case  25:	//PIN6---COM				
				if(F_bSegE1 != False)	//��һ��8��E����
				{
					PDMOD10	= PDMOD10 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED6 = Clr;	
					PAMOD32	= PAMOD32 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED1 = Set;				
				}
				break;
			case  26:	//PIN6---COM				
				if(F_bSegC2 != False)	//�ڶ���8��C����
				{
					PDMOD10	= PDMOD10 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED6 = Clr;					
					PBMOD76	= PBMOD76 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED2 = Set;					
				}
				break;
			case  27:	//PIN6---COM				
				if(F_bSegH1 != False)	//H1����	��2��λ
				{
					PDMOD10	= PDMOD10 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED6 = Clr;					
					PBMOD76	= PBMOD76 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED3 = Set;					
				}
				break;
			case  28:	//PIN6---COM				
				if(F_bSegK3 != False)	//K3����	"%"����				
				{
					PDMOD10	= PDMOD10 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED6 = Clr;						
					PBMOD54	= PBMOD54 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED4 = Set;							
				}													
				break;
			case  29:	//PIN6---COM				
				if(F_bSegL2 != False)	//L2����	��2��λ
				{
					PDMOD10	= PDMOD10 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED6 = Clr;				
					PBMOD54	= PBMOD54 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED5 = Set;					
				}		
				break;
		}
		RunLED.DisplayCnt++;	//ɨ��ѭ������++
		if(RunLED.DisplayCnt >= 30)
		{
			RunLED.DisplayCnt = 0;	//������е�ɨ�裬���¿�ʼ
			SetScanLedOK;
		}	
	}	
}


/*******************************************************************************
 * \brief   void  ShowNotifyLED(void)
 *          ��������ʾ����.
 * \param   [in]  void
 * \retval  void
 * \note    ģ��PWM������
 * 			���һ�ν�������ʱ�� = 
 * 			100uS(��ʱ���ж�����)*NotifyLedCycle*NotifyLedDuty*2
 ******************************************************************************/
void  ShowNotifyLED(void)
{
	if(RunLED.NotifyLedCycleCnt >= RunLED.NotifyLedCycle)	//һ��ռ�ձ�����
	{
		RunLED.NotifyLedCycleCnt = 0;
	
		if(F_LedRise != False)
		{
			if(RunLED.NotifyLedDuty < RunLED.NotifyLedCycle)  
			{
				RunLED.NotifyLedDuty++;		//����    
			}				
		}				
		else if(F_LedFall != False)
		{
			if(RunLED.NotifyLedDuty) 
			{
				RunLED.NotifyLedDuty--;		//����
			}	
			else	//�����
			{				
				ClrLedFall;
				SetLedRise;	//�ʱת����					
				if(F_SmokeLED != False)	
				{					
					ClrSmokeLED;
					ClrNotifyLED;	//����ʱ�ʱ���������
				}		            
			}
		}
	}
	else	RunLED.NotifyLedCycleCnt++;
		
	if(RunLED.NotifyLedCycleCnt >= RunLED.NotifyLedDuty || RunLED.NotifyLedDuty == 0)	  
	{
		//��������ռ�ձ�ƥ��ʱ����δ�ﵽ���ռ�ձ�ʱ��ת
		SetShowLED(0x00);	//��RGB��
	}
	else
	{
		if(F_SmokeLED != False)
		{
			SetShowLED(GetADC.Vout_Lx);	//��ǰ��λ����	//�������λ���	//�������λ�Ƶ�
		}
	}
}


/*******************************************************************************
 * \brief   void  ScanShowBatLxLED(void)
 *          ����LEDɨ��������ʾ��������.
 * \param   [in]  void
 * \retval  void
 * \note		
 ******************************************************************************/	
void  ScanShowBatLxLED(void)
{
	if(F_EnBatLxLED != False)
	{
		if(RunLED.TaskBatLx)	RunLED.TaskBatLx--;
		else
		{
			RunLED.TaskBatLx = 10;	//100msɨ����ʾ1��

			switch(RunLED.ShowBatLxCnt)
			{
				case  1:
					Com4SegLED.FlagByte = 0x01;
					break;
				case  2:
					Com4SegLED.FlagByte = 0x03;
					break;
				case  3:
					Com4SegLED.FlagByte = 0x07;
					break;
				case  4:
					Com4SegLED.FlagByte = 0x0F;
					break;
				case  5:
					Com4SegLED.FlagByte = 0x1F;
					break;	
				case  6:
					Com4SegLED.FlagByte = 0x3F;
					break;
				case  7:
					Com4SegLED.FlagByte = 0x7F;
					break;
				case  8:
					Com4SegLED.FlagByte = 0xFF;
					break;																																	
				default:
					Com4SegLED.FlagByte = 0x00;
					RunLED.ShowBatLxCnt = 0x00;
					break;
			}

			if(F_SmokeLED != False && F_LedRise != False)
			{
				if(RunLED.ShowBatLxCnt < 8)		RunLED.ShowBatLxCnt++;
			}
			else if(F_SmokeLED != False && F_LedFall != False)
			{
				if(RunLED.ShowBatLxCnt)		RunLED.ShowBatLxCnt--;
			}
			else if(F_Charger != False)
			{
				if(RunLED.ShowBatLxCnt < 8)		RunLED.ShowBatLxCnt++;
				else	RunLED.ShowBatLxCnt = 0x00;
			}
		}		
	}
}
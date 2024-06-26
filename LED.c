/******************************************************************************
 **	Function :	LED.c 文件
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
	//0~9、A、b、C、d、E、F、NULL、L、H、o	  // |		   |	  			  
	0x3F,0x06,0x5B,0x4F,0x66,				// F	     B		
	0x6D,0x7D,0x07,0x7F,0x6F,				// |----G----|		
	0x77,0x7C,0x3A,0x5E,0x79,				// E	     C 		// H
	0x71,0x00,0x38,0x76,0x5C				// |	     | 		
};											//  ----D----  		


/*******************************************************************************
 * \brief   void  SetShowLED(uint8_t LED_color)
 *          设置显示灯色.
 * \param   [in]  uint8_t LED_color	显示的灯色
 * \retval  void
 * \note
 ******************************************************************************/
void  SetShowLED(uint8_t LED_color)
{

}


/*******************************************************************************
 * \brief   void  SetOffNotifyLED(void)
 *          设置灭呼吸灯.
 * \param   [in]  void
 * \retval  void
 * \note
 ******************************************************************************/
void  SetOffNotifyLED(void)
{
	ClrNotifyLED;
	ClrChargeLED;
	ClrSmokeLED;
	ClrLedFall;		//清呼吸灯标志
	SetLedRise;   	//置位渐亮初状态
	RunLED.NotifyLedCycle = 100;	//呼吸灯周期1000ms
	RunLED.NotifyLedDuty = 0;  	//呼吸灯重新开始
}


/*******************************************************************************
 * \brief   void  SetShowBatLxLED(void)
 *          设置跑马灯显示.
 * \param   [in]  ShowBatLx		//显示跑马等级
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
 *          异常提示模块设置函数.
 * \param   [in]  RunEvent_TypeDef *EmRunEvent	模块类型
 * \param   [in]  uint8_t WarnEvent		警告类型
 * \param   [in]  uint8_t WarnShowTime	显示时间间隔
 * \param   [in]  uint8_t WarnShowCnt	提示次数*2
 * \retval  void
 * \note
 ******************************************************************************/
void  SetWarnEvent(RunEvent_TypeDef *EmRunEvent,uint8_t WarnEvent,uint8_t WarnShowTime,uint8_t WarnShowCnt)
{
	EmRunEvent->EmEvent = WarnEvent;		//警告类型	    
	EmRunEvent->FlashTimes = WarnShowCnt;   //闪烁次数*2    
	EmRunEvent->ShowTime = WarnShowTime;    //显示时间间隔       
	EmRunEvent->ShowTask = WarnShowTime;   	//开始提示前维持时间 
}


/*******************************************************************************
 * \brief   void  ShowWarnLED(void)
 *          LED灯提示显示函数.
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
				case  PowerOnReset:	//上电数显延时2S，全显所有符号/白灯常亮2S
					if(RunEventLED.FlashTimes < 9)
					{					
						SetShowLED(White_color);	//白灯常亮
						ShowSegmentLED(0xFF);	//数显全显
						SetShowBatLxLED(0xFF);	//跑马灯全显						
					}					
					break;
				case  SmokeShow:	//吸烟显示电量百分比、油量档位、屏1灯+停吸延迟显示2S	//吸烟前电量，吸烟中不更新电量	//屏2灯跑马
					ShowSegmentLED(0x0E);	//电量百分比+油量档位+屏1灯
					break;	
				case  Rechg:	//充电 显示电量百分比，闪电符号闪烁，屏1常亮
					GetADC.BatteryLevel = GetADC.BatteryPercent;	//保存显示的电量
					RunLED.ShowEventOld ^= 0x01;
					ShowSegmentLED((0x0C|RunLED.ShowEventOld));	//电量百分比+屏1+闪电符号闪烁
					if((RunEventLED.FlashTimes&0x01) == 0)
					{
						RunEventLED.FlashTimes = 20;
					}					
					break;
				case  LowVol:	//低压红灯闪烁10次，熄屏
					if((RunEventLED.FlashTimes&0x01) != 0)	//奇数次灭灯	
					{
						SetShowLED(0x00);
						ShowSegmentLED(0x08);
					}
					else	//偶数次亮灯
					{
						SetShowLED(Red_color);	//红灯亮
						GetADC.BatteryLevel = 0x00;
						ShowSegmentLED(0x0C);			
					}
					break;
				case  OverTime:	//超时档位灯闪烁2次，同时屏幕显示 "10"
					if((RunEventLED.FlashTimes&0x01) != 0)		
					{
						SetShowLED(0x00);	//奇数次灭灯						
					}
					else	//偶数次亮灯
					{
						SetShowLED(GetADC.Vout_Lx);	//当前档位灯亮			
					}
					ShowSegmentLED(0x10);	//屏幕显示 "10"									
					break;
				case  LowRes:	//短路/低阻白灯常亮2S，同时显示屏1灯、屏2灯、电量+油量
				case  HighRes:	//开路/高阻白灯闪烁2次，同时显示屏1灯、屏2灯、电量+油量 闪烁2次
					if((RunEventLED.FlashTimes&0x01) != 0)	//奇数次灭灯		
					{
						if(RunEventLED.EmEvent == LowRes)	//短路/低阻提示
						{
							SetShowLED(White_color);	//白灯亮
							ShowSegmentLED(0x0E);
							SetShowBatLxLED(0xFF);
						}
						else	//开路/高阻提示
						{
							SetShowLED(0x00);	
							ShowSegmentLED(0x00);
							SetShowBatLxLED(0x00);
						}												
					}
					else	//偶数次亮灯
					{
						SetShowLED(White_color);	//白灯亮
						ShowSegmentLED(0x0E);
						SetShowBatLxLED(0xFF);									
					}
					break;
				case  ChangeGears:	//切换输出档位当前档位灯闪烁3次
				case  PowerOn:	//关机转开机当前档位灯闪烁5次
				case  PowerOff:	//开机转关机当前档位灯闪烁5次
					if((RunEventLED.FlashTimes&0x01) != 0)	//奇数次灭灯	
					{
						SetShowLED(0x00);
					}
					else	//偶数次亮灯
					{
						SetShowLED(GetADC.Vout_Lx);	//当前档位灯亮			
					}
					break;
				case  ShowOil:	//单按按键，油量、电量、输出档位、屏1、屏2显示2S
					SetShowLED(GetADC.Vout_Lx);	//当前档位灯亮									
					ShowSegmentLED(0x0E);	//电量百分比+油量档位+屏1灯
					SetShowBatLxLED(0xFF);	//屏2灯亮
					break;
				case  PullCharger:	//拔除充电器，油量、电量、屏1显示2S								
					ShowSegmentLED(0x0E);	//电量百分比+油量档位+屏1灯
					break;
				case  RechgFull:	//充满电，电量、屏1、屏2、闪电符号 显示10S								
					ShowSegmentLED(0x0D);	//电量百分比+闪电+屏1灯
					SetShowBatLxLED(0xFF);	//屏2灯亮
					break;										
				default:
					break;
			}

			RunEventLED.FlashTimes--;     // 闪烁次数--
		}
	    else   //闪够次数清闪灯警告,灭灯
	    {	
			if(RunEventLED.EmEvent >= LowRes || RunEventLED.EmEvent < LowVol)
			{
				ShowSegmentLED(0x00);	//灭屏
			}
			
			if(RunEventLED.EmEvent == LowRes || RunEventLED.EmEvent == PowerOnReset || RunEventLED.EmEvent == ShowOil)
			{
				SetShowLED(0x00);	//灭RGB灯
				SetShowBatLxLED(0x00);	//跑马灯灭灯
			}

			if(RunEventLED.EmEvent == SmokeShow || RunEventLED.EmEvent == RechgFull)
			{
				ClrEnBatLxLED;	//禁止跑马灯
				RunLED.ShowBatLxCnt = 0x00;
				RunLED.TaskBatLx = 0;	//立即更新显示
				SetShowBatLxLED(0x00);	//跑马灯灭灯				
			}

			RunEventLED.EmEvent = IdleLED;	//异常提示完成					      
	    }		     		
    }
}


/*******************************************************************************
 * \brief   void  ShowSegmentLED(void)
 *          数显显示设置函数.
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
		case  0x00:	//灭所有显示	
			Com1SegLED.FlagByte = 0x00;
			Com2SegLED.FlagByte = 0x00;
			Com3SegLED.FlagByte = 0x00;				
			break;
		case  0xFF:	//全屏显示	
			Com1SegLED.FlagByte = 0xFF;
			Com2SegLED.FlagByte = 0xFF;
			Com3SegLED.FlagByte = 0xFF;
			break;
		case  0x10:	//显示十位、个位"10"	
			Com1SegLED.FlagByte = D_LCD_Table[1];
			Com2SegLED.FlagByte = D_LCD_Table[0];
			Com3SegLED.FlagByte = 0x00;				
			break;
		case  0x0F:	//显示0格油量	
			Com1SegLED.FlagByte = 0x00;
			Com2SegLED.FlagByte = 0x00;
			Com3SegLED.FlagByte = 0x0F;				
			break;            			
		case  0x40:	//显示1格油量	
			Com1SegLED.FlagByte = 0x00;
			Com2SegLED.FlagByte = 0x00;
			Com3SegLED.FlagByte = 0x1F;				
			break;
		case  0x80:	//显示2格油量	
			Com1SegLED.FlagByte = 0x00;
			Com2SegLED.FlagByte = 0x00;
			Com3SegLED.FlagByte = 0x3F;				
			break;
		case  0xC0:	//显示3格油量	
			Com1SegLED.FlagByte = 0x00;
			Com2SegLED.FlagByte = 0x00;
			Com3SegLED.FlagByte = 0x7F;				
			break;
		default:	//显示百分比0%~100%	//油滴油量
			if((ShowEvent & 0x04) != 0)	//显示百分比
			{
				temp_seg3 = GetADC.BatteryLevel;

				if(temp_seg3 >= 100)	//电量百分比100%
				{
					temp_seg0 |= 0x06;	//显示百分位"1"
					temp_seg3 = 0;			
				}	
				else	//电量百分比00%~99%
				{
					for(temp_seg2=0;temp_seg2<10;temp_seg2++)
					{
						if(temp_seg3 < 10)	break;
						temp_seg3 -= 10;			
					}
				}

				Com1SegLED.FlagByte = D_LCD_Table[temp_seg2];
				Com2SegLED.FlagByte = D_LCD_Table[temp_seg3] | 0x80;	//显示"%"符号
			}
			else
			{
				Com1SegLED.FlagByte = D_LCD_Table[16];	//"NULL"
				Com2SegLED.FlagByte = D_LCD_Table[16];	//"NULL"
			}

			if((ShowEvent & 0x08) != 0)	//显示屏1 "L1"
			{
				temp_seg0 |= 0x01;	
			}			

			if((ShowEvent & 0x01) != 0)	//显示充电符号
			{
				temp_seg0 |= 0x80;	
			}	

			if((ShowEvent & 0x02) != 0)	//显示油滴油量
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
 *          数显LED扫描显示驱动函数.
 * \param   [in]  void
 * \retval  void
 * \note		
 ******************************************************************************/
void  ScanSegmentLED(void)
{
	if(F_EnSegLED != False)	//开启扫描更新显示数据
	{
		//先所有灯GPIO改为高阻输入模式，灭灯
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
				if(F_bSegF1 != False)	//第一个8的F段亮
				{					
					PAMOD32	= PAMOD32 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED1 = Clr;
					PBMOD76	= PBMOD76 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED2 = Set;					
				}
				break;
			case  1:	//PIN1---COM
				if(F_bSegD2 != False)	//第二个8的D段亮
				{
					PAMOD32	= PAMOD32 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED1 = Clr;
					PBMOD76	= PBMOD76 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED3 = Set;					
				}
				break;
			case  2:	//PIN1---COM				
				if(F_bSegH2 != False)	//H2段亮	屏2档位
				{					
					PAMOD32	= PAMOD32 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED1 = Clr;
					PBMOD54	= PBMOD54 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED4 = Set;					
				}
				break;
			case  3:	//PIN1---COM				
				if(F_bSegH7 != False)	//H7段亮	"油滴"符号，油量L3
				{
					PAMOD32	= PAMOD32 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED1 = Clr;				
					PBMOD54	= PBMOD54 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED5 = Set;					
				}		
				break;
			case  4:	//PIN1---COM				
				if(F_bSegL3 != False)	//L3段亮	屏2档位
				{
					PAMOD32	= PAMOD32 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED1 = Clr;				
					PDMOD10	= PDMOD10 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED6 = Set;					
				}		
				break;
			case  5:	//PIN2---COM				
				if(F_bSegA1 != False)	//第一个8的A段亮
				{
					PBMOD76	= PBMOD76 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED2 = Clr;
					PAMOD32	= PAMOD32 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED1 = Set;				
				}
				break;
			case  6:	//PIN2---COM				
				if(F_bSegE2 != False)	//第二个8的E段亮
				{
					PBMOD76	= PBMOD76 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED2 = Clr;
					PBMOD76	= PBMOD76 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED3 = Set;					
				}
				break;
			case  7:	//PIN2---COM								
				if(F_bSegKB1 != False)	//"1"段亮	B/C
				{
					PBMOD76	= PBMOD76 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED2 = Clr;
					PBMOD54	= PBMOD54 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED4 = Set;					
				}
				break;
			case  8:	//PIN2---COM				
				if(F_bSegH6 != False)	//H6段亮	"油滴"符号，油量L2
				{
					PBMOD76	= PBMOD76 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED2 = Clr;			
					PBMOD54	= PBMOD54 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED5 = Set;					
				}					
				break;
			case  9:	//PIN2---COM								
				if(F_bSegL4 != False)	//L4段亮	屏2档位
				{
					PBMOD76	= PBMOD76 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED2 = Clr;
					PDMOD10	= PDMOD10 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED6 = Set;					
				}
				break;
			case  10:	//PIN3---COM
				if(F_bSegB1 != False)	//第一个8的B段亮
				{
					PBMOD76	= PBMOD76 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED3 = Clr;
					PAMOD32	= PAMOD32 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED1 = Set;				
				}
				break;
			case  11:	//PIN3---COM				
				if(F_bSegG1 != False)	//第一个8的G段亮
				{
					PBMOD76	= PBMOD76 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED3 = Clr;					
					PBMOD76	= PBMOD76 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED2 = Set;					
				}
				break;
			case  12:	//PIN3---COM
				if(F_bSegKC1 != False)	//"1"段亮	B/C				
				{
					PBMOD76	= PBMOD76 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED3 = Clr;
					PBMOD54	= PBMOD54 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED4 = Set;					
				}
				break;
			case  13:	//PIN3---COM				
				if(F_bSegH5 != False)	//H5段亮	"油滴"符号，油量L1
				{
					PBMOD76	= PBMOD76 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED3 = Clr;			
					PBMOD54	= PBMOD54 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED5 = Set;					
				}							
				break;
			case  14:	//PIN3---COM
				if(F_bSegL5 != False)	//L5段亮	屏2档位			
				{
					PBMOD76	= PBMOD76 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED3 = Clr;
					PDMOD10	= PDMOD10 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED6 = Set;					
				}
				break;
			case  15:	//PIN4---COM				
				if(F_bSegC1 != False)	//第一个8的C段亮
				{
					PBMOD54	= PBMOD54 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED4 = Clr;	
					PAMOD32	= PAMOD32 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED1 = Set;				
				}
				break;			
			case  16:	//PIN4---COM								
				if(F_bSegA2 != False)	//第二个8的A段亮
				{
					PBMOD54	= PBMOD54 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED4 = Clr;						
					PBMOD76	= PBMOD76 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED2 = Set;					
				}
				break;
			case  17:	//PIN4---COM				
				if(F_bSegF2 != False)	//第二个8的F段亮
				{
					PBMOD54	= PBMOD54 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED4 = Clr;						
					PBMOD76	= PBMOD76 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED3 = Set;					
				}										
				break;
			case  18:	//PIN4---COM				
				if(F_bSegL1 != False)	//L1段亮	屏1档位
				{
					PBMOD54	= PBMOD54 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED4 = Clr;				
					PBMOD54	= PBMOD54 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED5 = Set;					
				}		
				break;
			case  19:	//PIN4---COM				
				if(F_bSegL6 != False)	//L6段亮	屏2档位
				{
					PBMOD54	= PBMOD54 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED4 = Clr;				
					PDMOD10	= PDMOD10 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED6 = Set;					
				}		
				break;
			case  20:	//PIN5---COM				
				if(F_bSegD1 != False)	//第一个8的D段亮
				{
					PBMOD54	= PBMOD54 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED5 = Clr;	
					PAMOD32	= PAMOD32 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED1 = Set;				
				}
				break;
			case  21:	//PIN5---COM				
				if(F_bSegB2 != False)	//第二个8的B段亮
				{
					PBMOD54	= PBMOD54 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED5 = Clr;					
					PBMOD76	= PBMOD76 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED2 = Set;					
				}
				break;
			case  22:	//PIN5---COM				
				if(F_bSegG2 != False)	//第二个8的G段亮
				{
					PBMOD54	= PBMOD54 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED5 = Clr;					
					PBMOD76	= PBMOD76 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED3 = Set;					
				}
				break;
			case  23:	//PIN5---COM				
				if(F_bSegK1 != False)	//K1段亮	"闪电"符号				
				{
					PBMOD54	= PBMOD54 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED5 = Clr;						
					PBMOD54	= PBMOD54 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED4 = Set;							
				}													
				break;
			case  24:	//PIN5---COM				
				if(F_bSegL7 != False)	//L7段亮	屏2档位
				{
					PBMOD10	= PBMOD10 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED5 = Clr;				
					PDMOD10	= PDMOD10 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED6 = Set;					
				}		
				break;
			case  25:	//PIN6---COM				
				if(F_bSegE1 != False)	//第一个8的E段亮
				{
					PDMOD10	= PDMOD10 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED6 = Clr;	
					PAMOD32	= PAMOD32 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED1 = Set;				
				}
				break;
			case  26:	//PIN6---COM				
				if(F_bSegC2 != False)	//第二个8的C段亮
				{
					PDMOD10	= PDMOD10 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED6 = Clr;					
					PBMOD76	= PBMOD76 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED2 = Set;					
				}
				break;
			case  27:	//PIN6---COM				
				if(F_bSegH1 != False)	//H1段亮	屏2档位
				{
					PDMOD10	= PDMOD10 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED6 = Clr;					
					PBMOD76	= PBMOD76 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED3 = Set;					
				}
				break;
			case  28:	//PIN6---COM				
				if(F_bSegK3 != False)	//K3段亮	"%"符号				
				{
					PDMOD10	= PDMOD10 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED6 = Clr;						
					PBMOD54	= PBMOD54 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED4 = Set;							
				}													
				break;
			case  29:	//PIN6---COM				
				if(F_bSegL2 != False)	//L2段亮	屏2档位
				{
					PDMOD10	= PDMOD10 & 0x0F | PIN_H_Mode_PP;
					GPIO_SEG_LED6 = Clr;				
					PBMOD54	= PBMOD54 & 0xF0 | PIN_L_Mode_PP;
					GPIO_SEG_LED5 = Set;					
				}		
				break;
		}
		RunLED.DisplayCnt++;	//扫描循环次数++
		if(RunLED.DisplayCnt >= 30)
		{
			RunLED.DisplayCnt = 0;	//完成所有灯扫描，重新开始
			SetScanLedOK;
		}	
	}	
}


/*******************************************************************************
 * \brief   void  ShowNotifyLED(void)
 *          呼吸灯显示函数.
 * \param   [in]  void
 * \retval  void
 * \note    模拟PWM呼吸灯
 * 			完成一次渐亮渐灭时长 = 
 * 			100uS(定时器中断周期)*NotifyLedCycle*NotifyLedDuty*2
 ******************************************************************************/
void  ShowNotifyLED(void)
{
	if(RunLED.NotifyLedCycleCnt >= RunLED.NotifyLedCycle)	//一个占空比周期
	{
		RunLED.NotifyLedCycleCnt = 0;
	
		if(F_LedRise != False)
		{
			if(RunLED.NotifyLedDuty < RunLED.NotifyLedCycle)  
			{
				RunLED.NotifyLedDuty++;		//渐亮    
			}				
		}				
		else if(F_LedFall != False)
		{
			if(RunLED.NotifyLedDuty) 
			{
				RunLED.NotifyLedDuty--;		//渐灭
			}	
			else	//渐灭到最暗
			{				
				ClrLedFall;
				SetLedRise;	//最暗时转渐亮					
				if(F_SmokeLED != False)	
				{					
					ClrSmokeLED;
					ClrNotifyLED;	//吸烟时最暗时清除呼吸灯
				}		            
			}
		}
	}
	else	RunLED.NotifyLedCycleCnt++;
		
	if(RunLED.NotifyLedCycleCnt >= RunLED.NotifyLedDuty || RunLED.NotifyLedDuty == 0)	  
	{
		//计数器与占空比匹配时，且未达到最大占空比时反转
		SetShowLED(0x00);	//灭RGB灯
	}
	else
	{
		if(F_SmokeLED != False)
		{
			SetShowLED(GetADC.Vout_Lx);	//当前档位灯亮	//高输出档位红灯	//低输出档位黄灯
		}
	}
}


/*******************************************************************************
 * \brief   void  ScanShowBatLxLED(void)
 *          数显LED扫描跑马显示驱动函数.
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
			RunLED.TaskBatLx = 10;	//100ms扫描显示1次

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
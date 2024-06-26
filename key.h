/******************************************************************************
 ** Define to prevent recursive inclusion
 ******************************************************************************/
#ifndef  _KEY_H
#define  _KEY_H


/**************************** USER CODE BEGIN Private typedef ****************/
//----------------------- GPIO状态扫描相关变量数据类型重定义 -------------------
typedef  struct
{
	unsigned char   ChargerCnt; 		//充电器检测计数	
	unsigned char	ScanNew;			//新电平状态
	unsigned char	ScanOld;			//旧电平状态	
	unsigned char	ScanCnt;			//状态改变连续检测到计数(消抖)	
	unsigned char	KeyState;			//按键状态
	unsigned char	KeyNum;      		//触摸按键次数	
	unsigned char   KeyIntervalTime;  	//按键短按时间	
	unsigned int    KeyLongTime;  		//按键长按时间
}ReadPort_TypeDef;

/**************************** USER CODE END Private typedef ******************/


/******************************************************************************
 **	Global variables with extern
 ******************************************************************************/
extern	ReadPort_TypeDef		ReadPort;


/**************************** USER CODE BEGIN Private defines ****************/
//------------------------- 按键次数定义 --------------------------------------
#define	 KEY_NUM_CHANGE_GEAR    2
#define	 KEY_NUM_PRESMOKE    	1		
#define  KEY_NUM_ON_OFF			5

/**************************** USER CODE END Private defines ******************/


/******************************************************************************
 *******
 *******  					函数声明
 *******
 ******************************************************************************/
void  PortScan(void);
void  ReadChargerState(void);
void  KeyUpStopSmoke(void);




#endif








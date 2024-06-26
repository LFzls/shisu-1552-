#ifndef __TYW_LED_H__
#define __TYW_LED_H__



#include  	"init.h"
#include "Func.h"
#include "tenx_TM56F1522.h"


//#define TEST_XIAO

#define LED_MATRIX_NUM_PINS 8


#define LED_MATRIX_SIZE     (LED_MATRIX_NUM_PINS * (LED_MATRIX_NUM_PINS - 1))
#define LED_PWM_CYCLES      16
#define LED_COLOR_DIV	(256/LED_PWM_CYCLES)
#define LED_FREQ	(1000*1000/(LED_PWM_CYCLES*LED_MATRIX_SIZE*50)+1)

#define LED_NUMBER_COLUMN		LED_MATRIX_NUM_PINS-1
#define LED_NUMBER_ROW		LED_MATRIX_NUM_PINS

#define LED_NUMBER_SHOW_MAX		4  //��ʾ���ֵĸ���


extern unsigned char  led_duty_cycles[LED_MATRIX_NUM_PINS][LED_MATRIX_NUM_PINS];
extern unsigned char  led_duty_cycles_tmp[LED_MATRIX_NUM_PINS];

#define LED_1   PBD3
#define LED_2   PDD0
#define LED_3   PDD1
#define LED_4   PBD4
#define LED_5   PBD5
#define LED_6   PBD6
#define LED_7   PBD7
#define LED_8   PBD0



#define LED_PIN_OD_1	{LED_1=1; PBMOD32= PBMOD32 & 0x0F | PIN_H_Mode_OD; }   //PBD3=0，且设置为开漏
#define LED_PIN_OD_2	{LED_2=1; PDMOD10= PDMOD10 & 0xF0 | PIN_L_Mode_OD; }   //PBD0=0，且设置为开漏
#define LED_PIN_OD_3	{LED_3=1; PDMOD10= PDMOD10 & 0x0F | PIN_H_Mode_OD; }   //PBD1=0，且设置为开漏
#define LED_PIN_OD_4	{LED_4=1; PBMOD54= PBMOD54 & 0xF0 | PIN_L_Mode_OD; }
#define LED_PIN_OD_5	{LED_5=1; PBMOD54= PBMOD54 & 0x0F | PIN_H_Mode_OD; }
#define LED_PIN_OD_6	{LED_6=1; PBMOD76= PBMOD76 & 0xF0 | PIN_L_Mode_OD; }
#define LED_PIN_OD_7	{LED_7=1; PBMOD76= PBMOD76 & 0x0F | PIN_H_Mode_OD; }
#define LED_PIN_OD_8	{LED_8=1; PBMOD10= PBMOD10 & 0xF0 | PIN_L_Mode_OD; }


                                              
#define LED_PIN_PP_1(type)	{PBMOD32= PBMOD32 & 0x0F | PIN_H_Mode_PP; if(type)LED_1=1;else LED_1=0;}  //PBD3=0，且设置为推挽
#define LED_PIN_PP_2(type)	{PDMOD10= PDMOD10 & 0xF0 | PIN_L_Mode_PP; if(type)LED_2=1;else LED_2=0;}  
#define LED_PIN_PP_3(type)	{PDMOD10= PDMOD10 & 0x0F | PIN_H_Mode_PP; if(type)LED_3=1;else LED_3=0;}  
#define LED_PIN_PP_4(type)	{PBMOD54= PBMOD54 & 0xF0 | PIN_L_Mode_PP; if(type)LED_4=1;else LED_4=0;}
#define LED_PIN_PP_5(type)	{PBMOD54= PBMOD54 & 0x0F | PIN_H_Mode_PP; if(type)LED_5=1;else LED_5=0;}
#define LED_PIN_PP_6(type)	{PBMOD76= PBMOD76 & 0xF0 | PIN_L_Mode_PP; if(type)LED_6=1;else LED_6=0;}
#define LED_PIN_PP_7(type)	{PBMOD76= PBMOD76 & 0x0F | PIN_H_Mode_PP; if(type)LED_7=1;else LED_7=0;}
#define LED_PIN_PP_8(type)	{PBMOD10= PBMOD10 & 0xF0 | PIN_L_Mode_PP; if(type)LED_8=1;else LED_8=0;}






void led_one_test(uint8_t row,uint8_t cow);

void led_all_test(void);

void led_set_io_od(uint8_t io_num) ;
void led_set_io_pp(uint8_t io_num,uint8_t type) ;
void* tyw_memset(void* ptr, uint8_t value, uint8_t num) ;
void* tyw_memcpy(void* dest, const void* src, uint8_t num) ;
void led_matrix_run(void);

void led_show_num(unsigned char id,unsigned char num);

void led_show_set(void);
void led_show_clear(void);
void led_show_power(uint8_t powerPercent);
void led_show_Marquee(uint8_t num);
void led_show_work_mode(void);
void gpio_test(void);
#endif

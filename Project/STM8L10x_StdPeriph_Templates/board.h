#ifndef _BOARD_H_
#define _BOARD_H_

#include "stm8l10x_conf.h"

/* Board LED
PD0: Port D0 / Timer 1 - break input / Configurable clock output [AFR5]
*/
#define LED_PORT  GPIOC 
#define LED_PIN   GPIO_Pin_2
#define LED_ON    (LED_PORT->ODR |= LED_PIN)
#define LED_OFF   (LED_PORT->ODR &= (u8)(~LED_PIN))
#define LED_STATE (LED_PORT->IDR & LED_PIN)

/* Board Buttons
PC1 Button 1, button press = 0
PC0 Button 2, button press = 0
*/
#define BTN_PORT   GPIOC 
#define BTN1_PIN   GPIO_Pin_1
#define BTN2_PIN   GPIO_Pin_0
#define BTN1_STATE (BTN_PORT->IDR & BTN1_PIN)
#define BTN2_STATE (BTN_PORT->IDR & BTN2_PIN)


//RF
#define RFSEND_PORT   GPIOC
#define RFSEND_PIN    GPIO_Pin_6 
#define RFSEND_LOW()  (RFSEND_PORT->ODR &= (u8)(~RFSEND_PIN))   /* drive RF out pin low */
#define RFSEND_HIGH() (RFSEND_PORT->ODR |= RFSEND_PIN)          /* drive RF out pin high */

#define IRLED_PORT   GPIOB
#define IRLED_PIN    GPIO_Pin_0 
#define IRLED_ON    (IRLED_PORT->ODR &= (u8)(~IRLED_PIN))   /* drive RF out pin low */
#define IRLED_OFF   (IRLED_PORT->ODR |= IRLED_PIN)          /* drive RF out pin high */

#endif
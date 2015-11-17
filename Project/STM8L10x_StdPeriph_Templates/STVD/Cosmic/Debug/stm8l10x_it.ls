   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
   4                     ; Optimizer V4.3.6 - 29 Nov 2011
  21                     	bsct
  22  0000               _Btn_pressed:
  23  0000 00            	dc.b	0
  53                     ; 50 INTERRUPT_HANDLER(NonHandledInterrupt,0)
  53                     ; 51 {
  54                     .text:	section	.text,new
  55  0000               f_NonHandledInterrupt:
  59                     ; 55 }
  62  0000 80            	iret	
  84                     ; 63 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  84                     ; 64 {
  85                     .text:	section	.text,new
  86  0000               f_TRAP_IRQHandler:
  90                     ; 68 }
  93  0000 80            	iret	
 115                     ; 75 INTERRUPT_HANDLER(FLASH_IRQHandler,1)
 115                     ; 76 {
 116                     .text:	section	.text,new
 117  0000               f_FLASH_IRQHandler:
 121                     ; 80 }
 124  0000 80            	iret	
 146                     ; 87 INTERRUPT_HANDLER(AWU_IRQHandler,4)
 146                     ; 88 {
 147                     .text:	section	.text,new
 148  0000               f_AWU_IRQHandler:
 152                     ; 92 }
 155  0000 80            	iret	
 177                     ; 99 INTERRUPT_HANDLER(EXTIB_IRQHandler, 6)
 177                     ; 100 {
 178                     .text:	section	.text,new
 179  0000               f_EXTIB_IRQHandler:
 183                     ; 104 }
 186  0000 80            	iret	
 208                     ; 111 INTERRUPT_HANDLER(EXTID_IRQHandler, 7)
 208                     ; 112 {
 209                     .text:	section	.text,new
 210  0000               f_EXTID_IRQHandler:
 214                     ; 116 }
 217  0000 80            	iret	
 240                     ; 123 INTERRUPT_HANDLER(EXTI0_IRQHandler, 8)
 240                     ; 124 {
 241                     .text:	section	.text,new
 242  0000               f_EXTI0_IRQHandler:
 246                     ; 128   if(!BTN2_STATE)
 248  0000 7200500b04    	btjt	20491,#0,L101
 249                     ; 130     Btn_pressed = 1;
 251  0005 35010000      	mov	_Btn_pressed,#1
 252  0009               L101:
 253                     ; 132   EXTI->SR1 |= 0x01;  //clear interrupt flag
 255  0009 721050a3      	bset	20643,#0
 256                     ; 133 }
 259  000d 80            	iret	
 282                     ; 140 INTERRUPT_HANDLER(EXTI1_IRQHandler, 9)
 282                     ; 141 {
 283                     .text:	section	.text,new
 284  0000               f_EXTI1_IRQHandler:
 288                     ; 145   if(!BTN1_STATE)
 290  0000 7202500b02    	btjt	20491,#1,L311
 291                     ; 147     Btn_pressed = 0;
 293  0005 3f00          	clr	_Btn_pressed
 294  0007               L311:
 295                     ; 149   EXTI->SR1 |= 0x02; //clear interrupt flag
 297  0007 721250a3      	bset	20643,#1
 298                     ; 150 }
 301  000b 80            	iret	
 323                     ; 157 INTERRUPT_HANDLER(EXTI2_IRQHandler, 10)
 323                     ; 158 {
 324                     .text:	section	.text,new
 325  0000               f_EXTI2_IRQHandler:
 329                     ; 162 }
 332  0000 80            	iret	
 354                     ; 169 INTERRUPT_HANDLER(EXTI3_IRQHandler, 11)
 354                     ; 170 {
 355                     .text:	section	.text,new
 356  0000               f_EXTI3_IRQHandler:
 360                     ; 174 }
 363  0000 80            	iret	
 385                     ; 181 INTERRUPT_HANDLER(EXTI4_IRQHandler, 12)
 385                     ; 182 {
 386                     .text:	section	.text,new
 387  0000               f_EXTI4_IRQHandler:
 391                     ; 186 }
 394  0000 80            	iret	
 416                     ; 193 INTERRUPT_HANDLER(EXTI5_IRQHandler, 13)
 416                     ; 194 {
 417                     .text:	section	.text,new
 418  0000               f_EXTI5_IRQHandler:
 422                     ; 198 }
 425  0000 80            	iret	
 447                     ; 205 INTERRUPT_HANDLER(EXTI6_IRQHandler, 14)
 447                     ; 206 
 447                     ; 207 {
 448                     .text:	section	.text,new
 449  0000               f_EXTI6_IRQHandler:
 453                     ; 211 }
 456  0000 80            	iret	
 478                     ; 218 INTERRUPT_HANDLER(EXTI7_IRQHandler, 15)
 478                     ; 219 {
 479                     .text:	section	.text,new
 480  0000               f_EXTI7_IRQHandler:
 484                     ; 223 }
 487  0000 80            	iret	
 509                     ; 230 INTERRUPT_HANDLER(COMP_IRQHandler, 18)
 509                     ; 231 {
 510                     .text:	section	.text,new
 511  0000               f_COMP_IRQHandler:
 515                     ; 235 }
 518  0000 80            	iret	
 541                     ; 242 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_IRQHandler, 19)
 541                     ; 243 {
 542                     .text:	section	.text,new
 543  0000               f_TIM2_UPD_OVF_TRG_BRK_IRQHandler:
 547                     ; 248 }
 550  0000 80            	iret	
 573                     ; 255 INTERRUPT_HANDLER(TIM2_CAP_IRQHandler, 20)
 573                     ; 256 {
 574                     .text:	section	.text,new
 575  0000               f_TIM2_CAP_IRQHandler:
 579                     ; 260 }
 582  0000 80            	iret	
 605                     ; 268 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_IRQHandler, 21)
 605                     ; 269 {
 606                     .text:	section	.text,new
 607  0000               f_TIM3_UPD_OVF_TRG_BRK_IRQHandler:
 611                     ; 273 }
 614  0000 80            	iret	
 637                     ; 279 INTERRUPT_HANDLER(TIM3_CAP_IRQHandler, 22)
 637                     ; 280 {
 638                     .text:	section	.text,new
 639  0000               f_TIM3_CAP_IRQHandler:
 643                     ; 284 }
 646  0000 80            	iret	
 669                     ; 290 INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 25)
 669                     ; 291 {
 670                     .text:	section	.text,new
 671  0000               f_TIM4_UPD_OVF_IRQHandler:
 675                     ; 295 }
 678  0000 80            	iret	
 700                     ; 302 INTERRUPT_HANDLER(SPI_IRQHandler, 26)
 700                     ; 303 {
 701                     .text:	section	.text,new
 702  0000               f_SPI_IRQHandler:
 706                     ; 307 }
 709  0000 80            	iret	
 732                     ; 313 INTERRUPT_HANDLER(USART_TX_IRQHandler, 27)
 732                     ; 314 {
 733                     .text:	section	.text,new
 734  0000               f_USART_TX_IRQHandler:
 738                     ; 318 }
 741  0000 80            	iret	
 764                     ; 325 INTERRUPT_HANDLER(USART_RX_IRQHandler, 28)
 764                     ; 326 {
 765                     .text:	section	.text,new
 766  0000               f_USART_RX_IRQHandler:
 770                     ; 330 }
 773  0000 80            	iret	
 795                     ; 338 INTERRUPT_HANDLER(I2C_IRQHandler, 29)
 795                     ; 339 {
 796                     .text:	section	.text,new
 797  0000               f_I2C_IRQHandler:
 801                     ; 343 }
 804  0000 80            	iret	
 827                     	xdef	_Btn_pressed
 828                     	xdef	f_I2C_IRQHandler
 829                     	xdef	f_USART_RX_IRQHandler
 830                     	xdef	f_USART_TX_IRQHandler
 831                     	xdef	f_SPI_IRQHandler
 832                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 833                     	xdef	f_TIM3_CAP_IRQHandler
 834                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_IRQHandler
 835                     	xdef	f_TIM2_CAP_IRQHandler
 836                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_IRQHandler
 837                     	xdef	f_COMP_IRQHandler
 838                     	xdef	f_EXTI7_IRQHandler
 839                     	xdef	f_EXTI6_IRQHandler
 840                     	xdef	f_EXTI5_IRQHandler
 841                     	xdef	f_EXTI4_IRQHandler
 842                     	xdef	f_EXTI3_IRQHandler
 843                     	xdef	f_EXTI2_IRQHandler
 844                     	xdef	f_EXTI1_IRQHandler
 845                     	xdef	f_EXTI0_IRQHandler
 846                     	xdef	f_EXTID_IRQHandler
 847                     	xdef	f_EXTIB_IRQHandler
 848                     	xdef	f_AWU_IRQHandler
 849                     	xdef	f_FLASH_IRQHandler
 850                     	xdef	f_TRAP_IRQHandler
 851                     	xdef	f_NonHandledInterrupt
 870                     	end

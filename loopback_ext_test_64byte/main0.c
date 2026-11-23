/*******************************************************************************
* DISCLAIMER
* This software is supplied by Renesas Electronics Corporation and is only
* intended for use with Renesas products. No other uses are authorized. This
* software is owned by Renesas Electronics Corporation and is protected under
* all applicable laws, including copyright laws.
* THIS SOFTWARE IS PROVIDED "AS IS" AND RENESAS MAKES NO WARRANTIES REGARDING
* THIS SOFTWARE, WHETHER EXPRESS, IMPLIED OR STATUTORY, INCLUDING BUT NOT
* LIMITED TO WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE
* AND NON-INFRINGEMENT. ALL SUCH WARRANTIES ARE EXPRESSLY DISCLAIMED.
* TO THE MAXIMUM EXTENT PERMITTED NOT PROHIBITED BY LAW, NEITHER RENESAS
* ELECTRONICS CORPORATION NOR ANY OF ITS AFFILIATED COMPANIES SHALL BE LIABLE
* FOR ANY DIRECT, INDIRECT, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES FOR
* ANY REASON RELATED TO THIS SOFTWARE, EVEN IF RENESAS OR ITS AFFILIATES HAVE
* BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
* Renesas reserves the right, without notice, to make changes to this software
* and to discontinue the availability of this software. By using this software,
* you agree to the additional terms and conditions found by accessing the
* following link:
* http://www.renesas.com/disclaimer
*
* Copyright (C) 2022 Renesas Electronics Corporation. All rights reserved.
*******************************************************************************/
/******************************************************************************
* File Name	    : main0.c
* Version	    : 1.10
* Device(s) 	: RH850/U2A
* Description	: This is the main tutorial code.
******************************************************************************/
/*******************************************************************************
* History : DD.MM.YYYY Version Description
* : 31.10.2020 	1.00 	First Release
* : 30.06.2022 	1.10 	Modified for RH850/U2A6
******************************************************************************/

/******************************************************************************
header include
******************************************************************************/
#include "base_macrodef.h"			// Basic macro definitions
#include "r_rh850_can_drv.h"
#include "r_rh850_can_sfr.h"
#include "iodefine.h"

/*******************************************************************************
Macro definitions
*******************************************************************************/

/*******************************************************************************
Imported global variables and functions (from other files)
*******************************************************************************/

/*******************************************************************************
Exported global variables and functions (to be accessed by other files)
*******************************************************************************/
/* Functions */
void main_pm0(void);

/**********************************************************************
* Outline      : Main processing
* Header       : 
* Function name: void main(void)
* Description  : Main function base
* Arguments    : none
* Return Value : none
***********************************************************************/
/* Inspect this variable in the RH850 debugger:
 * CAN_RTN_OK (0) = PASS; CAN_RTN_ERROR = RX timeout/data mismatch.
 */
volatile Can_RtnType g_loopback_ext_test_result = CAN_RTN_MODE_WAIT;

void main_pm0(void)
{
	PORT_Init();
	R_CAN_Init();
	g_loopback_ext_test_result = R_CAN_Channel_Specific_TestStart();

	__EI();
	while(1);
}


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
/******************************************************************************* 
* File Name    : r_rh850_can_tx_table.c 
* Version	    : 1.10
* Device(s) 	: RH850/U2A
* Description  : This is include file for CAN configuration.
*******************************************************************************/
/*******************************************************************************
* History : DD.MM.YYYY Version Description
* : 31.10.2020 	1.00 	First Release
* : 30.06.2022 	1.10 	Modified for RH850/U2A6
******************************************************************************/

#include "r_rh850_can_drv.h"
#include "r_rh850_can_cfg.h"

can_frame_t tx_buf_table[1] = {
/*    TMID,THL,TMR,TMI,---,TMPT,TMD, DB0, DB1, DB2, DB3, DB4, DB5, DB6, DB7 , */
    {0x7F0,0x0,0x0,0x0,0x0,0x00,0xF,0x00000006,
    0x12,0x34,0x56,0x78,0x9a,0xbc,0xde,0xf0,
    0x23,0x45,0x67,0x89,0xab,0xcd,0xef,0x01,
    0x34,0x56,0x78,0x9a,0xbc,0xde,0xf0,0x10,
    0x45,0x67,0x89,0xab,0xcd,0xef,0x01,0x23,
    0x56,0x78,0x9a,0xbc,0xde,0xf0,0x12,0x34,
    0x67,0x89,0xab,0xcd,0xef,0x01,0x23,0x45,
    0x78,0x9a,0xbc,0xde,0xf0,0x12,0x34,0x56,
    0x89,0xab,0xcd,0xef,0x01,0x23,0x45,0x67
    } /* p=01 */
};

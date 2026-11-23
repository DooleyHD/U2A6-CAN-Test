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
* File Name    : r_rh850_can_drv2.c 
* Version	    : 1.10
* Device(s) 	: RH850/U2A
* Description  : This is source file for CAN driver code.
*******************************************************************************/
/*******************************************************************************
* History : DD.MM.YYYY Version Description
* : 31.10.2020 	1.00 	First Release
* : 30.06.2022 	1.10 	Modified for RH850/U2A6
******************************************************************************/
/*****************************************************************************
 Includes   <System Includes> , "Project Includes"
 *****************************************************************************/
#include "r_rh850_can_drv.h"
#include "r_rh850_can_sfr.h"
#include "r_rh850_can_tx_table.h"

//extern can_frame_t tx_buf_table[];

can_frame_t rx_data[1];

/****************************************************************************** 
* Function Name: R_CAN_Channel_Specific_TestStart
* Description  : Start global operation
* Arguments    : none 
* Return Value : CAN_RTN_OK -
*                    normal completion
*                CAN_RTN_MODE_WAIT -
*                    wait to change global mode
******************************************************************************/
Can_RtnType R_CAN_Channel_Specific_TestStart(void)
{
    uint8_t i;
    uint8_t ix;
    uint8_t ng_flg = 0;
    volatile can_ch_sfr1_t * ptr;

    /* ==== switch to global operation mode from global reset mode ==== */
    if ((RSCFDnCFDGSTS & CAN_GLB_RST_STS_BIT_ON) != 0U)
    {
        RSCFDnCFDGCTR = (RSCFDnCFDGCTR & (uint32_t)~CAN_GLB_MODE_BITS_ON) | CAN_GLB_OPERATION_MODE;
        while ((RSCFDnCFDGSTS & CAN_GLB_RST_STS_BIT_ON) == 1U);
    }

    /* === switch to channel halt mode === */
    ptr = (volatile can_ch_sfr1_t *)&RSCFDnCFDCmNCFG(0);
    /* Must be in Channel Halt before modifying CTMS/CTME (R01AN4894). */
    if ((ptr->CFDCmSTS & CAN_HLT_STS_BIT_ON) == 0U)
    {
        ptr->CFDCmCTR = (ptr->CFDCmCTR & (uint32_t)~CAN_MODE_BITS_ON) | CAN_MODE_CH_HALT_MODE;
        while ((ptr->CFDCmSTS & CAN_HLT_STS_BIT_ON) == 0U);
    }

    /* CTMS[1:0]=10: Self-Test Mode 0 (External Loopback)
       CTME=1, CHMDC[1:0]=10: Channel Halt, value 0x05000002.
       In contrast, 0x07000002 would select internal Mode 1. */
    ptr->CFDCmCTR =
        (ptr->CFDCmCTR & (uint32_t)~(CAN_CTMS_BITS_ON | CAN_SDTST_BIT_ON | CAN_MODE_BITS_ON)) |
        0x05000002UL;

    /* ---- switch to channel operation mode ---- */
    ptr = (volatile can_ch_sfr1_t *)&RSCFDnCFDCmNCFG(0);
    if ((ptr->CFDCmSTS & CAN_HLT_STS_BIT_ON) != 0U)
    {
        ptr->CFDCmCTR = (ptr->CFDCmCTR & (uint32_t)~CAN_MODE_BITS_ON) | CAN_MODE_CH_COMM_MODE;
        while ((ptr->CFDCmSTS & CAN_HLT_STS_BIT_ON) != 0U);
    }

    R_CAN_TrmByTxBuf(0,(uint8_t) CAN_TX_BUFFER_0, &tx_buf_table[0]);

    /* Bound the sample's receive wait to prevent an infinite hang if
       CAN0 TXD/RXD or the external transceiver is disconnected.
       This is an iteration budget, NOT a calibrated millisecond timeout. */
    {
        volatile uint32_t rx_wait_budget = 10000000UL;
        while ((RSCFDnCFDRMNDy(0) & 0x01U) == 0U && rx_wait_budget != 0U)
        {
            --rx_wait_budget;
        }
        if (rx_wait_budget == 0U)
        {
            ng_flg = 1U;
        }
    }

    if (ng_flg == 0U)
    {
        if (R_CAN_ReadRxBuffer(&ix, &rx_data[0]) != CAN_RTN_OK)
        {
            ng_flg = 1U;
        }
        else
        {
            /* Original code compared only 63 of the 64 CAN FD payload bytes. */
            for (i = 0U; i < 64U; ++i)
            {
                if (rx_data[0].DB[i] != tx_buf_table[0].DB[i])
                {
                    ng_flg = 1U;
                }
            }
        }
    }

    /* ---- switch to channel halt mode ---- */
    ptr = (volatile can_ch_sfr1_t *)&RSCFDnCFDCmNCFG(0);
    if ((ptr->CFDCmSTS & CAN_HLT_STS_BIT_ON) == 0U)
    {
        ptr->CFDCmCTR = (ptr->CFDCmCTR & (uint32_t)~CAN_MODE_BITS_ON) | CAN_MODE_CH_HALT_MODE;
        while ((ptr->CFDCmSTS & CAN_HLT_STS_BIT_ON) == 0U);
    }
    /* Disable Test Mode while Channel Halt is confirmed. */
    ptr->CFDCmCTR &= (uint32_t)~(CAN_CTMS_BITS_ON | CAN_SDTST_BIT_ON);

    if(ng_flg)
    {
        return CAN_RTN_ERROR;
    }
    else
    {
        return CAN_RTN_OK;
    }
}

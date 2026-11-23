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
* File Name	    : r_rh850_can_cfg.c
* Version	    : 1.10
* Device(s) 	: RH850/U2A
* Description  : This is source file for CAN driver code.
******************************************************************************/
/*******************************************************************************
* History : DD.MM.YYYY Version Description
* : 31.10.2020 	1.00 	First Release
* : 30.06.2022 	1.10 	Modified for RH850/U2A6
******************************************************************************/
#include "r_rh850_can_drv.h"
#include "r_rh850_can_sfr.h"

#if CAN_RX_RULE_NUM > 0
const uint32_t g_rxrule_table[CAN_RX_RULE_NUM][4] = {
    /* CAN0 */
    { 0x000007F0UL, 0xC00007FFUL, 0xB1238000UL, 0x00000000UL }
};
#endif

const uint8_t  g_rxfifo_use_table[CAN_MAX_RXFIFO_NUM] = {
    CAN_NOUSE, CAN_NOUSE, CAN_NOUSE, CAN_NOUSE,
    CAN_NOUSE, CAN_NOUSE, CAN_NOUSE, CAN_NOUSE
};

/* Setting value: (CAN_USE | Channel Number) or (CAN_NOUSE) */
const uint8_t  g_ch_use_table[MAX_CH_NUM] = {
    CAN_USE | 0x00, CAN_NOUSE
};

#if USE_CH_NUM > 0
const uint8_t  g_trfifo_use_table[USE_CH_NUM][CAN_MAX_TRFIFO_NUM] = {
	{ CAN_NOUSE,       CAN_NOUSE,       CAN_NOUSE       }
};

const uint8_t  g_txqueue_use_table[USE_CH_NUM] = {
    CAN_NOUSE
};

const can_ch_cfg_t  g_can_ch_cfg[USE_CH_NUM] = {
    {
        /* ---- Control setting ---- */
        CAN_CFG_FUNC(CAN_DISABLE,                          // BUS_ERR_IRQ_EN                 (CAN_ENABLE, CAN_DISABLE)
                     CAN_DISABLE,                          // ERR_WARNING_IRQ_EN             (CAN_ENABLE, CAN_DISABLE)
                     CAN_DISABLE,                          // ERR_PASSIVE_IRQ_EN             (CAN_ENABLE, CAN_DISABLE)
                     CAN_DISABLE,                          // BUS_OFF_START_IRQ_EN           (CAN_ENABLE, CAN_DISABLE)
                     CAN_DISABLE,                          // BUS_OFF_RETURN_IRQ_EN          (CAN_ENABLE, CAN_DISABLE)
                     CAN_DISABLE,                          // OVL_FRAME_TX_IRQ_EN            (CAN_ENABLE, CAN_DISABLE)
                     CAN_DISABLE,                          // BUS_LOCK_IRQ_EN                (CAN_ENABLE, CAN_DISABLE)
                     CAN_DISABLE,                          // ARBITRATION_LOST_IRQ_EN        (CAN_ENABLE, CAN_DISABLE)
                     CAN_DISABLE,                          // TX_ABORT_IRQ_EN                (CAN_ENABLE, CAN_DISABLE)
                     CAN_DISABLE,                          // ERR_CNT_OV_IRQ_EN              (CAN_ENABLE, CAN_DISABLE)
                     CAN_DISABLE,                          // COMM_SUCCESS_CNT_OV_IRQ_EN     (CAN_ENABLE, CAN_DISABLE)
                     CAN_DISABLE,                          // TX_DELAY_CORRECT_VIOLATE_IRQ_EN(CAN_ENABLE, CAN_DISABLE)
                     CAN_BOFF_RECOVERY_ISO11898,           // BUS_OFF_RETURN_MODE            (CAN_BOFF_RECOVERY_ISO11898, CAN_BOFF_RECOVERY_START_ENTRY, CAN_BOFF_RECOVERY_END_ENTRY, CAN_BOFF_RECOVERY_MANUAL_ENTRY)
                     CAN_ERRDISP_FIRST_ERR_ONLY),          // ERROR_DISP_MODE                (CAN_ERRDISP_FIRST_ERR_ONLY, CAN_ERRDISP_ALL_ERR)
        /* ---- Normal Baudrate ---- */
    	CAN_CFG_N_BAUDRATE(3U, CAN_NTSEG1_15TQ, CAN_NTSEG2_4TQ,  CAN_NSJW_4TQ),		// 1Mbps(BRP:4/Tq:20(1-15-4)/SP:80%)
//    	CAN_CFG_N_BAUDRATE(3U, CAN_NTSEG1_13TQ, CAN_NTSEG2_6TQ,  CAN_NSJW_6TQ),		// 1Mbps(BRP:4/Tq:20(1-13-6)/SP:70%)
//    	CAN_CFG_N_BAUDRATE(1U, CAN_NTSEG1_31TQ, CAN_NTSEG2_8TQ,  CAN_NSJW_8TQ),		// 1Mbps(BRP:2/Tq:40(1-31-8)/SP:80%)
//    	CAN_CFG_N_BAUDRATE(1U, CAN_NTSEG1_27TQ, CAN_NTSEG2_12TQ, CAN_NSJW_12TQ),	// 1Mbps(BRP:2/Tq:40(1-27-12)/SP:70%)
    	/* ---- Data Baudrate ---- */
    	CAN_CFG_D_BAUDRATE(0U, CAN_DTSEG1_15TQ, CAN_DTSEG2_4TQ,  CAN_DSJW_4TQ),		// 4Mbps(BRP:1/Tq:20(1-15-4)/SP:80%)
//    	CAN_CFG_D_BAUDRATE(0U, CAN_DTSEG1_13TQ, CAN_DTSEG2_6TQ,  CAN_DSJW_6TQ),		// 4Mbps(BRP:1/Tq:20(1-13-6)/SP:70%)
//    	CAN_CFG_D_BAUDRATE(1U, CAN_DTSEG1_7TQ,  CAN_DTSEG2_2TQ,  CAN_DSJW_2TQ),		// 4Mbps(BRP:2/Tq:10(1-7-2)/SP:80%)
//    	CAN_CFG_D_BAUDRATE(1U, CAN_DTSEG1_6TQ,  CAN_DTSEG2_3TQ,  CAN_DSJW_3TQ),		// 4Mbps(BRP:2/Tq:10(1-8-3)/SP:70%)
//    	/* ---- CANFD Ch Config ---- */
        CAN_CFG_FDCFG(CAN_DISABLE,                         // CLASSICAL_ONLY_MODE_EN (CAN_ENABLE, CAN_DISABLE)
                      CAN_DISABLE,                         // RX_EDGE_FILTER_EN      (CAN_ENABLE, CAN_DISABLE)
                      CAN_DISABLE,                         // FD_ONLY_MODE           (CAN_ENABLE, CAN_DISABLE)
                      BRS_BIT_CLEAR,                       // GATEWAY_BRS_SET        (BRS_BIT_CLEAR, BRS_BIT_SET)
                      CLASSICAL_FRAME,                     // GATEWAY_FDF_SET        (CLASSICAL_FRAME, CANFD_FRAME)
                      CAN_DISABLE,                         // GATEWAY_CAN2CANFD_EN   (CAN_ENABLE, CAN_DISABLE)
                      0U,                                  // TX_DELAY_CORRECT_OFFSET
                      CH_ERROR_STATE,                      // ERROR_STATE_DISP       (CH_ERROR_STATE, BUFF_ESI_BIT)
                      CAN_DISABLE,                         // TX_DELAY_CORRECT_EN    (CAN_ENABLE, CAN_DISABLE)
                      MEASURE_AND_OFFSET,                  // TX_DELAY_CORRECT_MODE  (MEASURE_AND_OFFSET, OFFSET_ONLY)
                      ALL_TX_RX_MESSAGE),                  // ERROR_COUNT_MODE       (ALL_TX_RX_MESSAGE, ALL_TX_MESSAGE, ALL_RX_MESSAGE,
                                                           //                         ONLY_TX_RX_DATA_PHASE, ONLY_TX_DATA_PHASE, ONLY_RX_DATA_PHASE)
        /* ---- Tx/Rx FIFO buffer ---- */
        0x00000000UL,
        0x00000000UL,
        0x00000000UL,
        /* ---- Tx queue ---- */
        0x00000000UL,
        /* ---- Tx buffer transmission complete interrupt ---- */
        0x0000U
    }
};
#endif /* USE_CH_NUM > 0 */


/*******************************************************************************
  Application Transparent Client Role Source File

  Company:
    Microchip Technology Inc.

  File Name:
    app_trpc.c

  Summary:
    This file contains the Application Transparent Client Role functions for this project.

  Description:
    This file contains the Application Transparent Client Role functions for this project.
    The implementation of demo mode is included in this file.
 *******************************************************************************/

// DOM-IGNORE-BEGIN
/*******************************************************************************
* Copyright (C) 2018 Microchip Technology Inc. and its subsidiaries.
*
* Subject to your compliance with these terms, you may use Microchip software
* and any derivatives exclusively with Microchip products. It is your
* responsibility to comply with third party license terms applicable to your
* use of third party software (including open source software) that may
* accompany Microchip software.
*
* THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
* EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
* WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
* PARTICULAR PURPOSE.
*
* IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
* INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
* WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
* BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
* FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
* ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
* THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
*******************************************************************************/
// DOM-IGNORE-END


// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************
#include <string.h>
#include "app.h"
#include "ble_util/byte_stream.h"
#include "stack_mgr.h"
#include "app_uart.h"
#include "app_trpc.h"
#include "app_timer.h"
#include "app_ble.h"
#include "drv_usart.h"

#include "app_led.h"

#include "app_error_defs.h"
#include "app_log.h"
#include "app_ble_handler.h"

#include "app_sm.h"


// *****************************************************************************
// *****************************************************************************
// Section: Macros
// *****************************************************************************
// *****************************************************************************

#define APP_TRPC_EVENT_NULL             0x00
#define APP_TRPC_EVENT_CHECK_SUM        0x01
#define APP_TRPC_EVENT_TRX_END          0x02
#define APP_TRPC_EVENT_LAST_NUMBER      0x04
#define APP_TRPC_EVENT_RX_LE_DATA       0x08
#define APP_TRPC_EVENT_TX_LE_DATA       0x10

/**@brief Enumeration type of check sum state. */
enum APP_TRPC_CS_STATE_T
{
    TRPC_CS_STATE_NULL = 0x00,      /**< The null state of check sum state machine. */
 	TRPC_CS_STATE_ENABLE_MODE,      /**< The enable mode state of check sum state machine. */
 	TRPC_CS_STATE_SEND_LENGTH,      /**< The send length state of check sum state machine. */
 	TRPC_CS_STATE_SEND_TYPE,        /**< The send type state of check sum state machine. */
 	TRPC_CS_STATE_START_TX,         /**< The start transmit state of check sum state machine. */
 	TRPC_CS_STATE_TX,               /**< The transmit state of check sum state machine. */
 	TRPC_CS_STATE_WAIT_CS,          /**< The wait check sum value state of check sum state machine. */
 	TRPC_CS_STATE_STOP_TX,          /**< The stop transmit state of check sum state machine. */
 	TRPC_CS_STATE_SEND_CS,          /**< The send check sum state of check sum state machine. */
     	
    TRPC_CS_STATE_END               /**< The end state of check sum state machine. */
};

/**@brief Enumeration type of fixed pattern state. */
enum APP_TRPC_FP_STATE_T
{
    TRPC_FP_STATE_NULL = 0x00,          /**< The null state of fixed pattern state machine. */
    TRPC_FP_STATE_ENABLE_MODE,          /**< The enable mode state of fixed pattern state machine. */
    TRPC_FP_STATE_SEND_TYPE,            /**< The send type state of fixed pattern state machine. */
    TRPC_FP_STATE_RX,                   /**< The recieved state of fixed pattern state machine. */
    // TRPC_FP_STATE_WAIT_STOP_RX,         /**< The wait stop state of fixed pattern state machine. */
    TRPC_FP_STATE_WAIT_LAST_NUMBER,     /**< The wait last unmber state of fixed pattern state machine. */
    TRPC_FP_STATE_SEND_LAST_NUMBER,     /**< The send last unmber state of fixed pattern state machine. */
     	
    TRPC_FP_STATE_END               /**< The end state of fixed pattern state machine. */
};

/**@brief Enumeration type of loopback state. */
enum APP_TRPC_LB_STATE_T
{
    TRPC_LB_STATE_NULL = 0x00,      /**< The null state of loopback state machine. */
    TRPC_LB_STATE_ENABLE_MODE,      /**< The enable mode state of loopback state machine. */
    TRPC_LB_STATE_SEND_TYPE,        /**< The send type state of loopback state machine. */
 	TRPC_LB_STATE_START_TX,         /**< The start Tx state of loopback state machine. */
 	TRPC_LB_STATE_TRX,              /**< The TRx state of loopback state machine. */
 	TRPC_LB_STATE_WAIT_STOP_TX,     /**< The wait stop state of loopback state machine. */
 	TRPC_LB_STATE_SEND_STOP_TX,     /**< The send stop state of loopback state machine. */
     	
    TRPC_LB_STATE_END               /**< The end state of loopback state machine. */
};

/**@brief Enumeration type of UART state. */
enum APP_TRPC_UART_STATE_T
{
    TRPC_UART_STATE_NULL = 0x00,        /**< The null state of UART state machine. */
	TRPC_UART_STATE_ENABLE_MODE,        /**< The enable mode state of UART state machine. */
    TRPC_UART_STATE_SEND_TYPE,          /**< The send type state of UART state machine. */
 	TRPC_UART_STATE_RELAY_DATA,         /**< The relay state of UART state machine. */
 	TRPC_UART_STATE_DISABLE_MODE,       /**< The disable mode state of UART state machine. */
     	
    TRPC_UART_STATE_END               /**< The end state of UART state machine. */
};

/**@brief Enumeration type of reverse loopback state. */
enum APP_TRPC_REV_LB_STATE_T
{
    TRPC_REV_LB_STATE_NULL = 0x00,      /**< The null state of reverse loopback state machine. */
    TRPC_REV_LB_STATE_ENABLE_MODE,      /**< The enable mode state of reverse loopback state machine. */
    TRPC_REV_LB_STATE_SEND_TYPE,        /**< The send type state of reverse loopback state machine. */
 	TRPC_REV_LB_STATE_START_TX,         /**< The start Tx state of reverse loopback state machine. */
 	TRPC_REV_LB_STATE_TRX,              /**< The TRx state of reverse loopback state machine. */
 	TRPC_REV_LB_STATE_SEND_STOP_TX,     /**< The send stop state of reverse loopback state machine. */
     	
    TRPC_REV_LB_STATE_END               /**< The end state of loopback state machine. */
};

// *****************************************************************************
// *****************************************************************************
// Section: Local Variables
// *****************************************************************************
// *****************************************************************************
static APP_TRP_ConnList_T       s_trpcConnList_t[APP_TRPC_MAX_LINK_NUMBER];
static APP_TRP_ConnList_T       *sp_trpcCurrentLink = NULL;
static APP_TRP_GenData_T        s_trpcRxUartData_t;

// *****************************************************************************
// *****************************************************************************
// Section: Global Variables
// *****************************************************************************
// *****************************************************************************


// *****************************************************************************
// *****************************************************************************
// Section: Functions
// *****************************************************************************
// *****************************************************************************
static void APP_TRPC_WmodeStateMachine(APP_TRP_ConnList_T *p_connList_t);

static void APP_TRPC_FlushRxDataInAllQueue(APP_TRP_ConnList_T *p_connList_t)
{
    uint16_t status = APP_RES_SUCCESS, dataLeng = 0;
    uint8_t *p_data = NULL;

    APP_TRP_COMMON_DelAllLeCircData(&p_connList_t->leCircQueue_t);
    status = APP_TRP_COMMON_GetTrpDataLength(p_connList_t, &dataLeng);
    while (dataLeng)
    {
        p_data = OSAL_Malloc(dataLeng);
        
        if (p_data != NULL)
        {
            APP_TRP_COMMON_GetTrpData(p_connList_t, p_data);
            OSAL_Free(p_data);
            p_data = NULL;
            dataLeng = 0;
        }

        status = APP_TRP_COMMON_GetTrpDataLength(p_connList_t, &dataLeng);
        if (status != APP_RES_SUCCESS)
            dataLeng = 0;
    }
}

static APP_TRP_ConnList_T *APP_TRPC_GetConnListByIndex(uint8_t index)
{
    if (index < APP_TRPC_MAX_LINK_NUMBER)
    {
        if (s_trpcConnList_t[index].connHandle != 0)
            return &s_trpcConnList_t[index];
    }
    
    return NULL;
}

APP_TRP_ConnList_T *APP_TRPC_GetConnListByConnHandle(uint16_t connHandle)
{
    uint8_t index;

    for (index = 0; index < APP_TRPC_MAX_LINK_NUMBER; index++)
    {
        if (s_trpcConnList_t[index].connHandle == connHandle)
        {
            return &s_trpcConnList_t[index];
        }
    }

    return NULL;
}

static APP_TRP_ConnList_T *APP_TRPC_GetSamllestHandleConnList(void)
{
    uint8_t i, idx = 0;
    uint16_t small = 0xFFFF;

    for (i = 0; i < APP_TRPC_MAX_LINK_NUMBER; i++)
    {
        if ((s_trpcConnList_t[i].connHandle != 0) && (s_trpcConnList_t[i].connHandle < small))
        {
            idx = i;
            small = s_trpcConnList_t[i].connHandle;
        }
    }

    if (small != 0xFFFF)
    {
        return &s_trpcConnList_t[idx];
    }
    else
    {
        return NULL;
    }
    
}

static void APP_TRPC_Update1stConnParameter(void)
{
    APP_BLE_ConnList_T *p_bleConn = NULL;
    APP_TRP_ConnList_T *p_trpcConnLink = NULL;
    BLE_DM_ConnParamUpdate_T params;
    uint8_t connLinkNum = APP_GetConnLinkNum();

    //find the first connected device
    p_trpcConnLink = APP_TRPC_GetSamllestHandleConnList();
    if (p_trpcConnLink != NULL)
    {
        p_bleConn = APP_GetConnInfoByConnHandle(p_trpcConnLink->connHandle);
        if ((connLinkNum > 1) && (p_bleConn->connData.connInterval != 0x18))
        {
            params.intervalMax = 0x18;  //30ms
            params.intervalMin = 0x18;  //30ms
            params.latency = 0;
            params.timeout = 0x6C;      //1080ms
        }

        BLE_DM_ConnectionParameterUpdate(p_trpcConnLink->connHandle, &params);
    }    
}

static uint16_t APP_TRPC_RevLoopbackStateMachine(uint8_t event, APP_TRP_ConnList_T *p_connList_t)
{
    uint16_t result = APP_RES_SUCCESS;
    
    switch(p_connList_t->trpState)
    {
        case TRPC_REV_LB_STATE_ENABLE_MODE:
        {
            result = APP_TRP_COMMON_SendTypeCommand(p_connList_t);
            
            if (result == APP_RES_SUCCESS)
                p_connList_t->trpState = TRPC_REV_LB_STATE_SEND_TYPE;
            
            APP_TIMER_SetTimerWraper(APP_TRP_TMR_ID_INST_MERGE(APP_TIMER_PROTOCOL_RSP, 0), 
                (void *)p_connList_t, APP_TIMER_3S, false, &(p_connList_t->protocolRspTmr));
        }
        break;

        case TRPC_REV_LB_STATE_SEND_TYPE:
        {
            result = APP_TRP_COMMON_SendModeCommand(p_connList_t, TRP_GRPID_TRANSMIT, APP_TRP_WMODE_TX_DATA_START);
            
            if (result == APP_RES_SUCCESS)
                p_connList_t->trpState = TRPC_REV_LB_STATE_START_TX;
        }
        break;
        
        case TRPC_REV_LB_STATE_START_TX:
        {
            p_connList_t->trpState = TRPC_REV_LB_STATE_TRX;
            p_connList_t->workModeEn = true;
            result = APP_TIMER_StopTimer(&(p_connList_t->protocolRspTmr.tmrHandle));
            if (result != APP_RES_SUCCESS)
            {
                APP_LOG_ERROR("APP_TIMER_PROTOCOL_RSP stop error ! result=%d\n", result);
            }
        }
        break;

        case TRPC_REV_LB_STATE_TRX:
        {
            if ((event & APP_TRPC_EVENT_RX_LE_DATA) || (event & APP_TRPC_EVENT_TX_LE_DATA))
            {
                result = APP_TRP_COMMON_SendMultiLinkLeDataTrpProfile(&g_trpcTrafficPriority_t, p_connList_t);
            }
        }
        break;

        case TRPC_REV_LB_STATE_SEND_STOP_TX:
        {
            p_connList_t->trpState = TRPC_LB_STATE_NULL;
            result = APP_TIMER_StopTimer(&(p_connList_t->protocolRspTmr.tmrHandle));
            if (result != APP_RES_SUCCESS)
            {
                APP_LOG_ERROR("APP_TIMER_PROTOCOL_RSP stop error ! result=%d\n", result);
            }

//Keep enabling reverse loopback
#ifndef APP_ENABLE_AFH_TEST
            p_connList_t->workMode = TRP_WMODE_NULL;
            APP_TRPC_WmodeStateMachine(p_connList_t);
#endif
        }
        break;

        default:
        {
            result = APP_RES_INVALID_PARA;
        }
        break;
    }

    return result;
}

static void APP_TRPC_UartStateMachine(uint8_t event, APP_TRP_ConnList_T *p_connList_t)
{
    uint16_t result = APP_RES_FAIL;
    
    switch(p_connList_t->trpState)
    {
        case TRPC_UART_STATE_NULL:
        {
            p_connList_t->trpState = TRPC_UART_STATE_ENABLE_MODE;
            APP_TRP_COMMON_SendModeCommand(p_connList_t, TRP_GRPID_UART, APP_TRP_WMODE_UART_ENABLE);
            APP_TIMER_SetTimerWraper(APP_TRP_TMR_ID_INST_MERGE(APP_TIMER_PROTOCOL_RSP, 0), (void *)p_connList_t, 
                APP_TIMER_3S, false, &(p_connList_t->protocolRspTmr));
        }
        break;

        case TRPC_UART_STATE_ENABLE_MODE:
        {
            p_connList_t->trpState = TRPC_UART_STATE_SEND_TYPE;
            APP_TRP_COMMON_SendTypeCommand(p_connList_t);
            APP_TIMER_SetTimerWraper(APP_TRP_TMR_ID_INST_MERGE(APP_TIMER_PROTOCOL_RSP, 0), (void *)p_connList_t, 
                APP_TIMER_3S, false, &(p_connList_t->protocolRspTmr));
        }
        break;

        case TRPC_UART_STATE_SEND_TYPE:
        {
            p_connList_t->trpState = TRPC_UART_STATE_RELAY_DATA;
            p_connList_t->workModeEn = true;
            trpLeRxCount = 0;
            trpLeTxCount = 0;
            trpUartRxCount = 0;
            trpUartTxCount = 0;
            result = APP_TIMER_StopTimer(&(p_connList_t->protocolRspTmr.tmrHandle));
            if (result != APP_RES_SUCCESS)
            {
                APP_LOG_ERROR("APP_TIMER_PROTOCOL_RSP stop error ! result=%d\n", result);
            }
        }
        break;

        case TRPC_UART_STATE_RELAY_DATA:
        {
            if (event & APP_TRPC_EVENT_RX_LE_DATA) // Send Le data to UART
                APP_TRP_COMMON_SendTrpProfileDataToUART(p_connList_t);
            
            if (event & APP_TRPC_EVENT_TX_LE_DATA) // Send UART data to Le
            {
                if (p_connList_t->uartCircQueue_t.usedNum > 0)
                {
                    APP_TRP_COMMON_SendLeDataUartCircQueue(p_connList_t);
                }
            }
            
            if (event & APP_TRPC_EVENT_TRX_END)
                p_connList_t->trpState = TRPC_UART_STATE_DISABLE_MODE;
        }
        break;

        case TRPC_UART_STATE_DISABLE_MODE:
        {
            g_enableUartMode &= ~APP_TRP_CLIENT_UART;
        }
        break;
        
        default:
            break;
    }
}

static void APP_TRPC_LoopbackRxDataCheck(APP_TRP_ConnList_T *p_connList_t)
{
    uint16_t result = APP_RES_FAIL;
    
    result = APP_TRP_COMMON_CheckFixPatternData(p_connList_t);
    if (result != APP_RES_SUCCESS)
    {
        APP_LOG_ERROR("Loopback content error !\n");
        result = APP_TRP_COMMON_SendErrorRsp(p_connList_t, TRP_GRPID_LOOPBACK);
        if (result == APP_RES_SUCCESS)
        {
            p_connList_t->trpState = TRPC_LB_STATE_SEND_STOP_TX;
            APP_TRP_COMMON_SendModeCommand(p_connList_t, TRP_GRPID_TRANSMIT, APP_TRP_WMODE_TX_DATA_END);
        }
        else
        {
            p_connList_t->trpState = TRPC_LB_STATE_WAIT_STOP_TX;
            p_connList_t->workModeEn = false;
        }
    }
    else if (p_connList_t->rxLastNunber == p_connList_t->lastNumber)
    {
        p_connList_t->trpState = TRPC_LB_STATE_WAIT_STOP_TX;
        p_connList_t->workModeEn = false;
        APP_LOG_INFO("Loopback is successful !\n");
    }
}

static void APP_TRPC_LoopbackStateMachine(uint8_t event, APP_TRP_ConnList_T *p_connList_t)
{
    uint16_t result = APP_RES_FAIL;
    
    switch(p_connList_t->trpState)
    {
        case TRPC_LB_STATE_NULL:
        {
            p_connList_t->trpState = TRPC_LB_STATE_ENABLE_MODE;
            APP_TRP_COMMON_SendModeCommand(p_connList_t, TRP_GRPID_LOOPBACK, APP_TRP_WMODE_LOOPBACK_ENABLE);
            APP_TIMER_SetTimerWraper(APP_TRP_TMR_ID_INST_MERGE(APP_TIMER_PROTOCOL_RSP, 0), 
                (void *)p_connList_t, APP_TIMER_3S, false, &(p_connList_t->protocolRspTmr));
        }
        break;
        
        case TRPC_LB_STATE_ENABLE_MODE:
        {
            p_connList_t->trpState = TRPC_LB_STATE_SEND_TYPE;
            APP_TRP_COMMON_SendTypeCommand(p_connList_t);
        }
        break;

        case TRPC_LB_STATE_SEND_TYPE:
        {
            p_connList_t->trpState = TRPC_LB_STATE_START_TX;
            APP_TRP_COMMON_SendModeCommand(p_connList_t, TRP_GRPID_TRANSMIT, APP_TRP_WMODE_TX_DATA_START);
        }
        break;
        
        case TRPC_LB_STATE_START_TX:
        {
            p_connList_t->trpState = TRPC_LB_STATE_TRX;
            p_connList_t->workModeEn = true;
            result = APP_TIMER_StopTimer(&(p_connList_t->protocolRspTmr.tmrHandle));
            if (result != APP_RES_SUCCESS)
            {
                APP_LOG_ERROR("APP_TIMER_PROTOCOL_RSP stop error ! result=%d\n", result);
            }
        }
        break;

        case TRPC_LB_STATE_TRX:
        {
            if (event & APP_TRPC_EVENT_RX_LE_DATA) // Send Le data to UART
                APP_TRP_COMMON_SendTrpProfileDataToUART(p_connList_t);
            
            if (event & APP_TRPC_EVENT_TX_LE_DATA) // Send UART data to Le
            {
                if (p_connList_t->uartCircQueue_t.usedNum > 0)
                {
                    APP_TRP_COMMON_SendLeDataUartCircQueue(p_connList_t);
                }
            }
        }
        break;
        
        case TRPC_LB_STATE_WAIT_STOP_TX:
        {
            if (event & APP_TRPC_EVENT_RX_LE_DATA)
            {
                APP_TRPC_LoopbackRxDataCheck(p_connList_t);
            }
            
            if (p_connList_t->workModeEn == false)
            {
                p_connList_t->trpState = TRPC_LB_STATE_SEND_STOP_TX;
                APP_TRP_COMMON_SendModeCommand(p_connList_t, TRP_GRPID_TRANSMIT, APP_TRP_WMODE_TX_DATA_END);
            }
        }
        break;

        case TRPC_LB_STATE_SEND_STOP_TX:
        {
            p_connList_t->trpState = TRPC_LB_STATE_NULL;
            result = APP_TIMER_StopTimer(&(p_connList_t->protocolRspTmr.tmrHandle));
            if (result != APP_RES_SUCCESS)
            {
                APP_LOG_ERROR("APP_TIMER_PROTOCOL_RSP stop error ! result=%d\n", result);
            }
            APP_TRPC_WmodeStateMachine(p_connList_t);
        }
        break;

        default:
            break;
    }
}

static void APP_TRPC_FixPatternStateMachine(uint8_t event, APP_TRP_ConnList_T *p_connList_t)
{
    uint16_t result = APP_RES_FAIL;
    
    APP_TIMER_SetTimerWraper(APP_TRP_TMR_ID_INST_MERGE(APP_TIMER_PROTOCOL_RSP, 0), (void *)p_connList_t, 
        APP_TIMER_3S, false, &(p_connList_t->protocolRspTmr));
    switch(p_connList_t->trpState)
    {
        case TRPC_FP_STATE_NULL:
        {
            p_connList_t->trpState = TRPC_FP_STATE_ENABLE_MODE;
            APP_TRP_COMMON_SendModeCommand(p_connList_t, TRP_GRPID_FIX_PATTERN, APP_TRP_WMODE_FIX_PATTERN_ENABLE);
        }
            break;

        case TRPC_FP_STATE_ENABLE_MODE:
        {
            p_connList_t->trpState = TRPC_FP_STATE_SEND_TYPE;
            APP_TRP_COMMON_SendTypeCommand(p_connList_t);
        }
            break;

        case TRPC_FP_STATE_SEND_TYPE:
        {
            p_connList_t->trpState = TRPC_FP_STATE_RX;
            APP_TRP_COMMON_SendModeCommand(p_connList_t, TRP_GRPID_TRANSMIT, APP_TRP_WMODE_TX_DATA_START);
            p_connList_t->workModeEn = true;
            p_connList_t->rxLastNunber = 0;
            p_connList_t->checkSum = 0;
        }
            break;

        case TRPC_FP_STATE_RX:
        {
            if (event & APP_TRPC_EVENT_RX_LE_DATA)
            {
                result = APP_TRP_COMMON_CheckFixPatternData(p_connList_t);
                if (result != APP_RES_SUCCESS)
                {
                    APP_LOG_ERROR("Fix pattern content error !\n");
                    APP_TRP_COMMON_DelAllLeCircData(&(p_connList_t->leCircQueue_t));
                    p_connList_t->trpState = TRPC_FP_STATE_SEND_LAST_NUMBER;
                    p_connList_t->lastNumber = p_connList_t->rxLastNunber;
                    APP_TRP_COMMON_SendLastNumber(p_connList_t);
                    result = APP_TRP_COMMON_SendErrorRsp(p_connList_t, TRP_GRPID_FIX_PATTERN);
                }
            }
            if (event & APP_TRPC_EVENT_TRX_END)
            {
                p_connList_t->trpState = TRPC_FP_STATE_WAIT_LAST_NUMBER;
                (p_connList_t->rxLastNunber)--;
            }
        }
            break;

        case TRPC_FP_STATE_WAIT_LAST_NUMBER:
        {
            if (event & APP_TRPC_EVENT_LAST_NUMBER)
            {
                p_connList_t->trpState = TRPC_FP_STATE_SEND_LAST_NUMBER;
                p_connList_t->lastNumber = p_connList_t->rxLastNunber;
                result = APP_TRP_COMMON_SendLastNumber(p_connList_t);
            }
        }
            break;

        case TRPC_FP_STATE_SEND_LAST_NUMBER:
        {
            p_connList_t->workModeEn = false;
            p_connList_t->trpState = TRPC_FP_STATE_NULL;
            result = APP_TIMER_StopTimer(&(p_connList_t->protocolRspTmr.tmrHandle));
            if (result != APP_RES_SUCCESS)
            {
                APP_LOG_ERROR("APP_TIMER_PROTOCOL_RSP stop error ! result=%d\n", result);
            }
            APP_TRPC_WmodeStateMachine(p_connList_t);
        }
            break;

        default:
            break;
    }

}

static void APP_TRPC_CheckSumStateMachine(uint8_t event, APP_TRP_ConnList_T *p_connList_t)
{
    uint16_t result = APP_RES_FAIL;
    
    APP_TIMER_SetTimerWraper(APP_TRP_TMR_ID_INST_MERGE(APP_TIMER_PROTOCOL_RSP, 0), (void *)p_connList_t, 
        APP_TIMER_3S, false, &(p_connList_t->protocolRspTmr));
    
    switch(p_connList_t->trpState)
    {
        case TRPC_CS_STATE_NULL:
        {
            p_connList_t->trpState = TRPC_CS_STATE_ENABLE_MODE;
            APP_TRP_COMMON_SendModeCommand(p_connList_t, TRP_GRPID_CHECK_SUM, APP_TRP_WMODE_CHECK_SUM_ENABLE);
        }
            break;

        case TRPC_CS_STATE_ENABLE_MODE:
        {
            p_connList_t->trpState = TRPC_CS_STATE_SEND_LENGTH;
            APP_TRP_COMMON_SendLengthCommand(p_connList_t, APP_TRP_WMODE_TX_MAX_SIZE);
        }
            break;

        case TRPC_CS_STATE_SEND_LENGTH:
        {
            p_connList_t->trpState = TRPC_CS_STATE_SEND_TYPE;
            APP_TRP_COMMON_SendTypeCommand(p_connList_t);
        }
            break;

        case TRPC_CS_STATE_SEND_TYPE:
        {
            p_connList_t->trpState = TRPC_CS_STATE_START_TX;
            APP_TRP_COMMON_SendModeCommand(p_connList_t, TRP_GRPID_TRANSMIT, APP_TRP_WMODE_TX_DATA_START);
            p_connList_t->workModeEn = true;
        }
            break;

        case TRPC_CS_STATE_START_TX:
        {
            // Send the first packet
            APP_TRP_COMMON_InitFixPatternParam(p_connList_t);
            APP_TRP_COMMON_SendFixPattern(p_connList_t);
            p_connList_t->trpState = TRPC_CS_STATE_TX;
        }
            break;

        case TRPC_CS_STATE_TX:
        {
            if(event & APP_TRPC_EVENT_TX_LE_DATA)
            {
                result = APP_TRP_COMMON_SendFixPattern(p_connList_t);
                if (result & APP_RES_COMPLETE)
                {
                    p_connList_t->trpState = TRPC_CS_STATE_WAIT_CS;
                }
            }
            // Wait for check sum from server role.
            if (event & APP_TRPC_EVENT_CHECK_SUM)
            {
                p_connList_t->trpState = TRPC_CS_STATE_STOP_TX;
                APP_TRP_COMMON_SendModeCommand(p_connList_t, TRP_GRPID_TRANSMIT, APP_TRP_WMODE_TX_DATA_END);
            }
        }
            break;
        
        case TRPC_CS_STATE_WAIT_CS:
        {
            // Wait for check sum from server role.
            if (event & APP_TRPC_EVENT_CHECK_SUM)
            {
                p_connList_t->trpState = TRPC_CS_STATE_STOP_TX;
                APP_TRP_COMMON_SendModeCommand(p_connList_t, TRP_GRPID_TRANSMIT, APP_TRP_WMODE_TX_DATA_END);
            }
        }
            break;

        case TRPC_CS_STATE_STOP_TX:
        {
            p_connList_t->workModeEn = false;
            p_connList_t->trpState = TRPC_CS_STATE_SEND_CS;
            APP_TRP_COMMON_SendCheckSumCommand(p_connList_t);
        }
            break;

        case TRPC_CS_STATE_SEND_CS:
        {
#ifndef APP_ENABLE_AFH_TEST
            p_connList_t->trpState = TRPC_CS_STATE_NULL;
            result = APP_TIMER_StopTimer(&(p_connList_t->protocolRspTmr.tmrHandle));
            if (result != APP_RES_SUCCESS)
            {
                APP_LOG_ERROR("APP_TIMER_PROTOCOL_RSP stop error ! result=%d\n", result);
            }
            APP_TRPC_WmodeStateMachine(p_connList_t);
#else //Keep check sum mode
            APP_TIMER_StopTimer(&(p_connList_t->protocolRspTmr.tmrHandle));
            p_connList_t->workMode = TRP_WMODE_CHECK_SUM;
            p_connList_t->trpState = 0;

            APP_TRPC_CheckSumStateMachine(APP_TRPC_EVENT_NULL, p_connList_t);
#endif
        }
            break;

        default:
            break;
    }
}

static void APP_TRPC_VendorCmdProc(APP_TRP_ConnList_T *p_connList_t, uint8_t length, uint8_t *p_cmd)
{
    uint8_t idx, groupId, commandId;
    bool    sendErrCommandFg = false;
    uint8_t grpId[] = {TRP_GRPID_NULL, TRP_GRPID_CHECK_SUM, TRP_GRPID_LOOPBACK, TRP_GRPID_FIX_PATTERN,
        TRP_GRPID_UART, TRP_GRPID_REV_LOOPBACK};
    uint16_t lastNumberServer;
    
    idx = 1;
    groupId = p_cmd[idx++];
    commandId = p_cmd[idx++];
    APP_LOG_INFO("Group ID = %d, Command ID = %d \n", groupId, commandId);

    if ((groupId == TRP_GRPID_REV_LOOPBACK) && (commandId == APP_TRP_WMODE_REV_LOOPBACK_ENABLE))
    {
        p_connList_t->workMode = TRP_WMODE_REV_LOOPBACK;
        APP_TRPC_WmodeStateMachine(p_connList_t);
        APP_TRPC_FlushRxDataInAllQueue(p_connList_t);
    }

   
    switch(p_connList_t->workMode)
    {
        case TRP_WMODE_CHECK_SUM:
        {
            if (groupId == TRP_GRPID_CHECK_SUM)
            {
                if (commandId == APP_TRP_WMODE_CHECK_SUM)
                {
                    if (((uint8_t)(p_connList_t->checkSum)) == p_cmd[idx])
                    {
                        APP_LOG_INFO("Check sum is successful !\n");
                    }
                    else
                    {
                        APP_LOG_ERROR("Check sum is error. CS_C:%d,CS_S:%d", (uint8_t)(p_connList_t->checkSum), p_cmd[idx]);
                    }
                    
                    if ((p_connList_t->trpState == TRPC_CS_STATE_TX) || (p_connList_t->trpState == TRPC_CS_STATE_WAIT_CS))
                        APP_TRPC_CheckSumStateMachine(APP_TRPC_EVENT_CHECK_SUM, p_connList_t);
                    else
                        sendErrCommandFg = true;
                }
                else if (commandId == APP_TRP_WMODE_ERROR_RSP)
                {
                    APP_LOG_ERROR("Check sum procedure is error!\n");
                }
            }
        }
        break;

        case TRP_WMODE_FIX_PATTERN:
        {
            if (groupId == TRP_GRPID_FIX_PATTERN)
            {
                if (commandId == APP_TRP_WMODE_TX_LAST_NUMBER)
                {
                    lastNumberServer = p_cmd[idx++];
                    lastNumberServer = (lastNumberServer << 8) | p_cmd[idx];
                    if (p_connList_t->rxLastNunber == lastNumberServer)
                    {
                        APP_LOG_INFO("Fixed Pattern is successful !\n");
                    }
                    else
                    {
                        APP_LOG_ERROR("Fixed Pattern is error. FP_C:%d,FP_S:%d", p_connList_t->rxLastNunber, 
                            lastNumberServer);
                    }
                    if (p_connList_t->trpState == TRPC_FP_STATE_WAIT_LAST_NUMBER)
                        APP_TRPC_FixPatternStateMachine(APP_TRPC_EVENT_LAST_NUMBER, p_connList_t);
                    else
                        sendErrCommandFg = true;
                }
                else if (commandId == APP_TRP_WMODE_ERROR_RSP)
                {
                    APP_LOG_ERROR("Fixed Pattern procedure is error!\n");
                }
            }
            else if (groupId == TRP_GRPID_TRANSMIT)
            {
                if ((commandId == APP_TRP_WMODE_TX_DATA_END) && (p_connList_t->trpState == TRPC_FP_STATE_RX))
                    APP_TRPC_FixPatternStateMachine(APP_TRPC_EVENT_TRX_END, p_connList_t);
                else
                    sendErrCommandFg = true;
            }
        }
        break;
            
        case TRP_WMODE_LOOPBACK:
        {
            if ((groupId == TRP_GRPID_LOOPBACK) && (commandId == APP_TRP_WMODE_ERROR_RSP))
            {
                APP_LOG_ERROR("Loopback procedure is error!\n");
            }
        }
        break;

        case TRP_WMODE_UART:
        {
            if (groupId == TRP_GRPID_UART)
            {
                if ((commandId == APP_TRP_WMODE_UART_DISABLE) && (p_connList_t->trpState == TRPC_UART_STATE_RELAY_DATA))
                    APP_TRPC_UartStateMachine(APP_TRPC_EVENT_TRX_END, p_connList_t);
            }
        }
        break;

        case TRP_WMODE_REV_LOOPBACK:
        {
            if (((groupId == TRP_GRPID_REV_LOOPBACK) && (commandId == APP_TRP_WMODE_REV_LOOPBACK_DISABLE))
                || ((groupId == TRP_GRPID_TRANSMIT) && (commandId == APP_TRP_WMODE_TX_DATA_END)))
            {
                p_connList_t->trpState = TRPC_REV_LB_STATE_SEND_STOP_TX;
                APP_TRPC_RevLoopbackStateMachine(APP_TRPC_EVENT_NULL, p_connList_t);
            }
        }
        break;
            
        default:
            break;
    }
    if (sendErrCommandFg)
        APP_TRP_COMMON_SendErrorRsp(p_connList_t, grpId[p_connList_t->workMode]);
}

static void APP_TRPC_VendorCmdRspProc(APP_TRP_ConnList_T *p_connList_t)
{
    switch(p_connList_t->workMode)
    {
        case TRP_WMODE_CHECK_SUM:
            APP_TRPC_CheckSumStateMachine(APP_TRPC_EVENT_NULL, p_connList_t);
            break;

        case TRP_WMODE_FIX_PATTERN:
            APP_TRPC_FixPatternStateMachine(APP_TRPC_EVENT_NULL, p_connList_t);
            break;
            
        case TRP_WMODE_LOOPBACK:
            APP_TRPC_LoopbackStateMachine(APP_TRPC_EVENT_NULL, p_connList_t);
            break;

        case TRP_WMODE_UART:
            APP_TRPC_UartStateMachine(APP_TRPC_EVENT_NULL, p_connList_t);
            break;

        case TRP_WMODE_REV_LOOPBACK:
            APP_TRPC_RevLoopbackStateMachine(APP_TRPC_EVENT_NULL, p_connList_t);
            break;
            
        default:
            break;
    }
}

static void APP_TRPC_WmodeStateMachine(APP_TRP_ConnList_T *p_connList_t)
{
    switch(p_connList_t->workMode)
    {
        case TRP_WMODE_NULL:
        {
            //uint8_t i;
            
            p_connList_t->workMode = TRP_WMODE_UART;
            p_connList_t->trpState = TRPC_UART_STATE_NULL;
            g_enableUartMode |= APP_TRP_CLIENT_UART;
        //move to APP_LED_Update()
        /*
        #ifdef APP_DEMO_MODE_LED_ENABLE
            APP_LED_StartByMode(APP_LED_MODE_TRPC_UART);
        #else
            for (i = 0; i < APP_TRPC_MAX_LINK_NUMBER; i++)
            {
                if (s_trpcConnList_t[i].workMode == TRP_WMODE_REV_LOOPBACK)
                    break;
            }

            if (i == APP_TRPC_MAX_LINK_NUMBER)
                APP_LED_StartByMode(APP_LED_MODE_CENTRAL);
                
        #endif  //#ifdef APP_DEMO_MODE_LED_ENABLE
        */
            APP_TRPC_UartStateMachine(APP_TRPC_EVENT_NULL, p_connList_t);
        }
        break;

        case TRP_WMODE_CHECK_SUM:
        {
            p_connList_t->workMode = TRP_WMODE_FIX_PATTERN;
            g_enableUartMode &= ~APP_TRP_CLIENT_UART;
        //move to APP_LED_Update()
        /*
        #ifdef APP_DEMO_MODE_LED_ENABLE
            APP_LED_StartByMode(APP_LED_MODE_TRPC_FP);
        #endif
        */
            APP_TRPC_FixPatternStateMachine(APP_TRPC_EVENT_NULL, p_connList_t);
        }
        break;

        case TRP_WMODE_FIX_PATTERN:
        {
            p_connList_t->workMode = TRP_WMODE_LOOPBACK;
            p_connList_t->trpState = TRPC_LB_STATE_NULL;
            // g_enableUartMode &= ~APP_TRP_CLIENT_UART;
            g_enableUartMode |= APP_TRP_CLIENT_UART;
            //move to APP_LED_Update()
            /*
            APP_LED_StartByMode(APP_LED_MODE_TRPC_LB);
            */
            APP_TRPC_LoopbackStateMachine(APP_TRPC_EVENT_NULL, p_connList_t);
        }
        break;

        case TRP_WMODE_LOOPBACK:
        {
            p_connList_t->workMode = TRP_WMODE_UART;
            p_connList_t->trpState = TRPC_UART_STATE_NULL;
            g_enableUartMode |= APP_TRP_CLIENT_UART;
        //move to APP_LED_Update()
        /*
        #ifdef APP_DEMO_MODE_LED_ENABLE
            APP_LED_StartByMode(APP_LED_MODE_TRPC_UART);
        #else
            //APP_LED_AlwaysOn(APP_LED_TYPE_RED, APP_LED_TYPE_NULL);
            APP_LED_StartByMode(APP_LED_MODE_CENTRAL);
        #endif
        */
            APP_TRPC_UartStateMachine(APP_TRPC_EVENT_NULL, p_connList_t);
        }
        break;

        case TRP_WMODE_UART:
        {
            p_connList_t->workMode = TRP_WMODE_LOOPBACK;
            p_connList_t->trpState = TRPC_LB_STATE_NULL;
            // g_enableUartMode &= ~APP_TRP_CLIENT_UART;
            g_enableUartMode |= APP_TRP_CLIENT_UART;
            //move to APP_LED_Update()
            /*
            APP_LED_StartByMode(APP_LED_MODE_TRPC_LB);
            */
            APP_TRPC_LoopbackStateMachine(APP_TRPC_EVENT_NULL, p_connList_t);
        }
        break;

        case TRP_WMODE_REV_LOOPBACK:
        {
            p_connList_t->trpState = TRPC_REV_LB_STATE_ENABLE_MODE;
            g_enableUartMode |= APP_TRP_CLIENT_UART;
            //move to APP_LED_Update()
            /*
            APP_LED_StartByMode(APP_LED_MODE_TRPC_LB);
            */
            APP_TRPC_RevLoopbackStateMachine(APP_TRPC_EVENT_NULL, p_connList_t);
        }
        break;

        default:
            break;
    }

    APP_LED_Update(p_connList_t->connHandle);
}

void APP_TRPC_Init(void)
{
    uint8_t i;

    for (i = 0; i < APP_TRPC_MAX_LINK_NUMBER; i++)
    {
        memset((uint8_t *) &s_trpcConnList_t[i], 0, sizeof(APP_TRP_ConnList_T));
        s_trpcConnList_t[i].maxAvailTxNumber = APP_TRP_MAX_TX_AVAILABLE_TIMES;
        s_trpcConnList_t[i].exchangedMTU = BLE_ATT_DEFAULT_MTU_LEN;
        s_trpcConnList_t[i].txMTU = BLE_ATT_DEFAULT_MTU_LEN - ATT_HANDLE_VALUE_HEADER_SIZE;
    }
    memset((uint8_t *) &s_trpcRxUartData_t, 0, sizeof(APP_TRP_GenData_T));
    g_trpcTrafficPriority_t.validNumber = APP_TRP_MAX_TRANSMIT_NUM;
}

void APP_TRPC_EventHandler(BLE_TRSPC_Event_T *p_event)
{
    APP_TRP_ConnList_T *p_trpcConnLink = NULL;
    uint16_t status;

    switch(p_event->eventId)
    {
        case BLE_TRSPC_EVT_UL_STATUS:
        {
            uint8_t connLinkNum;
            BLE_DM_ConnParamUpdate_T params;
            
            p_trpcConnLink = APP_TRPC_GetConnListByConnHandle(p_event->eventField.onUplinkStatus.connHandle);
            connLinkNum = APP_GetConnLinkNum();
            
            if (p_trpcConnLink != NULL)
            {
                p_trpcConnLink->workMode = TRP_WMODE_NULL;
                p_trpcConnLink->trpState = 0;
                if (p_event->eventField.onUplinkStatus.status == BLE_TRSPC_UL_STATUS_CBFCENABLED)
                {
                //LED update in APP_TRPC_WmodeStateMachine()
                /*
                    //APP_LED_AlwaysOn(APP_LED_TYPE_NULL, APP_LED_TYPE_NULL);
                    APP_LED_StartByMode(APP_LED_MODE_OFF);
                #ifdef APP_DEMO_MODE_LED_ENABLE
                    APP_LED_StartByMode(APP_LED_MODE_TRPC);
                #endif
                */
                    APP_TRPC_WmodeStateMachine(p_trpcConnLink);
                    if (connLinkNum > 1)
                    {
                        params.intervalMax = 0x18;  //30ms
                        params.intervalMin = 0x18;  //30ms
                        params.latency = 0;
                        params.timeout = 0x6C;      //1080ms

                        BLE_DM_ConnectionParameterUpdate(p_event->eventField.onUplinkStatus.connHandle, &params);
                        APP_TRPC_Update1stConnParameter();
                    }
                }
            }
            APP_LOG_INFO("UL is ready!\n");
        }
        break;

        case BLE_TRSPC_EVT_DL_STATUS:
        {
            p_trpcConnLink = APP_TRPC_GetConnListByConnHandle(p_event->eventField.onDownlinkStatus.connHandle);
            
            if (p_trpcConnLink != NULL )
            {
                if (p_event->eventField.onDownlinkStatus.status == BLE_TRSPC_DL_STATUS_DISABLED)
                {
                    p_trpcConnLink->trpRole = 0;
                    p_trpcConnLink->type = APP_TRP_TYPE_UNKNOWN;
                }
                else
                {
                    p_trpcConnLink->trpRole = APP_TRP_CLIENT_ROLE;
                    p_trpcConnLink->type = APP_TRP_TYPE_LEGACY;
                    if (p_event->eventField.onDownlinkStatus.currentCreditNumber)
                        APP_TRPC_TxBufValidEvtProc();
                }
            }
        }
        break;

        case BLE_TRSPC_EVT_RECEIVE_DATA:
        {
            uint8_t grpId[] = {TRP_GRPID_NULL, TRP_GRPID_CHECK_SUM, TRP_GRPID_LOOPBACK, TRP_GRPID_FIX_PATTERN,
                TRP_GRPID_UART, TRP_GRPID_REV_LOOPBACK};

            p_trpcConnLink = APP_TRPC_GetConnListByConnHandle(p_event->eventField.onReceiveData.connHandle);
            
            if (p_trpcConnLink != NULL )
            {
                if ((p_trpcConnLink->workMode == TRP_WMODE_NULL) 
                    || (p_trpcConnLink->workMode == TRP_WMODE_CHECK_SUM) 
                    || (p_trpcConnLink->workModeEn == false))
                {
                    status = APP_TRP_COMMON_FreeLeData(p_trpcConnLink);
                    
                    if (status == APP_RES_OOM)
                    {
                        APP_LOG_ERROR("LE_RX: APP_RES_OOM !\n");
                    }
                    APP_TRP_COMMON_SendErrorRsp(p_trpcConnLink, grpId[p_trpcConnLink->workMode]);
                    break;
                }
                //Rx token.
                p_trpcConnLink = APP_TRPC_GetConnListByIndex(g_trpcTrafficPriority_t.rxToken);
                APP_TRPC_LeRxProc(p_trpcConnLink);
            }
        }
        break;

        case BLE_TRSPC_EVT_VENDOR_CMD:
        {
            p_trpcConnLink = APP_TRPC_GetConnListByConnHandle(p_event->eventField.onVendorCmd.connHandle);
            
            if ((p_trpcConnLink->connHandle == p_event->eventField.onVendorCmd.connHandle)
                && (p_event->eventField.onVendorCmd.p_payLoad[0] == APP_TRP_VENDOR_OPCODE_BLE_UART))
                APP_TRPC_VendorCmdProc(p_trpcConnLink, p_event->eventField.onVendorCmd.payloadLength, p_event->eventField.onVendorCmd.p_payLoad);
        }
        break;

        case BLE_TRSPC_EVT_VENDOR_CMD_RSP:
        {
            p_trpcConnLink = APP_TRPC_GetConnListByConnHandle(p_event->eventField.onVendorCmdRsp.connHandle);
            
            if (p_trpcConnLink != NULL)
                APP_TRPC_VendorCmdRspProc(p_trpcConnLink);
        }
        break;

        default:
            break;
    }
}

void APP_TRPC_ConnEvtProc(BLE_GAP_Event_T *p_event)
{
    uint8_t i;

    for (i = 0; i < APP_TRPC_MAX_LINK_NUMBER; i++)
    {
        if (s_trpcConnList_t[i].connHandle == 0)
        {
            s_trpcConnList_t[i].connHandle = p_event->eventField.evtConnect.connHandle;
            sp_trpcCurrentLink = &s_trpcConnList_t[i];
            g_trpUartQueueNum = APP_TRP_SET_QUEUE_NUMBER(g_bleConnLinkNum);
            break;
        }
    }

    if ((i == APP_TRPC_MAX_LINK_NUMBER) || APP_TRP_IS_OVER_CONN_MAX_DEV)
        BLE_GAP_Disconnect(p_event->eventField.evtConnect.connHandle, GAP_DISC_REASON_REMOTE_TERMINATE);
}

void APP_TRPC_UpdateMtuEvtProc(uint16_t connHandle, uint16_t exchangedMTU)
{
    APP_TRP_ConnList_T *p_trpcConnLink = NULL;


    p_trpcConnLink = APP_TRPC_GetConnListByConnHandle(connHandle);

    if (p_trpcConnLink != NULL)
    {
        p_trpcConnLink->exchangedMTU = exchangedMTU;
        p_trpcConnLink->txMTU = p_trpcConnLink->exchangedMTU - ATT_HANDLE_VALUE_HEADER_SIZE;
    }
}

void APP_TRPC_ProtocolAvailableEvtProc(uint16_t connHandle)
{
    uint8_t grpId[] = {TRP_GRPID_NULL, TRP_GRPID_CHECK_SUM, TRP_GRPID_LOOPBACK, TRP_GRPID_FIX_PATTERN,
        TRP_GRPID_UART, TRP_GRPID_REV_LOOPBACK};
    APP_TRP_ConnList_T *p_trpcConnLink = NULL;

    p_trpcConnLink = APP_TRPC_GetConnListByConnHandle(connHandle);

    if (p_trpcConnLink != NULL)
    {
        switch(p_trpcConnLink->workMode)
        {
            case TRP_WMODE_CHECK_SUM:
            {
                if (p_trpcConnLink->txCtrRspFg & APP_TRP_SEND_GID_CS_FAIL)
                {
                    APP_TRP_COMMON_SendModeCommand(p_trpcConnLink, TRP_GRPID_CHECK_SUM, 
                        APP_TRP_WMODE_CHECK_SUM_ENABLE);
                }
                else if (p_trpcConnLink->txCtrRspFg & APP_TRP_SEND_LENGTH_FAIL)
                {
                    APP_TRP_COMMON_SendLengthCommand(p_trpcConnLink, APP_TRP_WMODE_TX_MAX_SIZE);
                }
                else if (p_trpcConnLink->txCtrRspFg & APP_TRP_SEND_TYPE_FAIL)
                {
                    APP_TRP_COMMON_SendTypeCommand(p_trpcConnLink);
                }
                else if ((p_trpcConnLink->txCtrRspFg & APP_TRP_SEND_GID_TX_FAIL) 
                    && (p_trpcConnLink->trpState == TRPC_CS_STATE_START_TX))
                {
                    APP_TRP_COMMON_SendModeCommand(p_trpcConnLink, TRP_GRPID_TRANSMIT, 
                        APP_TRP_WMODE_TX_DATA_START);
                }
                else if ((p_trpcConnLink->txCtrRspFg & APP_TRP_SEND_GID_TX_FAIL) 
                    && (p_trpcConnLink->trpState == TRPC_CS_STATE_STOP_TX))
                {
                    APP_TRP_COMMON_SendModeCommand(p_trpcConnLink, TRP_GRPID_TRANSMIT, 
                        APP_TRP_WMODE_TX_DATA_END);
                }
                else if (p_trpcConnLink->txCtrRspFg & APP_TRP_SEND_CHECK_SUM_FAIL)
                {
                    APP_TRP_COMMON_SendCheckSumCommand(p_trpcConnLink);
                }
            }
            break;

            case TRP_WMODE_FIX_PATTERN:
            {
                if (p_trpcConnLink->txCtrRspFg & APP_TRP_SEND_GID_FP_FAIL)
                {
                    APP_TRP_COMMON_SendModeCommand(p_trpcConnLink, TRP_GRPID_FIX_PATTERN, 
                        APP_TRP_WMODE_FIX_PATTERN_ENABLE);
                }
                else if (p_trpcConnLink->txCtrRspFg & APP_TRP_SEND_TYPE_FAIL)
                {
                    APP_TRP_COMMON_SendTypeCommand(p_trpcConnLink);
                }
                else if (p_trpcConnLink->txCtrRspFg & APP_TRP_SEND_GID_TX_FAIL)
                {
                    APP_TRP_COMMON_SendModeCommand(p_trpcConnLink, TRP_GRPID_TRANSMIT, 
                        APP_TRP_WMODE_TX_DATA_START);
                }
                else if (p_trpcConnLink->txCtrRspFg & APP_TRP_SEND_LAST_NUMBER_FAIL)
                {
                    APP_TRP_COMMON_SendLastNumber(p_trpcConnLink);
                }
            }
            break;
                
            case TRP_WMODE_LOOPBACK:
            {
                if (p_trpcConnLink->txCtrRspFg & APP_TRP_SEND_GID_LB_FAIL)
                {
                    APP_TRP_COMMON_SendModeCommand(p_trpcConnLink, TRP_GRPID_LOOPBACK, 
                        APP_TRP_WMODE_LOOPBACK_ENABLE);
                }
                else if (p_trpcConnLink->txCtrRspFg & APP_TRP_SEND_TYPE_FAIL)
                {
                    APP_TRP_COMMON_SendTypeCommand(p_trpcConnLink);
                }
                else if ((p_trpcConnLink->txCtrRspFg & APP_TRP_SEND_GID_TX_FAIL)
                    && (p_trpcConnLink->trpState == TRPC_LB_STATE_START_TX))
                {
                    APP_TRP_COMMON_SendModeCommand(p_trpcConnLink, TRP_GRPID_TRANSMIT, 
                        APP_TRP_WMODE_TX_DATA_START);
                }
                else if ((p_trpcConnLink->txCtrRspFg & APP_TRP_SEND_GID_TX_FAIL)
                    && (p_trpcConnLink->trpState == TRPC_LB_STATE_SEND_STOP_TX))
                {
                    APP_TRP_COMMON_SendModeCommand(p_trpcConnLink, TRP_GRPID_TRANSMIT, 
                        APP_TRP_WMODE_TX_DATA_END);
                }
            }
            break;

            case TRP_WMODE_UART:
            {
                if (p_trpcConnLink->txCtrRspFg & APP_TRP_SEND_GID_UART_FAIL)
                {
                    APP_TRP_COMMON_SendModeCommand(p_trpcConnLink, TRP_GRPID_UART, 
                        APP_TRP_WMODE_UART_ENABLE);
                }
                else if (p_trpcConnLink->txCtrRspFg & APP_TRP_SEND_TYPE_FAIL)
                {
                    APP_TRP_COMMON_SendTypeCommand(p_trpcConnLink);
                }
            }
            break;

            case TRP_WMODE_REV_LOOPBACK:
            {
                if (p_trpcConnLink->txCtrRspFg & APP_TRP_SEND_TYPE_FAIL)
                {
                    APP_TRP_COMMON_SendTypeCommand(p_trpcConnLink);
                }
                else if ((p_trpcConnLink->txCtrRspFg & APP_TRP_SEND_GID_TX_FAIL) 
                    && (p_trpcConnLink->trpState == TRPC_REV_LB_STATE_START_TX))
                {
                    APP_TRP_COMMON_SendModeCommand(p_trpcConnLink, TRP_GRPID_TRANSMIT, APP_TRP_WMODE_TX_DATA_START);
                }
            }
            break;

            default:
                break;
        }

        if (p_trpcConnLink->txCtrRspFg & APP_TRP_SEND_ERROR_RSP_FAIL)
        {
            APP_TRP_COMMON_SendErrorRsp(p_trpcConnLink, grpId[p_trpcConnLink->workMode]);
        }
    }
}

void APP_TRPC_TxBufValidEvtProc(void)
{
    APP_TRP_ConnList_T  *p_trpcConnLink = NULL;
    uint16_t status = APP_RES_SUCCESS;
    uint8_t checkListFg = false;

    
    sp_trpcCurrentLink = APP_TRPC_GetConnListByIndex(g_trpcTrafficPriority_t.txToken);

    if (sp_trpcCurrentLink == NULL)
        sp_trpcCurrentLink = APP_TRPC_ChangeNextLink(APP_TRP_LINK_TYPE_TX, &g_trpcTrafficPriority_t);

    if(sp_trpcCurrentLink == NULL)
        return;
        
    p_trpcConnLink = sp_trpcCurrentLink;
    g_trpcTrafficPriority_t.validNumber = APP_TRP_MAX_TRANSMIT_NUM;

    while (g_trpcTrafficPriority_t.validNumber > 0)
    {
        switch(sp_trpcCurrentLink->workMode)
        {
            case TRP_WMODE_CHECK_SUM:
            {
                if ((sp_trpcCurrentLink->trpState == TRPC_CS_STATE_TX) && (sp_trpcCurrentLink->workModeEn == true))
                {
                    APP_TRPC_CheckSumStateMachine(APP_TRPC_EVENT_TX_LE_DATA, sp_trpcCurrentLink);
                }

                sp_trpcCurrentLink->maxAvailTxNumber = 0;
            }
            break;
                
            case TRP_WMODE_LOOPBACK:
            {
                if ((sp_trpcCurrentLink->trpState == TRPC_LB_STATE_TRX) && (sp_trpcCurrentLink->workModeEn == true))
                {
                    APP_TRPC_LoopbackStateMachine(APP_TRPC_EVENT_TX_LE_DATA, sp_trpcCurrentLink);
                }

                sp_trpcCurrentLink->maxAvailTxNumber = 0;
            }
            break;

            case TRP_WMODE_UART:
            {                
                if (sp_trpcCurrentLink->trpState == TRPC_UART_STATE_RELAY_DATA)
                    APP_TRPC_UartStateMachine(APP_TRPC_EVENT_TX_LE_DATA, sp_trpcCurrentLink);
                
                sp_trpcCurrentLink->maxAvailTxNumber = 0;
            }
            break;

            case TRP_WMODE_REV_LOOPBACK:
            {
                if ((sp_trpcCurrentLink->trpState == TRPC_REV_LB_STATE_TRX) && (sp_trpcCurrentLink->workModeEn == true))
                {
                    status = APP_TRPC_RevLoopbackStateMachine(APP_TRPC_EVENT_TX_LE_DATA, sp_trpcCurrentLink);
                }
                else
                {
                    sp_trpcCurrentLink->maxAvailTxNumber = 0;
                }

                if (status == APP_RES_OOM)
                {
                    g_trpcTrafficPriority_t.validNumber = 0;
                }
                else if ((status == APP_RES_INVALID_PARA) || (status == APP_RES_NO_RESOURCE))
                {
                    //Change link
                    sp_trpcCurrentLink->maxAvailTxNumber = 0;
                }
            }
            break;

            default:
            {
                //Change link
                sp_trpcCurrentLink->maxAvailTxNumber = 0;
            }
            break;
        }

        //Tx available = 0 need to change link.
        if (sp_trpcCurrentLink->maxAvailTxNumber == 0)
        {
            sp_trpcCurrentLink->maxAvailTxNumber = APP_TRP_MAX_TX_AVAILABLE_TIMES;
            sp_trpcCurrentLink = APP_TRPC_ChangeNextLink(APP_TRP_LINK_TYPE_TX, &g_trpcTrafficPriority_t);
            checkListFg = true;
        }

        if (checkListFg)
        {
            checkListFg = false;
            if ((p_trpcConnLink == sp_trpcCurrentLink) || (sp_trpcCurrentLink == NULL) || (p_trpcConnLink == NULL))
                break;
        }
    }
}

void APP_TRPC_DiscEvtProc(uint16_t connHandle)
{
    sp_trpcCurrentLink = APP_TRPC_GetConnListByConnHandle(connHandle);

    if (sp_trpcCurrentLink != NULL)
    {
        APP_TRP_COMMON_DelAllLeCircData(&sp_trpcCurrentLink->leCircQueue_t);
        APP_TRP_COMMON_DelAllCircData(&sp_trpcCurrentLink->uartCircQueue_t);
        memset(sp_trpcCurrentLink, 0, sizeof(APP_TRP_ConnList_T));
        sp_trpcCurrentLink->maxAvailTxNumber = APP_TRP_MAX_TX_AVAILABLE_TIMES;
        sp_trpcCurrentLink->exchangedMTU = BLE_ATT_DEFAULT_MTU_LEN;
        sp_trpcCurrentLink->txMTU = BLE_ATT_DEFAULT_MTU_LEN - ATT_HANDLE_VALUE_HEADER_SIZE;
        g_trpUartQueueNum = APP_TRP_SET_QUEUE_NUMBER(g_bleConnLinkNum);
    }
}

void APP_TRPC_LeRxProc(APP_TRP_ConnList_T *p_connList_t)
{
    uint8_t checkListFg = false;
    uint16_t status = APP_RES_SUCCESS;


    
    sp_trpcCurrentLink = p_connList_t;
    
    if (sp_trpcCurrentLink == NULL)
        sp_trpcCurrentLink = APP_TRPC_ChangeNextLink(APP_TRP_LINK_TYPE_RX, &g_trpcTrafficPriority_t);
    
    if(sp_trpcCurrentLink == NULL)
        return;

    g_trpcTrafficPriority_t.validNumber = APP_TRP_MAX_TRANSMIT_NUM;

    while (g_trpcTrafficPriority_t.validNumber > 0)
    {
        switch (sp_trpcCurrentLink->workMode)
        {
            case TRP_WMODE_FIX_PATTERN:
            {
                APP_TRPC_FixPatternStateMachine(APP_TRPC_EVENT_RX_LE_DATA, sp_trpcCurrentLink);
                //Break the while loop
                g_trpcTrafficPriority_t.validNumber = 0;
            }
            break;

            case TRP_WMODE_LOOPBACK:
            {
                APP_TRPC_LoopbackStateMachine(APP_TRPC_EVENT_RX_LE_DATA, sp_trpcCurrentLink);
                g_trpcTrafficPriority_t.validNumber = 0;
            }
            break;

            case TRP_WMODE_UART:
            {
                APP_TRPC_UartStateMachine(APP_TRPC_EVENT_RX_LE_DATA, sp_trpcCurrentLink);
                sp_trpcCurrentLink->maxAvailTxNumber = 0;
            }
            break;

            case TRP_WMODE_REV_LOOPBACK:
            {
                if (sp_trpcCurrentLink->workModeEn == true)
                {
                    status = APP_TRPC_RevLoopbackStateMachine(APP_TRPC_EVENT_RX_LE_DATA, sp_trpcCurrentLink);
                }
                else
                    sp_trpcCurrentLink->maxAvailTxNumber = 0;
            }
            break;

            default:
            {
                //Change link.
                sp_trpcCurrentLink->maxAvailTxNumber = 0;
            }
            break;
        }

        if ((status == APP_RES_OOM) || (status == APP_RES_INVALID_PARA))
        {
            break;
        }

        // Change to the next link if there is no resource for the dedicated link.
        if (status == APP_RES_NO_RESOURCE)
            sp_trpcCurrentLink->maxAvailTxNumber = 0;

        if (sp_trpcCurrentLink->maxAvailTxNumber == 0)
        {
            sp_trpcCurrentLink->maxAvailTxNumber = APP_TRP_MAX_TX_AVAILABLE_TIMES;
            sp_trpcCurrentLink = APP_TRPC_ChangeNextLink(APP_TRP_LINK_TYPE_RX, &g_trpcTrafficPriority_t);
            checkListFg = true;
        }
        
        if (checkListFg)
        {
            checkListFg = false;
            if ((sp_trpcCurrentLink == p_connList_t) || (sp_trpcCurrentLink == NULL) || (p_connList_t == NULL))
                break;
        }
    }
}

APP_TRP_ConnList_T *APP_TRPC_ChangeNextLink(APP_TRP_LINK_TYPE_T linkType, APP_TRP_TrafficPriority_T *p_connToken)
{
    uint8_t i = 0, index = 0;

    if (p_connToken == NULL)
        return NULL;
    
    if (linkType == APP_TRP_LINK_TYPE_TX)
    {
        index = p_connToken->txToken;
        
        for (i = 0; i < APP_TRPC_MAX_LINK_NUMBER; i++)
        {
            index++;
            
            if (index > (APP_TRPC_MAX_LINK_NUMBER - 1))
                index = 0;
            
            if (s_trpcConnList_t[index].connHandle != 0)
                break;
        }
        
        p_connToken->txToken = index;

        if (s_trpcConnList_t[index].connHandle == 0)
        {
            return NULL;
        }
        else
        {
            return &(s_trpcConnList_t[index]);
        }
        
    }
    else if (linkType == APP_TRP_LINK_TYPE_RX)
    {
        index = p_connToken->rxToken;
        
        for (i = 0; i < APP_TRPC_MAX_LINK_NUMBER; i++)
        {
            index++;
            
            if (index > (APP_TRPC_MAX_LINK_NUMBER - 1))
                index = 0;
            
            if (s_trpcConnList_t[index].connHandle != 0)
                break;
        }
        
        p_connToken->rxToken = index;

        if (s_trpcConnList_t[index].connHandle == 0)
        {
            return NULL;
        }
        else
        {
            return &(s_trpcConnList_t[index]);
        }
        
    }

    return NULL;
}

bool APP_TRPC_IsUartMode(void)
{
    uint8_t i;

    for (i = 0; i < APP_TRPC_MAX_LINK_NUMBER; i++)
    {
        if ((s_trpcConnList_t[i].workMode == TRP_WMODE_UART) || (s_trpcConnList_t[i].workMode == TRP_WMODE_LOOPBACK))
            return true;
    }

    return false;
}

APP_TRP_ConnList_T *APP_TRPC_GetConnListByUartMode(void)
{
    uint8_t i;

    for (i = 0; i < APP_TRPC_MAX_LINK_NUMBER; i++)
    {
        if ((s_trpcConnList_t[i].workMode == TRP_WMODE_UART) || (s_trpcConnList_t[i].workMode == TRP_WMODE_LOOPBACK))
            return &(s_trpcConnList_t[i]);
    }

    return NULL;
}

void APP_TRPC_ProtocolErrRsp(APP_TRP_ConnList_T *p_connList_t)
{
    uint8_t grpId[] = {TRP_GRPID_NULL, TRP_GRPID_CHECK_SUM, TRP_GRPID_LOOPBACK, TRP_GRPID_FIX_PATTERN, 
        TRP_GRPID_UART, TRP_GRPID_REV_LOOPBACK};


    APP_TRP_COMMON_SendErrorRsp(p_connList_t, grpId[p_connList_t->workMode]);
    p_connList_t->workModeEn = false;
    
    switch(p_connList_t->workMode)
    {
        case TRP_WMODE_CHECK_SUM:
        {
            p_connList_t->trpState = TRPC_CS_STATE_SEND_CS;
            APP_TRPC_CheckSumStateMachine(APP_TRPC_EVENT_NULL, p_connList_t);
        }
        break;

        case TRP_WMODE_FIX_PATTERN:
        {
            p_connList_t->trpState = TRPC_FP_STATE_SEND_LAST_NUMBER;
            APP_TRPC_FixPatternStateMachine(APP_TRPC_EVENT_NULL, p_connList_t);
        }
        break;

        case TRP_WMODE_LOOPBACK:
        {
            p_connList_t->trpState = TRPC_LB_STATE_SEND_STOP_TX;
            APP_TRPC_LoopbackStateMachine(APP_TRPC_EVENT_NULL, p_connList_t);
        }
        break;

        case TRP_WMODE_UART:
        {
            p_connList_t->trpState = TRPC_UART_STATE_DISABLE_MODE;
            APP_TRPC_UartStateMachine(APP_TRPC_EVENT_NULL, p_connList_t);
        }
        break;

        case TRP_WMODE_REV_LOOPBACK:
        {
            p_connList_t->trpState = TRPC_REV_LB_STATE_SEND_STOP_TX;
            APP_TRPC_RevLoopbackStateMachine(APP_TRPC_EVENT_NULL, p_connList_t);
        }
        break;

        default:
            break;
    }
}

void APP_TRPC_KeyTrigger(uint8_t keyMesg)
{
    APP_LOG_INFO("TRPC: keyMesg=%d\n", keyMesg);
    
}


/*******************************************************************************
  Application Timer Header File

  Company:
    Microchip Technology Inc.

  File Name:
    app_timer.h

  Summary:
    This file contains the Application Timer functions for this project.

  Description:
    This file contains the Application Timer functions for this project.
    Including the Set/Stop/Reset timer and timer expired handler.
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


#ifndef APP_TIMER_H
#define APP_TIMER_H


// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************
#include <stdint.h>
#include "osal/osal_freertos_extend.h"
#include "timers.h"
#include "app.h"


// *****************************************************************************
// *****************************************************************************
// Section: Macros
// *****************************************************************************
// *****************************************************************************

/**@brief The definition of Timer ID. */
typedef enum APP_TIMER_TimerId_T
{
    APP_TIMER_PROTOCOL_RSP,                 /**< The timer to check protocol response delay. */
    APP_TIMER_FETCH_TRP_RX_DATA,            /**< The timer to fetch the TRP RX data. */
    APP_TIMER_UART_SEND,                    /**< The timer to send data to UART. */
    APP_TIMER_MSG_TMR,                      /**< The timer for BLE UART Application Messages. */
    APP_TIMER_RESERVED_04,                  /**< Reserved. */
    APP_TIMER_RESERVED_05,                  /**< Reserved. */
    APP_TIMER_RESERVED_06,                  /**< Reserved. */
    APP_TIMER_RESERVED_07,                  /**< Reserved. */
    APP_TIMER_RESERVED_08,                  /**< Reserved. */
    APP_TIMER_RESERVED_09,                  /**< Reserved. */

    APP_TIMER_TOTAL = 0x0A
} APP_TIMER_TimerId_T;


/**@brief The definition of Application Message Timer. */
typedef enum APP_TIMER_MsgTmrId_T
{
    APP_TIMER_MSG_UART_FETCH,   //APP_TIMER_UART_FETCH_00, /**< The timer to fetch UART data. */
    APP_TIMER_MSG_LED,          //APP_TIMER_LED_04         /**< The timer to measure LED interval and duration. */
    APP_TIMER_MSG_SCAN,         //APP_TIMER_SCAN_ADV_05    /**< The timer to get the largest RSSI advertising report. */
    APP_TIMER_MSG_KEY_SCAN,     //APP_TIMER_KEY_SCAN_06    /**< The timer for key scan. */
    APP_TIMER_MSG_DFU_TIMEOUT,
    APP_TIMER_MSG_DFU_REBOOT,
    APP_TIMER_MSG_BLE_GAP_DISCONNECT,
    
    APP_TIMER_MSG_END = 0x10
} APP_TIMER_MsgTmrId_T;


typedef enum APP_TIMER_MsgId_T
{
    APP_TIMER_MSG_UART_CMD_READY,
    APP_TIMER_MSG_TRPS_RCV_CREDIT,
} APP_TIMER_MsgId_T;




/**@defgroup APP_TIMER_TIMEOUT APP_TIMER_TIMEOUT
 * @brief The definition of the timeout value.
 * @{ */
#define APP_TIMER_10MS                                 0x0A     /**< 10ms timer. */
#define APP_TIMER_12MS                                 0x0C     /**< 12ms timer. */
#define APP_TIMER_18MS                                 0x12     /**< 18ms timer. */
#define APP_TIMER_20MS                                 0x14     /**< 20ms timer. */
#define APP_TIMER_30MS                                 0x1E     /**< 30ms timer. */
#define APP_TIMER_50MS                                 0x32     /**< 50ms timer. */
#define APP_TIMER_100MS                                0x64     /**< 100ms timer. */
#define APP_TIMER_500MS                                0x1F4    /**< 500ms timer. */
#define APP_TIMER_1S                                   0x3E8    /**< 1s timer. */
#define APP_TIMER_2S                                   0x7D0    /**< 2s timer. */
#define APP_TIMER_3S                                   0xBB8    /**< 3s timer. */
#define APP_TIMER_5S                                   0x1388   /**< 5s timer. */
#define APP_TIMER_30S                                  0x7530   /**< 30s timer. */
/** @} */

// *****************************************************************************
// *****************************************************************************
// Section: Data Types
// *****************************************************************************
// *****************************************************************************
/**@brief The structure contains the information about Timer element structure. */
typedef struct APP_TIMER_TmrElem_T
{
    uint8_t        tmrId;           /**< Dedicated timer Id */
    uint8_t        instance;        /**< Dedicated timer instance */ 
    TimerHandle_t   tmrHandle;      /**< Dedicated timer handler */ 
    void            *p_tmrParam;    /**< Dedicated timer parameter */
} APP_TIMER_TmrElem_T;

typedef struct APP_TIMER_Msg_T
{
    uint8_t        msgId;
    void            *p_param;
} APP_TIMER_Msg_T;



// *****************************************************************************
// *****************************************************************************
// Section: Function Prototypes
// *****************************************************************************
// *****************************************************************************

/**@brief The function is used to set timer element.
 *@param[in] timerId                          Timer ID. See @ref APP_TIMER_TimerId_T.
 *@param[in] instance                         Timer instance. Defined by users.
 *@param[in] p_tmrParam                       Timer parameters. Users want to pass the parameter.
 *@param[out] p_tmrElem                       Timer element. See @ref APP_TIMER_TmrElem_T.
 *
 * @retval none                               
 *
 */
void APP_TIMER_SetTimerElem(uint8_t timerId, uint8_t instance, void *p_tmrParam, 
    APP_TIMER_TmrElem_T *p_tmrElem);

/**@brief The function is used to set and start a timer.
 *@param[in] timerId                          Timer ID. See @ref APP_TIMER_TimerId_T.
 *@param[in] timeout                          Timeout value (unit: ms)
 *@param[in] isPeriodicTimer                  Set as true to let the timer expire repeatedly with a frequency set by the timeout parameter. \n
 *                                            Set as false to let the timer be a one-shot timer.
 *
 * @retval APP_RES_SUCCESS                    Set and start a timer successfully.
 * @retval APP_RES_FAIL                       Failed to start the timer.
 * @retval APP_RES_OOM                        No available memory.
 * @retval APP_RES_NO_RESOURCE                Failed to create a new timer.
 *
 */
uint16_t APP_TIMER_SetTimer(APP_TIMER_TmrElem_T *p_timerId, uint32_t timeout, bool isPeriodicTimer);

/**@brief The function is used to stop a timer.
 *@param[in] timerId                          Timer ID. See @ref APP_TIMER_TimerId_T.
 *
 * @retval APP_RES_SUCCESS                    Stop a timer successfully.
 * @retval APP_RES_FAIL                       Failed to stop the timer.
 * @retval APP_RES_INVALID_PARA               The timerId doesn't exist.
 *
 */
uint16_t APP_TIMER_StopTimer(TimerHandle_t *timerHandler);

/**@brief The function is used to re-start a timer. Not available if the timer is one-shot and it has been expired.
 *@param[in] timerId                          Timer ID. See @ref APP_TIMER_TimerId_T.
 *
 * @retval APP_RES_SUCCESS                    Reset a timer successfully.
 * @retval APP_RES_FAIL                       Failed to reset the timer.
 * @retval APP_RES_INVALID_PARA               The timerId doesn't exist.
 *
 */
uint16_t APP_TIMER_ResetTimer(TimerHandle_t timerHandler);




uint16_t APP_TIMER_SetTimerWraper(uint16_t idInstance, void *p_tmrParam, uint32_t timeout, bool isPeriodicTimer, APP_TIMER_TmrElem_T *p_tmrElem);

uint16_t APP_TIMER_SetMsgTimer(APP_TIMER_MsgTmrId_T msgId, uint8_t instance, uint32_t timeout, bool isPeriodic, void *p_param);

uint16_t APP_TIMER_StopMsgTimer(APP_TIMER_MsgTmrId_T msgId, uint8_t instance, bool resetOnly);

void APP_TIMER_TimerEventHandler(APP_TIMER_TmrElem_T        * p_timer);

uint16_t APP_TIMER_PostMsg(APP_TIMER_MsgId_T msgId, void* p_param);

void APP_TIMER_MsgEventHandler(APP_TIMER_Msg_T        * p_timer);




#endif

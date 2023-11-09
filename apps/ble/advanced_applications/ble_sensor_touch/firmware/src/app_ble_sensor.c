/*******************************************************************************
  Application BLE Sensor Source File

  Company:
    Microchip Technology Inc.

  File Name:
    app_sensor.c

  Summary:
    This file contains the Application Transparent Server Role functions for this project.

  Description:
    This file contains the Application Transparent Server Role functions for this project.
    The implementation of demo mode is included in this file.
 *******************************************************************************/

//DOM-IGNORE-BEGIN
/*******************************************************************************
* Copyright (C) 2020 Microchip Technology Inc. and its subsidiaries.
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
//DOM-IGNORE-END


// *****************************************************************************
// *****************************************************************************
// Section: Included Files
// *****************************************************************************
// *****************************************************************************
#include <stdint.h>
#include "app_trps.h"
#include "sensors/inc/rgb_led.h"
#include "sensors/inc/temp_sensor.h"
#include "app_timer/app_timer.h"
#include "peripheral/eic/plib_eic.h"
#include "system/console/sys_console.h"
#include "app.h"
#include "app_adv.h"
#include "app_ble_conn_handler.h"
#include "app_ble_sensor.h"
#include "app_error_defs.h"
#include "config/default/touch/touch.h"


// *****************************************************************************
// *****************************************************************************
// Section: Local Variables
// *****************************************************************************
// *****************************************************************************

/**@brief BLE sensor read periodic timer */
uint32_t bleSensTimer = 0;
APP_TRPS_SensorData_T bleSensorData = {LED_OFF,1,{GREEN_H,GREEN_S,GREEN_V},{0,0}};
float lastNotifiedTemp = -50.0, lastAdvTemp = -50.0;
bool b_button_debounce = false;

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
static uint8_t APP_TRPS_Sensor_LED_Ctrl(uint8_t *p_cmd);
static uint8_t APP_TRPS_Sensor_Color_Ctrl(uint8_t *p_cmd);
static void APP_TRPS_Sensor_Button_Callback(uintptr_t context);


#ifdef ENABLE_TOUCH
uint8_t key_status1 = 0;
uint8_t  scroller_status1   = 0;
uint16_t scroller_position1 = 0;
bool button1_touched = 0,slider_touched=0;
void APP_touch_status_display(void)
{ 
    key_status1 = get_sensor_state(0) & 0x80;
    
    if(0u != key_status1)
    {
        button1_touched=true;
    }
    
    if(0u == key_status1 && button1_touched== true)
    {      
        button1_touched=false;
        
        if(bleSensorData.rgbOnOffStatus == LED_OFF){
            bleSensorData.rgbOnOffStatus = LED_ON;
            RGB_LED_SetLedColorHSV(GREEN_H,GREEN_S,bleSensorData.RGB_color.Value);
            SYS_CONSOLE_MESSAGE("[BLE] LED ON\n\r");
        }
        else{
            RGB_LED_Off();
            bleSensorData.rgbOnOffStatus = LED_OFF;
            SYS_CONSOLE_MESSAGE("[BLE] LED OFF\n\r");
        }   
        
        if (APP_GetBleState() == APP_BLE_STATE_CONNECTED){
                APP_TRPS_SendNotification(APP_TRP_VENDOR_OPCODE_BLE_SENSOR,RGB_ONOFF_STATUS_NFY);
            }
        else{       
                APP_ADV_Init();  
            }
    }
        
	scroller_status1   = get_scroller_state(0);
	scroller_position1 = get_scroller_position(0);
    
    
    if (0u != scroller_status1) {
        
        slider_touched = true;
        
        bleSensorData.RGB_color.Hue =  85;
        bleSensorData.RGB_color.Saturation =  255;
        bleSensorData.RGB_color.Value =  scroller_position1;

        if(bleSensorData.rgbOnOffStatus == LED_ON)
            RGB_LED_SetLedColorHSV(GREEN_H,GREEN_S,bleSensorData.RGB_color.Value);
    }
    
    if(0u == scroller_status1 && slider_touched==true){
        
        slider_touched = false;

        if (APP_GetBleState() == APP_BLE_STATE_CONNECTED)
        {
            APP_TRPS_SendNotification(APP_TRP_VENDOR_OPCODE_BLE_SENSOR,RGB_COLOR_NFY);
        }
    }

    if(bleSensorData.rgbOnOffStatus == LED_ON)
    {
        // Button 2 LED 
        GPIO_PortClear(GPIO_PORT_A, (1<<13));
        
        // Slider LED's
        GPIO_PortSet(GPIO_PORT_A, (1<<8));
        GPIO_PortSet(GPIO_PORT_A, (1<<10));
        GPIO_PortSet(GPIO_PORT_A, (1<<7));
        GPIO_PortSet(GPIO_PORT_A, (1<<9));
        GPIO_PortSet(GPIO_PORT_A, (1<<14));
        GPIO_PortSet(GPIO_PORT_B, (1<<10));
        
        if (bleSensorData.RGB_color.Value > 0)
            GPIO_PortClear(GPIO_PORT_A, (1<<8));

        if (bleSensorData.RGB_color.Value > 43)    
            GPIO_PortClear(GPIO_PORT_A, (1<<10));

        if (bleSensorData.RGB_color.Value > 85)
            GPIO_PortClear(GPIO_PORT_A, (1<<7));
        
        if (bleSensorData.RGB_color.Value > 120)
            GPIO_PortClear(GPIO_PORT_A, (1<<9));

        if (bleSensorData.RGB_color.Value > 165)
            GPIO_PortClear(GPIO_PORT_A, (1<<14));
        
        if (bleSensorData.RGB_color.Value > 213)
            GPIO_PortClear(GPIO_PORT_B, (1<<10));
    }
    else
    {
        // Button 2 LED 
        GPIO_PortSet(GPIO_PORT_A, (1<<13));
        
        // Slider LED's
        GPIO_PortSet(GPIO_PORT_A, (1<<8));
        GPIO_PortSet(GPIO_PORT_A, (1<<10));
        GPIO_PortSet(GPIO_PORT_A, (1<<7));
        GPIO_PortSet(GPIO_PORT_A, (1<<9));
        GPIO_PortSet(GPIO_PORT_A, (1<<14));
        GPIO_PortSet(GPIO_PORT_B, (1<<10));        
    }
}
void APP_TouchMeasurement(void){

    /* call touch process function */
    touch_process();

    if(measurement_done_touch == 1)
    {
        measurement_done_touch = 0;
        // process touch data
        APP_touch_status_display();
        
        // Temperature measurement is called when ADC is not used for touch measurement
        bleSensTimer++;
        if( bleSensTimer == 25)  // temp sensor read every 1sec once
        {
            bleSensTimer = 0;
            APP_TRPS_Sensor_TimerHandler();
        }    
    }

}

#endif
APP_TRPS_CmdResp_T appTrpsSensorCmdResp[] = 
{
    BLE_SENSOR_DEFINE_CTRL_CMD_RESP()
};

APP_TRPS_NotifyData_T appTrpsSensorNotify[] = 
{
    BLE_SENSOR_DEFINE_CTRL_NOTIFY()
};


/* BLE Sensor RGB LED On/Off control through Mobile app */
static uint8_t APP_TRPS_Sensor_LED_Ctrl(uint8_t *p_cmd)
{
    if (p_cmd[3] == LED_OFF)
    {
        RGB_LED_Off();
        bleSensorData.rgbOnOffStatus = LED_OFF;
        SYS_CONSOLE_MESSAGE("[BLE] LED OFF\n\r");                
    }    
    else if (p_cmd[3] == LED_ON)
    {
        if(bleSensorData.rgbOnOffStatus == LED_OFF)
            RGB_LED_SetLedColorHSV(bleSensorData.RGB_color.Hue,bleSensorData.RGB_color.Saturation,bleSensorData.RGB_color.Value);
        bleSensorData.rgbOnOffStatus = LED_ON;
        SYS_CONSOLE_MESSAGE("[BLE] LED ON\n\r");                
    }
    return SUCCESS;
}

/* BLE Sensor RGB LED color control through Mobile app */
static uint8_t APP_TRPS_Sensor_Color_Ctrl(uint8_t *p_cmd)
{
    bleSensorData.RGB_color.Hue =  p_cmd[3];
    bleSensorData.RGB_color.Saturation =  p_cmd[4];
    bleSensorData.RGB_color.Value =  p_cmd[5];
    if(bleSensorData.rgbOnOffStatus == LED_ON)
    {    
        RGB_LED_SetLedColorHSV(bleSensorData.RGB_color.Hue,bleSensorData.RGB_color.Saturation,bleSensorData.RGB_color.Value);
        SYS_CONSOLE_MESSAGE("[BLE] COLOR SET\n\r");        
    }
    return SUCCESS;
}

/* Callback for BLE Sensor LED on/off through on board button */
static void APP_TRPS_Sensor_Button_Callback(uintptr_t context)
{
    APP_Msg_T appMsg;
    
    if(!b_button_debounce)
    {
        appMsg.msgId = APP_MSG_TRS_BLE_SENSOR_INT;

        OSAL_QUEUE_SendISR(&appData.appQueue, &appMsg);
        
        b_button_debounce = true;
    }    
}

/* BLE Sensor LED on/off control through on board button */
void APP_TRPS_Sensor_Button_Handler(void)
{
    b_button_debounce = false;
    
    if(bleSensorData.rgbOnOffStatus == LED_OFF)
    {
        RGB_LED_SetLedColorHSV(bleSensorData.RGB_color.Hue,bleSensorData.RGB_color.Saturation,bleSensorData.RGB_color.Value);
        bleSensorData.rgbOnOffStatus = LED_ON;
        SYS_CONSOLE_MESSAGE("[BLE] LED ON\n\r");
    }
    else
    {
        RGB_LED_Off();
        bleSensorData.rgbOnOffStatus = LED_OFF;
        SYS_CONSOLE_MESSAGE("[BLE] LED OFF\n\r");
    }
        
    if ( APP_GetBleState() == APP_BLE_STATE_CONNECTED)
    {
        APP_TRPS_SendNotification(APP_TRP_VENDOR_OPCODE_BLE_SENSOR,RGB_ONOFF_STATUS_NFY);
    }
    else
    {       
        APP_ADV_Init();  
    }
}

/* Periodic timer handler to read sensor data*/
void APP_TRPS_Sensor_TimerHandler(void)
{
    volatile float temperature=0, tempBack;
    uint16_t tempS = 0;
	//bleSensTimer++;
    //if( bleSensTimer == 25)  // temp sensor read every 1sec once
	{
        //bleSensTimer = 0;
        
        tempBack = temperature = MCP9700_Temp_Celsius();
        
        if(temperature < 0)
        {
            temperature = temperature * (-1.0);
        
            tempS = (uint16_t) (temperature * 10);  // 1 decimal place
            
            tempS = tempS | 0x8000;  // Set the MSB to indicate negative temperature          
        }
        else
        {       
            tempS = (uint16_t) (temperature * 10);  // 1 decimal place         
        }
        
        bleSensorData.tempSens.lsb = (uint8_t) tempS;
        bleSensorData.tempSens.msb = (uint8_t) (tempS>>8);  

        if ( APP_GetBleState() == APP_BLE_STATE_CONNECTED){
            if( (tempBack > (lastNotifiedTemp + 1)) || (tempBack < (lastNotifiedTemp-1)) )  //+/- 1°C above, only then do the notification
            {
                if(APP_TRPS_SendNotification(APP_TRP_VENDOR_OPCODE_BLE_SENSOR,TEMP_SENSOR_NFY)== APP_RES_SUCCESS)
                {
                    lastNotifiedTemp = tempBack;
                    SYS_CONSOLE_PRINT("[BLE] Temperature Notified: %.2f DegC\n\r",lastNotifiedTemp);
                }    
            }
        }
        else
        {
            if( (tempBack > (lastAdvTemp + 1)) || (tempBack < (lastAdvTemp-1)) )  //+/- 1°C above, only then update advertisement payload
            {       
                APP_ADV_Init();
                lastAdvTemp = tempBack;                
            }
        }
    }
}

/* Init BLE Sensor Specific */
void APP_TRPS_Sensor_Init(void)
{
    /* Init TRPS profile with BLE sensor specific command structure*/
    APP_TRPS_Init(APP_TRP_VENDOR_OPCODE_BLE_SENSOR,appTrpsSensorCmdResp,appTrpsSensorNotify,BLE_SENSOR_CMD_RESP_LST_SIZE,BLE_SENSOR_NOTIFY_LST_SIZE);


    /* Init Periodic application timer to do BLE sensor specific measurement like read temp sensor handled in APP_TRPS_Sensor_TimerHandler() */
//    extern bool OnBoard_User_Button2_SW3_status;
//    if (OnBoard_User_Button2_SW3_status)
        APP_TIMER_SetTimer(APP_TIMER_BLE_SENSOR, APP_TIMER_1S, true);
#ifndef ENABLE_TOUCH    
    /* PPS Output Remapping for RED and BLUE LED */
    PPS_REGS->PPS_RPB0G2R = 7U;
    PPS_REGS->PPS_RPB5G2R = 8U;
#endif    
    /* Register external button interrupt callback   */    
    EIC_CallbackRegister(BUTTON_1,APP_TRPS_Sensor_Button_Callback,0);
}

/* Do the BLE Sensor specific on disconnection  */
void APP_TRPS_Sensor_DiscEvtProc(void)
{
    lastNotifiedTemp = -50.0;    
}

/* Fill Adv Beacon with BLE Sensor specific */
void APP_TRPS_Sensor_Beacon(uint8_t* ptr_data)
{ 
    uint8_t idx=0;
    //Service Data
    ptr_data[idx++] = APP_ADV_ADD_DATA_CLASS_BYTE;
    ptr_data[idx++] = APP_ADV_PROD_TYPE_BLE_SENSOR;
    ptr_data[idx++] = RGB_ONOFF_STATUS_NFY;
    ptr_data[idx++] =  bleSensorData.rgbOnOffStatus;
    ptr_data[idx++] = TEMP_SENSOR_NFY;
    ptr_data[idx++] =  bleSensorData.tempSens.msb; // MSB
    ptr_data[idx++] =  bleSensorData.tempSens.lsb;  // LSB     
}
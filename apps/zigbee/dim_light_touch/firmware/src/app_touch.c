/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    filename.c

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
/* ************************************************************************** */

#include <stdint.h>
#include "sensors/inc/rgb_led.h"
#include "app.h"
#include "app_touch.h"
#include "config/default/touch/touch.h"
#include <z3device/light/include/lightOnOffCluster.h>
#include <z3device/light/include/lightLevelControlCluster.h>
#include <z3device/light/include/lightColorControlCluster.h>


// *****************************************************************************
// *****************************************************************************
// Section: Local Variables
// *****************************************************************************
// *****************************************************************************

/**@brief BLE sensor read periodic timer */
//uint32_t bleSensTimer = 0;
//APP_TRPS_SensorData_T bleSensorData = {LED_OFF,1,{GREEN_H,GREEN_S,GREEN_V},{0,0}};
//float lastNotifiedTemp = -50.0, lastAdvTemp = -50.0;
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

uint8_t key_status1 = 0;
uint8_t  scroller_status1 = 0;
uint16_t scroller_position1 = 0;
bool button1_touched = 0,slider_touched=0;

void APP_Zigbee_Light_onOff_Sync(bool on);
static void APP_Zigbee_Light_Brightness_level_Sync(uint8_t level);

void APP_touch_status_display(void)
{ 
    key_status1 = get_sensor_state(0) & 0x80;
    
    if(0u != key_status1)
    {
        button1_touched=true;
    }
    
    if(0u == key_status1 && button1_touched == true)
    {      
        button1_touched=false;
        
        if(lightOnOffClusterServerAttributes.onOff.value == false){
            lightOnOffClusterServerAttributes.onOff.value = true;
            APP_Zigbee_Light_onOff_Sync(true);
            RGB_LED_SetBrightnessLevel(lightLevelControlClusterServerAttributes.currentLevel.value);
        }
        else{
            RGB_LED_Off();
            APP_Zigbee_Light_onOff_Sync(false);
            lightOnOffClusterServerAttributes.onOff.value = false;
        }
    }
    
    scroller_status1   = get_scroller_state(0);
	scroller_position1 = get_scroller_position(0);
    
    if (0u != scroller_status1) {
        
        slider_touched = true;
        
        lightLevelControlClusterServerAttributes.currentLevel.value =  scroller_position1;

        if(lightOnOffClusterServerAttributes.onOff.value == true)
            RGB_LED_SetBrightnessLevel(lightLevelControlClusterServerAttributes.currentLevel.value);
    }
    
    if(0u == scroller_status1 && slider_touched==true){
        
        slider_touched = false;
        APP_Zigbee_Light_Brightness_level_Sync(lightLevelControlClusterServerAttributes.currentLevel.value);
    }
    
    
    if(lightOnOffClusterServerAttributes.onOff.value == true)
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
        
        if (lightLevelControlClusterServerAttributes.currentLevel.value > 0)
            GPIO_PortClear(GPIO_PORT_A, (1<<8));

        if (lightLevelControlClusterServerAttributes.currentLevel.value > 43)    
            GPIO_PortClear(GPIO_PORT_A, (1<<10));

        if (lightLevelControlClusterServerAttributes.currentLevel.value > 85)
            GPIO_PortClear(GPIO_PORT_A, (1<<7));
        
        if (lightLevelControlClusterServerAttributes.currentLevel.value > 120)
            GPIO_PortClear(GPIO_PORT_A, (1<<9));

        if (lightLevelControlClusterServerAttributes.currentLevel.value > 165)
            GPIO_PortClear(GPIO_PORT_A, (1<<14));
        
        if (lightLevelControlClusterServerAttributes.currentLevel.value > 213)
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

    if(BDB_GetBdbNodeIsOnANetwork())
    {
        /* call touch process function */
        touch_process();

        if(measurement_done_touch == 1)
        {
            measurement_done_touch = 0;
            // process touch data
            APP_touch_status_display();
        
        }
    }

}

/* Update Zigbee light On/Off specific variable when received from BLE */
 void APP_Zigbee_Light_onOff_Sync(bool on) //Changes the APi Names
{
    if(on)
    {
        onOffClusterSetGlobalSceneControl();
        setOnOff(true);
    }
    else
        setOnOff(false); 
}
 
void APP_Zigbee_Light_Brightness_level_Sync(uint8_t level)
{
    
    lightLevelControlClusterServerAttributes.currentLevel.value = level;
     
#ifdef _ZCL_REPORTING_SUPPORT_
    ZCL_ReportOnChangeIfNeeded(&lightLevelControlClusterServerAttributes.currentLevel);    
#endif 
    
    PDS_Store(APP_LIGHT_LEVEL_CONTROL_MEM_ID);
}







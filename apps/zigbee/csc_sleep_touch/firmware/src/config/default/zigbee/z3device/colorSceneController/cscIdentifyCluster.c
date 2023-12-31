/*******************************************************************************
  Color Scene Controller Identify cluster Header File

  Company:
    Microchip Technology Inc.

  File Name:
    cscIdentifyCluster.h

  Summary:
    This file contains the Color Scene Controller Identify cluster interface.

  Description:
    This file contains the Color Scene Controller Identify cluster interface.
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

#if (APP_Z3_DEVICE_TYPE == APP_DEVICE_TYPE_COLOR_SCENE_CONTROLLER)

/******************************************************************************
                    Includes section
******************************************************************************/
#include <z3device/clusters/include/haClusters.h>
#include <z3device/colorSceneController/include/cscIdentifyCluster.h>
#include <zcl/clusters/include/identifyCluster.h>

#include <z3device/common/include/z3Device.h>
#include <zcl/include/zclCommandManager.h>
#include <pds/include/wlPdsMemIds.h>
#ifdef BOARD_MEGARF
  #include <buttonsExt.h>
#endif
#if defined(BOARD_MEGARF) || defined(BOARD_SAMR21)
  #include <ledsExt.h>
  #include <lcdExt.h>
#endif
#include <app_zigbee/zigbee_console/console.h>
#include <app_zigbee/app_zigbee_handler.h>
/******************************************************************************
                    Definition(s) section
******************************************************************************/
#define IDENTIFY_EFFECT_TIMER_PERIOD  500U // in milliseconds
#define DEFAULT_IDENTIFY_TIME         3U

#define BLINK_IDENTIFY_TIME           1U
#define BREATHE_IDENTIFY_TIME         15U
#define OKAY_IDENTIFY_TIME            1U
#define CHANNEL_CHANGE_IDENTIFY_TIME  8U

#define LED_MAX_BRIGHTNESS            254U
#define LED_MIN_BRIGHTNESS            2U
#define LED_NO_BRIGHTNESS             0U

/******************************************************************************
                    Prototypes section
******************************************************************************/

// Commands received by server
static ZCL_Status_t identifyInd(ZCL_Addressing_t *addressing, uint8_t payloadLength, ZCL_Identify_t *payload);
static ZCL_Status_t identifyQueryInd(ZCL_Addressing_t *addressing, uint8_t payloadLength, uint8_t *payload);
static ZCL_Status_t identifyQueryResponseInd(ZCL_Addressing_t *addressing, uint8_t payloadLength, ZCL_IdentifyQueryResponse_t *payload);
static ZCL_Status_t triggerEffectInd(ZCL_Addressing_t *addressing, uint8_t payloadLength, ZCL_TriggerEffect_t *payload);

// Indication to notify change in Identify cluster attributes
static void ZCL_IdentifyAttributeEventInd(ZCL_Addressing_t *addressing, ZCL_AttributeId_t attributeId, ZCL_AttributeEvent_t event);

// Timer related function
static void identifyEffectTimerFired(void);

// Support functions
static void cscIdentifyFinish(void);
static void (*identifycb)(void);

/******************************************************************************
                    Global variables section
******************************************************************************/
ZCL_IdentifyClusterServerAttributes_t cscIdentifyClusterServerAttributes =
{
  ZCL_DEFINE_IDENTIFY_CLUSTER_SERVER_ATTRIBUTES()
};

ZCL_IdentifyClusterClientAttributes_t cscIdentifyClusterClientAttributes =
{
  ZCL_DEFINE_IDENTIFY_CLUSTER_CLIENT_ATTRIBUTES()
};

ZCL_IdentifyClusterCommands_t  cscIdentifyClusterCommands =
{
  ZCL_IDENTIFY_CLUSTER_COMMANDS(identifyInd, identifyQueryInd, triggerEffectInd, identifyQueryResponseInd)
};

extern QueueDescriptor_t identifySubscribers;

/******************************************************************************
                    Static variables section
******************************************************************************/
static HAL_AppTimer_t identifyEffectTimer;

static struct
{
  bool period      : 1;
  bool finish      : 1;
  bool chChangeEffect: 1;
  bool minTime       : 1;
} identificationStatus;

/******************************************************************************
                    Implementation section
******************************************************************************/
/**************************************************************************//**
\brief Initializes Identify cluster
******************************************************************************/
void cscIdentifyClusterInit(void)
{
  /* ENDPOINT to be added */
  ZCL_Cluster_t *cluster = ZCL_GetCluster(APP_ENDPOINT_COLOR_SCENE_CONTROLLER, IDENTIFY_CLUSTER_ID, ZCL_CLUSTER_SIDE_SERVER);
  ZCL_Cluster_t *identifyCluster = ZCL_GetCluster(APP_ENDPOINT_COLOR_SCENE_CONTROLLER, IDENTIFY_CLUSTER_ID, ZCL_CLUSTER_SIDE_CLIENT);
  // Server attributes init
  cscIdentifyClusterServerAttributes.identifyTime.value = 0;
  cscIdentifyClusterServerAttributes.clusterVersion.value = IDENTIFY_CLUSTER_VERSION;

  // All ongoing identification (if any) should be stopped
  cscIdentifyStop();
  if (cluster)
  {
    cluster->ZCL_AttributeEventInd = ZCL_IdentifyAttributeEventInd;
  }
  identifyEffectTimer.interval = IDENTIFY_EFFECT_TIMER_PERIOD;
  identifyEffectTimer.mode     = TIMER_REPEAT_MODE;
  identifyEffectTimer.callback = identifyEffectTimerFired;
  // Client attributes init
  cscIdentifyClusterClientAttributes.clusterVersion.value = IDENTIFY_CLUSTER_VERSION;
  LEDS_SET_COLOR_HS(255,255);
  if(identifyCluster)
    identifyCluster->ZCL_DefaultRespInd = ZCL_CommandZclDefaultResp;
}

/**************************************************************************//**
\brief Makes device to start identify itself

\param[in] time - identifying time in seconds
******************************************************************************/
void cscIdetifyStartIdentifyingCb(uint16_t time, void (*cb)(void))
{
  cscIdentifyClusterServerAttributes.identifyTime.value = time;
  identifycb = cb;
  cscIdentifyStart(cscIdentifyClusterServerAttributes.identifyTime.value);
}

/**************************************************************************//**
\brief Checks if identification process is in progress

\returns true if it is, false otherwise
******************************************************************************/
bool cscIdentifyIsIdentifying(void)
{
  return cscIdentifyClusterServerAttributes.identifyTime.value > 0;
}

/**************************************************************************//**
\brief Shows identification effect in way specified.

\param[in] identifyTime - identifying period in seconds.

******************************************************************************/
void cscIdentifyStart(uint16_t identifyTime)
{
  HAL_StopAppTimer(&identifyEffectTimer);
  identificationStatus.finish = false;
  cscIdentifyClusterServerAttributes.identifyTime.value = identifyTime;
  LEDS_SET_BRIGHTNESS(LED_NO_BRIGHTNESS);

  identifyEffectTimer.mode = TIMER_REPEAT_MODE;
  identifyEffectTimer.interval = IDENTIFY_EFFECT_TIMER_PERIOD;
  identifyEffectTimer.callback = identifyEffectTimerFired;

  HAL_StartAppTimer(&identifyEffectTimer);
}

/**************************************************************************//**
\brief Effect timer callback
******************************************************************************/
static void identifyEffectTimerFired(void)
{
  uint8_t level = 0;

  if (identificationStatus.chChangeEffect)
  {
    if (identificationStatus.period)
    {
      cscIdentifyClusterServerAttributes.identifyTime.value--;
      identificationStatus.period = !identificationStatus.period;
    }
    else
    {
      identificationStatus.period = !identificationStatus.period;
    }
    if (!identificationStatus.minTime)
    {
      level = LED_MAX_BRIGHTNESS;
      identificationStatus.minTime = !identificationStatus.minTime;
    }
    else
    {
      level = LED_MIN_BRIGHTNESS;
    }
  }
  else
  { // Effects such as Blink, Breathe and Okay or Normal Identify
    identificationStatus.period = !identificationStatus.period;
    if (identificationStatus.period)
    {
      level = LED_MAX_BRIGHTNESS;
      cscIdentifyClusterServerAttributes.identifyTime.value--;
    }
  }
  LEDS_SET_BRIGHTNESS(level);

  (void)level;
  if ((0 == cscIdentifyClusterServerAttributes.identifyTime.value) || identificationStatus.finish)
  {
    cscIdentifyStop();
  }
}

/**************************************************************************//**
\brief Finish identification routine.
******************************************************************************/
static void cscIdentifyFinish(void)
{
  identificationStatus.finish = true;
}


/**************************************************************************//**
\brief Stop identification routine.
******************************************************************************/
void cscIdentifyStop(void)
{
  identificationStatus.period = 0;
  identificationStatus.minTime = false;
  identificationStatus.chChangeEffect = false;

  HAL_StopAppTimer(&identifyEffectTimer);
  cscIdentifyClusterServerAttributes.identifyTime.value = 0;

  if (identifycb)
    identifycb();

  LEDS_SET_BRIGHTNESS(LED_NO_BRIGHTNESS);
}

/******************************************************************************
*                     ATTRIBUTE INDICATION HANDLER FUNCTION
******************************************************************************/
/**************************************************************************//**
\brief Attribute event (writing/reading) callback.

\param[in] addressing - incoming request addressing information.
\param[in] attributeId - attribute identifier.
\param[in] event - attribute event (read/write).
******************************************************************************/
static void ZCL_IdentifyAttributeEventInd(ZCL_Addressing_t *addressing,
  ZCL_AttributeId_t attributeId, ZCL_AttributeEvent_t event)
{
  APP_Zigbee_Event_t eventItem;
  eventItem.eventGroup = EVENT_CLUSTER;
  eventItem.eventId = CMD_ZCL_ATTR_IDENTIFY;
  eventItem.eventData.zclAttributeData.addressing = addressing;
  eventItem.eventData.zclAttributeData.attributeId = attributeId;
  eventItem.eventData.zclAttributeData.event = event;

  if ((ZCL_WRITE_ATTRIBUTE_EVENT == event) &&
      (ZCL_IDENTIFY_CLUSTER_IDENTIFY_TIME_ATTRIBUTE_ID == attributeId))
  {
    if (cscIdentifyClusterServerAttributes.identifyTime.value)
    {
      cscIdentifyStart(cscIdentifyClusterServerAttributes.identifyTime.value);
    }
    else
    {
      cscIdentifyStop();
    }
  APP_Zigbee_Handler(eventItem);
  }
}

/******************************************************************************
*                     COMMAND INDICATION HANDLERS
******************************************************************************/
/**************************************************************************//**
\brief Callback on receiving Identify command

\param[in] addressing - pointer to addressing information;
\param[in] payloadLength - data payload length;
\param[in] payload - data pointer

\return status of indication routine
******************************************************************************/
static ZCL_Status_t identifyInd(ZCL_Addressing_t *addressing, uint8_t payloadLength, ZCL_Identify_t *payload)
{
  APP_Zigbee_Event_t event;
  event.eventGroup = EVENT_CLUSTER;
  event.eventId = CMD_ZCL_IDENTIFY;
  event.eventData.zclEventData.addressing = addressing;
  event.eventData.zclEventData.payloadLength = payloadLength;
  event.eventData.zclEventData.payload = (uint8_t*)payload;

  if (payload->identifyTime)
  {
    cscIdentifyStart(payload->identifyTime);
  }
  else
  {
    cscIdentifyStop();
  }

  RAISE_CALLBACKS_TO_IDENTIFY_SUBSCIBERS(identifySubscribers, identify);

  APP_Zigbee_Handler(event);
  return ZCL_SUCCESS_STATUS;
}
/**************************************************************************//**
\brief Callback on receiving Identify Query command

\param[in] addressing - pointer to addressing information;
\param[in] payloadLength - data payload length;
\param[in] payload - data pointer

\return status of indication routine
******************************************************************************/
static ZCL_Status_t identifyQueryInd(ZCL_Addressing_t *addressing, uint8_t payloadLength, uint8_t *payload)
{
  APP_Zigbee_Event_t event;
  event.eventGroup = EVENT_CLUSTER;
  event.eventId = CMD_ZCL_IDENTIFY_QUERY;
  event.eventData.zclEventData.addressing = addressing;
  event.eventData.zclEventData.payloadLength = payloadLength;
  event.eventData.zclEventData.payload = (uint8_t*)payload;
  APP_Zigbee_Handler(event);
  if (cscIdentifyClusterServerAttributes.identifyTime.value)
    return sendIdentifyQueryResponse(addressing, APP_ENDPOINT_COLOR_SCENE_CONTROLLER, cscIdentifyClusterServerAttributes.identifyTime.value);

  RAISE_CALLBACKS_TO_IDENTIFY_SUBSCIBERS(identifySubscribers, identifyQuery);

  return ZCL_SUCCESS_WITH_DEFAULT_RESPONSE_STATUS;
}
/**************************************************************************//**
\brief Callback on receiving Identify Query Response command

\param[in] addressing - pointer to addressing information;
\param[in] payloadLength - data payload length;
\param[in] payload - data pointer

\return status of indication routine
******************************************************************************/
static ZCL_Status_t identifyQueryResponseInd(ZCL_Addressing_t *addressing, uint8_t payloadLength, ZCL_IdentifyQueryResponse_t *payload)
{
  APP_Zigbee_Event_t event;
  event.eventGroup = EVENT_CLUSTER;
  event.eventId = CMD_ZCL_IDENTIFY_QUERY_RESPONSE;
  event.eventData.zclEventData.addressing = addressing;
  event.eventData.zclEventData.payloadLength = payloadLength;
  event.eventData.zclEventData.payload = (uint8_t*)payload;

  RAISE_CALLBACKS_TO_IDENTIFY_SUBSCIBERS(identifySubscribers, identifyQueryResponse);

  APP_Zigbee_Handler(event);
  return ZCL_SUCCESS_STATUS;
}


/**************************************************************************//**
\brief Callback on receive of Trigger Effect command
******************************************************************************/
static ZCL_Status_t triggerEffectInd(ZCL_Addressing_t *addressing, uint8_t payloadLength, ZCL_TriggerEffect_t *payload)
{
  APP_Zigbee_Event_t event;
  event.eventGroup = EVENT_CLUSTER;
  event.eventId = CMD_ZCL_TRIGGER_EFFECT;
  event.eventData.zclEventData.addressing = addressing;
  event.eventData.zclEventData.payloadLength = payloadLength;
  event.eventData.zclEventData.payload = (uint8_t*)payload;

  switch (payload->effectIdentifier)
  {
    case ZCL_EFFECT_IDENTIFIER_BLINK:
      cscIdentifyStart(BLINK_IDENTIFY_TIME);
      break;

    case ZCL_EFFECT_IDENTIFIER_BREATHE:
      cscIdentifyStart(BREATHE_IDENTIFY_TIME);
      break;

    case ZCL_EFFECT_IDENTIFIER_OKAY:
      cscIdentifyStart(OKAY_IDENTIFY_TIME);
      break;

    case ZCL_EFFECT_IDENTIFIER_CHANNEL_CHANGE:
      identificationStatus.chChangeEffect = true;
      cscIdentifyStart(CHANNEL_CHANGE_IDENTIFY_TIME);
      break;

    case ZCL_EFFECT_IDENTIFIER_FINISH_EFFECT:
      cscIdentifyFinish();
      break;

    case ZCL_EFFECT_IDENTIFIER_STOP_EFFECT:
      cscIdentifyStop();
      break;

    default:
      break;
  }

  APP_Zigbee_Handler(event);
  return ZCL_SUCCESS_STATUS;
}
#endif // (APP_Z3_DEVICE_TYPE == APP_DEVICE_TYPE_COLOR_SCENE_CONTROLLER)

// eof cscIdentifyCluster.c

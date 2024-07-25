#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/legacy_adv_sleep.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/legacy_adv_sleep.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../src/app_ble/app_ble_handler.c ../src/app_ble/app_ble.c ../src/app_ble/app_ble_utility.c ../src/app.c ../src/app_idle_task.c ../src/main.c ../src/app_user_edits.c ../src/config/default/tasks.c ../src/config/default/peripheral/gpio/plib_gpio.c ../src/config/default/initialization.c ../src/config/default/osal/osal_freertos_extend.c ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_4.c ../src/config/default/peripheral/cmcc/plib_cmcc.c ../src/config/default/exceptions.c ../src/third_party/rtos/FreeRTOS/Source/timers.c ../src/config/default/ble/middleware_ble/ble_dm/ble_dm_dds.c ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c ../src/config/default/peripheral/evsys/plib_evsys.c ../src/config/default/peripheral/nvic/plib_nvic.c ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c ../src/config/default/ble/middleware_ble/ble_dm/ble_dm_info.c ../src/third_party/rtos/FreeRTOS/Source/croutine.c ../src/config/default/ble/middleware_ble/ble_dm/ble_dm.c ../src/config/default/ble/middleware_ble/ble_dm/ble_dm_sm.c ../src/config/default/peripheral/clk/plib_clk.c ../src/config/default/osal/osal_freertos.c ../src/config/default/peripheral/rtc/plib_rtc_timer.c ../src/config/default/ble/middleware_ble/ble_util/mw_aes.c ../src/config/default/interrupts.c ../src/config/default/device_sleep.c ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c ../src/third_party/rtos/FreeRTOS/Source/queue.c ../src/config/default/libc_syscalls.c ../src/config/default/device_deep_sleep.c ../src/third_party/rtos/FreeRTOS/Source/event_groups.c ../src/third_party/rtos/FreeRTOS/Source/list.c ../src/config/default/freertos_hooks.c ../src/config/default/peripheral/sercom/usart/plib_sercom0_usart.c ../src/config/default/ble/middleware_ble/ble_dm/ble_dm_conn.c ../src/config/default/peripheral/nvm/plib_nvm.c ../src/config/default/startup_xc32.c ../src/config/default/stdio/xc32_monitor.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1074542781/app_ble_handler.o ${OBJECTDIR}/_ext/1074542781/app_ble.o ${OBJECTDIR}/_ext/1074542781/app_ble_utility.o ${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/1360937237/app_idle_task.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/app_user_edits.o ${OBJECTDIR}/_ext/1171490990/tasks.o ${OBJECTDIR}/_ext/1865254177/plib_gpio.o ${OBJECTDIR}/_ext/1171490990/initialization.o ${OBJECTDIR}/_ext/1529399856/osal_freertos_extend.o ${OBJECTDIR}/_ext/1665200909/heap_4.o ${OBJECTDIR}/_ext/1865131932/plib_cmcc.o ${OBJECTDIR}/_ext/1171490990/exceptions.o ${OBJECTDIR}/_ext/404212886/timers.o ${OBJECTDIR}/_ext/481755623/ble_dm_dds.o ${OBJECTDIR}/_ext/246609638/port.o ${OBJECTDIR}/_ext/1986646378/plib_evsys.o ${OBJECTDIR}/_ext/1865468468/plib_nvic.o ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o ${OBJECTDIR}/_ext/481755623/ble_dm_info.o ${OBJECTDIR}/_ext/404212886/croutine.o ${OBJECTDIR}/_ext/481755623/ble_dm.o ${OBJECTDIR}/_ext/481755623/ble_dm_sm.o ${OBJECTDIR}/_ext/60165520/plib_clk.o ${OBJECTDIR}/_ext/1529399856/osal_freertos.o ${OBJECTDIR}/_ext/60180175/plib_rtc_timer.o ${OBJECTDIR}/_ext/889830802/mw_aes.o ${OBJECTDIR}/_ext/1171490990/interrupts.o ${OBJECTDIR}/_ext/1171490990/device_sleep.o ${OBJECTDIR}/_ext/404212886/stream_buffer.o ${OBJECTDIR}/_ext/404212886/queue.o ${OBJECTDIR}/_ext/1171490990/libc_syscalls.o ${OBJECTDIR}/_ext/1171490990/device_deep_sleep.o ${OBJECTDIR}/_ext/404212886/event_groups.o ${OBJECTDIR}/_ext/404212886/list.o ${OBJECTDIR}/_ext/1171490990/freertos_hooks.o ${OBJECTDIR}/_ext/504274921/plib_sercom0_usart.o ${OBJECTDIR}/_ext/481755623/ble_dm_conn.o ${OBJECTDIR}/_ext/60176403/plib_nvm.o ${OBJECTDIR}/_ext/1171490990/startup_xc32.o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1074542781/app_ble_handler.o.d ${OBJECTDIR}/_ext/1074542781/app_ble.o.d ${OBJECTDIR}/_ext/1074542781/app_ble_utility.o.d ${OBJECTDIR}/_ext/1360937237/app.o.d ${OBJECTDIR}/_ext/1360937237/app_idle_task.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/1360937237/app_user_edits.o.d ${OBJECTDIR}/_ext/1171490990/tasks.o.d ${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d ${OBJECTDIR}/_ext/1171490990/initialization.o.d ${OBJECTDIR}/_ext/1529399856/osal_freertos_extend.o.d ${OBJECTDIR}/_ext/1665200909/heap_4.o.d ${OBJECTDIR}/_ext/1865131932/plib_cmcc.o.d ${OBJECTDIR}/_ext/1171490990/exceptions.o.d ${OBJECTDIR}/_ext/404212886/timers.o.d ${OBJECTDIR}/_ext/481755623/ble_dm_dds.o.d ${OBJECTDIR}/_ext/246609638/port.o.d ${OBJECTDIR}/_ext/1986646378/plib_evsys.o.d ${OBJECTDIR}/_ext/1865468468/plib_nvic.o.d ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d ${OBJECTDIR}/_ext/481755623/ble_dm_info.o.d ${OBJECTDIR}/_ext/404212886/croutine.o.d ${OBJECTDIR}/_ext/481755623/ble_dm.o.d ${OBJECTDIR}/_ext/481755623/ble_dm_sm.o.d ${OBJECTDIR}/_ext/60165520/plib_clk.o.d ${OBJECTDIR}/_ext/1529399856/osal_freertos.o.d ${OBJECTDIR}/_ext/60180175/plib_rtc_timer.o.d ${OBJECTDIR}/_ext/889830802/mw_aes.o.d ${OBJECTDIR}/_ext/1171490990/interrupts.o.d ${OBJECTDIR}/_ext/1171490990/device_sleep.o.d ${OBJECTDIR}/_ext/404212886/stream_buffer.o.d ${OBJECTDIR}/_ext/404212886/queue.o.d ${OBJECTDIR}/_ext/1171490990/libc_syscalls.o.d ${OBJECTDIR}/_ext/1171490990/device_deep_sleep.o.d ${OBJECTDIR}/_ext/404212886/event_groups.o.d ${OBJECTDIR}/_ext/404212886/list.o.d ${OBJECTDIR}/_ext/1171490990/freertos_hooks.o.d ${OBJECTDIR}/_ext/504274921/plib_sercom0_usart.o.d ${OBJECTDIR}/_ext/481755623/ble_dm_conn.o.d ${OBJECTDIR}/_ext/60176403/plib_nvm.o.d ${OBJECTDIR}/_ext/1171490990/startup_xc32.o.d ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1074542781/app_ble_handler.o ${OBJECTDIR}/_ext/1074542781/app_ble.o ${OBJECTDIR}/_ext/1074542781/app_ble_utility.o ${OBJECTDIR}/_ext/1360937237/app.o ${OBJECTDIR}/_ext/1360937237/app_idle_task.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/app_user_edits.o ${OBJECTDIR}/_ext/1171490990/tasks.o ${OBJECTDIR}/_ext/1865254177/plib_gpio.o ${OBJECTDIR}/_ext/1171490990/initialization.o ${OBJECTDIR}/_ext/1529399856/osal_freertos_extend.o ${OBJECTDIR}/_ext/1665200909/heap_4.o ${OBJECTDIR}/_ext/1865131932/plib_cmcc.o ${OBJECTDIR}/_ext/1171490990/exceptions.o ${OBJECTDIR}/_ext/404212886/timers.o ${OBJECTDIR}/_ext/481755623/ble_dm_dds.o ${OBJECTDIR}/_ext/246609638/port.o ${OBJECTDIR}/_ext/1986646378/plib_evsys.o ${OBJECTDIR}/_ext/1865468468/plib_nvic.o ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o ${OBJECTDIR}/_ext/481755623/ble_dm_info.o ${OBJECTDIR}/_ext/404212886/croutine.o ${OBJECTDIR}/_ext/481755623/ble_dm.o ${OBJECTDIR}/_ext/481755623/ble_dm_sm.o ${OBJECTDIR}/_ext/60165520/plib_clk.o ${OBJECTDIR}/_ext/1529399856/osal_freertos.o ${OBJECTDIR}/_ext/60180175/plib_rtc_timer.o ${OBJECTDIR}/_ext/889830802/mw_aes.o ${OBJECTDIR}/_ext/1171490990/interrupts.o ${OBJECTDIR}/_ext/1171490990/device_sleep.o ${OBJECTDIR}/_ext/404212886/stream_buffer.o ${OBJECTDIR}/_ext/404212886/queue.o ${OBJECTDIR}/_ext/1171490990/libc_syscalls.o ${OBJECTDIR}/_ext/1171490990/device_deep_sleep.o ${OBJECTDIR}/_ext/404212886/event_groups.o ${OBJECTDIR}/_ext/404212886/list.o ${OBJECTDIR}/_ext/1171490990/freertos_hooks.o ${OBJECTDIR}/_ext/504274921/plib_sercom0_usart.o ${OBJECTDIR}/_ext/481755623/ble_dm_conn.o ${OBJECTDIR}/_ext/60176403/plib_nvm.o ${OBJECTDIR}/_ext/1171490990/startup_xc32.o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o

# Source Files
SOURCEFILES=../src/app_ble/app_ble_handler.c ../src/app_ble/app_ble.c ../src/app_ble/app_ble_utility.c ../src/app.c ../src/app_idle_task.c ../src/main.c ../src/app_user_edits.c ../src/config/default/tasks.c ../src/config/default/peripheral/gpio/plib_gpio.c ../src/config/default/initialization.c ../src/config/default/osal/osal_freertos_extend.c ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_4.c ../src/config/default/peripheral/cmcc/plib_cmcc.c ../src/config/default/exceptions.c ../src/third_party/rtos/FreeRTOS/Source/timers.c ../src/config/default/ble/middleware_ble/ble_dm/ble_dm_dds.c ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c ../src/config/default/peripheral/evsys/plib_evsys.c ../src/config/default/peripheral/nvic/plib_nvic.c ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c ../src/config/default/ble/middleware_ble/ble_dm/ble_dm_info.c ../src/third_party/rtos/FreeRTOS/Source/croutine.c ../src/config/default/ble/middleware_ble/ble_dm/ble_dm.c ../src/config/default/ble/middleware_ble/ble_dm/ble_dm_sm.c ../src/config/default/peripheral/clk/plib_clk.c ../src/config/default/osal/osal_freertos.c ../src/config/default/peripheral/rtc/plib_rtc_timer.c ../src/config/default/ble/middleware_ble/ble_util/mw_aes.c ../src/config/default/interrupts.c ../src/config/default/device_sleep.c ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c ../src/third_party/rtos/FreeRTOS/Source/queue.c ../src/config/default/libc_syscalls.c ../src/config/default/device_deep_sleep.c ../src/third_party/rtos/FreeRTOS/Source/event_groups.c ../src/third_party/rtos/FreeRTOS/Source/list.c ../src/config/default/freertos_hooks.c ../src/config/default/peripheral/sercom/usart/plib_sercom0_usart.c ../src/config/default/ble/middleware_ble/ble_dm/ble_dm_conn.c ../src/config/default/peripheral/nvm/plib_nvm.c ../src/config/default/startup_xc32.c ../src/config/default/stdio/xc32_monitor.c

# Pack Options 
PACK_COMMON_OPTIONS=-I "${CMSIS_DIR}/CMSIS/Core/Include"



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/legacy_adv_sleep.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=WBZ351
MP_LINKER_FILE_OPTION=,--script="..\src\config\default\WBZ351.ld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1074542781/app_ble_handler.o: ../src/app_ble/app_ble_handler.c  .generated_files/flags/default/7ac783397f18e9563af119aa67fc375013ac67c4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1074542781" 
	@${RM} ${OBJECTDIR}/_ext/1074542781/app_ble_handler.o.d 
	@${RM} ${OBJECTDIR}/_ext/1074542781/app_ble_handler.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1074542781/app_ble_handler.o.d" -o ${OBJECTDIR}/_ext/1074542781/app_ble_handler.o ../src/app_ble/app_ble_handler.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1074542781/app_ble.o: ../src/app_ble/app_ble.c  .generated_files/flags/default/c31fe7be97d6e0562d51e5bb998d1e1053d637ad .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1074542781" 
	@${RM} ${OBJECTDIR}/_ext/1074542781/app_ble.o.d 
	@${RM} ${OBJECTDIR}/_ext/1074542781/app_ble.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1074542781/app_ble.o.d" -o ${OBJECTDIR}/_ext/1074542781/app_ble.o ../src/app_ble/app_ble.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1074542781/app_ble_utility.o: ../src/app_ble/app_ble_utility.c  .generated_files/flags/default/20e131b1bd02fbdd6055adc65037cb74e704e43b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1074542781" 
	@${RM} ${OBJECTDIR}/_ext/1074542781/app_ble_utility.o.d 
	@${RM} ${OBJECTDIR}/_ext/1074542781/app_ble_utility.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1074542781/app_ble_utility.o.d" -o ${OBJECTDIR}/_ext/1074542781/app_ble_utility.o ../src/app_ble/app_ble_utility.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  .generated_files/flags/default/bc9e475745e5639cfa8e4789abd700006a6ac515 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_idle_task.o: ../src/app_idle_task.c  .generated_files/flags/default/889015593aca323789a0811259dc9a16f8e88cc7 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_idle_task.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_idle_task.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_idle_task.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_idle_task.o ../src/app_idle_task.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/default/83d415314924a0ddce1a33f0967df9acad2671bd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_user_edits.o: ../src/app_user_edits.c  .generated_files/flags/default/cba45b622bcebcbd25dbcf6ebf85df9bc918cca3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_user_edits.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_user_edits.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_user_edits.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_user_edits.o ../src/app_user_edits.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/tasks.o: ../src/config/default/tasks.c  .generated_files/flags/default/7ca44f056ffe1a6059efda3c3182e0ecf2447aff .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/tasks.o.d" -o ${OBJECTDIR}/_ext/1171490990/tasks.o ../src/config/default/tasks.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1865254177/plib_gpio.o: ../src/config/default/peripheral/gpio/plib_gpio.c  .generated_files/flags/default/496dca6b799a809a921b6b5ef049df4aaf47bc7d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865254177" 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/1865254177/plib_gpio.o ../src/config/default/peripheral/gpio/plib_gpio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/initialization.o: ../src/config/default/initialization.c  .generated_files/flags/default/ec6e8f5db3d53af1b1e1b3373430c5137c00381a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/initialization.o.d" -o ${OBJECTDIR}/_ext/1171490990/initialization.o ../src/config/default/initialization.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1529399856/osal_freertos_extend.o: ../src/config/default/osal/osal_freertos_extend.c  .generated_files/flags/default/bbcd4a16ff74ba430c3bea2b52490942e184807c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1529399856" 
	@${RM} ${OBJECTDIR}/_ext/1529399856/osal_freertos_extend.o.d 
	@${RM} ${OBJECTDIR}/_ext/1529399856/osal_freertos_extend.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1529399856/osal_freertos_extend.o.d" -o ${OBJECTDIR}/_ext/1529399856/osal_freertos_extend.o ../src/config/default/osal/osal_freertos_extend.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1665200909/heap_4.o: ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_4.c  .generated_files/flags/default/70f7b1d42a90612998bcbfd66ce2753fe6a0470a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1665200909" 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1665200909/heap_4.o.d" -o ${OBJECTDIR}/_ext/1665200909/heap_4.o ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_4.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1865131932/plib_cmcc.o: ../src/config/default/peripheral/cmcc/plib_cmcc.c  .generated_files/flags/default/55f3810465ba210222e755960da10b2f50b7f644 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865131932" 
	@${RM} ${OBJECTDIR}/_ext/1865131932/plib_cmcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865131932/plib_cmcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865131932/plib_cmcc.o.d" -o ${OBJECTDIR}/_ext/1865131932/plib_cmcc.o ../src/config/default/peripheral/cmcc/plib_cmcc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/exceptions.o: ../src/config/default/exceptions.c  .generated_files/flags/default/d127de131fa484df0023e00b266fc73c61859ae9 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/exceptions.o.d" -o ${OBJECTDIR}/_ext/1171490990/exceptions.o ../src/config/default/exceptions.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/timers.o: ../src/third_party/rtos/FreeRTOS/Source/timers.c  .generated_files/flags/default/92990dd4165b2be9130a9fdd788769c0a796e11c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/timers.o.d" -o ${OBJECTDIR}/_ext/404212886/timers.o ../src/third_party/rtos/FreeRTOS/Source/timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/481755623/ble_dm_dds.o: ../src/config/default/ble/middleware_ble/ble_dm/ble_dm_dds.c  .generated_files/flags/default/1385f5896c105f1daab58ce87077bd6b9a3b2abd .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/481755623" 
	@${RM} ${OBJECTDIR}/_ext/481755623/ble_dm_dds.o.d 
	@${RM} ${OBJECTDIR}/_ext/481755623/ble_dm_dds.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/481755623/ble_dm_dds.o.d" -o ${OBJECTDIR}/_ext/481755623/ble_dm_dds.o ../src/config/default/ble/middleware_ble/ble_dm/ble_dm_dds.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/246609638/port.o: ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c  .generated_files/flags/default/af726170a11d95ad0dee377ceb06568587454253 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/246609638" 
	@${RM} ${OBJECTDIR}/_ext/246609638/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/246609638/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/246609638/port.o.d" -o ${OBJECTDIR}/_ext/246609638/port.o ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1986646378/plib_evsys.o: ../src/config/default/peripheral/evsys/plib_evsys.c  .generated_files/flags/default/aab19e78bfeabedbbfbf8250533ac87747d5eb0b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1986646378" 
	@${RM} ${OBJECTDIR}/_ext/1986646378/plib_evsys.o.d 
	@${RM} ${OBJECTDIR}/_ext/1986646378/plib_evsys.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1986646378/plib_evsys.o.d" -o ${OBJECTDIR}/_ext/1986646378/plib_evsys.o ../src/config/default/peripheral/evsys/plib_evsys.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1865468468/plib_nvic.o: ../src/config/default/peripheral/nvic/plib_nvic.c  .generated_files/flags/default/c142477c818b9ce4e3b188b53c9678c79b22e30a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865468468" 
	@${RM} ${OBJECTDIR}/_ext/1865468468/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865468468/plib_nvic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865468468/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/1865468468/plib_nvic.o ../src/config/default/peripheral/nvic/plib_nvic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o: ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c  .generated_files/flags/default/d1f9a646901d530048ff628d8445b30654cab2eb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d" -o ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/481755623/ble_dm_info.o: ../src/config/default/ble/middleware_ble/ble_dm/ble_dm_info.c  .generated_files/flags/default/1f6c1554d1fec37c2b9605edf1df0003535066b0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/481755623" 
	@${RM} ${OBJECTDIR}/_ext/481755623/ble_dm_info.o.d 
	@${RM} ${OBJECTDIR}/_ext/481755623/ble_dm_info.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/481755623/ble_dm_info.o.d" -o ${OBJECTDIR}/_ext/481755623/ble_dm_info.o ../src/config/default/ble/middleware_ble/ble_dm/ble_dm_info.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/croutine.o: ../src/third_party/rtos/FreeRTOS/Source/croutine.c  .generated_files/flags/default/e03f6fde823a0d088c767723dbcf66c6f7e28c9f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/croutine.o.d" -o ${OBJECTDIR}/_ext/404212886/croutine.o ../src/third_party/rtos/FreeRTOS/Source/croutine.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/481755623/ble_dm.o: ../src/config/default/ble/middleware_ble/ble_dm/ble_dm.c  .generated_files/flags/default/fc7dd1c1a683c89c8a6d9fca740dd90251a652b0 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/481755623" 
	@${RM} ${OBJECTDIR}/_ext/481755623/ble_dm.o.d 
	@${RM} ${OBJECTDIR}/_ext/481755623/ble_dm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/481755623/ble_dm.o.d" -o ${OBJECTDIR}/_ext/481755623/ble_dm.o ../src/config/default/ble/middleware_ble/ble_dm/ble_dm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/481755623/ble_dm_sm.o: ../src/config/default/ble/middleware_ble/ble_dm/ble_dm_sm.c  .generated_files/flags/default/2380b3bc1d8a903989e05300954939630ff81ff1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/481755623" 
	@${RM} ${OBJECTDIR}/_ext/481755623/ble_dm_sm.o.d 
	@${RM} ${OBJECTDIR}/_ext/481755623/ble_dm_sm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/481755623/ble_dm_sm.o.d" -o ${OBJECTDIR}/_ext/481755623/ble_dm_sm.o ../src/config/default/ble/middleware_ble/ble_dm/ble_dm_sm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/60165520/plib_clk.o: ../src/config/default/peripheral/clk/plib_clk.c  .generated_files/flags/default/77b4ea2bbefd77c80a11318d7acb1610774ec599 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60165520" 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60165520/plib_clk.o.d" -o ${OBJECTDIR}/_ext/60165520/plib_clk.o ../src/config/default/peripheral/clk/plib_clk.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1529399856/osal_freertos.o: ../src/config/default/osal/osal_freertos.c  .generated_files/flags/default/3c873d6475ef19b01abab58ea72f3b82c24e53a1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1529399856" 
	@${RM} ${OBJECTDIR}/_ext/1529399856/osal_freertos.o.d 
	@${RM} ${OBJECTDIR}/_ext/1529399856/osal_freertos.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1529399856/osal_freertos.o.d" -o ${OBJECTDIR}/_ext/1529399856/osal_freertos.o ../src/config/default/osal/osal_freertos.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/60180175/plib_rtc_timer.o: ../src/config/default/peripheral/rtc/plib_rtc_timer.c  .generated_files/flags/default/579aa2adaee6fb1b98d26f7170ffd123612ea377 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60180175" 
	@${RM} ${OBJECTDIR}/_ext/60180175/plib_rtc_timer.o.d 
	@${RM} ${OBJECTDIR}/_ext/60180175/plib_rtc_timer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60180175/plib_rtc_timer.o.d" -o ${OBJECTDIR}/_ext/60180175/plib_rtc_timer.o ../src/config/default/peripheral/rtc/plib_rtc_timer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/889830802/mw_aes.o: ../src/config/default/ble/middleware_ble/ble_util/mw_aes.c  .generated_files/flags/default/58e105c47f19e5d77acc63c6959a472ada1f050d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/889830802" 
	@${RM} ${OBJECTDIR}/_ext/889830802/mw_aes.o.d 
	@${RM} ${OBJECTDIR}/_ext/889830802/mw_aes.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/889830802/mw_aes.o.d" -o ${OBJECTDIR}/_ext/889830802/mw_aes.o ../src/config/default/ble/middleware_ble/ble_util/mw_aes.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/interrupts.o: ../src/config/default/interrupts.c  .generated_files/flags/default/2003f4f68226ae051260085770231afd8ef42a9d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/interrupts.o.d" -o ${OBJECTDIR}/_ext/1171490990/interrupts.o ../src/config/default/interrupts.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/device_sleep.o: ../src/config/default/device_sleep.c  .generated_files/flags/default/dd54c6555ecb7d6dfea0aecd905f46e50994e158 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/device_sleep.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/device_sleep.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/device_sleep.o.d" -o ${OBJECTDIR}/_ext/1171490990/device_sleep.o ../src/config/default/device_sleep.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/stream_buffer.o: ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c  .generated_files/flags/default/3e69f07254c884c021577b48751278bd0378f343 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/stream_buffer.o.d" -o ${OBJECTDIR}/_ext/404212886/stream_buffer.o ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/queue.o: ../src/third_party/rtos/FreeRTOS/Source/queue.c  .generated_files/flags/default/68e7bd0ab3c2821044fff642355eb4d2dd7eba66 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/queue.o.d" -o ${OBJECTDIR}/_ext/404212886/queue.o ../src/third_party/rtos/FreeRTOS/Source/queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/libc_syscalls.o: ../src/config/default/libc_syscalls.c  .generated_files/flags/default/8fe2666b3e500a97518d752e44d4597f90dcd1c1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/libc_syscalls.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/libc_syscalls.o.d" -o ${OBJECTDIR}/_ext/1171490990/libc_syscalls.o ../src/config/default/libc_syscalls.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/device_deep_sleep.o: ../src/config/default/device_deep_sleep.c  .generated_files/flags/default/1ce72a8d1db77d4609334d15f2a267dd87765faa .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/device_deep_sleep.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/device_deep_sleep.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/device_deep_sleep.o.d" -o ${OBJECTDIR}/_ext/1171490990/device_deep_sleep.o ../src/config/default/device_deep_sleep.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/event_groups.o: ../src/third_party/rtos/FreeRTOS/Source/event_groups.c  .generated_files/flags/default/730ac03ed586d5dae8b06389fa9285c4419b4b76 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/event_groups.o.d" -o ${OBJECTDIR}/_ext/404212886/event_groups.o ../src/third_party/rtos/FreeRTOS/Source/event_groups.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/list.o: ../src/third_party/rtos/FreeRTOS/Source/list.c  .generated_files/flags/default/78a6c592b87932af8c172652694dd0baf98dadc1 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/list.o.d" -o ${OBJECTDIR}/_ext/404212886/list.o ../src/third_party/rtos/FreeRTOS/Source/list.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/freertos_hooks.o: ../src/config/default/freertos_hooks.c  .generated_files/flags/default/8bf35117a863e3cd28ee8b6a0eb2e53dba4db3ab .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/freertos_hooks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/freertos_hooks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/freertos_hooks.o.d" -o ${OBJECTDIR}/_ext/1171490990/freertos_hooks.o ../src/config/default/freertos_hooks.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/504274921/plib_sercom0_usart.o: ../src/config/default/peripheral/sercom/usart/plib_sercom0_usart.c  .generated_files/flags/default/96c1f74ec7a68200f57f690941de65df3c33d787 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/504274921" 
	@${RM} ${OBJECTDIR}/_ext/504274921/plib_sercom0_usart.o.d 
	@${RM} ${OBJECTDIR}/_ext/504274921/plib_sercom0_usart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/504274921/plib_sercom0_usart.o.d" -o ${OBJECTDIR}/_ext/504274921/plib_sercom0_usart.o ../src/config/default/peripheral/sercom/usart/plib_sercom0_usart.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/481755623/ble_dm_conn.o: ../src/config/default/ble/middleware_ble/ble_dm/ble_dm_conn.c  .generated_files/flags/default/34aa11b9ad1694fe26d2c73eb4da2f8d2245317b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/481755623" 
	@${RM} ${OBJECTDIR}/_ext/481755623/ble_dm_conn.o.d 
	@${RM} ${OBJECTDIR}/_ext/481755623/ble_dm_conn.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/481755623/ble_dm_conn.o.d" -o ${OBJECTDIR}/_ext/481755623/ble_dm_conn.o ../src/config/default/ble/middleware_ble/ble_dm/ble_dm_conn.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/60176403/plib_nvm.o: ../src/config/default/peripheral/nvm/plib_nvm.c  .generated_files/flags/default/ec7dfba12bdacec108f44fe92330ee867e2d804a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60176403" 
	@${RM} ${OBJECTDIR}/_ext/60176403/plib_nvm.o.d 
	@${RM} ${OBJECTDIR}/_ext/60176403/plib_nvm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60176403/plib_nvm.o.d" -o ${OBJECTDIR}/_ext/60176403/plib_nvm.o ../src/config/default/peripheral/nvm/plib_nvm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/startup_xc32.o: ../src/config/default/startup_xc32.c  .generated_files/flags/default/7107fc2825c3b7ccf398f7bd84f1274645b4ba3e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/startup_xc32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/1171490990/startup_xc32.o ../src/config/default/startup_xc32.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/163028504/xc32_monitor.o: ../src/config/default/stdio/xc32_monitor.c  .generated_files/flags/default/596330e4328e1bfe42b75ff891a122df63a5047a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/163028504" 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ../src/config/default/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
else
${OBJECTDIR}/_ext/1074542781/app_ble_handler.o: ../src/app_ble/app_ble_handler.c  .generated_files/flags/default/f7ca804619b5661c92c876fd6a9ef8390ed8c30b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1074542781" 
	@${RM} ${OBJECTDIR}/_ext/1074542781/app_ble_handler.o.d 
	@${RM} ${OBJECTDIR}/_ext/1074542781/app_ble_handler.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1074542781/app_ble_handler.o.d" -o ${OBJECTDIR}/_ext/1074542781/app_ble_handler.o ../src/app_ble/app_ble_handler.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1074542781/app_ble.o: ../src/app_ble/app_ble.c  .generated_files/flags/default/ac4f00ed24fae3167de7fdf054069575fedbc9be .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1074542781" 
	@${RM} ${OBJECTDIR}/_ext/1074542781/app_ble.o.d 
	@${RM} ${OBJECTDIR}/_ext/1074542781/app_ble.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1074542781/app_ble.o.d" -o ${OBJECTDIR}/_ext/1074542781/app_ble.o ../src/app_ble/app_ble.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1074542781/app_ble_utility.o: ../src/app_ble/app_ble_utility.c  .generated_files/flags/default/48102bac650bc3e114f61e7108003333153ad71c .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1074542781" 
	@${RM} ${OBJECTDIR}/_ext/1074542781/app_ble_utility.o.d 
	@${RM} ${OBJECTDIR}/_ext/1074542781/app_ble_utility.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1074542781/app_ble_utility.o.d" -o ${OBJECTDIR}/_ext/1074542781/app_ble_utility.o ../src/app_ble/app_ble_utility.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app.o: ../src/app.c  .generated_files/flags/default/296252778e56c194ff25b2b610f3bc1e8212440a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app.o.d" -o ${OBJECTDIR}/_ext/1360937237/app.o ../src/app.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_idle_task.o: ../src/app_idle_task.c  .generated_files/flags/default/1cd17d7f6e6b651e55557fdd9be944e4f34c581 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_idle_task.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_idle_task.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_idle_task.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_idle_task.o ../src/app_idle_task.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/flags/default/2881e53116a2c700c05dc76ef2384f27a5961d44 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1360937237/app_user_edits.o: ../src/app_user_edits.c  .generated_files/flags/default/afda024ee247ffb0556d874fb02819d2671d903b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_user_edits.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_user_edits.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_user_edits.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_user_edits.o ../src/app_user_edits.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/tasks.o: ../src/config/default/tasks.c  .generated_files/flags/default/201ee6ded18998f6c06ea01393865200c85842ea .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/tasks.o.d" -o ${OBJECTDIR}/_ext/1171490990/tasks.o ../src/config/default/tasks.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1865254177/plib_gpio.o: ../src/config/default/peripheral/gpio/plib_gpio.c  .generated_files/flags/default/1e88082c4278a9917f3deb7129bd3e88d73a5434 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865254177" 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865254177/plib_gpio.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865254177/plib_gpio.o.d" -o ${OBJECTDIR}/_ext/1865254177/plib_gpio.o ../src/config/default/peripheral/gpio/plib_gpio.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/initialization.o: ../src/config/default/initialization.c  .generated_files/flags/default/b1aa4162ed970e729f86b37b392d7c3308cd796f .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/initialization.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/initialization.o.d" -o ${OBJECTDIR}/_ext/1171490990/initialization.o ../src/config/default/initialization.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1529399856/osal_freertos_extend.o: ../src/config/default/osal/osal_freertos_extend.c  .generated_files/flags/default/f94c68c49402cf6316c3b1501ac5b842d3810bae .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1529399856" 
	@${RM} ${OBJECTDIR}/_ext/1529399856/osal_freertos_extend.o.d 
	@${RM} ${OBJECTDIR}/_ext/1529399856/osal_freertos_extend.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1529399856/osal_freertos_extend.o.d" -o ${OBJECTDIR}/_ext/1529399856/osal_freertos_extend.o ../src/config/default/osal/osal_freertos_extend.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1665200909/heap_4.o: ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_4.c  .generated_files/flags/default/25d7dd177880e0774c00e320527abdc12eed294e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1665200909" 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1665200909/heap_4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1665200909/heap_4.o.d" -o ${OBJECTDIR}/_ext/1665200909/heap_4.o ../src/third_party/rtos/FreeRTOS/Source/portable/MemMang/heap_4.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1865131932/plib_cmcc.o: ../src/config/default/peripheral/cmcc/plib_cmcc.c  .generated_files/flags/default/6d89a721b73b090422ba181cd59edca6a58d2450 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865131932" 
	@${RM} ${OBJECTDIR}/_ext/1865131932/plib_cmcc.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865131932/plib_cmcc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865131932/plib_cmcc.o.d" -o ${OBJECTDIR}/_ext/1865131932/plib_cmcc.o ../src/config/default/peripheral/cmcc/plib_cmcc.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/exceptions.o: ../src/config/default/exceptions.c  .generated_files/flags/default/aaa6606ad9bee9287d0a5d44064b49fd78fa0270 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/exceptions.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/exceptions.o.d" -o ${OBJECTDIR}/_ext/1171490990/exceptions.o ../src/config/default/exceptions.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/timers.o: ../src/third_party/rtos/FreeRTOS/Source/timers.c  .generated_files/flags/default/9337027decf66e79c418d8fdedd821cc1038414e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/timers.o.d" -o ${OBJECTDIR}/_ext/404212886/timers.o ../src/third_party/rtos/FreeRTOS/Source/timers.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/481755623/ble_dm_dds.o: ../src/config/default/ble/middleware_ble/ble_dm/ble_dm_dds.c  .generated_files/flags/default/6a8155bd490e9ba4b06367075378980715f4dbba .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/481755623" 
	@${RM} ${OBJECTDIR}/_ext/481755623/ble_dm_dds.o.d 
	@${RM} ${OBJECTDIR}/_ext/481755623/ble_dm_dds.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/481755623/ble_dm_dds.o.d" -o ${OBJECTDIR}/_ext/481755623/ble_dm_dds.o ../src/config/default/ble/middleware_ble/ble_dm/ble_dm_dds.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/246609638/port.o: ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c  .generated_files/flags/default/bcc00d58ac5d32f8eb8f151f63b70e3120514f56 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/246609638" 
	@${RM} ${OBJECTDIR}/_ext/246609638/port.o.d 
	@${RM} ${OBJECTDIR}/_ext/246609638/port.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/246609638/port.o.d" -o ${OBJECTDIR}/_ext/246609638/port.o ../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F/port.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1986646378/plib_evsys.o: ../src/config/default/peripheral/evsys/plib_evsys.c  .generated_files/flags/default/de0c9ef012e0cd6f32b754ea3d8dbd60be43424 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1986646378" 
	@${RM} ${OBJECTDIR}/_ext/1986646378/plib_evsys.o.d 
	@${RM} ${OBJECTDIR}/_ext/1986646378/plib_evsys.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1986646378/plib_evsys.o.d" -o ${OBJECTDIR}/_ext/1986646378/plib_evsys.o ../src/config/default/peripheral/evsys/plib_evsys.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1865468468/plib_nvic.o: ../src/config/default/peripheral/nvic/plib_nvic.c  .generated_files/flags/default/3fed66deaeced9a3a83d9a7ddfe9d3aba2983df8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1865468468" 
	@${RM} ${OBJECTDIR}/_ext/1865468468/plib_nvic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1865468468/plib_nvic.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1865468468/plib_nvic.o.d" -o ${OBJECTDIR}/_ext/1865468468/plib_nvic.o ../src/config/default/peripheral/nvic/plib_nvic.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o: ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c  .generated_files/flags/default/7239a7647cdc4b634a52ac901ca5bca9de9b7ae3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o.d" -o ${OBJECTDIR}/_ext/404212886/FreeRTOS_tasks.o ../src/third_party/rtos/FreeRTOS/Source/FreeRTOS_tasks.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/481755623/ble_dm_info.o: ../src/config/default/ble/middleware_ble/ble_dm/ble_dm_info.c  .generated_files/flags/default/4cca5fbf36102133b42a14d0dd93256c8afc5aea .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/481755623" 
	@${RM} ${OBJECTDIR}/_ext/481755623/ble_dm_info.o.d 
	@${RM} ${OBJECTDIR}/_ext/481755623/ble_dm_info.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/481755623/ble_dm_info.o.d" -o ${OBJECTDIR}/_ext/481755623/ble_dm_info.o ../src/config/default/ble/middleware_ble/ble_dm/ble_dm_info.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/croutine.o: ../src/third_party/rtos/FreeRTOS/Source/croutine.c  .generated_files/flags/default/499c644cda77536e8e8cce893389b6f1aa342a4 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/croutine.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/croutine.o.d" -o ${OBJECTDIR}/_ext/404212886/croutine.o ../src/third_party/rtos/FreeRTOS/Source/croutine.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/481755623/ble_dm.o: ../src/config/default/ble/middleware_ble/ble_dm/ble_dm.c  .generated_files/flags/default/6cdca26f2747ab342b929e42b52a2bac69fa8c2d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/481755623" 
	@${RM} ${OBJECTDIR}/_ext/481755623/ble_dm.o.d 
	@${RM} ${OBJECTDIR}/_ext/481755623/ble_dm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/481755623/ble_dm.o.d" -o ${OBJECTDIR}/_ext/481755623/ble_dm.o ../src/config/default/ble/middleware_ble/ble_dm/ble_dm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/481755623/ble_dm_sm.o: ../src/config/default/ble/middleware_ble/ble_dm/ble_dm_sm.c  .generated_files/flags/default/5b18d4c08df14900188a2c877afa6d7a52f391d8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/481755623" 
	@${RM} ${OBJECTDIR}/_ext/481755623/ble_dm_sm.o.d 
	@${RM} ${OBJECTDIR}/_ext/481755623/ble_dm_sm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/481755623/ble_dm_sm.o.d" -o ${OBJECTDIR}/_ext/481755623/ble_dm_sm.o ../src/config/default/ble/middleware_ble/ble_dm/ble_dm_sm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/60165520/plib_clk.o: ../src/config/default/peripheral/clk/plib_clk.c  .generated_files/flags/default/b9061ca3819f4e0265203e665cda638208dbbc95 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60165520" 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o.d 
	@${RM} ${OBJECTDIR}/_ext/60165520/plib_clk.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60165520/plib_clk.o.d" -o ${OBJECTDIR}/_ext/60165520/plib_clk.o ../src/config/default/peripheral/clk/plib_clk.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1529399856/osal_freertos.o: ../src/config/default/osal/osal_freertos.c  .generated_files/flags/default/cbb285f0c9c1557bbe1948bc6b6e9a346940082e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1529399856" 
	@${RM} ${OBJECTDIR}/_ext/1529399856/osal_freertos.o.d 
	@${RM} ${OBJECTDIR}/_ext/1529399856/osal_freertos.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1529399856/osal_freertos.o.d" -o ${OBJECTDIR}/_ext/1529399856/osal_freertos.o ../src/config/default/osal/osal_freertos.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/60180175/plib_rtc_timer.o: ../src/config/default/peripheral/rtc/plib_rtc_timer.c  .generated_files/flags/default/f89c2abf73d81cd2574e530014293fa25e82659e .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60180175" 
	@${RM} ${OBJECTDIR}/_ext/60180175/plib_rtc_timer.o.d 
	@${RM} ${OBJECTDIR}/_ext/60180175/plib_rtc_timer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60180175/plib_rtc_timer.o.d" -o ${OBJECTDIR}/_ext/60180175/plib_rtc_timer.o ../src/config/default/peripheral/rtc/plib_rtc_timer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/889830802/mw_aes.o: ../src/config/default/ble/middleware_ble/ble_util/mw_aes.c  .generated_files/flags/default/4b4b39f7773aa818d8a6ad360277784d4e63d954 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/889830802" 
	@${RM} ${OBJECTDIR}/_ext/889830802/mw_aes.o.d 
	@${RM} ${OBJECTDIR}/_ext/889830802/mw_aes.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/889830802/mw_aes.o.d" -o ${OBJECTDIR}/_ext/889830802/mw_aes.o ../src/config/default/ble/middleware_ble/ble_util/mw_aes.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/interrupts.o: ../src/config/default/interrupts.c  .generated_files/flags/default/d90b2dd42d9cf14706b7c9e54095ea92605d9d83 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/interrupts.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/interrupts.o.d" -o ${OBJECTDIR}/_ext/1171490990/interrupts.o ../src/config/default/interrupts.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/device_sleep.o: ../src/config/default/device_sleep.c  .generated_files/flags/default/5e3985bc4bcc595fab360ba4df2e5e1fad4f3d98 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/device_sleep.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/device_sleep.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/device_sleep.o.d" -o ${OBJECTDIR}/_ext/1171490990/device_sleep.o ../src/config/default/device_sleep.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/stream_buffer.o: ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c  .generated_files/flags/default/9ca9d5755bedf7132768f56dfc6e80da45787de6 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/stream_buffer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/stream_buffer.o.d" -o ${OBJECTDIR}/_ext/404212886/stream_buffer.o ../src/third_party/rtos/FreeRTOS/Source/stream_buffer.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/queue.o: ../src/third_party/rtos/FreeRTOS/Source/queue.c  .generated_files/flags/default/7b29e95e62fe159bed3516628d9359da8258055d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/queue.o.d" -o ${OBJECTDIR}/_ext/404212886/queue.o ../src/third_party/rtos/FreeRTOS/Source/queue.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/libc_syscalls.o: ../src/config/default/libc_syscalls.c  .generated_files/flags/default/ae9e0035823f3f2c949777994ced8c355bd9140a .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/libc_syscalls.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/libc_syscalls.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/libc_syscalls.o.d" -o ${OBJECTDIR}/_ext/1171490990/libc_syscalls.o ../src/config/default/libc_syscalls.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/device_deep_sleep.o: ../src/config/default/device_deep_sleep.c  .generated_files/flags/default/180a84dde85b96cd81fe46580655aa16dc87ab5b .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/device_deep_sleep.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/device_deep_sleep.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/device_deep_sleep.o.d" -o ${OBJECTDIR}/_ext/1171490990/device_deep_sleep.o ../src/config/default/device_deep_sleep.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/event_groups.o: ../src/third_party/rtos/FreeRTOS/Source/event_groups.c  .generated_files/flags/default/2244c14566c20399f866120ba664ff8aed77c098 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/event_groups.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/event_groups.o.d" -o ${OBJECTDIR}/_ext/404212886/event_groups.o ../src/third_party/rtos/FreeRTOS/Source/event_groups.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/404212886/list.o: ../src/third_party/rtos/FreeRTOS/Source/list.c  .generated_files/flags/default/4bb75f095e8aa0f98d84db0fe6b40bde36b0c6ac .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/404212886" 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o.d 
	@${RM} ${OBJECTDIR}/_ext/404212886/list.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/404212886/list.o.d" -o ${OBJECTDIR}/_ext/404212886/list.o ../src/third_party/rtos/FreeRTOS/Source/list.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/freertos_hooks.o: ../src/config/default/freertos_hooks.c  .generated_files/flags/default/4c74ac799080c36550c8e9315713fbff59d95e20 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/freertos_hooks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/freertos_hooks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/freertos_hooks.o.d" -o ${OBJECTDIR}/_ext/1171490990/freertos_hooks.o ../src/config/default/freertos_hooks.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/504274921/plib_sercom0_usart.o: ../src/config/default/peripheral/sercom/usart/plib_sercom0_usart.c  .generated_files/flags/default/b07e20154206029cb96e90c0a06f217e8c6e6ecb .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/504274921" 
	@${RM} ${OBJECTDIR}/_ext/504274921/plib_sercom0_usart.o.d 
	@${RM} ${OBJECTDIR}/_ext/504274921/plib_sercom0_usart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/504274921/plib_sercom0_usart.o.d" -o ${OBJECTDIR}/_ext/504274921/plib_sercom0_usart.o ../src/config/default/peripheral/sercom/usart/plib_sercom0_usart.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/481755623/ble_dm_conn.o: ../src/config/default/ble/middleware_ble/ble_dm/ble_dm_conn.c  .generated_files/flags/default/b4c3509f15b26cd0c8ea62915bd5d7ee1fe9123d .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/481755623" 
	@${RM} ${OBJECTDIR}/_ext/481755623/ble_dm_conn.o.d 
	@${RM} ${OBJECTDIR}/_ext/481755623/ble_dm_conn.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/481755623/ble_dm_conn.o.d" -o ${OBJECTDIR}/_ext/481755623/ble_dm_conn.o ../src/config/default/ble/middleware_ble/ble_dm/ble_dm_conn.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/60176403/plib_nvm.o: ../src/config/default/peripheral/nvm/plib_nvm.c  .generated_files/flags/default/cb13a25e90a333d9707dd4f9e34192705de536b8 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/60176403" 
	@${RM} ${OBJECTDIR}/_ext/60176403/plib_nvm.o.d 
	@${RM} ${OBJECTDIR}/_ext/60176403/plib_nvm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/60176403/plib_nvm.o.d" -o ${OBJECTDIR}/_ext/60176403/plib_nvm.o ../src/config/default/peripheral/nvm/plib_nvm.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/1171490990/startup_xc32.o: ../src/config/default/startup_xc32.c  .generated_files/flags/default/deef4c407f2460999b1e3b66457578fd1df113a3 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/1171490990" 
	@${RM} ${OBJECTDIR}/_ext/1171490990/startup_xc32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1171490990/startup_xc32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1171490990/startup_xc32.o.d" -o ${OBJECTDIR}/_ext/1171490990/startup_xc32.o ../src/config/default/startup_xc32.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
${OBJECTDIR}/_ext/163028504/xc32_monitor.o: ../src/config/default/stdio/xc32_monitor.c  .generated_files/flags/default/71a1d4af1f64a58505283bf35feaa5ccb1077b12 .generated_files/flags/default/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/163028504" 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d 
	@${RM} ${OBJECTDIR}/_ext/163028504/xc32_monitor.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -fdata-sections -O1 -fcommon -I"../src" -I"../src/app_ble" -I"../src/config/default" -I"../src/config/default/ble/lib/include" -I"../src/config/default/ble/middleware_ble" -I"../src/config/default/ble/profile_ble" -I"../src/config/default/ble/service_ble" -I"../src/config/default/driver/pds/include" -I"../src/packs/CMSIS/" -I"../src/packs/CMSIS/CMSIS/Core/Include" -I"../src/packs/WBZ351_DFP" -I"../src/third_party/rtos/FreeRTOS/Source/include" -I"../src/third_party/rtos/FreeRTOS/Source/portable/GCC/SAM/ARM_CM4F" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/163028504/xc32_monitor.o.d" -o ${OBJECTDIR}/_ext/163028504/xc32_monitor.o ../src/config/default/stdio/xc32_monitor.c    -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}/WBZ35" ${PACK_COMMON_OPTIONS} 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/legacy_adv_sleep.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../src/config/default/ble/lib/ble_stack_bz3_lib.a ../src/config/default/driver/pds/pds.a ../src/config/default/driver/device_support/pic32cx_bz3_device_support.a  ../src/config/default/WBZ351.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -mno-device-startup-code -o ${DISTDIR}/legacy_adv_sleep.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    ..\src\config\default\ble\lib\ble_stack_bz3_lib.a ..\src\config\default\driver\pds\pds.a ..\src\config\default\driver\device_support\pic32cx_bz3_device_support.a      -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=512,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}/WBZ35"
	
else
${DISTDIR}/legacy_adv_sleep.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../src/config/default/ble/lib/ble_stack_bz3_lib.a ../src/config/default/driver/pds/pds.a ../src/config/default/driver/device_support/pic32cx_bz3_device_support.a ../src/config/default/WBZ351.ld
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -mno-device-startup-code -o ${DISTDIR}/legacy_adv_sleep.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}    ..\src\config\default\ble\lib\ble_stack_bz3_lib.a ..\src\config\default\driver\pds\pds.a ..\src\config\default\driver\device_support\pic32cx_bz3_device_support.a      -DXPRJ_default=$(CND_CONF)    $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=512,--gc-sections,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml -mdfp="${DFP_DIR}/WBZ35"
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/legacy_adv_sleep.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif

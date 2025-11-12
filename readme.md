![Microchip logo](https://raw.githubusercontent.com/wiki/Microchip-MPLAB-Harmony/Microchip-MPLAB-Harmony.github.io/images/microchip_logo.png)
![Harmony logo small](https://raw.githubusercontent.com/wiki/Microchip-MPLAB-Harmony/Microchip-MPLAB-Harmony.github.io/images/microchip_mplab_harmony_logo_small.png)

# MPLAB® Harmony 3 Wireless BLE, and Zigbee Application Examples

MPLAB® Harmony 3 is an extension of the MPLAB® ecosystem for creating embedded firmware 
solutions for Microchip 32-bit SAM and PIC® microcontroller and microprocessor devices.  
Refer to the following links for more information.

- [Microchip 32-bit MCUs](https://www.microchip.com/design-centers/32-bit)
- [Microchip 32-bit MPUs](https://www.microchip.com/design-centers/32-bit-mpus)
- [Microchip MPLAB X IDE](https://www.microchip.com/mplab/mplab-x-ide)
- [Microchip MPLAB® Harmony](https://www.microchip.com/mplab/mplab-harmony)
- [Microchip MPLAB® Harmony Pages](https://microchip-mplab-harmony.github.io/)

This repository contains the MPLAB® Harmony 3 Wireless BLE, and Zigbee Application Examples solutions and example applications. 
Quickly incorporate connectivity to your designs with Wireless BLE, and Zigbee Application Examples ICs, modules, software and 
development kits that make connecting effortless for your customers. 
Our comprehensive Wireless BLE, and Zigbee Application Examples portfolio has the technology to meet your range, data rate, interoperability, frequency and topology needs. Refer to the following links for release notes, training materials, and interface reference information.

- [Release Notes](./release_notes.md)
- [MPLAB® Harmony License](mplab_harmony_license.md)

# Contents Summary

| Folder     | Description                                               |
| ---        | ---                                                       |
| apps       | [Example applications for PIC32CXB3/PIC32CX-BZ36/WBZ35x devices](./apps/readme.md)         |

## Code Examples

The following applications are provided to demonstrate the typical use case of one or more Peripheral libraries.

| BLE Examples | Families |
| --- | :---: |
| [BLE peripheral Legacy Adv](apps/ble/building_blocks/peripheral/legacy_adv/readme.md) | PIC32CX-BZ3 |
| [BLE peripheral Legacy Adv_Sleep](apps/ble/building_blocks/peripheral/legacy_adv_sleep/readme.md) | PIC32CX-BZ3 |
| [BLE peripheral Ext Adv](apps/ble/building_blocks/peripheral/ext_adv/readme.md) | PIC32CX-BZ3 |
| [BLE Peripheral Connection](apps/ble/building_blocks/peripheral/peripheral_conn/readme.md) | PIC32CX-BZ3 |
| [BLE Deep Sleep Adv](apps/ble/building_blocks/peripheral/deep_sleep_adv/readme.md) | PIC32CX-BZ3/PIC32CX-BZ36 |
| [BLE Custom Service](apps/ble/building_blocks/peripheral/profiles_services/custom_service/readme.md) | PIC32CX-BZ3 |
| [BLE peripheral transparent UART](apps/ble/building_blocks/peripheral/profiles_services/peripheral_trp_uart/readme.md) | PIC32CX-BZ3 |
| [BLE Central Legacy Scan](apps/ble/building_blocks/central/legacy_scan/readme.md) | PIC32CX-BZ3 |
| [BLE Central Scan Ext Adv](apps/ble/building_blocks/central/scan_ext_adv/readme.md) | PIC32CX-BZ3 |
| [BLE Central Connection](apps/ble/building_blocks/central/central_conn/readme.md) | PIC32CX-BZ3 |
| [BLE Central transparent UART](apps/ble/building_blocks/central/profiles_services/central_trp_uart/readme.md) | PIC32CX-BZ3 |
| [BLE Central Multilink](apps/ble/building_blocks/central/profiles_services/multilink/readme.md) | PIC32CX-BZ3 |
| [BLE Multirole](apps/ble/building_blocks/multirole/readme.md) | PIC32CX-BZ3 |
| [Bootloader](apps/bootloader/readme.md) | PIC32CX-BZ3 |
| [BLE Central Code PHY transparent UART](apps/ble/building_blocks/central/profiles_services/central_trp_uart_codedPhy/readme.md) | PIC32CX-BZ3 |
| [BLE Peripheral PATH Loss Advertisement](apps/ble/building_blocks/peripheral/Legacy_ADV_Pathloss/readme.md) | PIC32CX-BZ3 |
| [BLE peripheral Code PHY transparent UART](apps/ble/building_blocks/peripheral/profiles_services/peripheral_trp_uart_codedPhy/readme.md) | PIC32CX-BZ3 |
| [BLE Peripheral BLE Multiple Advertising Sets](apps/ble/building_blocks/peripheral/two_set_adv/readme.md) | PIC32CX-BZ3 |
| [BLE Sensor touch](apps/ble/advanced_applications/ble_sensor_touch/readme.md) | PIC32CX-BZ3 |
| [BLE Throughput](apps/ble/advanced_applications/ble_throughput/readme.md) | PIC32CX-BZ3 |
| [BLE Peripheral ANCS](apps/ble/advanced_applications/ble_ancs_app/readme.md) | PIC32CX-BZ3 |
| [BLE Peripheral HOGPS or HID Profile](apps/ble/advanced_applications/ble_hogps_app/readme.md) | PIC32CX-BZ3 |
| [BLE Peripheral ANPC](apps/ble/advanced_applications/ble_anpc_app/readme.md) | PIC32CX-BZ3 |
| [BLE Peripheral ANPS](apps/ble/advanced_applications/ble_anps_app/readme.md) | PIC32CX-BZ3 |
| [BLE Proximity Monitor PXPM](apps/ble/advanced_applications/ble_pxpm_app/readme.md) | PIC32CX-BZ3 |
| [BLE Proximity Reporter PXPR](apps/ble/advanced_applications/ble_pxpr_app/readme.md) | PIC32CX-BZ3 |

| IEEE_802_15_4 Applications | Families |
| --- | :---: |
| [IEEE_802_15_4 demoapp_ffd](apps/ieee_802_15_4/MAC/push_pull_mac_app/demoapp_ffd/readme.md) | PIC32CX-BZ3 |
| [IEEE_802_15_4 demoapp_rfd](apps/ieee_802_15_4/MAC/push_pull_mac_app/demoapp_rfd/readme.md) | PIC32CX-BZ3 |
| [IEEE_802_15_4 p2p_phy](apps/ieee_802_15_4/PHY/p2p_phy/readme.md) | PIC32CX-BZ3 |

| Thread Applications | Families |
| --- | :---: |
| [Thread cli_ftd](apps/thread/building_blocks/cli/cli_ftd/readme.md) | PIC32CX-BZ3 |
| [Thread cli_mtd](apps/thread/building_blocks/cli/cli_mtd/readme.md) | PIC32CX-BZ3 |
| [Thread demo_app_udp_ftd](apps/thread/building_blocks/demo_app_udp/demo_app_udp_ftd/readme.md) | PIC32CX-BZ3 |
| [Thread demo_app_udp_mtd](apps/thread/building_blocks/demo_app_udp/demo_app_udp_mtd/readme.md) | PIC32CX-BZ3 |
| [Thread rcp_uart](apps/thread/building_blocks/rcp_uart/readme.md) | PIC32CX-BZ3 |
| [Thread CoAP coap_ftd_client](apps/thread/advanced_applications/CoAP/coap_ftd_client/readme.md) | PIC32CX-BZ3 |
| [Thread CoAP coap_ftd_server](apps/thread/advanced_applications/CoAP/coap_ftd_server/readme.md) | PIC32CX-BZ3 |
| [Thread CoAP coap_sed_client](apps/thread/advanced_applications/CoAP/coap_sed_client/readme.md) | PIC32CX-BZ3 |
| [Thread CoAP coap_sed_server](apps/thread/advanced_applications/CoAP/coap_sed_server/readme.md) | PIC32CX-BZ3 |


| Zigbee Examples | Families |
| --- | :---: |
| [Zigbee Combined Interface (Coordinator)](apps/zigbee/combinedInterface/readme.md) | PIC32CX-BZ3 |
| [Zigbee Extended Lights (Router)](apps/zigbee/ext_light/readme.md) | PIC32CX-BZ3 |
| [Zigbee End Device (End Device)](apps/zigbee/multisensor/readme.md) | PIC32CX-BZ3 |
| [Zigbee Custom Cluster Server](apps/zigbee/custom_cluster_server/readme.md) | PIC32CX-BZ3 |
| [Zigbee Custom Occupancy Light](apps/zigbee/custom_occupancy_light/readme.md) | PIC32CX-BZ3 |
| [Zigbee Custom Cluster Client](apps/zigbee/custom_cluster_client/readme.md) | PIC32CX-BZ3 |
| [Zigbee Multisensor DeepSleep](apps/zigbee/multisensor_deepSleep/readme.md) | PIC32CX-BZ3 |
| [Zigbee CSC Sleep Touch](apps/zigbee/csc_sleep_touch/readme.md) | PIC32CX-BZ3 |
| [Zigbee Dimmable Light](apps/zigbee/dim_light_touch/readme.md) | PIC32CX-BZ3 |
____


[![License](https://img.shields.io/badge/license-Harmony%20license-orange.svg)](https://github.com/Microchip-MPLAB-Harmony/wireless_apps_pic32cxbz3_wbz35/blob/master/mplab_harmony_license.md)
[![Latest release](https://img.shields.io/github/release/Microchip-MPLAB-Harmony/wireless_apps_pic32cxbz3_wbz35.svg)](https://github.com/Microchip-MPLAB-Harmony/wireless_apps_pic32cxbz3_wbz35/releases/latest)
[![Latest release date](https://img.shields.io/github/release-date/Microchip-MPLAB-Harmony/wireless_apps_pic32cxbz3_wbz35.svg)](https://github.com/Microchip-MPLAB-Harmony/wireless_apps_pic32cxbz3_wbz35/releases/latest)
[![Commit activity](https://img.shields.io/github/commit-activity/y/Microchip-MPLAB-Harmony/wireless_apps_pic32cxbz3_wbz35.svg)](https://github.com/Microchip-MPLAB-Harmony/wireless_apps_pic32cxbz3_wbz35/graphs/commit-activity)
[![Contributors](https://img.shields.io/github/contributors-anon/Microchip-MPLAB-Harmony/wireless_apps_pic32cxbz3_wbz35.svg)]()

____

[![Developer Help](https://img.shields.io/badge/Youtube-Developer%20Help-red.svg)](https://www.youtube.com/MicrochipDeveloperHelp)
[![Developer Help](https://img.shields.io/badge/XWiki-Developer%20Help-torquiose.svg)](https://developerhelp.microchip.com/xwiki/bin/view/software-tools/harmony/)
[![Follow us on Youtube](https://img.shields.io/badge/Youtube-Follow%20us%20on%20Youtube-red.svg)](https://www.youtube.com/user/MicrochipTechnology)
[![Follow us on LinkedIn](https://img.shields.io/badge/LinkedIn-Follow%20us%20on%20LinkedIn-blue.svg)](https://www.linkedin.com/company/microchip-technology)
[![Follow us on Facebook](https://img.shields.io/badge/Facebook-Follow%20us%20on%20Facebook-blue.svg)](https://www.facebook.com/microchiptechnology/)
[![Follow us on Twitter](https://img.shields.io/twitter/follow/MicrochipTech.svg?style=social)](https://twitter.com/MicrochipTech)

[![MCHP](https://www.microchip.com/ResourcePackages/Microchip/assets/dist/images/logo.png)](https://www.microchip.com)
# Examples applications

The following applications are provided to demonstrate the typical use case of BLE, Zigbee and Multiprotocol(BLE + Zigbee) with PIC32CX_BZ3/WBZ35x devices.

## BLE

### BLE Building Blocks

* [Getting Started](ble/building_blocks/readme.md)
    * [Peripheral](ble/building_blocks/peripheral/readme.md)
        * [FreeRtos and BLE Stack Setup](ble/building_blocks/peripheral/freertos_ble_stack_init_peripheral.md)
        * [Adding UART](ble/building_blocks/chip_peripherals/uart_hello_world/readme.md)
		* [BLE Deep Sleep Adv](ble/building_blocks/peripheral/deep_sleep_adv/readme.md)
        * [Extended Advertisement](ble/building_blocks/peripheral/ext_adv/readme.md)		
        * [Legacy Advertisement](ble/building_blocks/peripheral/legacy_adv/readme.md)
		* [BLE Peripheral PATH Loss Advertisement](ble/building_blocks/peripheral/legacy_adv_pathloss/readme.md)
        * [BLE peripheral Legacy Adv](ble/building_blocks/peripheral/legacy_adv_sleep/readme.md)		
        * [Connection](ble/building_blocks/peripheral/peripheral_conn/readme.md)
        * [Profiles and Services](ble/building_blocks/peripheral/profiles_services/readme.md)		
        * [Transparent UART](ble/building_blocks/peripheral/profiles_services/peripheral_trp_uart/readme.md)
        * [Custom Service](ble/building_blocks/peripheral/profiles_services/custom_service/readme.md)
		* [BLE Custom Service](ble/building_blocks/peripheral/profiles_services/peripheral_trp_uart/readme.md)
		* [BLE Peripheral BLE Multiple Advertising Sets](ble/building_blocks/peripheral/two_set_adv/readme.md)
	* [BLE Central Code PHY transparent UART](apps/ble/building_blockscentral/profiles_services/central_trp_uart_codedPhy/readme.md)
    * [Central](ble/building_blocks/central/readme.md)
        * [FreeRtos and BLE Stack Setup](ble/building_blocks/central/freertos_ble_stack_init_central.md)
        * [Connection](ble/building_blocks/central/central_conn/readme.md)
        * [Legacy Scan](ble/building_blocks/central/legacy_scan/readme.md)
        * [Profiles and Services](ble/building_blocks/central/profiles_services/readme.md)
        * [Transparent UART](ble/building_blocks/central/profiles_services/central_trp_uart/readme.md)
		* [BLE Central Code PHY transparent UART](apps/ble/building_blockscentral/profiles_services/central_trp_uart_codedPhy/readme.md)
        * [Transparent UART Multilink](ble/building_blocks/central/profiles_services/multilink/readme.md)
        * [Scan Extended Advertisement](ble/building_blocks/central/scan_ext_adv/readme.md)
	* [UART](ble/building_blocks/chip_peripherals/uart_hello_world/readme.md)
    * [Multirole](ble/building_blocks/multirole/multilink/readme.md)

### BLE Advanced Applications
* [BLE Peripheral ANCS](apps/ble/advanced_applications/ble_ancs_app/readme.md)
* [BLE Peripheral HOGPS or HID Profile](apps/ble/advanced_applications/ble_hogps_app/readme.md)
* [BLE Sensor App](ble/advanced_applications/ble_sensor_touch/readme.md)
* [BLE Throughput](ble/advanced_applications/ble_throughput/readme.md)

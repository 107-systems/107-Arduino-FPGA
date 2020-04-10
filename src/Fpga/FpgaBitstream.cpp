/**
 * @brief   Arduino library containing FPGA configuration and MCU interface code for the MKR VIDOR 4000 based Viper quadcopter.
 * @license LGPL 3.0
 */

/**************************************************************************************
 * INCLUDE
 **************************************************************************************/

#include <stdint.h>

/**************************************************************************************
 * DEFINES
 **************************************************************************************/

#define SIGNATURE_NO_DATA \
  0xFF, 0xFF, 0xFF, 0xFF, \
  0xFF, 0xFF, 0xFF, 0xFF, \
  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, \
  0xFF, 0xFF, 0xFF, 0xFF, \
  0x00, 0x00, 0x00, 0x00  \

#define NO_BOOTLOADER  SIGNATURE_NO_DATA
#define NO_APP         SIGNATURE_NO_DATA
#define NO_USER_DATA   SIGNATURE_NO_DATA

/**************************************************************************************
 * CONSTANTS
 **************************************************************************************/

/* The signature has the following structure:
 *   - uint32_t offset;
 *   - uint32_t length;
 *   - uint32_t sha256sum[8];
 *   - uint32_t type;
 *   - uint32_t force;
 */

/* The bootloader code which uses the signature to determine whether or not to load
 * to the FPGA can be found here:
 * https://github.com/arduino/ArduinoCore-samd/blob/020b419fc1dbca49b23b7c0b5e47d50fb2a04485/bootloaders/zero/sam_ba_monitor.c#L443:L512
 */

__attribute__ ((used, section(".fpga_bitstream_signature")))
const unsigned char signatures[4096] = {
  #include "signature.h"
};

__attribute__ ((used, section(".fpga_bitstream")))
uint8_t const bitstream[] = {
  #include "bitstream.ttf"
};

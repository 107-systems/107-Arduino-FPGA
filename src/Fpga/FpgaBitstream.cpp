/**
 * @brief   Arduino library containing FPGA configuration and MCU interface code for the MKR VIDOR 4000 based Viper quadcopter.
 * @license LGPL 3.0
 */

/**************************************************************************************
 * INCLUDE
 **************************************************************************************/

#include <stdint.h>

/**************************************************************************************
 * CONSTANTS
 **************************************************************************************/

__attribute__ ((used, section(".fpga_bitstream")))
uint8_t const bitstream[] = {
  #include "bitstream.ttf"
};

/* This sketch contains the firmware for the MKR VIDOR 4000
 * based quadcopter flight controller codename 'Viper'.
 */

#ifndef VIPER_CONST_H_
#define VIPER_CONST_H_

/**************************************************************************************
 * NAMESPACE
 **************************************************************************************/

namespace viper
{

/**************************************************************************************
 * CONSTANTS
 **************************************************************************************/

static int const BMP388_CS_PIN   = 2;
static int const FPGA_CS_PIN     = 3; /* Pin 3 = D3 = PA11 */
static int const MCP2515_CS_PIN  = 4;
static int const BMP388_INT_PIN  = 6;
static int const MCP2515_INT_PIN = 7;

/**************************************************************************************
 * NAMESPACE
 **************************************************************************************/

} /* viper */

#endif /* VIPER_CONST_H_ */

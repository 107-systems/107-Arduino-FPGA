/**
 * @brief   Arduino library containing FPGA configuration and MCU interface code for the MKR VIDOR 4000 based Viper quadcopter.
 * @author  Alexander Entinger, MSc / LXRobotics GmbH
 * @license LGPL 3.0
 */

/**************************************************************************************
 * INCLUDE
 **************************************************************************************/

#include <ArduinoViperFpga.h>

/**************************************************************************************
 * PUBLIC MEMBER FUNCTIONS
 **************************************************************************************/

ArduinoViperFpga::Status ArduinoViperFpga::begin()
{
  return Status::OK;
}

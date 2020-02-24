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
 * EXTERN DECLARATIONS
 **************************************************************************************/

extern void enableFpgaClock(); /* Defined within MKRVIDOR4000/variant.cpp */

/**************************************************************************************
 * CTOR/DTOR
 **************************************************************************************/

ArduinoViperFpga::ArduinoViperFpga()
: _io_reg(SPI)
{

}

/**************************************************************************************
 * PUBLIC MEMBER FUNCTIONS
 **************************************************************************************/

ArduinoViperFpga::Status ArduinoViperFpga::begin()
{
  enableFpgaClock();
  return Status::OK;
}

ArduinoViperFpga::Status ArduinoViperFpga::setIntensityRed(uint8_t const red)
{
  _io_reg.write(ViperFpga::Register::RGB_LED_RED_INTENSITY, red);
  return Status::OK;
}

ArduinoViperFpga::Status ArduinoViperFpga::setIntensityGreen(uint8_t const green)
{
  _io_reg.write(ViperFpga::Register::RGB_LED_GREEN_INTENSITY, green);
  return Status::OK;
}

ArduinoViperFpga::Status ArduinoViperFpga::setIntensityBlue(uint8_t const blue)
{
  _io_reg.write(ViperFpga::Register::RGB_LED_BLUE_INTENSITY, blue);
  return Status::OK;
}

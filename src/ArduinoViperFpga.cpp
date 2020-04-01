/**
 * @brief   Arduino library containing FPGA configuration and MCU interface code for the MKR VIDOR 4000 based Viper quadcopter.
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

ArduinoViperFpga::ArduinoViperFpga(Fpga::SpiSelectFunc select, Fpga::SpiDeselectFunc deselect, Fpga::SpiTransferFunc transfer)
: _io(select, deselect, transfer)
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

uint8_t ArduinoViperFpga::getRevNum()
{
  return _io.read(Fpga::Register::FPGA_REV_NUM);
}

ArduinoViperFpga::Status ArduinoViperFpga::setIntensityRed(uint8_t const red)
{
  _io.write(Fpga::Register::RGB_LED_RED_INTENSITY, red);
  return Status::OK;
}

ArduinoViperFpga::Status ArduinoViperFpga::setIntensityGreen(uint8_t const green)
{
  _io.write(Fpga::Register::RGB_LED_GREEN_INTENSITY, green);
  return Status::OK;
}

ArduinoViperFpga::Status ArduinoViperFpga::setIntensityBlue(uint8_t const blue)
{
  _io.write(Fpga::Register::RGB_LED_BLUE_INTENSITY, blue);
  return Status::OK;
}

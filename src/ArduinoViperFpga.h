/**
 * @brief   Arduino library containing FPGA configuration and MCU interface code for the MKR VIDOR 4000 based Viper quadcopter.
 * @license LGPL 3.0
 */

#ifndef ARDUINO_VIPER_FPGA_H_
#define ARDUINO_VIPER_FPGA_H_

/**************************************************************************************
 * INCLUDE
 **************************************************************************************/

#include "ViperFpga/FpgaIo.h"

/**************************************************************************************
 * CLASS DECLARATION
 **************************************************************************************/

class ArduinoViperFpga
{

public:

  ArduinoViperFpga(ViperFpga::SpiSelectFunc select, ViperFpga::SpiDeselectFunc deselect, ViperFpga::SpiTransferFunc transfer);


  enum class Status : int
  {
    OK = 0
  };


  Status begin();

  uint8_t getRevNum();

  Status setIntensityRed  (uint8_t const red);
  Status setIntensityGreen(uint8_t const green);
  Status setIntensityBlue (uint8_t const blue);


private:

  ViperFpga::FpgaIo _io;

};

#endif /* ARDUINO_VIPER_FPGA_H_ */

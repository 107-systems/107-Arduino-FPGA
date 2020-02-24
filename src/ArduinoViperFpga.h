/**
 * @brief   Arduino library containing FPGA configuration and MCU interface code for the MKR VIDOR 4000 based Viper quadcopter.
 * @author  Alexander Entinger, MSc / LXRobotics GmbH
 * @license LGPL 3.0
 */

#ifndef ARDUINO_VIPER_FPGA_H_
#define ARDUINO_VIPER_FPGA_H_

/**************************************************************************************
 * INCLUDE
 **************************************************************************************/

#include "ViperFpga/RegisterIo.h"

/**************************************************************************************
 * CLASS DECLARATION
 **************************************************************************************/

class ArduinoViperFpga
{

public:

  ArduinoViperFpga();


  enum class Status : int
  {
    OK = 0
  };


  Status begin();

  Status setIntensityRed  (uint8_t const red);
  Status setIntensityGreen(uint8_t const green);
  Status setIntensityBlue (uint8_t const blue);


private:

  ViperFpga::RegisterIo _io_reg;

};

#endif /* ARDUINO_VIPER_FPGA_H_ */

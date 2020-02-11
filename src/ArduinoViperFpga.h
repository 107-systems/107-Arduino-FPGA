/**
 * @brief   Arduino library containing FPGA configuration and MCU interface code for the MKR VIDOR 4000 based Viper quadcopter.
 * @author  Alexander Entinger, MSc / LXRobotics GmbH
 * @license LGPL 3.0
 */

#ifndef ARDUINO_VIPER_FPGA_H_
#define ARDUINO_VIPER_FPGA_H_

/**************************************************************************************
 * CLASS DECLARATION
 **************************************************************************************/

class ArduinoViperFpga
{

public:

  enum class Status : int
  {
    OK = 0
  };


  Status begin();

};

#endif /* ARDUINO_VIPER_FPGA_H_ */

/**
 * @brief   Arduino library containing FPGA configuration and MCU interface code for the MKR VIDOR 4000 based Viper quadcopter.
 * @author  Alexander Entinger, MSc / LXRobotics GmbH
 * @license LGPL 3.0
 */

#ifndef ARDUINO_VIPER_FPGA_REGISTER_IO_H_
#define ARDUINO_VIPER_FPGA_REGISTER_IO_H_

/**************************************************************************************
 * INCLUDE
 **************************************************************************************/

#include <stdint.h>

#include <SPI.h>

/**************************************************************************************
 * NAMESPACE
 **************************************************************************************/

namespace ViperFpga
{

/**************************************************************************************
 * CONSTANTS
 **************************************************************************************/

static int const FPGA_CS_PIN = 3; /* Pin 3 = D3 = PA11 */

/**************************************************************************************
 * TYPEDEF
 **************************************************************************************/

enum class Register : uint8_t
{
  FPGA_REV_NUM            = 0x00,
  RGB_LED_RED_INTENSITY   = 0x01,
  RGB_LED_GREEN_INTENSITY = 0x02,
  RGB_LED_BLUE_INTENSITY  = 0x03
};

/**************************************************************************************
 * CLASS DECLARATION
 **************************************************************************************/

class RegisterIo
{

public:

  RegisterIo(SPIClass & spi, int const fpga_cs_pin = FPGA_CS_PIN);

  void    begin();

  uint8_t read (Register const reg);
  void    write(Register const reg, uint8_t const reg_val);


private:

  SPIClass & _spi;
  int const _fpga_cs_pin;

  void select  ();
  void deselect();

};

/**************************************************************************************
 * NAMESPACE
 **************************************************************************************/

} /* namespace ViperFpga */

#endif /* ARDUINO_VIPER_FPGA_REGISTER_IO_H_ */

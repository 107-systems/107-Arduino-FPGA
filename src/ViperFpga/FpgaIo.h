/**
 * @brief   Arduino library containing FPGA configuration and MCU interface code for the MKR VIDOR 4000 based Viper quadcopter.
 * @author  Alexander Entinger, MSc / LXRobotics GmbH
 * @license LGPL 3.0
 */

#ifndef ARDUINO_VIPER_FPGA_IO_H_
#define ARDUINO_VIPER_FPGA_IO_H_

/**************************************************************************************
 * INCLUDE
 **************************************************************************************/

#include <stdint.h>

#undef max
#undef min
#include <functional>

/**************************************************************************************
 * NAMESPACE
 **************************************************************************************/

namespace ViperFpga
{

/**************************************************************************************
 * TYPEDEF
 **************************************************************************************/

typedef std::function<void()>                 SpiSelectFunc;
typedef std::function<void()>                 SpiDeselectFunc;
typedef std::function<uint8_t(uint8_t const)> SpiTransferFunc;

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

class FpgaIo
{

public:

  FpgaIo(SpiSelectFunc select, SpiDeselectFunc deselect, SpiTransferFunc transfer);


  uint8_t read (Register const reg);
  void    write(Register const reg, uint8_t const reg_val);


private:

  SpiSelectFunc _select;
  SpiDeselectFunc _deselect;
  SpiTransferFunc _transfer;

};

/**************************************************************************************
 * NAMESPACE
 **************************************************************************************/

} /* namespace ViperFpga */

#endif /* ARDUINO_VIPER_FPGA_IO_H_ */

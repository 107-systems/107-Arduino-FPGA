/**
 * This software is distributed under the terms of the MIT License.
 * Copyright (c) 2020 LXRobotics.
 * Author: Alexander Entinger <alexander.entinger@lxrobotics.com>
 * Contributors: https://github.com/107-systems/107-Arduino-FPGA/graphs/contributors.
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

#include "FpgaConst.h"

/**************************************************************************************
 * NAMESPACE
 **************************************************************************************/

namespace Fpga
{

/**************************************************************************************
 * TYPEDEF
 **************************************************************************************/

typedef std::function<void()>                 SpiSelectFunc;
typedef std::function<void()>                 SpiDeselectFunc;
typedef std::function<uint8_t(uint8_t const)> SpiTransferFunc;

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

} /* namespace Fpga */

#endif /* ARDUINO_VIPER_FPGA_IO_H_ */

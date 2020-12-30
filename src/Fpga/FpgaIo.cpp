/**
 * This software is distributed under the terms of the MIT License.
 * Copyright (c) 2020 LXRobotics.
 * Author: Alexander Entinger <alexander.entinger@lxrobotics.com>
 * Contributors: https://github.com/107-systems/107-Arduino-FPGA/graphs/contributors.
 */

/**************************************************************************************
 * INCLUDE
 **************************************************************************************/

#include "FpgaIo.h"

#include <Arduino.h>

/**************************************************************************************
 * NAMESPACE
 **************************************************************************************/

namespace Fpga
{

/**************************************************************************************
 * CTOR/DTOR
 **************************************************************************************/

FpgaIo::FpgaIo(SpiSelectFunc select, SpiDeselectFunc deselect, SpiTransferFunc transfer)
: _select{select}
, _deselect{deselect}
, _transfer{transfer}
{

}

/**************************************************************************************
 * PUBLIC MEMBER FUNCTIONS
 **************************************************************************************/

uint8_t FpgaIo::read(Register const reg)
{
  uint8_t const reg_addr = to_integer(reg);

  _select();
                          _transfer(reg_addr);
  uint8_t const reg_val = _transfer(0);
  _deselect();

  return reg_val;
}

void FpgaIo::write(Register const reg, uint8_t const reg_val)
{
  uint8_t const reg_addr = 0x80 | to_integer(reg);

  _select();
  _transfer(reg_addr);
  _transfer(reg_val);
  _deselect();
}

/**************************************************************************************
 * NAMESPACE
 **************************************************************************************/

} /* namespace Fpga */

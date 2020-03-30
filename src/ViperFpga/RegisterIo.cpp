/**
 * @brief   Arduino library containing FPGA configuration and MCU interface code for the MKR VIDOR 4000 based Viper quadcopter.
 * @author  Alexander Entinger, MSc / LXRobotics GmbH
 * @license LGPL 3.0
 */

/**************************************************************************************
 * INCLUDE
 **************************************************************************************/

#include "RegisterIo.h"

#include <Arduino.h>

/**************************************************************************************
 * NAMESPACE
 **************************************************************************************/

namespace ViperFpga
{

/**************************************************************************************
 * CTOR/DTOR
 **************************************************************************************/

RegisterIo::RegisterIo(SpiSelectFunc select, SpiDeselectFunc deselect, SpiTransferFunc transfer)
: _select{select}
, _deselect{deselect}
, _transfer{transfer}
{

}

/**************************************************************************************
 * PUBLIC MEMBER FUNCTIONS
 **************************************************************************************/

uint8_t RegisterIo::read(Register const reg)
{
  uint8_t const reg_addr = static_cast<uint8_t>(reg);

  _select();
                          _transfer(reg_addr);
  uint8_t const reg_val = _transfer(0);
  _deselect();

  return reg_val;
}

void RegisterIo::write(Register const reg, uint8_t const reg_val)
{
  uint8_t const reg_addr = 0x80 | static_cast<uint8_t>(reg);

  _select();
  _transfer(reg_addr);
  _transfer(reg_val);
  _deselect();
}

/**************************************************************************************
 * NAMESPACE
 **************************************************************************************/

} /* namespace ViperFpga */

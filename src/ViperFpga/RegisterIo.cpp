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

RegisterIo::RegisterIo(SPIClass & spi, int const fpga_cs_pin)
: _spi{spi}
, _fpga_cs_pin{fpga_cs_pin}
{

}

/**************************************************************************************
 * PUBLIC MEMBER FUNCTIONS
 **************************************************************************************/

void RegisterIo::begin()
{
  _spi.begin  ();
  pinMode     (_fpga_cs_pin, OUTPUT);
  digitalWrite(_fpga_cs_pin, HIGH);
}

uint8_t RegisterIo::read(Register const reg)
{
  uint8_t const reg_addr = static_cast<uint8_t>(reg);

  select();
                          SPI.transfer(reg_addr);
  uint8_t const reg_val = SPI.transfer(0);
  deselect();

  return reg_val;
}

void RegisterIo::write(Register const reg, uint8_t const reg_val)
{
  uint8_t const reg_addr = static_cast<uint8_t>(reg);

  select();
  SPI.transfer(reg_addr);
  SPI.transfer(reg_val);
  deselect();
}

/**************************************************************************************
 * PRIVATE MEMBER FUNCTIONS
 **************************************************************************************/

void RegisterIo::select()
{
  digitalWrite(_fpga_cs_pin, LOW);
}

void RegisterIo::deselect()
{
  digitalWrite(_fpga_cs_pin, HIGH);
}

/**************************************************************************************
 * NAMESPACE
 **************************************************************************************/

} /* namespace ViperFpga */

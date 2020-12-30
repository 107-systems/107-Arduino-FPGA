/**
 * This software is distributed under the terms of the MIT License.
 * Copyright (c) 2020 LXRobotics.
 * Author: Alexander Entinger <alexander.entinger@lxrobotics.com>
 * Contributors: https://github.com/107-systems/107-Arduino-FPGA/graphs/contributors.
 */

/**************************************************************************************
 * INCLUDE
 **************************************************************************************/

#include <stdint.h>

/**************************************************************************************
 * NAMESPACE
 **************************************************************************************/

namespace Fpga
{

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
 * CONVERSION FUNCTIONS
 **************************************************************************************/

template <typename Enumeration>
constexpr auto to_integer(Enumeration const value) -> typename std::underlying_type<Enumeration>::type
{
  return static_cast<typename std::underlying_type<Enumeration>::type>(value);
}

template <typename Enumeration>
constexpr auto bp(Enumeration const value) -> typename std::underlying_type<Enumeration>::type
{
  return to_integer(value);
}

template <typename Enumeration>
constexpr auto bm(Enumeration const value) -> typename std::underlying_type<Enumeration>::type
{
    return (1 << to_integer(value));
}

/**************************************************************************************
 * NAMESPACE
 **************************************************************************************/

} /* namespace Fpga */

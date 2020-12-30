---------------------------------------------------------------
-- This software is distributed under the terms of the MIT License.
-- Copyright (c) 2020 LXRobotics.
-- Author: Alexander Entinger <alexander.entinger@lxrobotics.com>
-- Contributors: https://github.com/107-systems/107-Arduino-FPGA/graphs/contributors.
---------------------------------------------------------------

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

package OV2640Defs is

  -- Camera Output
  constant cPixelDataBitWidth : natural := 8;
  subtype  aPixelDataRange    is natural range (cPixelDataBitWidth-1) downto 0;
  subtype  aPixelData         is std_ulogic_vector(aPixelDataRange);

  -- OV2640 System Clock Speed
  constant cOV2640SystemClockSpeed : positive := 24000000;

end OV2640Defs;

---------------------------------------------------------------
-- This software is distributed under the terms of the MIT License.
-- Copyright (c) 2020 LXRobotics.
-- Author: Alexander Entinger <alexander.entinger@lxrobotics.com>
-- Contributors: https://github.com/107-systems/107-Arduino-FPGA/graphs/contributors.
---------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

package viper is

  -- Positive Logic
  constant cActivated   : std_ulogic := '1';
  constant cInactivated : std_ulogic := '0';

  -- Negative Logic
  constant cnActivated   : std_ulogic := '0';
  constant cnInactivated : std_ulogic := '1';

  -- FPGA Clock Speed
  constant cFPGAClockSpeed : positive := 48000000;

end viper;

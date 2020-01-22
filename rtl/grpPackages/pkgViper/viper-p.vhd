---------------------------------------------------------------
-- Viper Quadcopter MKR VIDOR 4000 FPGA Code
-- (C) Alexander Entinger, MSc / LXRobotics GmbH
-- GNU LGPL V3.0
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

end viper;


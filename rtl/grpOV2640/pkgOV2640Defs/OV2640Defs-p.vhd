---------------------------------------------------------------
-- Viper Quadcopter MKR VIDOR 4000 FPGA Code
-- (C) Alexander Entinger, MSc / LXRobotics GmbH
-- GNU LGPL V3.0
---------------------------------------------------------------

library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

package OV2640Defs is

  -- Camera Output
  constant cPixelDataBitWidth : natural := 8;
  subtype  aPixelDataRange    is natural range (cPixelDataBitWidth-1) downto 0;
  subtype  aPixelData         is std_ulogic_vector(aPixelDataRange);

end OV2640Defs;

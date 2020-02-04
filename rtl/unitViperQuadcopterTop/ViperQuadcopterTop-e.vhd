---------------------------------------------------------------
-- Viper Quadcopter MKR VIDOR 4000 FPGA Code
-- (C) Alexander Entinger, MSc / LXRobotics GmbH
-- GNU LGPL V3.0
---------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.viper.all;

entity ViperQuadcopterTop is
  port (
    iClk         : in std_ulogic;
    inResetAsync : in std_ulogic
  );
end ViperQuadcopterTop;


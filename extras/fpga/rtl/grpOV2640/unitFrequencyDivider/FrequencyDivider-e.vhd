---------------------------------------------------------------
-- Viper Quadcopter MKR VIDOR 4000 FPGA Code
-- (C) Alexander Entinger, MSc / LXRobotics GmbH
-- GNU LGPL V3.0
---------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.viper.all;
use work.ov2640defs.all;

entity FrequencyDivider is
  generic (
    gInClkFreq  : positive := cFPGAClockSpeed;
    gOutClkFreq : positive := cOV2640SystemClockSpeed
  );
  port (
    iClk      : in std_ulogic;
    inReset   : in std_ulogic;
    oClk      : out std_ulogic
  );
end FrequencyDivider;

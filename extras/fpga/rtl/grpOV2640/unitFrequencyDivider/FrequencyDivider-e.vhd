---------------------------------------------------------------
-- This software is distributed under the terms of the MIT License.
-- Copyright (c) 2020 LXRobotics.
-- Author: Alexander Entinger <alexander.entinger@lxrobotics.com>
-- Contributors: https://github.com/107-systems/107-Arduino-FPGA/graphs/contributors.
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

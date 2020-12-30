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
use work.rgbleddefs.all;

entity RgbLedEncoder is
  port (
    iColour : in aRgbLedColour;
    oRed    : out std_ulogic;
    oGreen  : out std_ulogic;
    oBlue   : out std_ulogic
  );
end RgbLedEncoder;

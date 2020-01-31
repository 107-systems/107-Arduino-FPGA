---------------------------------------------------------------
-- Viper Quadcopter MKR VIDOR 4000 FPGA Code
-- (C) Alexander Entinger, MSc / LXRobotics GmbH
-- GNU LGPL V3.0
---------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.viper.all;
use work.rgbleddefs.all;

entity RgbLed is
  port (
    iClk      : in std_ulogic;
    inReset   : in std_ulogic;
    iColour   : in aRgbLedColour;
    oRed      : out std_ulogic;
    oGreen    : out std_ulogic;
    oBlue     : out std_ulogic
  );
end RgbLed;

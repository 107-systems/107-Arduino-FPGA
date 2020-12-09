---------------------------------------------------------------
-- Viper Quadcopter MKR VIDOR 4000 FPGA Code
-- (C) Alexander Entinger, MSc / LXRobotics GmbH
-- GNU LGPL V3.0
---------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity SpiSynchronizer is
  port (
    iClk       : in  std_ulogic;
    inReset    : in  std_ulogic;

    iMosiAsync : in  std_ulogic;
    iSckAsync  : in  std_ulogic;
    inCsAsync  : in  std_ulogic;

    oMosiSync  : out std_ulogic;
    oSckSync   : out std_ulogic;
    onCsSync   : out std_ulogic
  );
end SpiSynchronizer;

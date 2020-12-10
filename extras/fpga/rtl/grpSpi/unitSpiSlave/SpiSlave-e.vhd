---------------------------------------------------------------
-- Viper Quadcopter MKR VIDOR 4000 FPGA Code
-- (C) Alexander Entinger, MSc / LXRobotics GmbH
-- GNU LGPL V3.0
---------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity SpiSlave is
  port (
    iClk    : in std_ulogic;
    inReset : in std_ulogic;
    iMOSI   : in std_ulogic;
    iSCK    : in std_ulogic;
    inCS    : in std_ulogic;
    oMISO   : out std_ulogic
  );
end SpiSlave;

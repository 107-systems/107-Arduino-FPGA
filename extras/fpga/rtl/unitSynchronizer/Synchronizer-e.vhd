---------------------------------------------------------------
-- Viper Quadcopter MKR VIDOR 4000 FPGA Code
-- (C) Alexander Entinger, MSc / LXRobotics GmbH
-- GNU LGPL V3.0
---------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.viper.all;

entity Synchronizer is
  generic (
    gResetValue      : std_ulogic := '0';
    gSyncChainLength : positive := 2
  );
  port (
    iClk    : in std_ulogic;
    inReset : in std_ulogic;
    iData   : in std_ulogic;
    oData   : out std_ulogic
  );
end Synchronizer;

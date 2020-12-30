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

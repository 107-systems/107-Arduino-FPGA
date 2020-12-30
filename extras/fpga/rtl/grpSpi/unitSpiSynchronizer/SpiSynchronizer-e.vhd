---------------------------------------------------------------
-- This software is distributed under the terms of the MIT License.
-- Copyright (c) 2020 LXRobotics.
-- Author: Alexander Entinger <alexander.entinger@lxrobotics.com>
-- Contributors: https://github.com/107-systems/107-Arduino-FPGA/graphs/contributors.
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

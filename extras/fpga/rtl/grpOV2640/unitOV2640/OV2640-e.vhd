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

entity OV2640 is
  port (
    iClk      : in std_ulogic;
    inReset   : in std_ulogic;
    iCamPCLK  : in std_ulogic; -- Pixel Clock
    iCamHREF  : in std_ulogic; -- Horizontal Reference
    iCamVSYNC : in std_ulogic; -- Vertical Synchronisation
    iCamDATA  : in aPixelData; -- Pixel Data
    oCamXCLK  : out std_ulogic -- System Clock
  );
end OV2640;

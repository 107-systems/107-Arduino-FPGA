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

entity ViperQuadcopterTop is
  port (
    iClk         : in std_ulogic;
    inResetAsync : in std_ulogic;
    -- MCU/FPGA SPI Interface
    iMOSI        : in std_ulogic;
    iSCK         : in std_ulogic;
    inCS         : in std_ulogic;
    oMISO        : out std_ulogic;
    onIRQ        : out std_ulogic;
    -- OV2640
    iPCLK        : in std_ulogic;
    iHREF        : in std_ulogic;
    iVSYNC       : in std_ulogic;
    iDOUT0       : in std_ulogic;
    iDOUT1       : in std_ulogic;
    iDOUT2       : in std_ulogic;
    iDOUT3       : in std_ulogic;
    iDOUT4       : in std_ulogic;
    iDOUT5       : in std_ulogic;
    iDOUT6       : in std_ulogic;
    iDOUT7       : in std_ulogic;
    iDOUT8       : in std_ulogic;
    iDOUT9       : in std_ulogic;
    oXCLK        : out std_ulogic;
    oRST         : out std_ulogic;
    oPWDN        : out std_ulogic;
    ioSCL        : inout std_ulogic;
    ioSDA        : inout std_ulogic;
    -- RGB LED
    oLED_R       : out std_ulogic;
    oLED_G       : out std_ulogic;
    oLED_B       : out std_ulogic
  );
end ViperQuadcopterTop;

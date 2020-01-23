---------------------------------------------------------------
-- Viper Quadcopter MKR VIDOR 4000 FPGA Code
-- (C) Alexander Entinger, MSc / LXRobotics GmbH
-- GNU LGPL V3.0
---------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.viper.all;

entity OV2640 is
  port (
    iClk      : in std_ulogic;
    inReset   : in std_ulogic;
    iCamPCLK  : in std_ulogic;                    -- Pixel Clock
    iCamHREF  : in std_ulogic;                    -- Horizontal Reference
    iCamVSYNC : in std_ulogic;                    -- Vertical Synchronisation
    iCamDATA  : in std_ulogic_vector(7 downto 0); -- Pixel Data
    oCamXCLK  : out std_ulogic                    -- System Clock
  );
end OV2640;

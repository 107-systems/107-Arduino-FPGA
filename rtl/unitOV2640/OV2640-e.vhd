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
    iPixelClk : in std_ulogic;
    iHref     : in std_ulogic;
    iVsync    : in std_ulogic;
    iData     : in std_ulogic_vector(7 downto 0);
    oCamClk   : out std_ulogic
  );
end OV2640;


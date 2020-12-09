---------------------------------------------------------------
-- Viper Quadcopter MKR VIDOR 4000 FPGA Code
-- (C) Alexander Entinger, MSc / LXRobotics GmbH
-- GNU LGPL V3.0
---------------------------------------------------------------

library ieee;
use ieee.numeric_std.all;

library work;
use work.viper.all;

---------------------------------------------------------------

architecture Rtl of SpiSynchronizer is

begin

    mosi_sync : entity work.Synchronizer(Rtl)
    port map
    (
        iClk => iClk,
        inReset => inReset,
        iData => iMosiAsync,
        oData => oMosiSync
    );

    sck_sync : entity work.Synchronizer(Rtl)
    port map
    (
        iClk => iClk,
        inReset => inReset,
        iData => iSckAsync,
        oData => oSckSync
    );

    ncs_sync : entity work.Synchronizer(Rtl)
    port map
    (
        iClk => iClk,
        inReset => inReset,
        iData => inCsAsync,
        oData => onCsSync
    );

end Rtl;

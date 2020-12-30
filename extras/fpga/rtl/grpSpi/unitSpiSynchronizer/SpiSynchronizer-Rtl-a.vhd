---------------------------------------------------------------
-- This software is distributed under the terms of the MIT License.
-- Copyright (c) 2020 LXRobotics.
-- Author: Alexander Entinger <alexander.entinger@lxrobotics.com>
-- Contributors: https://github.com/107-systems/107-Arduino-FPGA/graphs/contributors.
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

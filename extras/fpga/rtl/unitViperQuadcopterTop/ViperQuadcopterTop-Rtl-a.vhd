---------------------------------------------------------------
-- This software is distributed under the terms of the MIT License.
-- Copyright (c) 2020 LXRobotics.
-- Author: Alexander Entinger <alexander.entinger@lxrobotics.com>
-- Contributors: https://github.com/107-systems/107-Arduino-FPGA/graphs/contributors.
---------------------------------------------------------------

architecture Rtl of ViperQuadcopterTop is

  constant cRgbLedColour : aRgbLedColour := Cyan;

  -- PLL output signals
  signal pll_clock_c0_192MHz : std_ulogic;
  signal pll_locked          : std_ulogic;

  -- SPI sync signals
  signal iMosiSync : std_ulogic;
  signal iSckSync : std_ulogic;
  signal inCsSync : std_ulogic;
  
begin

  rgb_led_encoder : entity work.RgbLedEncoder(Rtl)
  port map
  (
    iColour => cRgbLedColour,
    oRed    => oLED_R,
    oGreen  => oLED_G,
    oBlue   => oLED_B
  );

  syspll_inst : entity work.syspll(SYN)
  port map
  (
    areset => inResetAsync,
    inclk0 => iClk,
    c0     => pll_clock_c0_192MHz,
    locked => pll_locked
  );

  spisync_inst : entity work.SpiSynchronizer(Rtl)
  port map
  (
      iClk       => pll_clock_c0_192MHz,
      inReset    => pll_locked,
      iMosiAsync => iMOSI,
      iSckAsync  => iSCK,
      inCsAsync  => inCS,
      oMosiSync  => iMosiSync,
      oSckSync   => iSckSync,
      onCsSync   => inCsSync
  );

  spislave_inst : entity work.SpiSlave(Rtl)
  port map
  (
    iClk    => pll_clock_c0_192MHz,
    inReset => pll_locked,
    iMOSI   => iMosiSync,
    iSCK    => iSckSync,
    inCS    => inCsSync,
    oMISO   => oMISO
  );

end Rtl;

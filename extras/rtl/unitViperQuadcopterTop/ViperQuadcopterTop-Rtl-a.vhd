---------------------------------------------------------------
-- Viper Quadcopter MKR VIDOR 4000 FPGA Code
-- (C) Alexander Entinger, MSc / LXRobotics GmbH
-- GNU LGPL V3.0
---------------------------------------------------------------

architecture Rtl of ViperQuadcopterTop is

  constant cRgbLedColour : aRgbLedColour := Cyan;

begin

  rgb_led_encoder : entity work.RgbLedEncoder(Rtl)
  port map
  (
    iColour => cRgbLedColour,
    oRed    => oLED_R,
    oGreen  => oLED_G,
    oBlue   => oLED_B
  );

end Rtl;

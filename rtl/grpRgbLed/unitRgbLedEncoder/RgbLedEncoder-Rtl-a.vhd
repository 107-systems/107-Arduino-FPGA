---------------------------------------------------------------
-- Viper Quadcopter MKR VIDOR 4000 FPGA Code
-- (C) Alexander Entinger, MSc / LXRobotics GmbH
-- GNU LGPL V3.0
---------------------------------------------------------------

architecture Rtl of RgbLedEncoder is

begin

  process(iColour) is
  begin

    case iColour is

      when Black =>
        oRed   <= cInactivated;
        oGreen <= cInactivated;
        oBlue  <= cInactivated;
      
      when White =>
        oRed   <= cActivated;
        oGreen <= cActivated;
        oBlue  <= cActivated;

      when Red =>
        oRed   <= cActivated;
        oGreen <= cInactivated;
        oBlue  <= cInactivated;

      when Green =>
        oRed   <= cInactivated;
        oGreen <= cActivated;
        oBlue  <= cInactivated;

      when Blue =>
        oRed   <= cInactivated;
        oGreen <= cInactivated;
        oBlue  <= cActivated;

      when Yellow =>
        oRed   <= cActivated;
        oGreen <= cActivated;
        oBlue  <= cInactivated;
      
      when Cyan =>
        oRed   <= cInactivated;
        oGreen <= cActivated;
        oBlue  <= cActivated;
      
      when Magenta =>
        oRed   <= cActivated;
        oGreen <= cInactivated;
        oBlue  <= cActivated;

      when others => null;

    end case;

  end process;

end Rtl;
  
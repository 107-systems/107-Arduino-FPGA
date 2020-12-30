---------------------------------------------------------------
-- This software is distributed under the terms of the MIT License.
-- Copyright (c) 2020 LXRobotics.
-- Author: Alexander Entinger <alexander.entinger@lxrobotics.com>
-- Contributors: https://github.com/107-systems/107-Arduino-FPGA/graphs/contributors.
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

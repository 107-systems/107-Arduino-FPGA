---------------------------------------------------------------
-- Viper Quadcopter MKR VIDOR 4000 FPGA Code
-- (C) Alexander Entinger, MSc / LXRobotics GmbH
-- GNU LGPL V3.0
---------------------------------------------------------------

architecture Rtl of RgbLed is

  type aRegSet is record
    Colour : aRgbLedColour;
    Red    : std_ulogic;
    Green  : std_ulogic;
    Blue   : std_ulogic;
  end record;

  -------------------------------------------------------------

  constant cInitRegSet : aRegSet := (
    Colour => Black,
    Red    => cInactivated,
    Green  => cInactivated,
    Blue   => cInactivated
    );

  -------------------------------------------------------------

  signal R, NextR : aRegSet;

  begin

  comb : process(R, iColour) is
  begin

    NextR <= R;

    NextR.Colour <= iColour;
    
    case R.Colour is

      when Black =>
        NextR.Red   <= cInactivated;
        NextR.Green <= cInactivated;
        NextR.Blue  <= cInactivated;
      
      when White =>
        NextR.Red   <= cActivated;
        NextR.Green <= cActivated;
        NextR.Blue  <= cActivated;

      when Red =>
        NextR.Red   <= cActivated;
        NextR.Green <= cInactivated;
        NextR.Blue  <= cInactivated;

      when Green =>
        NextR.Red   <= cInactivated;
        NextR.Green <= cActivated;
        NextR.Blue  <= cInactivated;

      when Blue =>
        NextR.Red   <= cInactivated;
        NextR.Green <= cInactivated;
        NextR.Blue  <= cActivated;

      when Yellow =>
        NextR.Red   <= cActivated;
        NextR.Green <= cActivated;
        NextR.Blue  <= cInactivated;
      
      when Cyan =>
        NextR.Red   <= cInactivated;
        NextR.Green <= cActivated;
        NextR.Blue  <= cActivated;
      
      when Magenta =>
        NextR.Red   <= cActivated;
        NextR.Green <= cInactivated;
        NextR.Blue  <= cActivated;

      when others => null;

    end case;

  end process comb;
    
  -------------------------------------------------------------

  sequ : process(iClk, inReset) is
  begin
    if inReset = cnActivated then
      R <= cInitRegSet;
    elsif rising_edge(iClk) then
      R <= NextR;
    end if;
  end process sequ;

  -------------------------------------------------------------

  oRed   <= R.Red;
  oGreen <= R.Green;
  oBlue  <= R.Blue;

end Rtl;
  
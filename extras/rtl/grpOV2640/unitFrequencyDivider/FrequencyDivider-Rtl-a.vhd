---------------------------------------------------------------
-- Viper Quadcopter MKR VIDOR 4000 FPGA Code
-- (C) Alexander Entinger, MSc / LXRobotics GmbH
-- GNU LGPL V3.0
---------------------------------------------------------------

architecture Rtl of FrequencyDivider is

begin

  process(iClk, inReset) is
  begin
    if inReset = cnActivated then
      oClk <= '0';
    elsif rising_edge(iClk) then
      -- TODO
    end if;  
  end process;

end Rtl;

---------------------------------------------------------------
-- This software is distributed under the terms of the MIT License.
-- Copyright (c) 2020 LXRobotics.
-- Author: Alexander Entinger <alexander.entinger@lxrobotics.com>
-- Contributors: https://github.com/107-systems/107-Arduino-FPGA/graphs/contributors.
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

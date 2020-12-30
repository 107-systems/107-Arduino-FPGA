---------------------------------------------------------------
-- This software is distributed under the terms of the MIT License.
-- Copyright (c) 2020 LXRobotics.
-- Author: Alexander Entinger <alexander.entinger@lxrobotics.com>
-- Contributors: https://github.com/107-systems/107-Arduino-FPGA/graphs/contributors.
---------------------------------------------------------------

architecture Rtl of Synchronizer is

  signal sync_chain : std_ulogic_vector(gSyncChainLength-1 downto 0) := (others => gResetValue);

begin

  process(iClk, inReset)
  begin
    if inReset = cnActivated then
      sync_chain <= (others => gResetValue);
    elsif rising_edge(iClk) then
      sync_chain <= sync_chain(sync_chain'high-1 downto 0) & iData;
    end if;
  end process;

  oData <= sync_chain(sync_chain'high);

end Rtl;

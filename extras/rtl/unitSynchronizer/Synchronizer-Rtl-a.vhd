---------------------------------------------------------------
-- Viper Quadcopter MKR VIDOR 4000 FPGA Code
-- (C) Alexander Entinger, MSc / LXRobotics GmbH
-- GNU LGPL V3.0
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

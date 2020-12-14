---------------------------------------------------------------
-- Viper Quadcopter MKR VIDOR 4000 FPGA Code
-- (C) Alexander Entinger, MSc / LXRobotics GmbH
-- GNU LGPL V3.0
---------------------------------------------------------------

library ieee;
use ieee.numeric_std.all;

library work;
use work.viper.all;

---------------------------------------------------------------

architecture Rtl of SpiSlave is

    type aSpiSlaveState is (Idle, Command, Address, Data);
    subtype aSpiBitCnt is unsigned (2 downto 0);
    subtype aSpiCommand is std_ulogic_vector (7 downto 0);

    type aRegSet is record
        SpiSlaveState : aSpiSlaveState;
        iSpiSck       : std_ulogic;
        oSpiMosi      : std_ulogic;
        SpiBitCnt     : aSpiBitCnt;
        SpiRegCommand : std_ulogic_vector(7 downto 0);
        SpiRegAddr    : std_ulogic_vector(7 downto 0);
        SpiRegData    : std_ulogic_vector(7 downto 0);
    end record;
    -----------------------------------------------------------
    constant cInitRegSet : aRegSet := (
        SpiSlaveState => Idle,
        iSpiSck       => '0',
        oSpiMosi      => '0',
        SpiBitCnt     => to_unsigned(0, aSpiBitCnt'length),
        SpiRegCommand => (others => '0'),
        SpiRegAddr    => (others => '0'),
        SpiRegData    => (others => '0')
    );
    constant cCommandWrite : aSpiCommand := "00000010"; -- WRITE = 0x02
    constant cCommandRead  : aSpiCommand := "00000011"; -- READ  = 0x03
    -----------------------------------------------------------
    signal R, NextR             : aRegSet;
    signal sck_rising_edge      : std_ulogic;
    signal spi_bit_cnt_overflow : std_ulogic;
    -----------------------------------------------------------
begin
    -----------------------------------------------------------
    sck_rising_edge <= iSCK and not R.iSpiSck;
    spi_bit_cnt_overflow <= cActivated when R.SpiBitCnt = to_unsigned(7, aSpiBitCnt'length) else cInactivated;
    -----------------------------------------------------------
    comb : process(R, iMOSI, iSCK, inCS, sck_rising_edge, spi_bit_cnt_overflow) is
    begin
        -------------------------------------------------------
        NextR <= R;
        NextR.oSpiMosi <= '0';
        -------------------------------------------------------
        if sck_rising_edge = cActivated then
            NextR.SpiBitCnt <= R.SpiBitCnt + 1;
        end if;
        -------------------------------------------------------
        case R.SpiSlaveState is
            ---------------------------------------------------
            when Idle =>
                if inCS = cnActivated then
                    NextR.SpiSlaveState <= Command;
                    NextR.SpiBitCnt     <= to_unsigned(0, aSpiBitCnt'length);
                    NextR.SpiRegCommand <= (others => '0');
                    NextR.SpiRegAddr    <= (others => '0');
                    NextR.SpiRegData    <= (others => '0');
                end if;
            ---------------------------------------------------
            when Command =>
                if sck_rising_edge = cActivated then
                    NextR.SpiRegCommand <= R.SpiRegCommand(R.SpiRegCommand'high-1 downto 0) & iMOSI;
                end if;
                if spi_bit_cnt_overflow = cActivated then
                    NextR.SpiSlaveState <= Data;
                end if;
            ---------------------------------------------------
            when Address =>
                if sck_rising_edge = cActivated then
                    NextR.SpiRegAddr <= R.SpiRegAddr(R.SpiRegAddr'high-1 downto 0) & iMOSI;
                end if;
                if spi_bit_cnt_overflow = cActivated then
                    NextR.SpiSlaveState <= Data;
                end if;
            ---------------------------------------------------
            when Data =>
                if sck_rising_edge = cActivated then
                    -------------------------------------------
                    if R.SpiRegCommand = cCommandWrite then
                        NextR.SpiRegData <= R.SpiRegData(R.SpiRegData'high-1 downto 0) & iMOSI;
                    end if;
                    -------------------------------------------
                    if R.SpiRegCommand = cCommandRead then
                        NextR.oSpiMosi <= R.SpiRegData(to_integer(R.SpiBitCnt));
                    end if;
                    -------------------------------------------
                end if;
            ---------------------------------------------------
            when others => null;
        end case;
        -------------------------------------------------------
        if inCS = cnInactivated then
            NextR.SpiSlaveState <= Idle;
        end if;
        -------------------------------------------------------
    end process comb;

    -----------------------------------------------------------

    sequ : process(iClk, inReset) is
    begin
        if inReset = cnActivated then
            R <= cInitRegSet;
        elsif rising_edge(iClk) then
            R <= NextR;
        end if;
    end process sequ;

    -----------------------------------------------------------

    oMISO <= R.oSpiMosi;

end Rtl;
  
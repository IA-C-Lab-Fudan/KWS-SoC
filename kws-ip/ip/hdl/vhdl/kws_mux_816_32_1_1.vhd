-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.2 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity kws_mux_816_32_1_1 is
generic (
    ID            :integer := 0;
    NUM_STAGE     :integer := 1;
    din0_WIDTH       :integer := 32;
    din1_WIDTH       :integer := 32;
    din2_WIDTH       :integer := 32;
    din3_WIDTH       :integer := 32;
    din4_WIDTH       :integer := 32;
    din5_WIDTH       :integer := 32;
    din6_WIDTH       :integer := 32;
    din7_WIDTH       :integer := 32;
    din8_WIDTH       :integer := 32;
    dout_WIDTH        :integer := 32);
port (
    din0   :in  std_logic_vector(31 downto 0);
    din1   :in  std_logic_vector(31 downto 0);
    din2   :in  std_logic_vector(31 downto 0);
    din3   :in  std_logic_vector(31 downto 0);
    din4   :in  std_logic_vector(31 downto 0);
    din5   :in  std_logic_vector(31 downto 0);
    din6   :in  std_logic_vector(31 downto 0);
    din7   :in  std_logic_vector(31 downto 0);
    din8   :in  std_logic_vector(15 downto 0);
    dout     :out std_logic_vector(31 downto 0));
end entity;

architecture rtl of kws_mux_816_32_1_1 is
    -- puts internal signals
    signal sel    : std_logic_vector(15 downto 0);
    -- level 1 signals
    signal mux_1_0    : std_logic_vector(31 downto 0);
    signal mux_1_1    : std_logic_vector(31 downto 0);
    signal mux_1_2    : std_logic_vector(31 downto 0);
    signal mux_1_3    : std_logic_vector(31 downto 0);
    -- level 2 signals
    signal mux_2_0    : std_logic_vector(31 downto 0);
    signal mux_2_1    : std_logic_vector(31 downto 0);
    -- level 3 signals
    signal mux_3_0    : std_logic_vector(31 downto 0);
    -- level 4 signals
    signal mux_4_0    : std_logic_vector(31 downto 0);
    -- level 5 signals
    signal mux_5_0    : std_logic_vector(31 downto 0);
    -- level 6 signals
    signal mux_6_0    : std_logic_vector(31 downto 0);
    -- level 7 signals
    signal mux_7_0    : std_logic_vector(31 downto 0);
    -- level 8 signals
    signal mux_8_0    : std_logic_vector(31 downto 0);
    -- level 9 signals
    signal mux_9_0    : std_logic_vector(31 downto 0);
    -- level 10 signals
    signal mux_10_0    : std_logic_vector(31 downto 0);
    -- level 11 signals
    signal mux_11_0    : std_logic_vector(31 downto 0);
    -- level 12 signals
    signal mux_12_0    : std_logic_vector(31 downto 0);
    -- level 13 signals
    signal mux_13_0    : std_logic_vector(31 downto 0);
    -- level 14 signals
    signal mux_14_0    : std_logic_vector(31 downto 0);
    -- level 15 signals
    signal mux_15_0    : std_logic_vector(31 downto 0);
    -- level 16 signals
    signal mux_16_0    : std_logic_vector(31 downto 0);
begin

sel <= din8;

-- Generate level 1 logic
mux_1_0 <= din0 when sel(0) = '0' else din1;
mux_1_1 <= din2 when sel(0) = '0' else din3;
mux_1_2 <= din4 when sel(0) = '0' else din5;
mux_1_3 <= din6 when sel(0) = '0' else din7;

-- Generate level 2 logic
mux_2_0 <= mux_1_0 when sel(1) = '0' else mux_1_1;
mux_2_1 <= mux_1_2 when sel(1) = '0' else mux_1_3;

-- Generate level 3 logic
mux_3_0 <= mux_2_0 when sel(2) = '0' else mux_2_1;

-- Generate level 4 logic
mux_4_0 <= mux_3_0;

-- Generate level 5 logic
mux_5_0 <= mux_4_0;

-- Generate level 6 logic
mux_6_0 <= mux_5_0;

-- Generate level 7 logic
mux_7_0 <= mux_6_0;

-- Generate level 8 logic
mux_8_0 <= mux_7_0;

-- Generate level 9 logic
mux_9_0 <= mux_8_0;

-- Generate level 10 logic
mux_10_0 <= mux_9_0;

-- Generate level 11 logic
mux_11_0 <= mux_10_0;

-- Generate level 12 logic
mux_12_0 <= mux_11_0;

-- Generate level 13 logic
mux_13_0 <= mux_12_0;

-- Generate level 14 logic
mux_14_0 <= mux_13_0;

-- Generate level 15 logic
mux_15_0 <= mux_14_0;

-- Generate level 16 logic
mux_16_0 <= mux_15_0;

-- output logic
dout <= mux_16_0;

end architecture;

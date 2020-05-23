-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.2 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity kws_mux_432_32_1_1 is
generic (
    ID            :integer := 0;
    NUM_STAGE     :integer := 1;
    din0_WIDTH       :integer := 32;
    din1_WIDTH       :integer := 32;
    din2_WIDTH       :integer := 32;
    din3_WIDTH       :integer := 32;
    din4_WIDTH       :integer := 32;
    dout_WIDTH        :integer := 32);
port (
    din0   :in  std_logic_vector(31 downto 0);
    din1   :in  std_logic_vector(31 downto 0);
    din2   :in  std_logic_vector(31 downto 0);
    din3   :in  std_logic_vector(31 downto 0);
    din4   :in  std_logic_vector(31 downto 0);
    dout     :out std_logic_vector(31 downto 0));
end entity;

architecture rtl of kws_mux_432_32_1_1 is
    -- puts internal signals
    signal sel    : std_logic_vector(31 downto 0);
    -- level 1 signals
    signal mux_1_0    : std_logic_vector(31 downto 0);
    signal mux_1_1    : std_logic_vector(31 downto 0);
    -- level 2 signals
    signal mux_2_0    : std_logic_vector(31 downto 0);
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
    -- level 17 signals
    signal mux_17_0    : std_logic_vector(31 downto 0);
    -- level 18 signals
    signal mux_18_0    : std_logic_vector(31 downto 0);
    -- level 19 signals
    signal mux_19_0    : std_logic_vector(31 downto 0);
    -- level 20 signals
    signal mux_20_0    : std_logic_vector(31 downto 0);
    -- level 21 signals
    signal mux_21_0    : std_logic_vector(31 downto 0);
    -- level 22 signals
    signal mux_22_0    : std_logic_vector(31 downto 0);
    -- level 23 signals
    signal mux_23_0    : std_logic_vector(31 downto 0);
    -- level 24 signals
    signal mux_24_0    : std_logic_vector(31 downto 0);
    -- level 25 signals
    signal mux_25_0    : std_logic_vector(31 downto 0);
    -- level 26 signals
    signal mux_26_0    : std_logic_vector(31 downto 0);
    -- level 27 signals
    signal mux_27_0    : std_logic_vector(31 downto 0);
    -- level 28 signals
    signal mux_28_0    : std_logic_vector(31 downto 0);
    -- level 29 signals
    signal mux_29_0    : std_logic_vector(31 downto 0);
    -- level 30 signals
    signal mux_30_0    : std_logic_vector(31 downto 0);
    -- level 31 signals
    signal mux_31_0    : std_logic_vector(31 downto 0);
    -- level 32 signals
    signal mux_32_0    : std_logic_vector(31 downto 0);
begin

sel <= din4;

-- Generate level 1 logic
mux_1_0 <= din0 when sel(0) = '0' else din1;
mux_1_1 <= din2 when sel(0) = '0' else din3;

-- Generate level 2 logic
mux_2_0 <= mux_1_0 when sel(1) = '0' else mux_1_1;

-- Generate level 3 logic
mux_3_0 <= mux_2_0;

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

-- Generate level 17 logic
mux_17_0 <= mux_16_0;

-- Generate level 18 logic
mux_18_0 <= mux_17_0;

-- Generate level 19 logic
mux_19_0 <= mux_18_0;

-- Generate level 20 logic
mux_20_0 <= mux_19_0;

-- Generate level 21 logic
mux_21_0 <= mux_20_0;

-- Generate level 22 logic
mux_22_0 <= mux_21_0;

-- Generate level 23 logic
mux_23_0 <= mux_22_0;

-- Generate level 24 logic
mux_24_0 <= mux_23_0;

-- Generate level 25 logic
mux_25_0 <= mux_24_0;

-- Generate level 26 logic
mux_26_0 <= mux_25_0;

-- Generate level 27 logic
mux_27_0 <= mux_26_0;

-- Generate level 28 logic
mux_28_0 <= mux_27_0;

-- Generate level 29 logic
mux_29_0 <= mux_28_0;

-- Generate level 30 logic
mux_30_0 <= mux_29_0;

-- Generate level 31 logic
mux_31_0 <= mux_30_0;

-- Generate level 32 logic
mux_32_0 <= mux_31_0;

-- output logic
dout <= mux_32_0;

end architecture;

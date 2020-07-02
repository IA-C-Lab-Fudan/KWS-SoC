-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.2 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity preprocess_mux_20CeG is
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
    din9_WIDTH       :integer := 32;
    din10_WIDTH       :integer := 32;
    din11_WIDTH       :integer := 32;
    din12_WIDTH       :integer := 32;
    din13_WIDTH       :integer := 32;
    din14_WIDTH       :integer := 32;
    din15_WIDTH       :integer := 32;
    din16_WIDTH       :integer := 32;
    din17_WIDTH       :integer := 32;
    din18_WIDTH       :integer := 32;
    din19_WIDTH       :integer := 32;
    din20_WIDTH       :integer := 32;
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
    din8   :in  std_logic_vector(31 downto 0);
    din9   :in  std_logic_vector(31 downto 0);
    din10   :in  std_logic_vector(31 downto 0);
    din11   :in  std_logic_vector(31 downto 0);
    din12   :in  std_logic_vector(31 downto 0);
    din13   :in  std_logic_vector(31 downto 0);
    din14   :in  std_logic_vector(31 downto 0);
    din15   :in  std_logic_vector(31 downto 0);
    din16   :in  std_logic_vector(31 downto 0);
    din17   :in  std_logic_vector(31 downto 0);
    din18   :in  std_logic_vector(31 downto 0);
    din19   :in  std_logic_vector(31 downto 0);
    din20   :in  std_logic_vector(15 downto 0);
    dout     :out std_logic_vector(31 downto 0));
end entity;

architecture rtl of preprocess_mux_20CeG is
    -- puts internal signals
    signal sel    : std_logic_vector(15 downto 0);
    -- level 1 signals
    signal mux_1_0    : std_logic_vector(31 downto 0);
    signal mux_1_1    : std_logic_vector(31 downto 0);
    signal mux_1_2    : std_logic_vector(31 downto 0);
    signal mux_1_3    : std_logic_vector(31 downto 0);
    signal mux_1_4    : std_logic_vector(31 downto 0);
    signal mux_1_5    : std_logic_vector(31 downto 0);
    signal mux_1_6    : std_logic_vector(31 downto 0);
    signal mux_1_7    : std_logic_vector(31 downto 0);
    signal mux_1_8    : std_logic_vector(31 downto 0);
    signal mux_1_9    : std_logic_vector(31 downto 0);
    -- level 2 signals
    signal mux_2_0    : std_logic_vector(31 downto 0);
    signal mux_2_1    : std_logic_vector(31 downto 0);
    signal mux_2_2    : std_logic_vector(31 downto 0);
    signal mux_2_3    : std_logic_vector(31 downto 0);
    signal mux_2_4    : std_logic_vector(31 downto 0);
    -- level 3 signals
    signal mux_3_0    : std_logic_vector(31 downto 0);
    signal mux_3_1    : std_logic_vector(31 downto 0);
    signal mux_3_2    : std_logic_vector(31 downto 0);
    -- level 4 signals
    signal mux_4_0    : std_logic_vector(31 downto 0);
    signal mux_4_1    : std_logic_vector(31 downto 0);
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

sel <= din20;

-- Generate level 1 logic
mux_1_0 <= din0 when sel(0) = '0' else din1;
mux_1_1 <= din2 when sel(0) = '0' else din3;
mux_1_2 <= din4 when sel(0) = '0' else din5;
mux_1_3 <= din6 when sel(0) = '0' else din7;
mux_1_4 <= din8 when sel(0) = '0' else din9;
mux_1_5 <= din10 when sel(0) = '0' else din11;
mux_1_6 <= din12 when sel(0) = '0' else din13;
mux_1_7 <= din14 when sel(0) = '0' else din15;
mux_1_8 <= din16 when sel(0) = '0' else din17;
mux_1_9 <= din18 when sel(0) = '0' else din19;

-- Generate level 2 logic
mux_2_0 <= mux_1_0 when sel(1) = '0' else mux_1_1;
mux_2_1 <= mux_1_2 when sel(1) = '0' else mux_1_3;
mux_2_2 <= mux_1_4 when sel(1) = '0' else mux_1_5;
mux_2_3 <= mux_1_6 when sel(1) = '0' else mux_1_7;
mux_2_4 <= mux_1_8 when sel(1) = '0' else mux_1_9;

-- Generate level 3 logic
mux_3_0 <= mux_2_0 when sel(2) = '0' else mux_2_1;
mux_3_1 <= mux_2_2 when sel(2) = '0' else mux_2_3;
mux_3_2 <= mux_2_4;

-- Generate level 4 logic
mux_4_0 <= mux_3_0 when sel(3) = '0' else mux_3_1;
mux_4_1 <= mux_3_2;

-- Generate level 5 logic
mux_5_0 <= mux_4_0 when sel(4) = '0' else mux_4_1;

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

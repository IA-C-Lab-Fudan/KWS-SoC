-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.2 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity fbank_band_mapper_rom is 
    generic(
             DWIDTH     : integer := 7; 
             AWIDTH     : integer := 10; 
             MEM_SIZE    : integer := 513
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of fbank_band_mapper_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 1=> "1111110", 2 to 3=> "1111111", 4 to 5=> "0000000", 6 to 8=> "0000001", 
    9 to 10=> "0000010", 11 to 13=> "0000011", 14 to 15=> "0000100", 16 to 18=> "0000101", 
    19 to 21=> "0000110", 22 to 24=> "0000111", 25 to 28=> "0001000", 29 to 31=> "0001001", 
    32 to 34=> "0001010", 35 to 38=> "0001011", 39 to 42=> "0001100", 43 to 46=> "0001101", 
    47 to 51=> "0001110", 52 to 55=> "0001111", 56 to 60=> "0010000", 61 to 65=> "0010001", 
    66 to 70=> "0010010", 71 to 75=> "0010011", 76 to 81=> "0010100", 82 to 87=> "0010101", 
    88 to 93=> "0010110", 94 to 99=> "0010111", 100 to 106=> "0011000", 107 to 113=> "0011001", 
    114 to 121=> "0011010", 122 to 128=> "0011011", 129 to 137=> "0011100", 138 to 145=> "0011101", 
    146 to 154=> "0011110", 155 to 163=> "0011111", 164 to 173=> "0100000", 174 to 183=> "0100001", 
    184 to 194=> "0100010", 195 to 205=> "0100011", 206 to 217=> "0100100", 218 to 229=> "0100101", 
    230 to 242=> "0100110", 243 to 256=> "0100111", 257 to 512=> "1111110" );


begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
    end if;
end process;

end rtl;

Library IEEE;
use IEEE.std_logic_1164.all;

entity fbank_band_mapper is
    generic (
        DataWidth : INTEGER := 7;
        AddressRange : INTEGER := 513;
        AddressWidth : INTEGER := 10);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of fbank_band_mapper is
    component fbank_band_mapper_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    fbank_band_mapper_rom_U :  component fbank_band_mapper_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;



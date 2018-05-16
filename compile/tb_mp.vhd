-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : mos6510
-- Author      : 1
-- Company     : AbelianGroup
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\mos\mos6510\compile\tb_mp.vhd
-- Generated   : Wed May 16 21:47:41 2018
-- From        : c:\My_Designs\mos\mos6510\src\tb_mp.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library ieee;
        use ieee.std_logic_1164.all;
        use ieee.std_logic_arith.all;
        use ieee.std_logic_unsigned.all;

entity tb_mp is 
end tb_mp;

architecture behv of tb_mp is

---- Component declarations -----

component microprocessor
  port (
       cpu_clk : in STD_LOGIC;
       cpu_rst : in STD_LOGIC;
       cpu_output : out STD_LOGIC_VECTOR(15 downto 0)
  );
end component;

---- Signal declarations used on the diagram ----

signal TB_clk : std_logic;
signal TB_rst : std_logic;
signal TB_output : std_logic_vector (15 downto 0);

begin

---- Processes ----

process
                       begin
                         TB_clk <= '0';
                         wait for 5ns;
                         TB_clk <= '1';
                         wait for 5ns;
                       end process;                      

process
                       begin
                         TB_rst <= '1';
                         wait for 50ns;
                         TB_rst <= '0';
                         wait for 100000ns;
                       end process;                      

----  Component instantiations  ----

Unit : microprocessor
  port map(
       cpu_clk => TB_clk,
       cpu_output => TB_output,
       cpu_rst => TB_rst
  );


end behv;

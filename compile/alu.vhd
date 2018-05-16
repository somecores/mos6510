-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : mos6510
-- Author      : 1
-- Company     : AbelianGroup
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\mos\mos6510\compile\alu.vhd
-- Generated   : Wed May 16 21:47:40 2018
-- From        : c:\My_Designs\mos\mos6510\src\alu.bde
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

entity alu is
  port(
       jpsign : in std_logic;
       ALUs : in std_logic_vector(1 downto 0);
       num_A : in std_logic_vector(15 downto 0);
       num_B : in std_logic_vector(15 downto 0);
       ALUz : out std_logic;
       ALUout : out std_logic_vector(15 downto 0)
  );
end alu;

architecture behv of alu is

---- Signal declarations used on the diagram ----

signal alu_tmp : std_logic_vector (15 downto 0);

begin

---- Processes ----

process (num_A,num_B,ALUs)
                       begin
                         case ALUs is 
                           when "00" => 
                              alu_tmp <= num_A;
                           when "01" => 
                              alu_tmp <= num_B;
                           when "10" => 
                              alu_tmp <= num_A + num_B;
                           when "11" => 
                              alu_tmp <= num_A - num_B;
                           when others => 
                         end case;
                       end process;                      

process (jpsign,alu_tmp)
                       begin
                         if (jpsign = '1' and alu_tmp = "0000000000000000") then
                            ALUz <= '1';
                         else 
                            ALUz <= '0';
                         end if;
                       end process;                      

---- Terminal assignment ----

    -- Output\buffer terminals
	ALUout <= alu_tmp;


end behv;

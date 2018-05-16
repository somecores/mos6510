-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : mos6510
-- Author      : 1
-- Company     : AbelianGroup
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\mos\mos6510\compile\memory.vhd
-- Generated   : Wed May 16 21:47:39 2018
-- From        : c:\My_Designs\mos\mos6510\src\memory.bde
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

entity memory is
  port(
       Mre : in std_logic;
       Mwe : in std_logic;
       clock : in std_logic;
       rst : in std_logic;
       address : in std_logic_vector(7 downto 0);
       data_in : in std_logic_vector(15 downto 0);
       data_out : out std_logic_vector(15 downto 0)
  );
end memory;

architecture behv of memory is

---- Architecture declarations -----
--Added by Active-HDL. Do not change code inside this section.
type ram_type is array (0 to 255) of std_logic_vector(15 downto 0);
--End of extra code.


---- Signal declarations used on the diagram ----

signal tmp_ram : ram_type;

begin

---- Processes ----

read : process (clock,rst,Mwe,address)
                       begin
                         if rst = '1' then
                            data_out <= "0000000000000000";
                         else 
                            if (clock'event and clock = '1') then
                               if (Mre = '1' and Mwe = '0') then
                                  data_out <= tmp_ram(conv_integer(address));
                               end if;
                            end if;
                         end if;
                       end process;                      

write : process (clock,rst,Mre,address,data_in)
                       begin
                         if rst = '1' then
                            tmp_ram <= (0 => "0011000000000000",1 => "0011000100000001",2 => "0011001000110100",3 => "0011001100000001",4 => "0001000000110010",5 => "0001000100110011",6 => "0001000101100100",7 => "0100000100000000",8 => "0000000001100100",9 => "0010001000010000",10 => "0100001000110000",11 => "0000010000111011",12 => "0110010000000101",13 => "0111000000110010",14 => "0111000000110011",15 => "0111000000110100",16 => "0111000000110101",17 => "0111000000110110",18 => "0111000000110111",19 => "0111000000111000",20 => "0111000000111001",21 => "0111000000111010",22 => "0111000000111011",23 => "1111000000000000",others => "0000000000000000");
                         else 
                            if (clock'event and clock = '1') then
                               if (Mwe = '1' and Mre = '0') then
                                  tmp_ram(conv_integer(address)) <= data_in;
                               end if;
                            end if;
                         end if;
                       end process;                      

end behv;

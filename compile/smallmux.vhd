-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : mos6510
-- Author      : 1
-- Company     : AbelianGroup
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\mos\mos6510\compile\smallmux.vhd
-- Generated   : Wed May 16 21:47:40 2018
-- From        : c:\My_Designs\mos\mos6510\src\smallmux.bde
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

entity smallmux is
  port(
       I0 : in std_logic_vector(15 downto 0);
       I1 : in std_logic_vector(15 downto 0);
       I2 : in std_logic_vector(15 downto 0);
       Sel : in std_logic_vector(1 downto 0);
       O : out std_logic_vector(15 downto 0)
  );
end smallmux;

architecture behv of smallmux is

begin

---- Processes ----

process (I0,I1,I2,Sel)
                       begin
                         case Sel is 
                           when "00" => 
                              O <= I0;
                           when "01" => 
                              O <= I1;
                           when "10" => 
                              O <= I2;
                           when others => 
                         end case;
                       end process;                      

end behv;

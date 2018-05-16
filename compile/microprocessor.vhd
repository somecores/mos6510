-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : mos6510
-- Author      : 1
-- Company     : AbelianGroup
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\mos\mos6510\compile\microprocessor.vhd
-- Generated   : Wed May 16 21:47:40 2018
-- From        : c:\My_Designs\mos\mos6510\src\microprocessor.bde
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

entity microprocessor is
  port(
       cpu_clk : in std_logic;
       cpu_rst : in std_logic;
       cpu_output : out std_logic_vector(15 downto 0)
  );
end microprocessor;

architecture structure of microprocessor is

---- Component declarations -----

component ctrl_unit
  port (
       PCld_cu : in STD_LOGIC;
       clock_cu : in STD_LOGIC;
       dpdata_out : in STD_LOGIC_VECTOR(15 downto 0);
       mdata_out : in STD_LOGIC_VECTOR(15 downto 0);
       rst_cu : in STD_LOGIC;
       ALUs_cu : out STD_LOGIC_VECTOR(1 downto 0);
       Mre_cu : out STD_LOGIC;
       Mwe_cu : out STD_LOGIC;
       RFr1a_cu : out STD_LOGIC_VECTOR(3 downto 0);
       RFr1e_cu : out STD_LOGIC;
       RFr2a_cu : out STD_LOGIC_VECTOR(3 downto 0);
       RFr2e_cu : out STD_LOGIC;
       RFs_cu : out STD_LOGIC_VECTOR(1 downto 0);
       RFwa_cu : out STD_LOGIC_VECTOR(3 downto 0);
       RFwe_cu : out STD_LOGIC;
       immdata : out STD_LOGIC_VECTOR(15 downto 0);
       jpen_cu : out STD_LOGIC;
       maddr_in : out STD_LOGIC_VECTOR(15 downto 0);
       oe_cu : out STD_LOGIC
  );
end component;
component datapath
  port (
       ALUs_dp : in STD_LOGIC_VECTOR(1 downto 0);
       RFr1a_dp : in STD_LOGIC_VECTOR(3 downto 0);
       RFr1e_dp : in STD_LOGIC;
       RFr2a_dp : in STD_LOGIC_VECTOR(3 downto 0);
       RFr2e_dp : in STD_LOGIC;
       RFs_dp : in STD_LOGIC_VECTOR(1 downto 0);
       RFwa_dp : in STD_LOGIC_VECTOR(3 downto 0);
       RFwe_dp : in STD_LOGIC;
       clock_dp : in STD_LOGIC;
       imm_data : in STD_LOGIC_VECTOR(15 downto 0);
       jp_en : in STD_LOGIC;
       mem_data : in STD_LOGIC_VECTOR(15 downto 0);
       oe_dp : in STD_LOGIC;
       rst_dp : in STD_LOGIC;
       ALUout_dp : out STD_LOGIC_VECTOR(15 downto 0);
       ALUz_dp : out STD_LOGIC;
       RF1out_dp : out STD_LOGIC_VECTOR(15 downto 0);
       bufout_dp : out STD_LOGIC_VECTOR(15 downto 0)
  );
end component;
component memory
  port (
       Mre : in STD_LOGIC;
       Mwe : in STD_LOGIC;
       address : in STD_LOGIC_VECTOR(7 downto 0);
       clock : in STD_LOGIC;
       data_in : in STD_LOGIC_VECTOR(15 downto 0);
       rst : in STD_LOGIC;
       data_out : out STD_LOGIC_VECTOR(15 downto 0)
  );
end component;

---- Signal declarations used on the diagram ----

signal IRld_s : std_logic;
signal jpz_s : std_logic;
signal Mre_s : std_logic;
signal Mwe_s : std_logic;
signal oe_s : std_logic;
signal PCclr_s : std_logic;
signal PCinc_s : std_logic;
signal PCld_s : std_logic;
signal RFr1e_s : std_logic;
signal RFr2e_s : std_logic;
signal RFwe_s : std_logic;
signal addr_bus : std_logic_vector (15 downto 0);
signal ALUs_s : std_logic_vector (1 downto 0);
signal immd_bus : std_logic_vector (15 downto 0);
signal mdin_bus : std_logic_vector (15 downto 0);
signal mdout_bus : std_logic_vector (15 downto 0);
signal mem_addr : std_logic_vector (7 downto 0);
signal rfout_bus : std_logic_vector (15 downto 0);
signal RFr1a_s : std_logic_vector (3 downto 0);
signal RFr2a_s : std_logic_vector (3 downto 0);
signal RFs_s : std_logic_vector (1 downto 0);
signal RFwa_s : std_logic_vector (3 downto 0);

begin

---- User Signal Assignments ----
mem_addr <= addr_bus(7 downto 0);

----  Component instantiations  ----

Unit0 : ctrl_unit
  port map(
       ALUs_cu => ALUs_s,
       Mre_cu => Mre_s,
       Mwe_cu => Mwe_s,
       PCld_cu => PCld_s,
       RFr1a_cu => RFr1a_s,
       RFr1e_cu => RFr1e_s,
       RFr2a_cu => RFr2a_s,
       RFr2e_cu => RFr2e_s,
       RFs_cu => RFs_s,
       RFwa_cu => RFwa_s,
       RFwe_cu => RFwe_s,
       clock_cu => cpu_clk,
       dpdata_out => rfout_bus,
       immdata => immd_bus,
       jpen_cu => jpz_s,
       maddr_in => addr_bus,
       mdata_out => mdout_bus,
       oe_cu => oe_s,
       rst_cu => cpu_rst
  );

Unit1 : datapath
  port map(
       ALUout_dp => mdin_bus,
       ALUs_dp => ALUs_s,
       ALUz_dp => PCld_s,
       RF1out_dp => rfout_bus,
       RFr1a_dp => RFr1a_s,
       RFr1e_dp => RFr1e_s,
       RFr2a_dp => RFr2a_s,
       RFr2e_dp => RFr2e_s,
       RFs_dp => RFs_s,
       RFwa_dp => RFwa_s,
       RFwe_dp => RFwe_s,
       bufout_dp => cpu_output,
       clock_dp => cpu_clk,
       imm_data => immd_bus,
       jp_en => jpz_s,
       mem_data => mdout_bus,
       oe_dp => oe_s,
       rst_dp => cpu_rst
  );

Unit2 : memory
  port map(
       Mre => Mre_s,
       Mwe => Mwe_s,
       address => mem_addr,
       clock => cpu_clk,
       data_in => mdin_bus,
       data_out => mdout_bus,
       rst => cpu_rst
  );


end structure;

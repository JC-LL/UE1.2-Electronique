-----------------------------------------------------------------
-- This file was generated automatically by vhdl_tb Ruby utility
-- date : (d/m/y) 12/11/2018 11:42
-- Author : Jean-Christophe Le Lann - 2014
-----------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ab_plus_cd_unsigned_tb is
  generic(n : natural :=8);
end entity;

architecture bhv of ab_plus_cd_unsigned_tb is

  constant HALF_PERIOD : time := 5 ns;

  signal clk     : std_logic := '0';
  signal reset_n : std_logic := '0';
  signal sreset  : std_logic := '0';
  signal running : boolean   := true;

  procedure wait_cycles(n : natural) is
   begin
     for i in 1 to n loop
       wait until rising_edge(clk);
     end loop;
   end procedure;

  signal a       : unsigned(n-1 downto 0);
  signal b       : unsigned(n-1 downto 0);
  signal c       : unsigned(n-1 downto 0);
  signal d       : unsigned(n-1 downto 0);
  signal f       : unsigned(2*n-1 downto 0);

begin
  -------------------------------------------------------------------
  -- clock and reset
  -------------------------------------------------------------------
  reset_n <= '0','1' after 66 ns;

  clk <= not(clk) after HALF_PERIOD when running else clk;

  --------------------------------------------------------------------
  -- Design Under Test
  --------------------------------------------------------------------
  --dut : entity work.ab_plus_cd_unsigned(combinatoire)
  dut : entity work.ab_plus_cd_unsigned(truncated)

        port map (
          reset_n => reset_n,
          clk     => clk    ,
          a       => a      ,
          b       => b      ,
          c       => c      ,
          d       => d      ,
          f       => f
        );

  --------------------------------------------------------------------
  -- sequential stimuli
  --------------------------------------------------------------------
  stim : process
   begin
     a<= x"00";
     b<= x"00";
     c<= x"00";
     d<= x"00";
     report "running testbench for ab_plus_cd_UNSIGNED";
     report "waiting for asynchronous reset";
     wait until reset_n='1';
     wait_cycles(5);
     report "applying stimuli...";

     wait until rising_edge(clk);
     a<= to_unsigned(1,n);
     b<= to_unsigned(1,n);
     c<= to_unsigned(1,n);
     d<= to_unsigned(1,n);
     -- 1*1+1*1 => 2

     wait until rising_edge(clk);
     report "computing biggest value possible";
     a<= x"FF";
     b<= x"FF";
     c<= x"FF";
     d<= x"FF";
     -- 255*255+255*255=2*255**2=130050
     wait_cycles(10);
     report "end of simulation";
     running <=false;
     wait;
   end process;

end bhv;
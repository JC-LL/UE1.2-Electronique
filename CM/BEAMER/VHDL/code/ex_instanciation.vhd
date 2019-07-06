library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity A is
  port(
    a1 : in  std_logic;
    a2 : in  std_logic;
    s  : out std_logic
    );
end entity;

architecture simple of A is
begin
  s <= a1 and a2;
end simple;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity B is
  port(
    reset_n : in  std_logic;
    clock   : in  std_logic;
    b1, b2  : in  std_logic;
    s       : out std_logic
    );
end entity;

architecture simple of B is
begin
  process(reset_n, clock)
  begin
    if reset_n = '0' then
      s <= '0';
    elsif rising_edge(clock) then
      s <= b1 xor b2;
    end if;
  end process;
end simple;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity C is
  port(
    reset_n : in  std_logic;
    clk     : in  std_logic;
    in_d    : in  std_logic;
    in_e    : in  std_logic;
    out_f   : out std_logic
    );
end entity;

architecture rtl of C is
  signal s1, s2 : std_logic;
begin

  inst_a_1 : entity work.A(rtl)
    port map(
      a1 => in_d,
      a2 => in_e,
      s  => s2
      );

  inst_a_2 : entity work.A(rtl)
    port map(
      a1 => in_d,
      a2 => in_e,
      s  => s1
      );

  inst_b_1 : entity work.B(rtl)
    port map(
      reset_n => reset_n,
      clock   => clk,
      b1      => s1,
      b2      => s2,
      s       => out_f
      );


end rtl;

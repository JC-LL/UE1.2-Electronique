
library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
  port(
    a, b    : in  std_logic;
    s, cout : out std_logic;
    );
end entity;

architecture logic of half_adder is
begin
  
  s    <= a xor b;
  cout <= a and b;

end logic;



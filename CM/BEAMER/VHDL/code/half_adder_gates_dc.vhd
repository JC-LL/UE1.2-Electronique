
library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_half_adder is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_half_adder;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_half_adder.all;

entity half_adder is

   port( a, b : in std_logic;  s, cout : out std_logic);

end half_adder;

architecture SYN_logic of half_adder is

   component AND2X1
      port( IN1, IN2 : in std_logic;  Q : out std_logic);
   end component;
   
   component XOR2X1
      port( IN1, IN2 : in std_logic;  Q : out std_logic);
   end component;

begin
   
   U3 : XOR2X1 port map( IN1 => b, IN2 => a, Q => s);
   U4 : AND2X1 port map( IN1 => b, IN2 => a, Q => cout);

end SYN_logic;


library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_B is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_B;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_B.all;

entity B is

   port( reset_n, clock, b1, b2 : in std_logic;  s : out std_logic);

end B;

architecture SYN_simple of B is

   component XOR2X1
      port( IN1, IN2 : in std_logic;  Q : out std_logic);
   end component;
   
   component DFFARX1
      port( D, CLK, RSTB : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal N0, n_1000 : std_logic;

begin
   
   s_reg : DFFARX1 port map( D => N0, CLK => clock, RSTB => reset_n, Q => s, QN
                           => n_1000);
   U4 : XOR2X1 port map( IN1 => b2, IN2 => b1, Q => N0);

end SYN_simple;

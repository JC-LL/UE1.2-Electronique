
library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_C_1 is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_C_1;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_C_1.all;

entity A_0 is

   port( a1, a2 : in std_logic;  s : out std_logic);

end A_0;

architecture SYN_simple of A_0 is

   component AND2X1
      port( IN1, IN2 : in std_logic;  Q : out std_logic);
   end component;

begin
   
   U1 : AND2X1 port map( IN1 => a2, IN2 => a1, Q => s);

end SYN_simple;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_C_1.all;

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
   U3 : XOR2X1 port map( IN1 => b2, IN2 => b1, Q => N0);

end SYN_simple;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_C_1.all;

entity A_1 is

   port( a1, a2 : in std_logic;  s : out std_logic);

end A_1;

architecture SYN_simple of A_1 is

   component AND2X1
      port( IN1, IN2 : in std_logic;  Q : out std_logic);
   end component;

begin
   
   U1 : AND2X1 port map( IN1 => a2, IN2 => a1, Q => s);

end SYN_simple;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_C_1.all;

entity C_1 is

   port( reset_n, clk, in_d, in_e : in std_logic;  out_f : out std_logic);

end C_1;

architecture SYN_rtl of C_1 is

   component B
      port( reset_n, clock, b1, b2 : in std_logic;  s : out std_logic);
   end component;
   
   component A_0
      port( a1, a2 : in std_logic;  s : out std_logic);
   end component;
   
   component A_1
      port( a1, a2 : in std_logic;  s : out std_logic);
   end component;
   
   signal s2, s1 : std_logic;

begin
   
   inst_a_1 : A_1 port map( a1 => in_d, a2 => in_e, s => s2);
   inst_a_2 : A_0 port map( a1 => in_d, a2 => in_e, s => s1);
   inst_b_1 : B port map( reset_n => reset_n, clock => clk, b1 => s1, b2 => s2,
                           s => out_f);

end SYN_rtl;

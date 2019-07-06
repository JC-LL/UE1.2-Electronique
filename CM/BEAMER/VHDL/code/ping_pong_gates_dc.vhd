
library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_ping_pong is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_ping_pong;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_ping_pong.all;

entity ping_pong is

   port( reset_n, clk, ball : in std_logic;  spy : out std_logic);

end ping_pong;

architecture SYN_rtl of ping_pong is

   component OR2X1
      port( IN1, IN2 : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND2X1
      port( IN1, IN2 : in std_logic;  QN : out std_logic);
   end component;
   
   component NOR2X0
      port( IN1, IN2 : in std_logic;  QN : out std_logic);
   end component;
   
   component INVX0
      port( INP : in std_logic;  ZN : out std_logic);
   end component;
   
   component AO221X1
      port( IN1, IN2, IN3, IN4, IN5 : in std_logic;  Q : out std_logic);
   end component;
   
   component AO22X1
      port( IN1, IN2, IN3, IN4 : in std_logic;  Q : out std_logic);
   end component;
   
   component DFFASRX1
      port( D, CLK, RSTB, SETB : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal spy_port, n5, n6, n7, n9, n10, n11, n16, n17, n18, n19, n20, n_1000 :
      std_logic;
   
   signal state, next_state : std_logic_vector(1 downto 0);

begin
   spy <= spy_port;
   
   state_reg_0_inst : DFFASRX1 port map( D => next_state(0), CLK => clk, RSTB 
                           => n17, SETB => n19, Q => state(0), QN => n16);
   state_reg_1_inst : DFFASRX1 port map( D => next_state(1), CLK => clk, RSTB 
                           => n18, SETB => n20, Q => state(1), QN => n_1000);
   U19 : AO22X1 port map( IN1 => spy_port, IN2 => ball, IN3 => state(1), IN4 =>
                           n10, Q => next_state(1));
   U20 : AO221X1 port map( IN1 => ball, IN2 => state(1), IN3 => spy_port, IN4 
                           => n9, IN5 => n7, Q => next_state(0));
   U21 : INVX0 port map( INP => next_state(1), ZN => n5);
   U22 : INVX0 port map( INP => next_state(0), ZN => n6);
   U23 : INVX0 port map( INP => ball, ZN => n9);
   U24 : INVX0 port map( INP => n11, ZN => n7);
   U25 : NAND2X1 port map( IN1 => ball, IN2 => n11, QN => n10);
   U26 : NOR2X0 port map( IN1 => n16, IN2 => state(1), QN => spy_port);
   U27 : NAND2X1 port map( IN1 => state(1), IN2 => state(0), QN => n11);
   U28 : OR2X1 port map( IN1 => reset_n, IN2 => next_state(0), Q => n17);
   U29 : OR2X1 port map( IN1 => reset_n, IN2 => next_state(1), Q => n18);
   U30 : OR2X1 port map( IN1 => reset_n, IN2 => n6, Q => n19);
   U31 : OR2X1 port map( IN1 => reset_n, IN2 => n5, Q => n20);

end SYN_rtl;

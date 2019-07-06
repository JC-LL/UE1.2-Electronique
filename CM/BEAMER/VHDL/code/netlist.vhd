library IEEE;
use IEEE.std_logic_1164.all;

entity circuit_fsm is
  port(reset_n, clk : in  std_logic;
       e1, e2       : in  std_logic;
       o1           : out std_logic);
end circuit_fsm;

architecture SYN_solution of circuit_fsm is

  component NAND2X1
    port(IN1, IN2 : in std_logic; QN : out std_logic);
  end component;

  -- code supprimé...

  component DFFARX1
    port(D, CLK, RSTB : in std_logic; Q, QN : out std_logic);
  end component;

  signal Q, D : std_logic_vector(1 downto 0);

  signal n1, n2, n3, n4, n5, n6 : std_logic;

begin

  Q_reg_0_inst : DFFARX1 port map(D => D(0), CLK => clk, RSTB => reset_n, Q
                                  => Q(0), QN => n2);
  Q_reg_1_inst : DFFARX1 port map(D => D(1), CLK => clk, RSTB => reset_n, Q
                                  => Q(1), QN => n1);
  U7  : AO21X1  port map(IN1  => n3, IN2 => n1, IN3 => Q(0), Q => n5);
  U8  : NAND3X0 port map(IN1 => Q(0), IN2 => n1, IN3 => e2, QN => n4);
  U9  : OA22X1  port map(IN1  => Q(0), IN2 => n3, IN3 => e2, IN4 => n2, Q => n6);
  U10 : NOR2X0  port map(IN1  => n4, IN2 => n3, QN => D(1));
  U11 : NOR2X0  port map(IN1  => Q(1), IN2 => n6, QN => D(0));
  U12 : INVX0   port map(INP   => e1, ZN => n3);
  U13 : NAND2X1 port map(IN1 => n4, IN2 => n5, QN => o1);

end SYN_solution;

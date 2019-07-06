library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity circuit_fsm is
  port (
    reset_n : in  std_logic;
    clk     : in  std_logic;
    e1      : in  std_logic;
    e2      : in  std_logic;
    o1      : out std_logic
    );                     
end circuit_fsm;

architecture solution of circuit_fsm is
  signal D, Q : std_logic_vector(1 downto 0);  --2 bits d'états
begin
  -----------------------------------------
  -- equations logiques d'etat suivant :
  ----------------------------------------
  D(1) <=   not Q(1) and Q(0) and e1 and e2;
  D(0) <=  (not Q(1) and  not Q(0) and e1 ) or (not Q(1) and Q(0) and not e2);
  -----------------------------------------
  -- equations logiques des sorties :
  -------------------------------       ---------
  o1   <= (not Q(1) and not Q(0) and e1) or (not Q(1) and Q(0) and e2) or (Q(1) and not Q(0));
  -----------------------------------------
  -- registres d'état (bascules D)
  ----------------------------------------
  regs_etat : process(reset_n, clk)
  begin
    if reset_n = '0' then
      Q <= "00";                               --etat S0
    elsif rising_edge(clk) then
      Q <= D;
    end if;
  end process;

end solution;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sequence_detector is
  port(
    reset_n : in std_logic;
    clk : in std_logic;
    e : in std_logic;
    s : out std_logic
  );
end entity;

architecture rtl of sequence_detector is

  type state_type is (IDLE,UN,DEUX,TROIS,QUATRE);
  signal state_r,state_c : state_type;

begin

  tick : process(reset_n,clk)
  begin
    if reset_n='0' then
      state_r <= IDLE;
    elsif rising_edge(clk) then
      state_r <= state_c;
    end if;
  end process;

  comb : process(e,state_r)
    begin
      state_c <= state_r; --default assigment
      s <= '0';
      case state_r is
        when IDLE =>
          if e='0' then
            state_c <= UN;
          end if;
        when UN =>
          if e='1' then
            state_c <= DEUX;
          end if;
        when DEUX =>
          if e='1' then
            state_c <= TROIS;
          elsif e='0' then
            state_c <= UN;
          end if;
        when TROIS =>
          if e='1' then
            state_c <= IDLE;
          elsif e='0' then
            state_c <= QUATRE;
          end if;
        when QUATRE =>
          s <= '1';
          if e='1' then
            state_c <= DEUX;
          elsif e='0' then
            state_c <= UN;
          end if;
        when others =>
          null;
      end case;
  end process;

end rtl;

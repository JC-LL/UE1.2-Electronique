-- automatically generated by RubyRTL
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ruby_rtl;
use ruby_rtl.ruby_rtl_package.all;

library fsm_lib;
use fsm_lib.fsm_package.all;

entity fsm_c is
  port (
    reset_n : in std_logic;
    clk     : in std_logic;
    go : in  std_logic;
    done : out std_logic);
end fsm_c;

architecture rtl of fsm_c is
  type controler_state_t is (s0,s1,s2,s3);
  signal controler_state : controler_state_t;
begin

  controler_update : process(reset_n,clk)
  begin
    if reset_n='0' then
      controler_state <= s0;
    elsif rising_edge(clk) then
      if sreset='1' then
        controler_state <= s0;
      else
        case controler_state is
          when s0 =>
            if (to_uint(go,1) = 1) then
              controler_state <= s1;
            end if;
          when s1 =>
            controler_state <= s2;
          when s2 =>
            controler_state <= s3;
          when s3 =>
            controler_state <= s0;
          when others =>
            null;
        end case;
      end if;
    end if;
  end process;


end rtl;

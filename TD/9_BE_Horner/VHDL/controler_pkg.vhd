-- automatically generated by RubyRTL
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package controler_pkg is
  type control_type is record
    cmd_0 : integer range 0 to 1;
    cmd_1 : integer range 0 to 1;
    cmd_2 : integer range 0 to 1;
    cmd_3 : integer range 0 to 2; -- warning
    cmd_4 : integer range 0 to 1;
    cmd_5 : integer range 0 to 2; -- warning
  end record;
end package;

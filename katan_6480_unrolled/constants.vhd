library ieee;
use ieee.std_logic_1164.all;

package constants is
    type ctr_array is array(254 downto 0) of std_logic_vector(7 downto 0);
    type key_array is array(254 downto 0) of std_logic_vector(79 downto 0);
    type l1_array is array(254 downto 0) of std_logic_vector(24 downto 0);
    type l2_array is array(254 downto 0) of std_logic_vector(38 downto 0);
end package;

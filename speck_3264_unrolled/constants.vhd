library ieee;
use ieee.std_logic_1164.all;

package constants is
    type key_array is array(22 downto 0) of std_logic_vector(15 downto 0);
    type l_array is array(23 downto 0) of std_logic_vector(15 downto 0);
    type ct_array is array(22 downto 0) of std_logic_vector(31 downto 0);
end package;

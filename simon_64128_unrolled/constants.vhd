library ieee;
use ieee.std_logic_1164.all;

package constants is
    type key_array is array(43 downto 0) of std_logic_vector(31 downto 0);
    type ct_array is array(44 downto 0) of std_logic_vector(63 downto 0);
end package;

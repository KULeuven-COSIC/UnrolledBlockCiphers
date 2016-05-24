library ieee;
use ieee.std_logic_1164.all;
use work.constants.all;

entity katan_key is
    port (
        keyi : in  std_logic_vector(79 downto 0);
        keyo : out std_logic_vector(79 downto 0)
    );
end entity;

architecture rtl of katan_key is
begin
    lfsr_process : process (keyi) is
    begin
        keyo <= keyi(77 downto 0) & (keyi(79) xor keyi(60) xor keyi(49) xor keyi(12)) & (keyi(78) xor keyi(59) xor keyi(48) xor keyi(11));
    end process lfsr_process;
end architecture rtl;

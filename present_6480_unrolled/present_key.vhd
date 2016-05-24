library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constants.all;

entity present_key is
    generic (
        round_ctr : integer
    );
    port (
        keyi : in  std_logic_vector(79 downto 0);
        keyo : out std_logic_vector(79 downto 0)
    );
end entity;

architecture rtl of present_key is
    component present_sbox is
        port (
            datai : in  std_logic_vector(3 downto 0);
            datao : out std_logic_vector(3 downto 0)
        );
    end component present_sbox;
begin
    sbox0 : present_sbox
        port map (
            datai => keyi(18 downto 15),
            datao => keyo(79 downto 76)
        );

    expand_process : process (keyi) is
    begin
        keyo(75 downto 0) <= keyi(14 downto 0) & keyi(79 downto 39) & (keyi(38 downto 34) xor std_logic_vector(to_unsigned(round_ctr, 5))) & keyi(33 downto 19);
    end process expand_process;
end architecture rtl;

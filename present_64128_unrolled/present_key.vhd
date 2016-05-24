library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constants.all;

entity present_key is
    generic (
        round_ctr : integer
    );
    port (
        keyi : in  std_logic_vector(127 downto 0);
        keyo : out std_logic_vector(127 downto 0)
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
            datai => keyi(66 downto 63),
            datao => keyo(127 downto 124)
        );

    sbox1 : present_sbox
        port map (
            datai => keyi(62 downto 59),
            datao => keyo(123 downto 120)
        );

    expand_process : process (keyi) is
    begin
        keyo(119 downto 0) <= keyi(58 downto 6) & (keyi(5 downto 1) xor std_logic_vector(to_unsigned(round_ctr, 5))) & keyi(0) & keyi(127 downto 67);
    end process expand_process;
end architecture rtl;

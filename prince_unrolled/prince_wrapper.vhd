library ieee;
use ieee.std_logic_1164.all;

entity prince_wrapper is
end entity;

architecture rtl of prince_wrapper is
    signal   r_key        : std_logic_vector(127 downto 0);
    signal   r_plaintext  : std_logic_vector(63 downto 0);

    signal   r_ciphertext : std_logic_vector(63 downto 0);

    component prince is
        port (
            key        : in  std_logic_vector(127 downto 0);
            plaintext  : in  std_logic_vector(63 downto 0);

            ciphertext : out std_logic_vector(63 downto 0)
        );
    end component prince;
begin
    prince0 : prince
        port map (
            key        => r_key,
            plaintext  => r_plaintext,

            ciphertext => r_ciphertext
        );
end architecture;

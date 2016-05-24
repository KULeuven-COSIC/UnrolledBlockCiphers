library ieee;
use ieee.std_logic_1164.all;

entity speck_tb is
end entity;

architecture test of speck_tb is
    signal   r_key        : std_logic_vector(127 downto 0);
    signal   r_plaintext  : std_logic_vector(63 downto 0);

    signal   r_ciphertext : std_logic_vector(63 downto 0);

    component speck is
        port (
            key        : in  std_logic_vector(127 downto 0);
            plaintext  : in  std_logic_vector(63 downto 0);

            ciphertext : out std_logic_vector(63 downto 0)
        );
    end component speck;
begin
    dut : speck
        port map (
            key        => r_key,
            plaintext  => r_plaintext,

            ciphertext => r_ciphertext
        );

    process
    begin
        r_key       <= x"1b1a1918131211100b0a090803020100";
        r_plaintext <= x"3b7265747475432d";

        wait;
    end process;
end architecture;

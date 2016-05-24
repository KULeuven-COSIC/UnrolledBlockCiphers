library ieee;
use ieee.std_logic_1164.all;

entity aes_tb is
end entity;

architecture test of aes_tb is
    signal   r_key        : std_logic_vector(127 downto 0);
    signal   r_plaintext  : std_logic_vector(127 downto 0);

    signal   r_ciphertext : std_logic_vector(127 downto 0);

    component aes is
        port (
            key        : in  std_logic_vector(127 downto 0);
            plaintext  : in  std_logic_vector(127 downto 0);

            ciphertext : out std_logic_vector(127 downto 0)
        );
    end component aes;
begin
    dut : aes
        port map (
            key        => r_key,
            plaintext  => r_plaintext,

            ciphertext => r_ciphertext
        );

    process
    begin
        r_key       <= x"000102030405060708090a0b0c0d0e0f";
        r_plaintext <= x"00112233445566778899aabbccddeeff";

        wait;
    end process;
end architecture;

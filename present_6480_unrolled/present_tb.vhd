library ieee;
use ieee.std_logic_1164.all;

entity present_tb is
end entity;

architecture test of present_tb is
    signal   r_key        : std_logic_vector(79 downto 0);
    signal   r_plaintext  : std_logic_vector(63 downto 0);

    signal   r_ciphertext : std_logic_vector(63 downto 0);

    component present is
        port (
            key        : in  std_logic_vector(79 downto 0);
            plaintext  : in  std_logic_vector(63 downto 0);

            ciphertext : out std_logic_vector(63 downto 0)
        );
    end component present;
begin
    dut : present
        port map (
            key        => r_key,
            plaintext  => r_plaintext,

            ciphertext => r_ciphertext
        );

    process
    begin
        r_key       <= x"00000000000000000000";
        r_plaintext <= x"0000000000000000";

        wait;
    end process;
end architecture;

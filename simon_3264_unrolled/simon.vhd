library ieee;
use ieee.std_logic_1164.all;
use work.constants.all;

entity simon is
    port (
        key        : in  std_logic_vector(63 downto 0);
        plaintext  : in  std_logic_vector(31 downto 0);

        ciphertext : out std_logic_vector(31 downto 0)
    );
end entity;

architecture rtl of simon is
    signal keys : key_array;
    signal cts  : ct_array; 

    component simon_key is
        generic (
            round_ctr     :  integer
        );
        port (
            k_0, k_1, k_3 : in  std_logic_vector(15 downto 0);
            key           : out std_logic_vector(15 downto 0)
        );
    end component simon_key;

    component simon_enc is
        port (
            key : in  std_logic_vector(15 downto 0);
            xy  : in  std_logic_vector(31 downto 0);

            yx  : out std_logic_vector(31 downto 0)
        );
    end component simon_enc;
begin
    enc_generate : for i in 0 to 31 generate
        enc0 : simon_enc
            port map (
                xy  => cts(i),
                key => keys(i),
                
                yx  => cts(i+1)
            );
    end generate;

    key_generate : for i in 4 to 31 generate
        key0 : simon_key
            generic map (
                round_ctr => i-4
            )
            port map (
                k_0       => keys(i-4),
                k_1       => keys(i-3),
                k_3       => keys(i-1),

                key       => keys(i)
            );
    end generate;

    enc_process : process(key, plaintext) is
    begin
        keys(0) <= key(15 downto 0);
        keys(1) <= key(31 downto 16);
        keys(2) <= key(47 downto 32);
        keys(3) <= key(63 downto 48);

        cts(0)  <= plaintext;
    end process enc_process;

    ciphertext <= cts(32);
end architecture rtl;

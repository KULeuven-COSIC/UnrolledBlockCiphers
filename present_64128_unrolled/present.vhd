library ieee;
use ieee.std_logic_1164.all;
use work.constants.all;

entity present is
    port (
        key        : in  std_logic_vector(127 downto 0);
        plaintext  : in  std_logic_vector(63 downto 0);

        ciphertext : out std_logic_vector(63 downto 0)
    );
end entity;

architecture rtl of present is
    signal keys : key_array;
    signal cts  : ct_array;

    component present_key is
        generic (
            round_ctr : integer
        );
        port (
            keyi : in  std_logic_vector(127 downto 0);
            keyo : out std_logic_vector(127 downto 0)
        );
    end component present_key;

    component present_enc is
        port (
            key   : in  std_logic_vector(127 downto 0);
            datai : in  std_logic_vector(63 downto 0);

            datao : out std_logic_vector(63 downto 0)
        );
    end component present_enc;
begin
    enc_generate : for i in 0 to 30 generate
        enc0 : present_enc
            port map (
                key   => keys(i),
                datai => cts(i),
                
                datao => cts(i+1)
            );
    end generate;

    key_generate : for i in 0 to 30 generate
        key0 : present_key
            generic map (
                round_ctr => i+1
            )
            port map (
                keyi => keys(i),
                keyo => keys(i+1)
            );
    end generate;

    enc_process : process(key, plaintext) is
    begin
        keys(0) <= key;
        cts(0)  <= plaintext;
    end process enc_process;

    ciphertext <= cts(31) xor keys(31)(127 downto 64);
end architecture rtl;

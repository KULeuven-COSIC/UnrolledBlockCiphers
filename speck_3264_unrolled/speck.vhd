library ieee;
use ieee.std_logic_1164.all;
use work.constants.all;

entity speck is
    port (
        key        : in  std_logic_vector(63 downto 0);
        plaintext  : in  std_logic_vector(31 downto 0);

        ciphertext : out std_logic_vector(31 downto 0)
    );
end entity;

architecture rtl of speck is
    signal keys  : key_array;
    signal ls    : l_array;
    signal cts   : ct_array; 

    component speck_key is
        generic (
            round_ctr :  integer
        );
        port (
            keyi, li  : in  std_logic_vector(15 downto 0);
            keyo, lo  : out std_logic_vector(15 downto 0)
        );
    end component speck_key;

    component speck_enc is
        port (
            key : in  std_logic_vector(15 downto 0);
            xy  : in  std_logic_vector(31 downto 0);

            yx  : out std_logic_vector(31 downto 0)
        );
    end component speck_enc;
begin
    enc_generate : for i in 0 to 21 generate
        enc0 : speck_enc
            port map (
                xy  => cts(i),
                key => keys(i),
                
                yx  => cts(i+1)
            );
    end generate;

    key_generate : for i in 0 to 20 generate
        key0 : speck_key
            generic map (
                round_ctr => i
            )
            port map (
                keyi      => keys(i),
                li        => ls(i),

                keyo      => keys(i+1),
                lo        => ls(i+3)
            );
    end generate;

    enc_process : process(key, plaintext) is
    begin
        keys(0) <= key(15 downto 0);

        ls(0)   <= key(31 downto 16);
        ls(1)   <= key(47 downto 32);
        ls(2)   <= key(63 downto 48);

        cts(0)  <= plaintext;
    end process enc_process;

    ciphertext <= cts(22);
end architecture rtl;

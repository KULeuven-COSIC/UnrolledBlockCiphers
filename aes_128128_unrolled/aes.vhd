library ieee;
use ieee.std_logic_1164.all;
use work.constants.all;

entity aes is
    port (
        key        : in  std_logic_vector(127 downto 0);
        plaintext  : in  std_logic_vector(127 downto 0);

        ciphertext : out std_logic_vector(127 downto 0)
    );
end entity;

architecture rtl of aes is
    signal keys   : key_array;
    signal cts    : ct_array;

    signal sboxo  : std_logic_vector(127 downto 0);
    signal shifto : std_logic_vector(127 downto 0);

    component aes_key is
        generic (
            round_ctr : integer
        );
        port (
            keyi : in  std_logic_vector(127 downto 0);
            keyo : out std_logic_vector(127 downto 0)
        );
    end component aes_key;

    component aes_enc is
        port (
            key   : in  std_logic_vector(127 downto 0);
            datai : in  std_logic_vector(127 downto 0);

            datao : out std_logic_vector(127 downto 0)
        );
    end component aes_enc;

    component aes_sbox is
        port (
            datai : in  std_logic_vector(7 downto 0);
            datao : out std_logic_vector(7 downto 0)
        );
    end component aes_sbox;

    component aes_shift is
        port (
            datai : in  std_logic_vector(127 downto 0);
            datao : out std_logic_vector(127 downto 0)
        );
    end component aes_shift;
begin
    enc_generate : for i in 0 to 8 generate
        enc0 : aes_enc
            port map (
                key   => keys(i+1),
                datai => cts(i),
                
                datao => cts(i+1)
            );
    end generate;

    key_generate : for i in 0 to 9 generate
        key0 : aes_key
            generic map (
                round_ctr => i+1
            )
            port map (
                keyi => keys(i),
                keyo => keys(i+1)
            );
    end generate;

    sbox_generate : for i in 0 to 15 generate
        sbox0 : aes_sbox
            port map (
                datai => cts(9)(8*i+7 downto 8*i),
                datao => sboxo(8*i+7 downto 8*i)
            );
    end generate;

    shift0 : aes_shift
        port map (
            datai => sboxo,
            datao => shifto
        );

    enc_process : process(key, plaintext) is
    begin
        keys(0) <= key;
        cts(0)  <= plaintext xor key;
    end process enc_process;

    ciphertext <= shifto xor keys(10);
end architecture rtl;

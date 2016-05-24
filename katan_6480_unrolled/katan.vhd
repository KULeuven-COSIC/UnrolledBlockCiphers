library ieee;
use ieee.std_logic_1164.all;
use work.constants.all;

entity katan is
    port (
        key        : in  std_logic_vector(79 downto 0);
        plaintext  : in  std_logic_vector(63 downto 0);

        ciphertext : out std_logic_vector(63 downto 0)
    );
end entity;

architecture rtl of katan is
    signal keys  : key_array;
    signal ctrs  : ctr_array;
    signal l1s   : l1_array;
    signal l2s   : l2_array; 

    component katan_key is
        port (
            keyi : in  std_logic_vector(79 downto 0);
            keyo : out std_logic_vector(79 downto 0)
        );
    end component katan_key;

    component katan_enc is
        port (
            key  : in  std_logic_vector(79 downto 0);
            ctri : in  std_logic_vector(7 downto 0);
            l1i  : in  std_logic_vector(24 downto 0);
            l2i  : in  std_logic_vector(38 downto 0);

            ctro : out  std_logic_vector(7 downto 0);
            l1o  : out std_logic_vector(24 downto 0);
            l2o  : out std_logic_vector(38 downto 0)
        );
    end component katan_enc;
begin
    enc_generate : for i in 0 to 253 generate
        enc0 : katan_enc
            port map (
                ctri => ctrs(i),
                l1i  => l1s(i),
                l2i  => l2s(i),
                key  => keys(i),
                
                ctro => ctrs(i+1),
                l1o  => l1s(i+1),
                l2o  => l2s(i+1)
            );
    end generate;

    key_generate : for i in 0 to 253 generate
        key0 : katan_key
            port map (
                keyi => keys(i),
                keyo => keys(i+1)
            );
    end generate;

    enc_process : process(key, plaintext) is
    begin
        ctrs(0) <= "11111110";
        keys(0) <= key;
        l1s(0)  <= plaintext(63 downto 39);
        l2s(0)  <= plaintext(38 downto 0);
    end process enc_process;

    ciphertext <= l1s(254) & l2s(254);
end architecture rtl;

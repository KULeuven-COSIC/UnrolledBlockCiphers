library ieee;
use ieee.std_logic_1164.all;
use work.constants.all;

entity prince is
    port (
        key        : in  std_logic_vector(127 downto 0);
        plaintext  : in  std_logic_vector(63 downto 0);

        ciphertext : out std_logic_vector(63 downto 0)
    );
end entity;

architecture rtl of prince is
    signal k_1     : std_logic_vector(63 downto 0);

    signal round   : round_array;
    signal matrixi : std_logic_vector(63 downto 0);
    signal matrixo : std_logic_vector(63 downto 0);
    signal round_i : round_array;

    component prince_round is
        generic (
            round_ctr : integer
        );
        port (
            key       : in  std_logic_vector(63 downto 0);
            datai     : in  std_logic_vector(63 downto 0);

            datao     : out std_logic_vector(63 downto 0)
        );
    end component prince_round;

    component prince_sbox is
        port (
            datai : in  std_logic_vector(3 downto 0);
            datao : out std_logic_vector(3 downto 0)
        );
    end component prince_sbox;

    component prince_matrix_p is
        port (
            datai : in  std_logic_vector(63 downto 0);
            datao : out std_logic_vector(63 downto 0)
        );
    end component prince_matrix_p;

    component prince_sbox_i is
        port (
            datai : in  std_logic_vector(3 downto 0);
            datao : out std_logic_vector(3 downto 0)
        );
    end component prince_sbox_i;

    component prince_round_i is
        generic (
            round_ctr : integer
        );
        port (
            key       : in  std_logic_vector(63 downto 0);
            datai     : in  std_logic_vector(63 downto 0);

            datao     : out std_logic_vector(63 downto 0)
        );
    end component prince_round_i;
begin
    round_generate : for i in 1 to 5 generate
        round0 : prince_round
            generic map (
                round_ctr => i
            )
            port map (
                key       => k_1,
                datai     => round(i-1),

                datao     => round(i)
            );
    end generate;

    sbox_generate : for i in 0 to 15 generate
        sbox0 : prince_sbox
            port map (
                datai => round(5)(4*i+3 downto 4*i),
                datao => matrixi(4*i+3 downto 4*i)
            );
    end generate;

    matrix0 : prince_matrix_p
        port map (
            datai => matrixi,
            datao => matrixo
        );

    sbox_i_generate : for i in 0 to 15 generate
        sbox_i0 : prince_sbox_i
            port map (
                datai => matrixo(4*i+3 downto 4*i),
                datao => round_i(0)(4*i+3 downto 4*i)
            );
    end generate;

    round_i_generate : for i in 6 to 10 generate
        round0 : prince_round_i
            generic map (
                round_ctr => i
            )
            port map (
                key       => k_1,
                datai     => round_i(i-6),

                datao     => round_i(i-5)
            );
    end generate;

    enc_process : process(key, plaintext) is
    begin
        k_1      <= key(63 downto 0);
        round(0) <= plaintext xor key(127 downto 64) xor key(63 downto 0) xor x"0000000000000000";
    end process enc_process;

    ciphertext <= round_i(5) xor x"c0ac29b7c97c50dd" xor key(63 downto 0) xor (key(64) & key(127 downto 66) & (key(65) xor key(127)));
end architecture rtl;

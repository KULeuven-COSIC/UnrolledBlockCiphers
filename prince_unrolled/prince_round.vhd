library ieee;
use ieee.std_logic_1164.all;

entity prince_round is
    generic (
        round_ctr : integer
    );
    port (
        key       : in  std_logic_vector(63 downto 0);
        datai     : in  std_logic_vector(63 downto 0);

        datao     : out std_logic_vector(63 downto 0)
    );
end entity;

architecture rtl of prince_round is
    signal sbox   : std_logic_vector(63 downto 0);
    signal matrix : std_logic_vector(63 downto 0);

    signal rc     : std_logic_vector(63 downto 0);

    component prince_sbox is
        port (
            datai : in  std_logic_vector(3 downto 0);
            datao : out std_logic_vector(3 downto 0)
        );
    end component prince_sbox;

    component prince_matrix is
        port (
            datai : in  std_logic_vector(63 downto 0);
            datao : out std_logic_vector(63 downto 0)
        );
    end component prince_matrix;
begin
    sbox_generate : for i in 0 to 15 generate
        sbox0 : prince_sbox
            port map (
                datai => datai(4*i+3 downto 4*i),
                datao => sbox(4*i+3 downto 4*i)
            );
    end generate;

    matrix0 : prince_matrix
        port map (
            datai => sbox,
            datao => matrix
        );

    round_process : process (datai) is
    begin
        rc_case : case round_ctr is
            when 1      => rc <= x"13198a2e03707344";
            when 2      => rc <= x"a4093822299f31d0";
            when 3      => rc <= x"082efa98ec4e6c89";
            when 4      => rc <= x"452821e638d01377";
            when 5      => rc <= x"be5466cf34e90c6c";

            when others => rc <= (others => 'X');
        end case rc_case;
    end process round_process;

    datao <= matrix xor rc xor key;
end architecture rtl;

library ieee;
use ieee.std_logic_1164.all;

entity prince_round_i is
    generic (
        round_ctr : integer
    );
    port (
        key       : in  std_logic_vector(63 downto 0);
        datai     : in  std_logic_vector(63 downto 0);

        datao     : out std_logic_vector(63 downto 0)
    );
end entity;

architecture rtl of prince_round_i is
    signal matrixi : std_logic_vector(63 downto 0);
    signal matrixo : std_logic_vector(63 downto 0);

    signal rc      : std_logic_vector(63 downto 0);

    component prince_sbox_i is
        port (
            datai : in  std_logic_vector(3 downto 0);
            datao : out std_logic_vector(3 downto 0)
        );
    end component prince_sbox_i;

    component prince_matrix_i is
        port (
            datai : in  std_logic_vector(63 downto 0);
            datao : out std_logic_vector(63 downto 0)
        );
    end component prince_matrix_i;
begin
    sbox_i_generate : for i in 0 to 15 generate
        sbox_i0 : prince_sbox_i
            port map (
                datai => matrixo(4*i+3 downto 4*i),
                datao => datao(4*i+3 downto 4*i)
            );
    end generate;

    matrix0 : prince_matrix_i
        port map (
            datai => matrixi,
            datao => matrixo
        );

    round_process : process (datai) is
    begin
        rc_case : case round_ctr is
            when 6      => rc <= x"7ef84f78fd955cb1";
            when 7      => rc <= x"85840851f1ac43aa";
            when 8      => rc <= x"c882d32f25323c54";
            when 9      => rc <= x"64a51195e0e3610d";
            when 10     => rc <= x"d3b5a399ca0c2399";

            when others => rc <= (others => 'X');
        end case rc_case;
    end process round_process;

    matrixi <= datai xor key xor rc;
end architecture rtl;

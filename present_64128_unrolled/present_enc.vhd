library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity present_enc is
    port (
        key   : in  std_logic_vector(127 downto 0);
        datai : in  std_logic_vector(63 downto 0);

        datao : out std_logic_vector(63 downto 0)
    );
end entity;

architecture rtl of present_enc is
    signal sboxi : std_logic_vector(63 downto 0);
    signal sboxo : std_logic_vector(63 downto 0);

    component present_sbox
        port (
            datai : in  std_logic_vector(3 downto 0);
            datao : out std_logic_vector(3 downto 0)
        );
    end component present_sbox;

    component present_p
        port (
            datai : in  std_logic_vector(63 downto 0);
            datao : out std_logic_vector(63 downto 0)
        );
    end component present_p;
begin
    sbox_generate : for i in 0 to 15 generate
        sbox0 : present_sbox
            port map (
                datai => sboxi(4*i+3 downto 4*i),
                datao => sboxo(4*i+3 downto 4*i)
            );
    end generate;

    p0 : present_p
        port map (
            datai => sboxo,
            datao => datao
        );

    encrypt_process : process (key, datai) is
    begin
        sboxi <= datai xor key(127 downto 64);
    end process encrypt_process;
end architecture rtl;

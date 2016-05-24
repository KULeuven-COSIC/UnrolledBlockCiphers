library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constants.all;

entity aes_key is
    generic (
        round_ctr : integer
    );
    port (
        keyi : in  std_logic_vector(127 downto 0);
        keyo : out std_logic_vector(127 downto 0)
    );
end entity;

architecture rtl of aes_key is
    signal rcon   : std_logic_vector(7 downto 0);

    signal sbox0i : std_logic_vector(7 downto 0);
    signal sbox1i : std_logic_vector(7 downto 0);
    signal sbox2i : std_logic_vector(7 downto 0);
    signal sbox3i : std_logic_vector(7 downto 0);

    signal sbox0o : std_logic_vector(7 downto 0);
    signal sbox1o : std_logic_vector(7 downto 0);
    signal sbox2o : std_logic_vector(7 downto 0);
    signal sbox3o : std_logic_vector(7 downto 0);

    signal keyo_s : std_logic_vector(127 downto 0);

    component aes_sbox is
        port (
            datai : in  std_logic_vector(7 downto 0);
            datao : out std_logic_vector(7 downto 0)
        );
    end component aes_sbox;
begin
    sbox0 : aes_sbox
        port map (
            datai => keyi(23 downto 16),
            datao => sbox0o
        );

    sbox1 : aes_sbox
        port map (
            datai => keyi(15 downto 8),
            datao => sbox1o
        );

    sbox2 : aes_sbox
        port map (
            datai => keyi(7 downto 0),
            datao => sbox2o
        );

    sbox3 : aes_sbox
        port map (
            datai => keyi(31 downto 24),
            datao => sbox3o
        );

    expand_process : process (keyi) is
    begin
        rcon_case : case round_ctr is
            when 1      => rcon <= x"01";
            when 2      => rcon <= x"02";
            when 3      => rcon <= x"04";
            when 4      => rcon <= x"08";
            when 5      => rcon <= x"10";
            when 6      => rcon <= x"20";
            when 7      => rcon <= x"40";
            when 8      => rcon <= x"80";
            when 9      => rcon <= x"1b";
            when 10     => rcon <= x"36";

            when others => rcon <= (others => 'X');
        end case rcon_case;
    end process expand_process;

    keyo_s(127 downto 120) <= (sbox0o xor rcon) xor keyi(127 downto 120);
    keyo_s(119 downto 112) <= sbox1o xor keyi(119 downto 112);
    keyo_s(111 downto 104) <= sbox2o xor keyi(111 downto 104);
    keyo_s(103 downto 96)  <= sbox3o xor keyi(103 downto 96);

    keyo_s(95 downto 64)   <= keyo_s(127 downto 96) xor keyi(95 downto 64);
    keyo_s(63 downto 32)   <= keyo_s(95 downto 64) xor keyi(63 downto 32);
    keyo_s(31 downto 0)    <= keyo_s(63 downto 32) xor keyi(31 downto 0);

    keyo <= keyo_s;
end architecture rtl;

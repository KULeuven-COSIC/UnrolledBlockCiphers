library ieee;
use ieee.std_logic_1164.all;

entity simon_enc is
    port (
        key : in  std_logic_vector(15 downto 0);
        xy  : in  std_logic_vector(31 downto 0);

        yx  : out std_logic_vector(31 downto 0)
    );
end entity;

architecture rtl of simon_enc is
    function rotl(value: std_logic_vector(15 downto 0); places: integer) return std_logic_vector is
    begin
        return value(15-places downto 0) & value(15 downto 15-(places-1));
    end function rotl;
begin
    encrypt_process : process (key, xy) is
    begin
        yx(15 downto 0)  <= xy(31 downto 16);
        yx(31 downto 16) <= xy(15 downto 0) xor (rotl(xy(31 downto 16), 1) and rotl(xy(31 downto 16), 8)) xor rotl(xy(31 downto 16), 2) xor key;
    end process encrypt_process;
end architecture rtl;

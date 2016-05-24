library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity speck_enc is
    port (
        key : in  std_logic_vector(15 downto 0);
        xy  : in  std_logic_vector(31 downto 0);

        yx  : out std_logic_vector(31 downto 0)
    );
end entity;

architecture rtl of speck_enc is
    function rotl(value: std_logic_vector(15 downto 0); places: integer) return std_logic_vector is
    begin
        return value(15-places downto 0) & value(15 downto 15-(places-1));
    end function rotl;

    function rotr(value: std_logic_vector(15 downto 0); places: integer) return std_logic_vector is
    begin
        return value(places-1 downto 0) & value(15 downto places);
    end function rotr;
begin
    encrypt_process : process (key, xy) is
        variable x_z : std_logic_vector(15 downto 0);
    begin
        x_z              := std_logic_vector(unsigned(rotr(xy(31 downto 16), 7)) + unsigned(xy(15 downto 0))) xor key;

        yx(31 downto 16) <= x_z;
        yx(15 downto 0)  <= rotl(xy(15 downto 0), 2) xor x_z;
    end process encrypt_process;
end architecture rtl;

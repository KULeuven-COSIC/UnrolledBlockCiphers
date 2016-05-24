library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity speck_enc is
    port (
        key : in  std_logic_vector(31 downto 0);
        xy  : in  std_logic_vector(63 downto 0);

        yx  : out std_logic_vector(63 downto 0)
    );
end entity;

architecture rtl of speck_enc is
    function rotl(value: std_logic_vector(31 downto 0); places: integer) return std_logic_vector is
    begin
        return value(31-places downto 0) & value(31 downto 31-(places-1));
    end function rotl;

    function rotr(value: std_logic_vector(31 downto 0); places: integer) return std_logic_vector is
    begin
        return value(places-1 downto 0) & value(31 downto places);
    end function rotr;
begin
    encrypt_process : process (key, xy) is
        variable x_z : std_logic_vector(31 downto 0);
    begin
        x_z              := std_logic_vector(unsigned(rotr(xy(63 downto 32), 8)) + unsigned(xy(31 downto 0))) xor key;

        yx(63 downto 32) <= x_z;
        yx(31 downto 0)  <= rotl(xy(31 downto 0), 3) xor x_z;
    end process encrypt_process;
end architecture rtl;

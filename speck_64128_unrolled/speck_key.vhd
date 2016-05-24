library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.constants.all;

entity speck_key is
    generic (
        round_ctr : integer
    );
    port (
        keyi, li  : in  std_logic_vector(31 downto 0);
        keyo, lo  : out std_logic_vector(31 downto 0)
    );
end entity;

architecture rtl of speck_key is
    function rotl(value: std_logic_vector(31 downto 0); places: integer) return std_logic_vector is
    begin
        return value(31-places downto 0) & value(31 downto 31-(places-1));
    end function rotl;

    function rotr(value: std_logic_vector(31 downto 0); places: integer) return std_logic_vector is
    begin
        return value(places-1 downto 0) & value(31 downto places);
    end function rotr;
begin
    expand_process : process (keyi, li) is
        variable lo_z : std_logic_vector(31 downto 0);
    begin
        lo_z := std_logic_vector(unsigned(keyi) + unsigned(rotr(li, 8))) xor std_logic_vector(to_unsigned(round_ctr, 32));

        lo   <= lo_z;
        keyo <= rotl(keyi, 3) xor lo_z;
    end process expand_process;
end architecture rtl;

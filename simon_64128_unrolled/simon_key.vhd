library ieee;
use ieee.std_logic_1164.all;
use work.constants.all;

entity simon_key is
    generic (
        round_ctr     : integer
    );
    port (
        k_0, k_1, k_3 : in  std_logic_vector(31 downto 0);
        key           : out std_logic_vector(31 downto 0)
    );
end entity;

architecture rtl of simon_key is
    function rotr(value: std_logic_vector(31 downto 0); places: integer) return std_logic_vector is
    begin
        return value(places-1 downto 0) & value(31 downto places);
    end function rotr;
begin
    expand_process : process (k_0, k_1, k_3) is
        --
        -- Note
        -- ----
        -- The value given in the paper is longer (62 bits), but was truncated
        -- to the length needed for 64-bit blocks. The shortened string was also
        -- reversed so that (39-round_ctr) could be changed into round_ctr
        -- on line 27.
        --
        constant Z     : std_logic_vector(39 downto 0) := b"0001001000000111101001100011010111011011";

        variable tmp   : std_logic_vector(31 downto 0);
        variable vec_z : std_logic_vector(31 downto 0);
        variable three : std_logic_vector(31 downto 0);
    begin
        tmp   := rotr(k_3, 3) xor k_1;
        tmp   := tmp xor rotr(tmp, 1);
        
        vec_z := (0 => Z(round_ctr), others => '0');
        three := (0 => '1', 1 => '1', others => '0');

        key   <= (not k_0) xor vec_z xor tmp xor three;
    end process expand_process;
end architecture rtl;

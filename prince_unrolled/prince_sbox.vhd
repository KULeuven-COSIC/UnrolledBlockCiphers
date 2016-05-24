library ieee;
use ieee.std_logic_1164.all;

entity prince_sbox is
    port (
        datai : in  std_logic_vector(3 downto 0);
        datao : out std_logic_vector(3 downto 0)
    );
end entity;

architecture rtl of prince_sbox is
begin
    lookup_process : process (datai) is
    begin
        lookup_case : case datai is
            when x"0"   => datao <= x"B";
            when x"1"   => datao <= x"F";
            when x"2"   => datao <= x"3";
            when x"3"   => datao <= x"2";
            when x"4"   => datao <= x"A";
            when x"5"   => datao <= x"C";
            when x"6"   => datao <= x"9";
            when x"7"   => datao <= x"1";
            when x"8"   => datao <= x"6";
            when x"9"   => datao <= x"7";
            when x"A"   => datao <= x"8";
            when x"B"   => datao <= x"0";
            when x"C"   => datao <= x"E";
            when x"D"   => datao <= x"5";
            when x"E"   => datao <= x"D";
            when x"F"   => datao <= x"4";

            when others => datao <= (others => 'X');
        end case lookup_case;
    end process lookup_process;
end architecture rtl;

library ieee;
use ieee.std_logic_1164.all;

entity prince_sbox_i is
    port (
        datai : in  std_logic_vector(3 downto 0);
        datao : out std_logic_vector(3 downto 0)
    );
end entity;

architecture rtl of prince_sbox_i is
begin
    lookup_process : process (datai) is
    begin
        lookup_case : case datai is
            when x"0"   => datao <= x"B";
            when x"1"   => datao <= x"7";
            when x"2"   => datao <= x"3";
            when x"3"   => datao <= x"2";
            when x"4"   => datao <= x"F";
            when x"5"   => datao <= x"D";
            when x"6"   => datao <= x"8";
            when x"7"   => datao <= x"9";
            when x"8"   => datao <= x"A";
            when x"9"   => datao <= x"6";
            when x"A"   => datao <= x"4";
            when x"B"   => datao <= x"0";
            when x"C"   => datao <= x"5";
            when x"D"   => datao <= x"E";
            when x"E"   => datao <= x"C";
            when x"F"   => datao <= x"1";

            when others => datao <= (others => 'X');
        end case lookup_case;
    end process lookup_process;
end architecture rtl;

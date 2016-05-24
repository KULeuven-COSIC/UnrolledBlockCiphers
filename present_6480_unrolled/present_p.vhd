library ieee;
use ieee.std_logic_1164.all;

entity present_p is
    port (
        datai : in  std_logic_vector(63 downto 0);
        datao : out std_logic_vector(63 downto 0)
    );
end entity;

architecture rtl of present_p is
begin
    permute_process : process (datai) is
    begin
        datao(0)  <= datai(0);
        datao(16) <= datai(1);
        datao(32) <= datai(2);
        datao(48) <= datai(3);
        datao(1)  <= datai(4);
        datao(17) <= datai(5);
        datao(33) <= datai(6);
        datao(49) <= datai(7);
        datao(2)  <= datai(8);
        datao(18) <= datai(9);
        datao(34) <= datai(10);
        datao(50) <= datai(11);
        datao(3)  <= datai(12);
        datao(19) <= datai(13);
        datao(35) <= datai(14);
        datao(51) <= datai(15);
        datao(4)  <= datai(16);
        datao(20) <= datai(17);
        datao(36) <= datai(18);
        datao(52) <= datai(19);
        datao(5)  <= datai(20);
        datao(21) <= datai(21);
        datao(37) <= datai(22);
        datao(53) <= datai(23);
        datao(6)  <= datai(24);
        datao(22) <= datai(25);
        datao(38) <= datai(26);
        datao(54) <= datai(27);
        datao(7)  <= datai(28);
        datao(23) <= datai(29);
        datao(39) <= datai(30);
        datao(55) <= datai(31);
        datao(8)  <= datai(32);
        datao(24) <= datai(33);
        datao(40) <= datai(34);
        datao(56) <= datai(35);
        datao(9)  <= datai(36);
        datao(25) <= datai(37);
        datao(41) <= datai(38);
        datao(57) <= datai(39);
        datao(10) <= datai(40);
        datao(26) <= datai(41);
        datao(42) <= datai(42);
        datao(58) <= datai(43);
        datao(11) <= datai(44);
        datao(27) <= datai(45);
        datao(43) <= datai(46);
        datao(59) <= datai(47);
        datao(12) <= datai(48);
        datao(28) <= datai(49);
        datao(44) <= datai(50);
        datao(60) <= datai(51);
        datao(13) <= datai(52);
        datao(29) <= datai(53);
        datao(45) <= datai(54);
        datao(61) <= datai(55);
        datao(14) <= datai(56);
        datao(30) <= datai(57);
        datao(46) <= datai(58);
        datao(62) <= datai(59);
        datao(15) <= datai(60);
        datao(31) <= datai(61);
        datao(47) <= datai(62);
        datao(63) <= datai(63);
    end process permute_process;
end architecture rtl;

library ieee;
use ieee.std_logic_1164.all;

entity prince_matrix_p is
    port (
        datai : in  std_logic_vector(63 downto 0);
        datao : out std_logic_vector(63 downto 0)
    );
end entity;

architecture rtl of prince_matrix_p is
begin
    mul_process : process (datai) is
    begin
        datao(63) <= datai(59) xor datai(55) xor datai(51);
        datao(62) <= datai(62) xor datai(54) xor datai(50);
        datao(61) <= datai(61) xor datai(57) xor datai(49);
        datao(60) <= datai(60) xor datai(56) xor datai(52);
        datao(59) <= datai(63) xor datai(59) xor datai(55);
        datao(58) <= datai(58) xor datai(54) xor datai(50);
        datao(57) <= datai(61) xor datai(53) xor datai(49);
        datao(56) <= datai(60) xor datai(56) xor datai(48);
        datao(55) <= datai(63) xor datai(59) xor datai(51);
        datao(54) <= datai(62) xor datai(58) xor datai(54);
        datao(53) <= datai(57) xor datai(53) xor datai(49);
        datao(52) <= datai(60) xor datai(52) xor datai(48);
        datao(51) <= datai(63) xor datai(55) xor datai(51);
        datao(50) <= datai(62) xor datai(58) xor datai(50);
        datao(49) <= datai(61) xor datai(57) xor datai(53);
        datao(48) <= datai(56) xor datai(52) xor datai(48);
        datao(47) <= datai(47) xor datai(43) xor datai(39);
        datao(46) <= datai(42) xor datai(38) xor datai(34);
        datao(45) <= datai(45) xor datai(37) xor datai(33);
        datao(44) <= datai(44) xor datai(40) xor datai(32);
        datao(43) <= datai(47) xor datai(43) xor datai(35);
        datao(42) <= datai(46) xor datai(42) xor datai(38);
        datao(41) <= datai(41) xor datai(37) xor datai(33);
        datao(40) <= datai(44) xor datai(36) xor datai(32);
        datao(39) <= datai(47) xor datai(39) xor datai(35);
        datao(38) <= datai(46) xor datai(42) xor datai(34);
        datao(37) <= datai(45) xor datai(41) xor datai(37);
        datao(36) <= datai(40) xor datai(36) xor datai(32);
        datao(35) <= datai(43) xor datai(39) xor datai(35);
        datao(34) <= datai(46) xor datai(38) xor datai(34);
        datao(33) <= datai(45) xor datai(41) xor datai(33);
        datao(32) <= datai(44) xor datai(40) xor datai(36);
        datao(31) <= datai(31) xor datai(27) xor datai(23);
        datao(30) <= datai(26) xor datai(22) xor datai(18);
        datao(29) <= datai(29) xor datai(21) xor datai(17);
        datao(28) <= datai(28) xor datai(24) xor datai(16);
        datao(27) <= datai(31) xor datai(27) xor datai(19);
        datao(26) <= datai(30) xor datai(26) xor datai(22);
        datao(25) <= datai(25) xor datai(21) xor datai(17);
        datao(24) <= datai(28) xor datai(20) xor datai(16);
        datao(23) <= datai(31) xor datai(23) xor datai(19);
        datao(22) <= datai(30) xor datai(26) xor datai(18);
        datao(21) <= datai(29) xor datai(25) xor datai(21);
        datao(20) <= datai(24) xor datai(20) xor datai(16);
        datao(19) <= datai(27) xor datai(23) xor datai(19);
        datao(18) <= datai(30) xor datai(22) xor datai(18);
        datao(17) <= datai(29) xor datai(25) xor datai(17);
        datao(16) <= datai(28) xor datai(24) xor datai(20);
        datao(15) <= datai(11) xor datai(7) xor datai(3);
        datao(14) <= datai(14) xor datai(6) xor datai(2);
        datao(13) <= datai(13) xor datai(9) xor datai(1);
        datao(12) <= datai(12) xor datai(8) xor datai(4);
        datao(11) <= datai(15) xor datai(11) xor datai(7);
        datao(10) <= datai(10) xor datai(6) xor datai(2);
        datao(9)  <= datai(13) xor datai(5) xor datai(1);
        datao(8)  <= datai(12) xor datai(8) xor datai(0);
        datao(7)  <= datai(15) xor datai(11) xor datai(3);
        datao(6)  <= datai(14) xor datai(10) xor datai(6);
        datao(5)  <= datai(9) xor datai(5) xor datai(1);
        datao(4)  <= datai(12) xor datai(4) xor datai(0);
        datao(3)  <= datai(15) xor datai(7) xor datai(3);
        datao(2)  <= datai(14) xor datai(10) xor datai(2);
        datao(1)  <= datai(13) xor datai(9) xor datai(5);
        datao(0)  <= datai(8) xor datai(4) xor datai(0);
    end process mul_process;
end architecture rtl;

library ieee;
use ieee.std_logic_1164.all;

entity prince_matrix is
    port (
        datai : in  std_logic_vector(63 downto 0);
        datao : out std_logic_vector(63 downto 0)
    );
end entity;

architecture rtl of prince_matrix is
begin
    mul_process : process (datai) is
    begin
        datao(63) <= datai(59) xor datai(55) xor datai(51);
        datao(62) <= datai(62) xor datai(54) xor datai(50);
        datao(61) <= datai(61) xor datai(57) xor datai(49);
        datao(60) <= datai(60) xor datai(56) xor datai(52);
        datao(59) <= datai(47) xor datai(43) xor datai(35);
        datao(58) <= datai(46) xor datai(42) xor datai(38);
        datao(57) <= datai(41) xor datai(37) xor datai(33);
        datao(56) <= datai(44) xor datai(36) xor datai(32);
        datao(55) <= datai(31) xor datai(23) xor datai(19);
        datao(54) <= datai(30) xor datai(26) xor datai(18);
        datao(53) <= datai(29) xor datai(25) xor datai(21);
        datao(52) <= datai(24) xor datai(20) xor datai(16);
        datao(51) <= datai(15) xor datai(7) xor datai(3);
        datao(50) <= datai(14) xor datai(10) xor datai(2);
        datao(49) <= datai(13) xor datai(9) xor datai(5);
        datao(48) <= datai(8) xor datai(4) xor datai(0);
        datao(47) <= datai(47) xor datai(43) xor datai(39);
        datao(46) <= datai(42) xor datai(38) xor datai(34);
        datao(45) <= datai(45) xor datai(37) xor datai(33);
        datao(44) <= datai(44) xor datai(40) xor datai(32);
        datao(43) <= datai(31) xor datai(27) xor datai(19);
        datao(42) <= datai(30) xor datai(26) xor datai(22);
        datao(41) <= datai(25) xor datai(21) xor datai(17);
        datao(40) <= datai(28) xor datai(20) xor datai(16);
        datao(39) <= datai(15) xor datai(11) xor datai(3);
        datao(38) <= datai(14) xor datai(10) xor datai(6);
        datao(37) <= datai(9) xor datai(5) xor datai(1);
        datao(36) <= datai(12) xor datai(4) xor datai(0);
        datao(35) <= datai(63) xor datai(55) xor datai(51);
        datao(34) <= datai(62) xor datai(58) xor datai(50);
        datao(33) <= datai(61) xor datai(57) xor datai(53);
        datao(32) <= datai(56) xor datai(52) xor datai(48);
        datao(31) <= datai(31) xor datai(27) xor datai(23);
        datao(30) <= datai(26) xor datai(22) xor datai(18);
        datao(29) <= datai(29) xor datai(21) xor datai(17);
        datao(28) <= datai(28) xor datai(24) xor datai(16);
        datao(27) <= datai(15) xor datai(11) xor datai(7);
        datao(26) <= datai(10) xor datai(6) xor datai(2);
        datao(25) <= datai(13) xor datai(5) xor datai(1);
        datao(24) <= datai(12) xor datai(8) xor datai(0);
        datao(23) <= datai(63) xor datai(59) xor datai(51);
        datao(22) <= datai(62) xor datai(58) xor datai(54);
        datao(21) <= datai(57) xor datai(53) xor datai(49);
        datao(20) <= datai(60) xor datai(52) xor datai(48);
        datao(19) <= datai(43) xor datai(39) xor datai(35);
        datao(18) <= datai(46) xor datai(38) xor datai(34);
        datao(17) <= datai(45) xor datai(41) xor datai(33);
        datao(16) <= datai(44) xor datai(40) xor datai(36);
        datao(15) <= datai(11) xor datai(7) xor datai(3);
        datao(14) <= datai(14) xor datai(6) xor datai(2);
        datao(13) <= datai(13) xor datai(9) xor datai(1);
        datao(12) <= datai(12) xor datai(8) xor datai(4);
        datao(11) <= datai(63) xor datai(59) xor datai(55);
        datao(10) <= datai(58) xor datai(54) xor datai(50);
        datao(9)  <= datai(61) xor datai(53) xor datai(49);
        datao(8)  <= datai(60) xor datai(56) xor datai(48);
        datao(7)  <= datai(47) xor datai(39) xor datai(35);
        datao(6)  <= datai(46) xor datai(42) xor datai(34);
        datao(5)  <= datai(45) xor datai(41) xor datai(37);
        datao(4)  <= datai(40) xor datai(36) xor datai(32);
        datao(3)  <= datai(27) xor datai(23) xor datai(19);
        datao(2)  <= datai(30) xor datai(22) xor datai(18);
        datao(1)  <= datai(29) xor datai(25) xor datai(17);
        datao(0)  <= datai(28) xor datai(24) xor datai(20);
    end process mul_process;
end architecture rtl;

library ieee;
use ieee.std_logic_1164.all;

entity prince_matrix_i is
    port (
        datai : in  std_logic_vector(63 downto 0);
        datao : out std_logic_vector(63 downto 0)
    );
end entity;

architecture rtl of prince_matrix_i is
begin
    mul_process : process (datai) is
    begin
        datao(63) <= datai(35) xor datai(23) xor datai(11);
        datao(62) <= datai(62) xor datai(34) xor datai(22);
        datao(61) <= datai(61) xor datai(33) xor datai(9);
        datao(60) <= datai(60) xor datai(20) xor datai(8);
        datao(59) <= datai(63) xor datai(23) xor datai(11);
        datao(58) <= datai(34) xor datai(22) xor datai(10);
        datao(57) <= datai(61) xor datai(33) xor datai(21);
        datao(56) <= datai(60) xor datai(32) xor datai(8);
        datao(55) <= datai(63) xor datai(35) xor datai(11);
        datao(54) <= datai(62) xor datai(22) xor datai(10);
        datao(53) <= datai(33) xor datai(21) xor datai(9);
        datao(52) <= datai(60) xor datai(32) xor datai(20);
        datao(51) <= datai(63) xor datai(35) xor datai(23);
        datao(50) <= datai(62) xor datai(34) xor datai(10);
        datao(49) <= datai(61) xor datai(21) xor datai(9);
        datao(48) <= datai(32) xor datai(20) xor datai(8);
        datao(47) <= datai(59) xor datai(47) xor datai(7);
        datao(46) <= datai(58) xor datai(18) xor datai(6);
        datao(45) <= datai(45) xor datai(17) xor datai(5);
        datao(44) <= datai(56) xor datai(44) xor datai(16);
        datao(43) <= datai(59) xor datai(47) xor datai(19);
        datao(42) <= datai(58) xor datai(46) xor datai(6);
        datao(41) <= datai(57) xor datai(17) xor datai(5);
        datao(40) <= datai(44) xor datai(16) xor datai(4);
        datao(39) <= datai(47) xor datai(19) xor datai(7);
        datao(38) <= datai(58) xor datai(46) xor datai(18);
        datao(37) <= datai(57) xor datai(45) xor datai(5);
        datao(36) <= datai(56) xor datai(16) xor datai(4);
        datao(35) <= datai(59) xor datai(19) xor datai(7);
        datao(34) <= datai(46) xor datai(18) xor datai(6);
        datao(33) <= datai(57) xor datai(45) xor datai(17);
        datao(32) <= datai(56) xor datai(44) xor datai(4);
        datao(31) <= datai(55) xor datai(43) xor datai(31);
        datao(30) <= datai(54) xor datai(42) xor datai(2);
        datao(29) <= datai(53) xor datai(29) xor datai(1);
        datao(28) <= datai(40) xor datai(28) xor datai(0);
        datao(27) <= datai(43) xor datai(31) xor datai(3);
        datao(26) <= datai(54) xor datai(42) xor datai(30);
        datao(25) <= datai(53) xor datai(41) xor datai(1);
        datao(24) <= datai(52) xor datai(28) xor datai(0);
        datao(23) <= datai(55) xor datai(31) xor datai(3);
        datao(22) <= datai(42) xor datai(30) xor datai(2);
        datao(21) <= datai(53) xor datai(41) xor datai(29);
        datao(20) <= datai(52) xor datai(40) xor datai(0);
        datao(19) <= datai(55) xor datai(43) xor datai(3);
        datao(18) <= datai(54) xor datai(30) xor datai(2);
        datao(17) <= datai(41) xor datai(29) xor datai(1);
        datao(16) <= datai(52) xor datai(40) xor datai(28);
        datao(15) <= datai(51) xor datai(39) xor datai(27);
        datao(14) <= datai(50) xor datai(38) xor datai(14);
        datao(13) <= datai(49) xor datai(25) xor datai(13);
        datao(12) <= datai(36) xor datai(24) xor datai(12);
        datao(11) <= datai(39) xor datai(27) xor datai(15);
        datao(10) <= datai(50) xor datai(38) xor datai(26);
        datao(9)  <= datai(49) xor datai(37) xor datai(13);
        datao(8)  <= datai(48) xor datai(24) xor datai(12);
        datao(7)  <= datai(51) xor datai(27) xor datai(15);
        datao(6)  <= datai(38) xor datai(26) xor datai(14);
        datao(5)  <= datai(49) xor datai(37) xor datai(25);
        datao(4)  <= datai(48) xor datai(36) xor datai(12);
        datao(3)  <= datai(51) xor datai(39) xor datai(15);
        datao(2)  <= datai(50) xor datai(26) xor datai(14);
        datao(1)  <= datai(37) xor datai(25) xor datai(13);
        datao(0)  <= datai(48) xor datai(36) xor datai(24);
    end process mul_process;
end architecture rtl;

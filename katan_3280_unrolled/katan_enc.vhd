library ieee;
use ieee.std_logic_1164.all;

entity katan_enc is
    port (
        key  : in  std_logic_vector(79 downto 0);
        ctri : in  std_logic_vector(7 downto 0);
        l1i  : in  std_logic_vector(12 downto 0);
        l2i  : in  std_logic_vector(18 downto 0);

        ctro : out std_logic_vector(7 downto 0);
        l1o  : out std_logic_vector(12 downto 0);
        l2o  : out std_logic_vector(18 downto 0)
    );
end entity;

architecture rtl of katan_enc is
begin
    encrypt_process : process (key, ctri, l1i, l2i) is
    begin
        ctro <= ctri(6 downto 0) & (ctri(7) xor ctri(6) xor ctri(4) xor ctri(2));

        l1o  <= l1i(11 downto 0) & (l2i(18) xor l2i(7) xor (l2i(12) and l2i(10)) xor (l2i(8) and l2i(3)) xor key(78));
        l2o  <= l2i(17 downto 0) & (l1i(12) xor l1i(7) xor (l1i(8) and l1i(5)) xor (l1i(3) and ctri(7)) xor key(79));
    end process encrypt_process;
end architecture rtl;

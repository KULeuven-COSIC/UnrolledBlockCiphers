library ieee;
use ieee.std_logic_1164.all;

entity katan_enc is
    port (
        key  : in  std_logic_vector(79 downto 0);
        ctri : in  std_logic_vector(7 downto 0);
        l1i  : in  std_logic_vector(24 downto 0);
        l2i  : in  std_logic_vector(38 downto 0);

        ctro : out std_logic_vector(7 downto 0);
        l1o  : out std_logic_vector(24 downto 0);
        l2o  : out std_logic_vector(38 downto 0)
    );
end entity;

architecture rtl of katan_enc is
begin
    encrypt_process : process (key, ctri, l1i, l2i) is
    begin
        ctro <= ctri(6 downto 0) & (ctri(7) xor ctri(6) xor ctri(4) xor ctri(2));

        l1o  <= l1i(21 downto 0)
                  & (l2i(38) xor l2i(25) xor (l2i(33) and l2i(21)) xor (l2i(14) and l2i(9)) xor key(78))
                  & (l2i(37) xor l2i(24) xor (l2i(32) and l2i(20)) xor (l2i(13) and l2i(8)) xor key(78))
                  & (l2i(36) xor l2i(23) xor (l2i(31) and l2i(19)) xor (l2i(12) and l2i(7)) xor key(78));
        l2o  <= l2i(35 downto 0)
                  & (l1i(24) xor l1i(15) xor (l1i(20) and l1i(11)) xor (l1i(9) and ctri(7)) xor key(79))
                  & (l1i(23) xor l1i(14) xor (l1i(19) and l1i(10)) xor (l1i(8) and ctri(7)) xor key(79))
                  & (l1i(22) xor l1i(13) xor (l1i(18) and l1i(9)) xor (l1i(7) and ctri(7)) xor key(79));
    end process encrypt_process;
end architecture rtl;

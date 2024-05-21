library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY rom IS
    GENERIC (bits: INTEGER := 4; -- 4 bits
             words: INTEGER := 16); -- Tamanho "AULA_LOGICA"
    PORT (addr: IN std_logic_vector(bits-1 downto 0);
          data: OUT STD_LOGIC_VECTOR(bits-1 DOWNTO 0));
END rom;

ARCHITECTURE rom OF rom IS
    TYPE vector_array IS ARRAY (0 TO words-1) OF STD_LOGIC_VECTOR(bits-1 DOWNTO 0);
    CONSTANT memory: vector_array := 
        ( "1010", -- A
          "1101", -- U
          "1110", -- L
          "1010", -- A
          "1000", -- _ (espaco)
          "1110", -- L
          "0000", -- O
          "1011", -- G
          "1111", -- I
          "1100", -- C
          "1010", -- A
			 "1010",
			 "1010",
			 "1010",
			 "1010",
			 "1010"
        );
BEGIN
    process(addr)
    begin
        data <= memory(to_integer(unsigned(addr)));
    end process;
END rom;

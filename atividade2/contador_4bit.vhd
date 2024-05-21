library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity contador_4bit is
    port (
        clk: in std_logic;
        count: out std_logic_vector(3 downto 0)
    );
end contador_4bit;

architecture behv of contador_4bit is
    signal aux: std_logic_vector(3 downto 0);
begin
    process (clk)
    begin
        if (clk'EVENT AND clk = '1') then
            aux <= aux + 1;
        end if;
    end process;

    count <= aux;
end behv;
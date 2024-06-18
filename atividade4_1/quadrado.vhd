
-- cria quadrado em 640*480


LIBRARY ieee;
USE ieee.std_logic_1164.all; 
use IEEE.NUMERIC_STD.ALL;

ENTITY quadrado IS 
	PORT
	(
		coluna :  IN  STD_LOGIC_VECTOR(9 DOWNTO 0);
		linha :  IN  STD_LOGIC_VECTOR(9 DOWNTO 0);
		posicaoHorizontal: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		posicaoVertical: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		a :  OUT  STD_LOGIC
	);
END quadrado;

ARCHITECTURE quadrado OF quadrado IS 
	signal h : integer := to_integer(unsigned(posicaoHorizontal));
	signal v : integer := to_integer(unsigned(posicaoVertical));
	signal linhaAtual : integer := to_integer(signed(linha));
   signal colunaAtual : integer := to_integer(signed(coluna));
	signal tamanhoQuadrado: integer := 10;
	signal alturaTela : integer := 470;
	signal larguraTela : integer := 470;
	signal baseX : INTEGER;
    signal baseY : INTEGER;
begin

-- Calcular a posição base em pixels
baseX <= 10 + (h * larguraTela/16) ;
baseY <= 10 + (v * alturaTela/16) ;



process(linhaAtual, colunaAtual, baseX, baseY, alturaTela, larguraTela)
    begin
        if (baseX >= 0 and baseX + 10 <= larguraTela and baseY >= 0 and baseY + 10 <= alturaTela) then
            if (colunaAtual >= baseX and colunaAtual < baseX + 10 and linhaAtual >= baseY and linhaAtual < baseY + 10) then
                a <= '1';
            else
                a <= '0';
            end if;
        else
            a <= '0';  -- Fora dos limites da tela
        end if;
    end process;

END quadrado;
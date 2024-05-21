library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
entity ALU is
port(
		 clk: in std_logic;
		 A: in std_logic_vector(1 downto 0);
       B: in std_logic_vector(1 downto 0);
       Sel: in std_logic_vector(2 downto 0);
       Res: out std_logic_vector(1 downto 0)
);
end ALU;

architecture behv of ALU is
	 signal reg_A, reg_B: std_logic_vector(1 downto 0);
    signal temp_Res: std_logic_vector(1 downto 0);
	 signal out_reg: std_logic_vector(1 downto 0);
begin
	process(clk,A,B,Sel)
		begin
			if (clk'EVENT AND clk='1') then
				reg_A <= A;
            reg_B <= B;
				case Sel is
					 when "000" =>
						  temp_Res <= A + B;
					 when "001" =>
						  temp_Res <= A + (not B) + 1;
					 when "010" =>
						  temp_Res <= A and B;
					 when "011" =>
						  temp_Res <= A or B;
					 when "100" =>
						  temp_Res <= not(A and B);
					 when "101" =>
						  temp_Res <= not(A or B);
					 when others =>
						  temp_Res <= "XX";
				end case;
				out_reg <= temp_Res;
			end if;
	end process;
	
	Res <= out_reg;
end behv;

LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY display IS
PORT (velMotorE, velMotorD:IN STD_LOGIC;
		estado: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
			out1, out2, out3 : OUT STD_LOGIC_VECTOR (6 DOWNTO 0));
END display;
ARCHITECTURE regras OF display IS
SIGNAL forca_motor_esq :STD_LOGIC_VECTOR (6 DOWNTO 0);
SIGNAL forca_motor_dir :STD_LOGIC_VECTOR (6 DOWNTO 0);
SIGNAL estadoAux :STD_LOGIC_VECTOR (6 DOWNTO 0);
SIGNAL aux1 :STD_LOGIC_VECTOR (1 DOWNTO 0);
BEGIN
  aux1 <= velMotorE & velMotorD;
  WITH aux1 SELECT
  forca_motor_esq <=  "0011001" WHEN "11",
							        "0100100" WHEN "10",
							        "0011001" WHEN "01",
                      "1000000" WHEN "00";
                      
  WITH aux1 SELECT 
  forca_motor_dir <=  "0011001" WHEN "11",
                      "0011001" WHEN "10",
                      "0100100" WHEN "01",
                      "1000000" WHEN "00";
  WITH estado SELECT 
  estadoAux <=  "1000000" WHEN "000",
                "1111001" WHEN "001",
                "0100100" WHEN "010",
                "0110000" WHEN "011",
                "0011001" WHEN "100",
                "0011001" WHEN "101",
                "0011001" WHEN "110",
                "0011001" WHEN "111";
  out1 <= forca_motor_dir;
  out2 <= forca_motor_esq;
  out3 <= estadoAux;
END regras;
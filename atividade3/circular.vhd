library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity circular is
    port (
        clk: in std_logic;
		  direction: in std_logic;
		  speed: in std_logic;
        rom_data: in std_logic_vector(3 downto 0);  -- Dados da ROM
        disp1_code: out std_logic_vector(3 downto 0);  -- Display 1
        disp2_code: out std_logic_vector(3 downto 0);  -- Display 2
        disp3_code: out std_logic_vector(3 downto 0);  -- Display 3
        disp4_code: out std_logic_vector(3 downto 0)  -- Display 4
    );
end circular;

architecture behv of circular is
    type display_array is array (0 to 3) of std_logic_vector(3 downto 0);
    signal displays: display_array := (others => (others => '0'));

begin
    process(clk)
	 variable aux: std_logic := '0';
    begin
		if(speed = '0') then
        if(clk'EVENT AND clk = '1') then
					if direction = '0' then
						 displays(3) <= displays(2);
						 displays(2) <= displays(1);
						 displays(1) <= displays(0);
						 displays(0) <= rom_data;
					elsif direction = '1' then
						 displays(0) <= displays(1);
						 displays(1) <= displays(2);
						 displays(2) <= displays(3);
						 displays(3) <= rom_data;
					end if;
        end if;
		  elsif(speed = '1') then
			  if(clk'EVENT AND clk = '1') then
					if(aux = '1') then
						if direction = '0' then
							 displays(3) <= displays(2);
							 displays(2) <= displays(1);
							 displays(1) <= displays(0);
							 displays(0) <= rom_data;
						elsif direction = '1' then
							 displays(0) <= displays(1);
							 displays(1) <= displays(2);
							 displays(2) <= displays(3);
							 displays(3) <= rom_data;
						end if;
						aux := '0';
					elsif (aux ='0') then
						aux :='1';
					end if;
			  end if;
		  end if;
    end process;

	 disp4_code <= displays(0);
	 disp3_code <= displays(1);
	 disp2_code <= displays(2);
	 disp1_code <= displays(3);
end behv;
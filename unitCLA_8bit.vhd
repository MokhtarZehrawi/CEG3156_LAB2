LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY unitCLA_8bit IS
	PORT (
		P, G : IN STD_LOGIC_VECTOR (1 downto 0);
		Cin : IN STD_LOGIC;
		C : OUT STD_LOGIC;
		Cout : OUT STD_LOGIC
	);
END;

ARCHITECTURE struct OF unitCLA_8bit IS

BEGIN
	C <= G(0) OR (P(0) AND Cin);
	Cout <= G(1) OR (P(1) AND G(0)) OR (P(1) AND P(0) AND Cin);
	
END struct;


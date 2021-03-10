LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY adderCLA_4bit IS
	PORT (
		a, b : IN STD_LOGIC_VECTOR (3 downto 0);
		cin : IN STD_LOGIC;
		sum : OUT STD_LOGIC_VECTOR (3 downto 0);
		P, G : OUT STD_LOGIC
	);
END;

ARCHITECTURE struct OF adderCLA_4bit IS

SIGNAL int_p, int_g : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL int_c : STD_LOGIC_VECTOR (3 downto 1);

BEGIN
	int_p <= a OR b;
	int_g <= a AND b;
	int_c(1) <= int_g(0) OR (int_p(0) AND cin);
	int_c(2) <= int_g(1) OR (int_p(1) AND int_g(0)) OR (int_p(0) AND int_p(1) AND cin);
	int_c(3) <= int_g(2) OR (int_p(2) AND int_g(1)) OR (int_p(2) AND int_p(1) AND int_g(0)) OR (int_p(0) AND int_p(1) AND int_p(2) AND cin);

	P <= int_p(0) AND int_p(1) AND int_p(2) AND int_p(3);
	G <= (int_g(3) OR (int_p(3) AND int_g(2)) OR (int_p(3) AND int_p(2) AND int_g(1)) OR (int_p(3) AND int_p(2) AND int_p(1) AND int_g(0)));

	sum(0) <= cin XOR (a(0) XOR b(0));
	sum(1) <= int_c(1) XOR (a(1) XOR b(1));
	sum(2) <= int_c(2) XOR (a(2) XOR b(2));
	sum(3) <= int_c(3) XOR (a(3) XOR b(3));

END struct;




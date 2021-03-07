LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Decoder_3x8 IS
	PORT (
		i_Input : IN STD_LOGIC_VECTOR (2 downto 0);
		o_Output : OUT STD_LOGIC_VECTOR (7 downto 0) );
END;

ARCHITECTURE struct OF Decoder_3x8 IS

	SIGNAL int_sig : STD_LOGIC_VECTOR (7 downto 0);

BEGIN
	--Signal Assignment
	int_sig(0) <= not(i_Input(2)) AND not(i_Input(1)) AND not(i_Input(0)); 
	int_sig(1) <= not(i_Input(2)) AND not(i_Input(1)) AND     i_Input(0) ; 
	int_sig(2) <= not(i_Input(2)) AND     i_Input(1)  AND not(i_Input(0)); 
	int_sig(3) <= not(i_Input(2)) AND     i_Input(1)  AND     i_Input(0) ;
	int_sig(4) <=     i_Input(2)  AND not(i_Input(1)) AND not(i_Input(0)); 
	int_sig(5) <=     i_Input(2)  AND not(i_Input(1)) AND     i_Input(0) ; 
	int_sig(6) <=     i_Input(2)  AND     i_Input(1)  AND not(i_Input(0));
	int_sig(7) <=     i_Input(2)  AND     i_Input(1)  AND     i_Input(0) ;
	--Output Assignment
	o_Output <= int_sig;
END struct;

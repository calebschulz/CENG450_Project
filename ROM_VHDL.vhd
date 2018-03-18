library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;


entity ROM_VHDL is
    port(
         clk      : in  std_logic;
			en			: in std_logic;
         addr     : in  std_logic_vector (6 downto 0);
         data     : out std_logic_vector (15 downto 0)
         );
end ROM_VHDL;

architecture BHV of ROM_VHDL is

    type ROM_TYPE is array (0 to 127 ) of std_logic_vector (15 downto 0);

    constant rom_content : ROM_TYPE := (
	000 => "0100001000000000", -- IN R0 , 02  -- This example tests the branching capabilities of the design.No data dependencies.
	001 => "0100001001000000", -- IN R1 , 03  -- The values to be loaded into the corresponding resgister.
	002 => "0100001010000000", -- IN R2 , 01
	003 => "0100001011000000", -- IN R3 , 05  --  End of initialization
	004 => "0100001100000000", -- IN R4 , 00
	005 => "0100001101000000", -- IN R5 , 01 -- for absolute branching
	006 => "0100001110000000", -- IN R6 , 05 -- r6 is counter for the loop and indicates the number of times the loop is done.
	007 => "0100001111000000", -- IN R7 , 00
	008 => X"0000",
	009 => X"0000",
	010 => X"0000",
	011 => "1000110100000001", -- BR.SUB R4, 1 -- Go to the subroutine
	012 => "1000000111111111", -- BRR -1     -- Infinite loop (the end of the program)
	013 => "0000001010001101", -- ADD R2, R1, R5  -- Start of the subroutine. It runs for 5 times. R2 <-- R1 + 1
	014 => "0000010110110101", -- SUB R6, R6, R5  -- R6 <-- R6 - 1   The counter for the loop.
	015 => "0000111110000000", -- TEST R6         -- Set the z flag for the branch decision
	016 => "1000101100000001", -- BR.z R4, 1      -- If r6 is zero, jump out of the loop. 
	017 => "1000000111111011", -- BRR -5		-- If not jump to the start of the subroutine.
	018 => "1000111000000000", -- RETURN 
	others => x"0000" ); -- NOP
begin

p1:    process (clk)
	 variable add_in : integer := 0;
    begin
        if rising_edge(clk) then
				if (en = '1') then
					 add_in := conv_integer(unsigned(addr));
                data <= rom_content(add_in);
				end if;
        end if;
    end process;
end BHV;
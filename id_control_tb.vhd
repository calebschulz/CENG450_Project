--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:40:08 03/08/2018
-- Design Name:   
-- Module Name:   C:/ISE Design Projects/CENG450_Project/id_control_tb.vhd
-- Project Name:  CENG450_Project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: id_control
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY id_control_tb IS
END id_control_tb;
 
ARCHITECTURE behavior OF id_control_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT id_control
    PORT(
         clk : IN  std_logic;
         instruction_id : IN  std_logic_vector(15 downto 0);
         rd1 : OUT  std_logic_vector(2 downto 0);
         rd2 : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal instruction_id : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal rd1 : std_logic_vector(2 downto 0);
   signal rd2 : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: id_control PORT MAP (
          clk => clk,
          instruction_id => instruction_id,
          rd1 => rd1,
          rd2 => rd2
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;
		
		for i in 0 to 71 loop
			instruction_id <= conv_std_logic_vector(i,7) & "111" & "000" & "111";
			wait for clk_period;
		end loop;
      -- insert stimulus here 

      wait;
   end process;

END;

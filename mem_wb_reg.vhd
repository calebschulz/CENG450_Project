----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:49:17 02/20/2018 
-- Design Name: 
-- Module Name:    mem_wb_reg - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mem_wb_reg is
    Port ( ar_in : in  STD_LOGIC_VECTOR (15 downto 0);
           ar_out : out  STD_LOGIC_VECTOR (15 downto 0);
			  wr_en	: out	STD_LOGIC;
           op : in  STD_LOGIC_VECTOR (6 downto 0));
end mem_wb_reg;

architecture Behavioral of mem_wb_reg is

begin

ar_out <= ar_in;


end Behavioral;

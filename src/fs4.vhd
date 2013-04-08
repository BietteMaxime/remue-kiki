----------------------------------------------------------------------------------
-- This file is part of Remue Kiki.
-- 
-- Remue Kiki is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
-- 
-- Remue Kiki is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
-- 
-- You should have received a copy of the GNU General Public License
-- along with Remue Kiki.  If not, see <http://www.gnu.org/licenses/>.
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- Company: 
-- Engineers: Maxime Biette, Arthur Ricat, Maxence Verneuil
-- 
-- Create Date:    18:11:03 05/03/2010 
-- Design Name: 
-- Module Name:    fs4 - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fs4 is
    Port ( clk : in  STD_LOGIC;
           btn_h : in  STD_LOGIC;
           btn_b : in  STD_LOGIC;
           btn_g : in  STD_LOGIC;
           btn_d : in  STD_LOGIC;
           origine_x : out  STD_LOGIC_VECTOR (9 downto 0);
           orignie_y : out  STD_LOGIC_VECTOR (9 downto 0));
end fs4;

architecture Behavioral of fs4 is
signal ligne: STD_LOGIC_VECTOR (9 downto 0):="0010100000";
signal pixel: STD_LOGIC_VECTOR (9 downto 0):="0010100000";
CONSTANT tailleX :integer := 74;  
CONSTANT tailleY :integer := 99;
begin

process(clk)
begin
	if clk'event and (clk='1')
	then
		if (pixel<783-tailleX) and (btn_d='1')
		then
			pixel <= pixel + 1;
		end if;
		
		if (pixel > 144) and (btn_g='1')
		then
			pixel <= pixel - 1;
		end if;
		
		if (ligne<510-tailleY) and (btn_b='1')
		then
			ligne <= ligne + 1;
		end if;
		
		if (ligne > 31) and (btn_h='1')
		then
			ligne <= ligne - 1;
		end if;
	end if;
end process;

origine_x <= pixel;
orignie_y <= ligne;

end Behavioral;


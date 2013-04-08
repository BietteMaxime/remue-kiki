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
-- Create Date:    10:44:39 05/11/2010 
-- Design Name: 
-- Module Name:    fs6 - Behavioral 
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

entity fs6 is
    Port ( score_u : in  STD_LOGIC_VECTOR (3 downto 0);
           score_d : in  STD_LOGIC_VECTOR (3 downto 0);
           clk25 : in  STD_LOGIC;
           an : out  STD_LOGIC_VECTOR (3 downto 0);
           led : out  STD_LOGIC_VECTOR (6 downto 0));
end fs6;

architecture Behavioral of fs6 is
signal mp: std_logic:='0';
signal valeur_bcd: std_logic_vector(3 downto 0):="0000";
begin

process(clk25)
begin
	if clk25'event and clk25='1'
	then
		if mp='0'
		then
			mp<='1';
		else mp<='0';
		end if;
	end if;
end process;

with mp select
	an <="1110" when '0',
	     "1101" when '1',
		  "1111" when others;

with mp select
valeur_bcd <= score_u when '0',
				  score_d when '1',
				  "0000" when others;
				  
with valeur_bcd select
	led <= "1000000" when "0000",
			 "1111001" when "0001",
			 "0100100" when "0010",
			 "0110000" when "0011",
			 "0011001" when "0100",
			 "0010010" when "0101",
			 "0000010" when "0110",
			 "1111000" when "0111",
			 "0000000" when "1000",
			 "0010000" when "1001",
			 "1000000" when others;

end Behavioral;


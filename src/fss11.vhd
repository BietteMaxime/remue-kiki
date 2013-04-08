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
-- Create Date:    17:17:57 05/02/2010 
-- Design Name: 
-- Module Name:    fss11 - Behavioral 
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

entity fss11 is
    Port ( clk25 : in  STD_LOGIC;
           cmpt_ligne : out  STD_LOGIC_VECTOR (9 downto 0);
           cmpt_pixel : out  STD_LOGIC_VECTOR (9 downto 0));
end fss11;

architecture Behavioral of fss11 is

signal Compteur_pixels : std_logic_vector (9 downto 0):="0000000000";
signal Compteur_lignes : std_logic_vector (9 downto 0):="0000000000";

begin

process (clk25) 
	begin
		if clk25'event and (clk25='1') 
		then
			Compteur_pixels <=Compteur_pixels+1;
			if (Compteur_pixels = 799)
			then
				Compteur_pixels <= "0000000000";
				Compteur_lignes <= Compteur_lignes+1;	
				if (Compteur_lignes = 520)
				then
					Compteur_lignes <= "0000000000";
				end if;
			end if;
		end if;
	end process;

cmpt_ligne <= Compteur_lignes;
cmpt_pixel <= Compteur_pixels;

end Behavioral;


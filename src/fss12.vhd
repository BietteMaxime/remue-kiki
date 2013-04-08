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
-- Create Date:    17:24:01 05/02/2010 
-- Design Name: 
-- Module Name:    fss12 - Behavioral 
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

entity fss12 is
    Port ( Compteur_pixels : in  STD_LOGIC_VECTOR (9 downto 0);
		     Compteur_lignes : in  STD_LOGIC_VECTOR (9 downto 0);
           sync_h : out  STD_LOGIC;
           sync_v : out  STD_LOGIC;
           valide : out  STD_LOGIC);
end fss12;

architecture Behavioral of fss12 is

begin

valide <= '1'
	when (Compteur_pixels>=144
		and Compteur_pixels<=783 
		and Compteur_lignes>=31
		and Compteur_lignes<=510)
	else '0' ;

sync_h <= '0' when Compteur_pixels < 96 else '1';
sync_v <= '0' when Compteur_lignes < 2 else '1';


end Behavioral;


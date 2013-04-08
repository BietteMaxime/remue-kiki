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
-- Create Date:    02:34:30 05/03/2010 
-- Design Name: 
-- Module Name:    fs3 - Behavioral 
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

entity fs3 is
    Port ( spot : in  STD_LOGIC;
           valide : in  STD_LOGIC;
           r : out  STD_LOGIC_VECTOR (2 downto 0);
           v : out  STD_LOGIC_VECTOR (2 downto 0);
           b : out  STD_LOGIC_VECTOR (1 downto 0));
end fs3;
architecture Behavioral of fs3 is
begin
r <= "111" when (spot='1') and (valide='1') else "000";
v <= "111" when (spot='1') and (valide='1') else "000";
b <= "11"  when (spot='1') and (valide='1') else "00";
end Behavioral;


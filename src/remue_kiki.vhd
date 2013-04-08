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
-- Create Date:    17:15:38 05/02/2010 
-- Design Name: 
-- Module Name:    remue_kiki - Behavioral 
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

entity remue_kiki is
    Port ( clk25 : in  STD_LOGIC;
			  btn_h : in std_logic;
           btn_b : in std_logic;
			  btn_g : in std_logic;
			  btn_d : in std_logic;
           hs : out  STD_LOGIC;
           vs : out  STD_LOGIC;
			  r : out  STD_LOGIC_VECTOR (2 downto 0);
           v : out  STD_LOGIC_VECTOR (2 downto 0);
           b : out  STD_LOGIC_VECTOR (1 downto 0);
			  an : out std_logic_vector (3 downto 0);
			  led : out std_logic_vector (6 downto 0));
end remue_kiki;

architecture Behavioral of remue_kiki is

component fss11
    Port ( clk25 : in  STD_LOGIC;
           cmpt_ligne : out  STD_LOGIC_VECTOR (9 downto 0);
           cmpt_pixel : out  STD_LOGIC_VECTOR (9 downto 0));
end component;

component fss12
    Port ( Compteur_pixels : in  STD_LOGIC_VECTOR (9 downto 0);
		     Compteur_lignes : in  STD_LOGIC_VECTOR (9 downto 0);
           sync_h : out  STD_LOGIC;
           sync_v : out  STD_LOGIC;
           valide : out  STD_LOGIC);
end component;

component fs2
    Port ( origine_x : in  STD_LOGIC_VECTOR (9 downto 0);
           origine_y : in  STD_LOGIC_VECTOR (9 downto 0);
			  direction : in  std_logic_vector (3 downto 0);
			  cmpt_ligne: in  STD_LOGIC_VECTOR (9 downto 0);
			  cmpt_pixel: in  STD_LOGIC_VECTOR (9 downto 0);		  
           spot : out  STD_LOGIC);
end component;

component fs3
    Port ( spot : in  STD_LOGIC;
           valide : in  STD_LOGIC;
           r : out  STD_LOGIC_VECTOR (2 downto 0);
           v : out  STD_LOGIC_VECTOR (2 downto 0);
           b : out  STD_LOGIC_VECTOR (1 downto 0));
end component;

component fs4
    Port ( clk : in  STD_LOGIC;
           btn_h : in  STD_LOGIC;
           btn_b : in  STD_LOGIC;
           btn_g : in  STD_LOGIC;
           btn_d : in  STD_LOGIC;
           origine_x : out  STD_LOGIC_VECTOR (9 downto 0);
           orignie_y : out  STD_LOGIC_VECTOR (9 downto 0);
			  direction : out std_logic_vector (3 downto 0));
end component;

component fs5
    Port ( spot_chien : in  STD_LOGIC;
           cpt_p : in  STD_LOGIC_VECTOR (9 downto 0);
           cpt_l : in  STD_LOGIC_VECTOR (9 downto 0);
			  score_d : out std_logic_vector (3 downto 0);
			  score_u : out std_logic_vector (3 downto 0);
			  spot : out std_logic );
end component;

component fs6
    Port ( score_u : in  STD_LOGIC_VECTOR (3 downto 0);
           score_d : in  STD_LOGIC_VECTOR (3 downto 0);
           clk25 : in  STD_LOGIC;
           an : out  STD_LOGIC_VECTOR (3 downto 0);
           led : out  STD_LOGIC_VECTOR (6 downto 0));
end component;

signal Compteur_pixels : std_logic_vector (9 downto 0):="0000000000";
signal Compteur_lignes : std_logic_vector (9 downto 0):="0000000000";
signal origine_x : std_logic_vector (9 downto 0):="0000000000";
signal origine_y : std_logic_vector (9 downto 0):="0000000000";
signal valide : std_logic:='0';
signal spot : std_logic:='0';
signal spot_final : std_logic:='0';
signal dir: std_logic_vector (3 downto 0):="0001";
signal score_d : std_logic_vector (3 downto 0):="0000";
signal score_u : std_logic_vector (3 downto 0):="0000";

begin

comptage : fss11 port map (clk25,
									Compteur_lignes,
									Compteur_pixels
									);
									
signaux  : fss12 port map (Compteur_pixels,
									Compteur_lignes,
									hs,
									vs,
									valide
									);
									
kiki     : fs2   port map (origine_x,
									origine_y,
									dir,
									Compteur_lignes,
									Compteur_pixels,
									spot
									);
									
rvb		: fs3	  port map (spot_final,
									valide,
									r,
									v,
									b
									);
									
move		: fs4	  port map (Compteur_lignes(9),
									btn_h,
									btn_b,
									btn_g,
									btn_d,
									origine_x,
									origine_y,
									dir
									);

pilon	: fs5 port map (spot,
           Compteur_pixels,
           Compteur_lignes,
			  score_d,
			  score_u,
			  spot_final
			  );

score: fs6 port map ( score_u,
           score_d,
           Compteur_pixels(6),
           an,
           led 
			  );

end Behavioral;


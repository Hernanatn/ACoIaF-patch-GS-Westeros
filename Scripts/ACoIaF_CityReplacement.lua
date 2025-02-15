-- ==================================Starting Points===============================================================================
local silent=false;
-- Standard Westeros Coordinates
if(not silent) then
	print("Establishing Variables");
	print("Map Data");
	print(Map.GetMapSize() or "GetMapSize is nil");
	print(GameInfo.Maps["MAPSIZE_STANDARD"].Index or "Index is nil");
end
-- Northern Conflict Points {x, y}
iWinterfell = {16, 60};
iWhiteHarbor = {19, 52};
iDreadfort = {24, 62};
--Stark Leaders
iEddardPlayer = -1;
iJonPlayer = -1;
--Bolton Leaders
iRoosePlayer = -1;
--Stark City States
iminorBolton = -1;
iKarstark = -1;
iUmber = -1;
iGlover = -1;
iReed = -1;
iMormont = -1;
	
-- Iron Islands Conflict Points {x, y}
iPyke = {6, 38};
iBlacktyde = {7, 42};
--Iron Islands Leaders
iBalonPlayer = -1;
iEuronPlayer = -1;

-- Vale of Arryn Conflict Points {x, y}
iEryie = {23, 39};
--Arryn Leaders
iPetyrPlayer = -1;
--Arryn City States
iRoyce = -1;
iColdwater = -1;

-- Westerlands Conflict Points {x, y}
iCasterlyRock = {5,30};
iLannisport = {5, 26};
--Lanniester Leaders
iTywinPlayer = -1;
iCerseiPlayer = -1;
--Lanniester City States
iClegane = -1;

-- Reach Conflict Points {x, y}
iHighgarden = {10, 18};
--Tyrell Leaders
iOlennaPlayer = -1;
--Tyrell City States
iTarly = -1;
iHightower = -1;

-- Riverlands Conflict Points {x, y}
iRiverrun = {14, 35};
--Riverlands Leaders
iEdmurePlayer = -1;
--Riverlands City States
iFrey = -1;
iHoare = -1;

-- Crownlands Conflict Points {x, y}
iKingsLanding = {21, 26};
iDragonstone = {29, 30};
--Crownlands Leaders
iRobertPlayer = -1;
iStannisPlayer = -1;
--Crownlands City States
iRykker = -1;
iMassey = -1;

-- Stormlands Conflict Points {x, y}
iStormsEnd = {26, 21};
--Stormlands Leaders
iRenlyPlayer = -1;
--Stormlands City States
iTarth = -1;
iSelmy = -1;

-- Dorne Conflict Points {x, y}
iSunspear = {29, 7};
--Dorne Leaders
iDoranPlayer = -1;
--Dorne City States
iWyl = -1;
iDayne = -1;
if(not silent) then
	print("Variables Established");

end
-- ======================================================================================================================================
function Initialize()
	local aPlayers = PlayerManager.GetAlive();
	local aPlayersMajor = PlayerManager.GetAliveMajors();
	local aPlayersMinor = PlayerManager.GetAliveMinors();
	if(not silent) then
		print("Going Through Players I");
	end
	for loop, pPlayer in ipairs(aPlayers) do
		local iPlayer = pPlayer:GetID();
		local config = PlayerConfigurations[iPlayer];
		if(pPlayer ~= nil) then
			if(GameInfo.Leaders["LEADER_EDDARD"].Hash == config:GetLeaderTypeID()) then --The North
				if(not silent) then
					print("Found Eddard, PlayerID: "..iPlayer);
				end
				iEddardPlayer=iPlayer;
			elseif(GameInfo.Leaders["LEADER_JON_SNOW"].Hash == config:GetLeaderTypeID()) then --The North
				if(not silent) then
					print("Found Jon, PlayerID: "..iPlayer);
				end
				iJonPlayer=iPlayer;
			elseif(GameInfo.Leaders["LEADER_MINOR_CIV_BOLTON"].Hash == config:GetLeaderTypeID()) then
				if(not silent) then
					print("Found Minor Boltons, PlayerID: "..iPlayer);
				end
				iMinorBolton=iPlayer;
			elseif(GameInfo.Leaders["LEADER_ROOSE"].Hash == config:GetLeaderTypeID()) then
				if(not silent) then
					print("Found Major Boltons, PlayerID: "..iPlayer);
				end
				iRoosePlayer=iPlayer;
			elseif(GameInfo.Leaders["LEADER_MINOR_CIV_KARSTARK"].Hash == config:GetLeaderTypeID()) then
				if(not silent) then
					print("Found Karstarks, PlayerID: "..iPlayer);
				end
				iKarstark=iPlayer;
			elseif(GameInfo.Leaders["LEADER_MINOR_CIV_UMBER"].Hash == config:GetLeaderTypeID()) then
				if(not silent) then
					print("Found Umbers, PlayerID: "..iPlayer);
				end
				iUmber=iPlayer;
			elseif(GameInfo.Leaders["LEADER_MINOR_CIV_GLOVER"].Hash == config:GetLeaderTypeID()) then
				if(not silent) then
					print("Found Glovers, PlayerID: "..iPlayer);
				end
				iGlover=iPlayer;
			elseif(GameInfo.Leaders["LEADER_MINOR_CIV_REED"].Hash == config:GetLeaderTypeID()) then
				if(not silent) then
					print("Found Reed, PlayerID: "..iPlayer);
					iReed=iPlayer;
				elseif(GameInfo.Leaders["LEADER_MINOR_CIV_MORMONT"].Hash == config:GetLeaderTypeID()) then
					if(not silent) then
						print("Found Mormont, PlayerID: "..iPlayer);
					end
					iMormont=iPlayer;
				elseif(GameInfo.Leaders["LEADER_BALON"].Hash == config:GetLeaderTypeID()) then --Iron Islands
					if(not silent) then
						print("Found Balon, PlayerID: "..iPlayer);
					end
					iBalonPlayer=iPlayer;
				elseif(GameInfo.Leaders["LEADER_EURON"].Hash == config:GetLeaderTypeID()) then
					if(not silent) then
						print("Found Euron, PlayerID: "..iPlayer);
					end
					iEuronPlayer=iPlayer;
				elseif(GameInfo.Leaders["LEADER_TYWIN"].Hash == config:GetLeaderTypeID()) then --Westerlands
					if(not silent) then
						print("Found Tywin, PlayerID: "..iPlayer);
					end
					iTywinPlayer=iPlayer;
				elseif(GameInfo.Leaders["LEADER_CERSEI"].Hash == config:GetLeaderTypeID()) then
					if(not silent) then
						print("Found Cersei, PlayerID: "..iPlayer);
					end
					iCerseiPlayer=iPlayer;
				elseif(GameInfo.Leaders["LEADER_MINOR_CIV_CLEGANE"].Hash == config:GetLeaderTypeID()) then
					if(not silent) then
						print("Found Clegane, PlayerID: "..iPlayer);
					end
					iClegane=iPlayer;
				elseif(GameInfo.Leaders["LEADER_KING_ROBERT"].Hash == config:GetLeaderTypeID()) then
					if(not silent) then
						print("Found Robert, PlayerID: "..iPlayer);
					end
					iRobertPlayer=iPlayer;
				elseif(GameInfo.Leaders["LEADER_RENLY"].Hash == config:GetLeaderTypeID()) then --Stormlands
					if(not silent) then
						print("Found Renly, PlayerID: "..iPlayer);
					end
					iRenlyPlayer=iPlayer;
				elseif(GameInfo.Leaders["LEADER_STANNIS"].Hash == config:GetLeaderTypeID()) then
					if(not silent) then
						print("Found Stannis, PlayerID: "..iPlayer);
					end
					iStannisPlayer=iPlayer;
				elseif(GameInfo.Leaders["LEADER_MINOR_CIV_MASSEY"].Hash == config:GetLeaderTypeID()) then
					if(not silent) then
						print("Found Massey, PlayerID: "..iPlayer);
					end
					iMassey=iPlayer;
				elseif(GameInfo.Leaders["LEADER_MINOR_CIV_TARLY"].Hash == config:GetLeaderTypeID()) then
					if(not silent) then
						print("Found Tarly, PlayerID: "..iPlayer);
					end
					iTarly=iPlayer;
				elseif(GameInfo.Leaders["LEADER_MINOR_CIV_RYKKER"].Hash == config:GetLeaderTypeID()) then
					if(not silent) then
						print("Found Rykker, PlayerID: "..iPlayer);
					end
					iRykker=iPlayer;
				elseif(GameInfo.Leaders["LEADER_MINOR_CIV_SELMY"].Hash == config:GetLeaderTypeID()) then
					if(not silent) then
						print("Found Selmy, PlayerID: "..iPlayer);
					end
					iSelmy=iPlayer;
				elseif(GameInfo.Leaders["LEADER_PETYR"].Hash == config:GetLeaderTypeID()) then --Vale of Arryn
					if(not silent) then
						print("Found Petyr, PlayerID: "..iPlayer);
					end
					iPetyrPlayer=iPlayer;
				elseif(GameInfo.Leaders["LEADER_MINOR_CIV_COLDWATER"].Hash == config:GetLeaderTypeID()) then
					if(not silent) then
						print("Found Coldwater, PlayerID: "..iPlayer);
					end
					iColdwater=iPlayer;
				elseif(GameInfo.Leaders["LEADER_MINOR_CIV_ROYCE"].Hash == config:GetLeaderTypeID()) then
					if(not silent) then
						print("Found Royce, PlayerID: "..iPlayer);
					end
					iRoyce=iPlayer;
				elseif(GameInfo.Leaders["LEADER_OLENNA"].Hash == config:GetLeaderTypeID()) then --The Reach
					if(not silent) then
						print("Found Olenna, PlayerID: "..iPlayer);
					end
					iOlennaPlayer=iPlayer;
				elseif(GameInfo.Leaders["LEADER_MINOR_CIV_TARLY"].Hash == config:GetLeaderTypeID()) then
					if(not silent) then
						print("Found Tarly, PlayerID: "..iPlayer);
					end
					iTarly=iPlayer;
				elseif(GameInfo.Leaders["LEADER_MINOR_CIV_HIGHTOWER"].Hash == config:GetLeaderTypeID()) then
					if(not silent) then
						print("Found Hightower, PlayerID: "..iPlayer);
					end
					iHightower=iPlayer;
				elseif(GameInfo.Leaders["LEADER_DORAN"].Hash == config:GetLeaderTypeID()) then --Dorne
					if(not silent) then
						print("Found Doran, PlayerID: "..iPlayer);
					end
					iDoranPlayer=iPlayer;
				elseif(GameInfo.Leaders["LEADER_MINOR_CIV_WYL"].Hash == config:GetLeaderTypeID()) then
					if(not silent) then
						print("Found Wyl, PlayerID: "..iPlayer);
					end
					iWyl=iPlayer;
				elseif(GameInfo.Leaders["LEADER_MINOR_CIV_DAYNE"].Hash == config:GetLeaderTypeID()) then
					if(not silent) then
						print("Found Dayne, PlayerID: "..iPlayer);
					end
					iDayne=iPlayer;
				elseif(GameInfo.Leaders["LEADER_EDMURE"].Hash == config:GetLeaderTypeID()) then --Riverlands
					if(not silent) then
						print("Found Edmure, PlayerID: "..iPlayer);
					end
					iEdmurePlayer=iPlayer;
				elseif(GameInfo.Leaders["LEADER_MINOR_CIV_HARRENHAL"].Hash == config:GetLeaderTypeID()) then
					if(not silent) then
						print("Found Hoare, PlayerID: "..iPlayer);
					end
					iHoare=iPlayer;
				elseif(GameInfo.Leaders["LEADER_MINOR_CIV_THE_TWINS"].Hash == config:GetLeaderTypeID()) then
					if(not silent) then
						print("Found Frey, PlayerID: "..iPlayer);
					end
					iFrey=iPlayer;
				end
			end
		end
		if(not silent) then
			print("Done Going Through Players I");
		end
	end
end
function OnCityAddedToMap( playerID: number, cityID : number, cityX : number, cityY : number )
	local aPlayers = PlayerManager.GetAlive();
	local aPlayersMajor = PlayerManager.GetAliveMajors();
	local aPlayersMinor = PlayerManager.GetAliveMinors();
	if(not silent) then
		print("Added a city");
	end
	for loop, pPlayer in ipairs(aPlayers) do
		local iPlayer = pPlayer:GetID();
		local config = PlayerConfigurations[iPlayer];
		if(iPlayer==playerID) then
			local pPlayerCities:table = pPlayer:GetCities();
			local pThisCity = pPlayerCities:FindID(cityID);
			local pThisCityName= pThisCity:GetName();
			if(not silent) then
				print("CityAddedToMap - " ..pThisCityName.." (" .. tostring(cityX) .. ", " .. tostring(cityY)..")");
			end
			if(pPlayer ~= nil) then
				if(GameInfo.Civilizations["CIVILIZATION_STARK"].Hash == config:GetCivilizationTypeID() or GameInfo.Civilizations["CIVILIZATION_MAJOR_BOLTON"].Hash == config:GetCivilizationTypeID()) then
					if(not silent) then
						print("It's a Stark city");
					end
					if(pThisCityName=="LOC_CIVILIZATION_STARK_CITY_GREYWATER_WATCH" and iReed ~= -1) then
						if(not silent) then
							print("Greywater Watch exists, use a different name");
						end
						pThisCity:SetName("Stoney Shore", false);
					elseif(pThisCityName=="LOC_CIVILIZATION_STARK_CITY_BEAR_ISLAND" and iMormont ~= -1) then
						if(not silent) then
							print("Bear Island exists, use a different name");
						end
						pThisCity:SetName("White Knife", false);
					elseif(pThisCityName=="LOC_CIVILIZATION_STARK_CITY_DEEPWOOD_MOTTE" and iGlover ~= -1) then
						if(not silent) then
							print("Deepwood Motte exists, use a different name");
						end
						pThisCity:SetName("Wolfswood", false);
					elseif(pThisCityName=="LOC_CIVILIZATION_STARK_CITY_KARHOLD" and iKarstark ~= -1) then
						if(not silent) then
							print("Karhold exists, use a different name");
						end
						pThisCity:SetName("Broken Branch", false);
					elseif(pThisCityName=="LOC_CIVILIZATION_STARK_CITY_LAST_HEARTH" and iUmber ~= -1) then
						if(not silent) then
							print("Last Hearth exists, use a different name");
						end
						pThisCity:SetName("Lonely Hills", false);
					elseif(pThisCityName=="LOC_CIVILIZATION_STARK_CITY_DREAD_FORT" and iMinorBolton ~= -1) then
						if(not silent) then
							print("Dread Fort exists, use a different name");
						end
						pThisCity:SetName("Weeping Water", false);
					end
				elseif(GameInfo.Civilizations["CIVILIZATION_LANNISTER"].Hash == config:GetCivilizationTypeID()) then
					if(not silent) then
						print("It's a Lannister city");
					end
					if(pThisCityName=="LOC_CIVILIZATION_LANNISTER_CITY_CLEGANE_HALL" and iClegane ~= -1) then
						if(not silent) then
							print("Clegane Hall exists, use a different name");
						end
						pThisCity:SetName("Cornfield", false);
					end
				elseif(GameInfo.Civilizations["CIVILIZATION_BARATHEON"].Hash == config:GetCivilizationTypeID()) then
					if(not silent) then
						print("It's a Baratheon city");
					end
					if(pThisCityName=="LOC_CIVILIZATION_BARATHEON_CITY_HARVEST_HALL" and iSelmy ~= -1) then
						if(not silent) then
							print("Harvest Hall exists, use a different name");
						end
						pThisCity:SetName("Estermont", false);
					elseif(pThisCityName=="LOC_CIVILIZATION_BARATHEON_CITY_EVENFALL_HALL" and iTarly ~= -1) then
						if(not silent) then
							print("Evenfall Hall exists, use a different name");
						end
						pThisCity:SetName("Parchments", false);
					elseif(pThisCityName=="LOC_CIVILIZATION_BARATHEON_CITY_STONEDANCE" and iMassey ~= -1) then
						if(not silent) then
							print("Stonedance exists, use a different name");
						end
						pThisCity:SetName("Sharp Point", false);
					elseif(pThisCityName=="LOC_CIVILIZATION_BARATHEON_CITY_DUSKENDALE" and iRykker ~= -1) then
						if(not silent) then
							print("Duskendale exists, use a different name");
						end
						pThisCity:SetName("Rosby", false);
					end
				elseif(GameInfo.Civilizations["CIVILIZATION_TYRELL"].Hash == config:GetCivilizationTypeID()) then
					if(not silent) then
						print("It's a Tyrell city");
					end
					if(pThisCityName=="LOC_CIVILIZATION_TYRELL_CITY_OLD_TOWN" and iHightower ~= -1) then
						if(not silent) then
							print("Old Town exists, use a different name");
						end
						pThisCity:SetName("Bandallon", false);
					elseif(pThisCityName=="LOC_CIVILIZATION_TYRELL_CITY_HORN_HILL" and iTarly ~= -1) then
						if(not silent) then
							print("Horn Hill exists, use a different name");
						end
						pThisCity:SetName("Appleton", false);
					end
				elseif(GameInfo.Civilizations["CIVILIZATION_ARRYN"].Hash == config:GetCivilizationTypeID()) then
					if(not silent) then
						print("It's an Arryn city");
					end
					if(pThisCityName=="LOC_CIVILIZATION_ARRYN_CITY_OLD_TOWN" and iColdwater ~= -1) then
						if(not silent) then
							print("Old Town exists, use a different name");
						end
						pThisCity:SetName("Grey Glenn", false);
					elseif(pThisCityName=="LOC_CIVILIZATION_TYRELL_CITY_RUNESTONE" and iRoyce ~= -1) then
						if(not silent) then
							print("Horn Hill exists, use a different name");
						end
						pThisCity:SetName("Ninestars", false);
					end
				elseif(GameInfo.Civilizations["CIVILIZATION_MARTELL"].Hash == config:GetCivilizationTypeID()) then
					if(not silent) then
						print("It's a Martell city");
					end
					if(pThisCityName=="LOC_CIVILIZATION_MARTELL_CITY_WYL" and iWyl ~= -1) then
						if(not silent) then
							print("Wyl exists, use a different name");
						end
						pThisCity:SetName("Vulture's Roost", false);
					elseif(pThisCityName=="LOC_CIVILIZATION_MARTELL_CITY_STARFALL" and iDayne ~= -1) then
						if(not silent) then
							print("Starfall exists, use a different name");
						end
						pThisCity:SetName("High Hermitage", false);
					end
				elseif(GameInfo.Civilizations["CIVILIZATION_TULLY"].Hash == config:GetCivilizationTypeID()) then
					if(not silent) then
						print("It's an Tully city");
					end
					if(pThisCityName=="LOC_CIVILIZATION_TULLY_CITY_HARRENHAL" and iHoare ~= -1) then
						if(not silent) then
							print("Harrenhal exists, use a different name");
						end
						pThisCity:SetName("Darry", false);
					elseif(pThisCityName=="LOC_CIVILIZATION_TULLY_CITY_THE_TWINS" and iFrey ~= -1) then
						if(not silent) then
							print("The Twins exist, use a different name");
						end
						pThisCity:SetName("Hag's Mire", false);
					end
				end
			end
		end
	end
end

GameEvents.CityBuilt.Add(OnCityAddedToMap);

Initialize();

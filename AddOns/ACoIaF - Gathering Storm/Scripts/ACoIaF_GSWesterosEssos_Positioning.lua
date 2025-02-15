-- ==================================Starting Points===============================================================================
local silent=false;

g_iW, g_iH = Map.GetGridSize();
-- Standard Westeros Coordinates

print("Loading GSWesterosEssos_Positioning.lua");
if(not silent) then
	print("Establishing Variables"); 

	print("Map Data");
	print("Map Width: "..g_iW.." Map Height: "..g_iH);
	print("Map Size: "..Map.GetMapSize() or "GetMapSize is nil");
end
if ((g_iW==107) and (g_iH==93)) then 
	if((Map.GetMapSize()==5) and (g_iW==107) and (g_iH==93)) then
					if(not silent) then
			print("Huge Map Size Detected");
		end
		-- Northern Conflict Points {x, y}
		iWinterfell = {16, (60+16)}; 
		iWhiteHarbor = {19, (52+16)}; 
		iDreadfort = {24, (62+16)}; 
		
		
		-- Iron Islands Conflict Points {x, y}
		iPyke = {6, (38+16)}; 
		iBlacktyde = {7, (42+16)}; 
		
		-- Vale of Arryn Conflict Points {x, y}
		iEryie = {23, (39+16)}; 
		iBaelishKeep = {25, 61};
		
		-- Westerlands Conflict Points {x, y}
		iCasterlyRock = {5, (30+16)}; 
		iLannisport = {5, (26+16)}; 
		
		-- Reach Conflict Points {x, y}
		iHighgarden = {10, (18+16)}; 
		
		-- Riverlands Conflict Points {x, y}
		iRiverrun = {14, (35+16)}; 
		
		-- Crownlands Conflict Points {x, y}
		iKingsLanding = {21, (26+16)}; 
		iDragonstone = {29, (30+16)}; 
		
		-- Stormlands Conflict Points {x, y}
		iStormsEnd = {26, (21+16)}; 
		
		-- Dorne Conflict Points {x, y}
		iSunspear = {29, (7+16)}; 
	elseif(Map.GetMapSize()==4) then
					if(not silent) then
			print("Standard Map Size Detected");
		end
	end
		
	--Stark Leaders
	 iEddardPlayer = -1;
	 iJonPlayer = -1;
	 iRoosePlayer = -1;
	--Stark City States
	 iBolton = -1;
	 iKarstark = -1;
	 iUmber = -1;
	 iGlover = -1;
	 iReed = -1;
	 iMormont = -1;


	--Iron Islands Leaders
	 iBalonPlayer = -1;
	 iEuronPlayer = -1;


	--Arryn Leaders
	 iJonArrynPlayer = -1;
	 iPetyrPlayer = -1;
	 
	--Arryn City States
	 iRoyce = -1;
	 iColdwater = -1;

	--Lanniester Leaders
	 iTywinPlayer = -1;
	 iCerseiPlayer = -1;
	--Lanniester City States
	 iClegane = -1;


	--Tyrell Leaders
	 iOlennaPlayer = -1;
	--Tyrell City States
	 iTarly = -1;
	 iHightower = -1;


	--Riverlands Leaders
	 iEdmurePlayer = -1;
	--Riverlands City States
	 iFrey = -1;
	 iHoare = -1;

	--Crownlands Leaders
	 iRobertPlayer = -1;
	 iStannisPlayer = -1;
	--Crownlands City States
	 iRykker = -1;
	 iMassey = -1;

	--Stormlands Leaders
	 iRenlyPlayer = -1;
	--Stormlands City States
	 iTarth = -1;
	 iSelmy = -1;

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
				elseif(GameInfo.Leaders["LEADER_ROOSE"].Hash == config:GetLeaderTypeID()) then
					if(not silent) then
						print("Found Major Boltons, PlayerID: "..iPlayer);
					end  
					iRoosePlayer=iPlayer;
				elseif(GameInfo.Leaders["LEADER_MINOR_CIV_BOLTON"].Hash == config:GetLeaderTypeID()) then
					if(not silent) then
						print("Found Boltons, PlayerID: "..iPlayer);  
					end  
					iBolton=iPlayer;
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
					end  
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
				elseif(GameInfo.Leaders["LEADER_JON_ARRYN"].Hash == config:GetLeaderTypeID()) then --Vale of Arryn
					if(not silent) then
						print("Found Jon Arryn, PlayerID: "..iPlayer);  
					end  
					iJonArrynPlayer=iPlayer;
				elseif(GameInfo.Leaders["LEADER_PETYR"].Hash == config:GetLeaderTypeID()) then
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

	function InitializeNewGame()
		if(not silent) then
			print("Applying Changes"); 
		end
		g_iW, g_iH = Map.GetGridSize();
		local aPlayers = PlayerManager.GetAlive();
		local aPlayersMajor = PlayerManager.GetAliveMajors();
		local aPlayersMinor = PlayerManager.GetAliveMinors();
		if(not silent) then
			print("Going Through Players II"); 
		end
		for loop, pPlayer in ipairs(aPlayers) do
			local iPlayer = pPlayer:GetID();
			local config = PlayerConfigurations[iPlayer];
			if(pPlayer ~= nil) then
				local pUnits :table = Players[iPlayer]:GetUnits(); 	
				if(GameInfo.Leaders["LEADER_JON_SNOW"].Hash == config:GetLeaderTypeID()) then
					if(not silent) then
						print("Found Jon Snow. ID: "..iJonPlayer); 
					end
					if(iEddardPlayer==-1) then
						if(not silent) then
							print("No Eddard detected"); 
						end
						local pPlot = Map.GetPlot(iWinterfell[1], iWinterfell[2]);
						local pJonPlayer = Players[iPlayer];
						if (pJonPlayer ~= nil) then
							if(not silent) then
								print("Spawn Jon at Winterfell(", iWinterfell[1], ",", iWinterfell[2],")"); 
							end
							SpawnPlayer(iPlayer, iWinterfell[1], iWinterfell[2], 1);
							if(not silent) then
								print("Kill Jon's starting units"); 
							end
							units=1;
							for i, pUnit in pUnits:Members() do
								if(units<3) then
									UnitManager.Kill(pUnit);
								end
								units=units+1;
							end
						end
					elseif(iEddardPlayer~=-1) then
						if(not silent) then
							print("Eddard (ID: "..iEddardPlayer..") and Jon detected"); 
						end
						local pJonPlayer = Players[iJonPlayer];
						local pEddardPlayer = Players[iEddardPlayer];
						local pEddardUnits :table = Players[iEddardPlayer]:GetUnits();
						if(not silent) then
							print("Founding Winterfell to eliminate competition for it."); 
						end
						pEddardPlayer:GetCities():Create(iWinterfell[1], iWinterfell[2]);
						if(not silent) then
							print("Kill Eddard's settler");
						end 
						units=1;
						for i, pUnit in pEddardUnits:Members() do
							if(units==1) then
								UnitManager.Kill(pUnit);
							end
							units=units+1;
						end
					end
				elseif(GameInfo.Leaders["LEADER_ROOSE"].Hash == config:GetLeaderTypeID()) then
					if(not silent) then
						print("Found Roose"); 
					end
					if(iBolton==-1) then
						if(not silent) then
							print("No minor Bolton detected, no problem."); 
						end
					elseif(iBolton~=-1) then
						if(not silent) then
							print("Minor and Major Bolton's detected"); 
						end
						local pMajorBoltonPlayer = Players[iRoosePlayer];
						local pMajorBoltonUnits :table = Players[iRoosePlayer]:GetUnits();
						local pMinorBoltonPlayer = Players[iBolton];
						local pMinorBoltonUnits :table = Players[iBolton]:GetUnits();
						if(not silent) then
							print("Respawn the Major Bolton Civ on the Dreadfort"); 
						end
						SpawnPlayer(iPlayer, iDreadfort[1], iDreadfort[2], 0);
						if(not silent) then
							print("Kill Roose's starting units"); 
						end
						units=1;
						for i, pUnit in pMajorBoltonUnits:Members() do
							if(units<3) then
								UnitManager.Kill(pUnit);
							end
							units=units+1;
						end
						if(not silent) then
							print("Kill the minor Bolton Civ"); 
						end
						units=1;
						for i, pUnit in pMinorBoltonUnits:Members() do
							if(units==1) then
								UnitManager.Kill(pUnit);
							end
							units=units+1;
						end
					end
					 elseif(GameInfo.Leaders["LEADER_PETYR"].Hash == config:GetLeaderTypeID()) then
					  if(not silent) then
						print("Found Petyr");
					  end
					  if(iJonArrynPlayer==-1) then
						if(not silent) then
						  print("No Jon Arryn detected");
						end
						local pPlot = Map.GetPlot(iEryie[1], iEryie[2]);
						local pPetyrPlayer = Players[iPlayer];
						if (pPetyrPlayer ~= nil) then
						  if(not silent) then
							print("Spawn Petyr at Eyrie(", iEryie[1], ",", iEryie[2],")");
						  end
						  SpawnPlayer(iPlayer, iEryie[1], iEryie[2], 0);
						  if(not silent) then
							print("Kill Petyr's starting units");
						  end
						  units=1;
						  for i, pUnit in pUnits:Members() do
							if(units<3) then
							  UnitManager.Kill(pUnit);
							end
							units=units+1;
						  end
						end
						
					  elseif(iJonArrynPlayer~=-1) then
						if(not silent) then
						  print("Jon Arryn and Petyr detected");
						end
						local pPetyrPlayer = Players[iPetyrPlayer];
						local pJonArrynPlayer = Players[iJonArrynPlayer];
						local pJonArrynUnits :table = Players[iJonArrynPlayer]:GetUnits();
						if(not silent) then
						  print("Founding the Eyrie to eliminate competition for it.");
						end
						pJonArrynPlayer:GetCities():Create(iEryie[1], iEryie[2]);
						if(not silent) then
						  print("Kill Jon Arryn's settler");
						end
						units=1;
						for i, pUnit in pJonArrynUnits:Members() do
						  if(units==1) then
							UnitManager.Kill(pUnit);
						  end
						  units=units+1;
						end
						  if(iColdwater==-1) then
							if(not silent) then
							  print("No minor Coldwater detected, no problem.");
							end
						  elseif(iColdwater~=-1) then
							if(not silent) then
							  print("Coldwater, Petyr, and Jon Arryn detected");
							end
							local pMinorColdwaterPlayer = Players[iColdwater];
							local pMinorColdwaterUnits :table = Players[iColdwater]:GetUnits();
							
							if(not silent) then
							  print("Kill the minor Coldwater Civ");
							end
							units=1;
							for i, pUnit in pMinorColdwaterUnits:Members() do
							  if(units==1) then
								UnitManager.Kill(pUnit);
							  end
							  units=units+1;
							end
							
						  end
						
					  end
				elseif(GameInfo.Leaders["LEADER_EURON"].Hash == config:GetLeaderTypeID()) then
					if(not silent) then
						print("Found Euron"); 
					end
					if(iBalonPlayer==-1) then
						if(not silent) then
							print("No Balon detected"); 
						end
						local pPlot = Map.GetPlot(iPyke[1], iPyke[2]);
						local pEuronPlayer = Players[iPlayer];
						if (pEuronPlayer ~= nil) then
							if(not silent) then
								print("Spawn Euron at Pyke(", iPyke[1], ",", iPyke[2],")"); 
							end
							SpawnPlayer(iPlayer, iPyke[1], iPyke[2], 0);
							if(not silent) then
								print("Kill Euron's starting units"); 
							end
							units=1;
							for i, pUnit in pUnits:Members() do
								if(units<3) then
									UnitManager.Kill(pUnit);
								end
								units=units+1;
							end
						end
					elseif(iBalonPlayer~=-1) then
						if(not silent) then
							print("Balon and Euron detected"); 
						end
						local pEuronPlayer = Players[iEuronPlayer];
						local pBalonPlayer = Players[iBalonPlayer];
						local pBalonUnits :table = Players[iBalonPlayer]:GetUnits();
						if(not silent) then
							print("Founding Pyke to eliminate competition for it."); 
						end
						pBalonPlayer:GetCities():Create(iPyke[1], iPyke[2]);
						if(not silent) then
							print("Kill Balon's settler"); 
						end
						units=1;
						for i, pUnit in pBalonUnits:Members() do
							if(units==1) then
								UnitManager.Kill(pUnit);
							end
							units=units+1;
						end
					end
				elseif(GameInfo.Leaders["LEADER_CERSEI"].Hash == config:GetLeaderTypeID()) then
					if(not silent) then
						print("Found Cersei"); 
					end
					if(iTywinPlayer==-1) then
						if(not silent) then
							print("No Tywin detected"); 
						end
						local pPlot = Map.GetPlot(iCasterlyRock[1], iCasterlyRock[2]);
						local pCerseiPlayer = Players[iPlayer];
						if (pCerseiPlayer ~= nil) then
							if(not silent) then
								print("Spawn Cersei at CasterlyRock(", iCasterlyRock[1], ",", iCasterlyRock[2],")"); 
							end
							SpawnPlayer(iPlayer, iCasterlyRock[1], iCasterlyRock[2], 0);
							if(not silent) then
								print("Kill Cersei's starting units"); 
							end
							units=1;
							for i, pUnit in pUnits:Members() do
								if(units<3) then
									UnitManager.Kill(pUnit);
								end
								units=units+1;
							end
						end
					elseif(iTywinPlayer~=-1) then
						if(not silent) then
							print("Tywin and Cersei detected"); 
						end
						local pCerseiPlayer = Players[iCerseiPlayer];
						local pTywinPlayer = Players[iTywinPlayer];
						local pTywinUnits :table = Players[iTywinPlayer]:GetUnits();
						if(not silent) then
							print("Founding CasterlyRock to eliminate competition for it."); 
						end
						pTywinPlayer:GetCities():Create(iCasterlyRock[1], iCasterlyRock[2]);
						if(not silent) then
							print("Kill Tywin's settler"); 
						end
						units=1;
						for i, pUnit in pTywinUnits:Members() do
							if(units==1) then
								UnitManager.Kill(pUnit);
							end
							units=units+1;
						end
					end
				end
			end
		end
		if(not silent) then
			print("Done Going Through Players II"); 
		end
	end

	LuaEvents.NewGameInitialized.Add(InitializeNewGame);
	Initialize();

	function SpawnPlayer(iPlayer, iX, iY, bStark)
		if(bStark==1) then
			UnitManager.InitUnit(iPlayer, "UNIT_SETTLER", iX,iY);
			UnitManager.InitUnitValidAdjacentHex(iPlayer, "UNIT_BANNERMAN", (iX),iY);
		else 
			UnitManager.InitUnit(iPlayer, "UNIT_SETTLER", iX,iY);
			UnitManager.InitUnitValidAdjacentHex(iPlayer, "UNIT_WARRIOR", (iX),iY);
		end
	end
else
	if(not silent) then
		print("Not the right map"); 
	end
end

print("GSWesterosEssos_Positioning.lua loaded!");
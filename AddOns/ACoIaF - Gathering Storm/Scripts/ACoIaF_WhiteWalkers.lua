include("InstanceManager.lua");
include("SupportFunctions.lua");
include("NaturalWonderGenerator.lua");
include("MapEnums.lua");

eWhiteWalkerPID=-100;
eWhiteWalkerPlayer=nil;
silent=false;

function Initialize()
	local aPlayersMajor = PlayerManager.GetAlive();
	for loop, pPlayer in ipairs(aPlayersMajor) do
		local iPlayer = pPlayer:GetID();
		local iPlayerStartPlot = pPlayer:GetStartingPlot();
		if(pPlayer ~= nil) then
			local config = PlayerConfigurations[iPlayer];
			if(GameInfo.Leaders["LEADER_NIGHTKING"].Hash == config:GetLeaderTypeID()) then 
				eWhiteWalkerPID=iPlayer;
				eWhiteWalkerPlayer=Players[eWhiteWalkerPID];
				if(not silent) then
					print("White Walkers Found! WhiteWalkerID: ", eWhiteWalkerPID, "!");
					
				end
			end
		end
	end
end

function InitializeNewGame()
	local aPlayersMajor = PlayerManager.GetAlive();
	for loop, pPlayer in ipairs(aPlayersMajor) do
		local iPlayer = pPlayer:GetID();
		local iPlayerStartPlot = pPlayer:GetStartingPlot();
		if(pPlayer ~= nil) then
			local config = PlayerConfigurations[iPlayer];
			if(GameInfo.Leaders["LEADER_NIGHTKING"].Hash == config:GetLeaderTypeID()) then 
				eWhiteWalkerPID=iPlayer;
				eWhiteWalkerPlayer=Players[eWhiteWalkerPID];
				if(not silent) then
					print("White Walkers Found! WhiteWalkerID: ", eWhiteWalkerPID, "!");
					print("Is it cold in here?");
				end
				TerrainBuilder.SetTerrainType(iPlayerStartPlot, g_TERRAIN_TYPE_SNOW);
				
				local eWhiteWalkerUnits :table = Players[iPlayer]:GetUnits();
				if(not silent) then
					print("Founding Dawn's End"); 
				end
				eWhiteWalkerPlayer:GetCities():Create(iPlayerStartPlot:GetX(), iPlayerStartPlot:GetY());
				if(not silent) then
					print("Kill Nightkings Settler"); 
				end
				units=1;
				for i, pUnit in eWhiteWalkerUnits:Members() do
					if(units==1) then
						UnitManager.Kill(pUnit);
					end
					units=units+1;
				end
			end
		end
	end
end
LuaEvents.NewGameInitialized.Add(InitializeNewGame);

local function OnPlayerTurnActivated( player )
	local currentTurn = Game.GetCurrentGameTurn();
	if(currentTurn==1) then
		if (player == eWhiteWalkerPID) then
			setWhiteWalkerDiplomaticState();
		end
	end
end

function setWhiteWalkerDiplomaticState()
	if(not silent) then
		print("Setting White Walker Diplomatic state");
	end
end

function WhiteWalker_BringWinter(PlotX, PlotY, ImprovementID, PlayerID, ResourceID, Unknown1, Unknown2)
	local winterize	= GameInfo.Improvements['IMPROVEMENT_WINTERIZE'].Index;
	if (ImprovementID == winterize) then									
		plot = Map.GetPlot(PlotX, PlotY)
		ImprovementBuilder.SetImprovementType(plot, -1, 0); --remove any improvement
		ResourceBuilder.SetResourceType(plot, -1, 0); --remove any resource
		if(not silent) then
			print("Is it cold in here?");
		end
		TerrainBuilder.SetTerrainType(plot, g_TERRAIN_TYPE_SNOW);

		local localPlayerVis:table = PlayersVisibility[PlayerID];
		local pCurPlayerVisibility = PlayersVisibility[PlayerID];
		local iPlotIndex = Map.GetPlot(PlotX, PlotY):GetIndex();
	end
end

Events.ImprovementAddedToMap.Add(WhiteWalker_BringWinter);

function IsTargetCavalry(unitType)
	local isCavalry = {false, false};if(not silent) then
		print("It was cavalry");
	end
	if(unitType=="LOC_UNIT_BARBARIAN_HORSE_ARCHER_NAME" or unitType=="LOC_UNIT_BARBARIAN_HORSEMAN_NAME" or unitType=="LOC_UNIT_HORSEMAN_NAME" or unitType=="LOC_UNIT_KNIGHT_NAME" or unitType=="LOC_UNIT_KNIGHT_II_NAME" or unitType=="LOC_CIVILIZATION_UNIT_VALE_KNIGHT_NAME" or unitType=="LOC_CIVILIZATION_UNIT_VALE_KNIGHT_II_NAME" or unitType=="LOC_CIVILIZATION_UNIT_REACH_KNIGHT_NAME" or unitType=="LOC_CIVILIZATION_UNIT_REACH_KNIGHT_II_NAME" or unitType=="LOC_CIVILIZATION_UNIT_SCREAMER_NAME" or unitType=="LOC_CIVILIZATION_UNIT_SCREAMER_II_NAME" or unitType=="LOC_CIVILIZATION_UNIT_BLOOD_RIDER_NAME" or unitType=="LOC_CIVILIZATION_UNIT_BLOOD_RIDER_II_NAME") then
		isCavalry[0] = true;
		if(unitType=="LOC_UNIT_KNIGHT_II_NAME" or unitType=="LOC_UNIT_VALE_KNIGHT_II_NAME" or unitType=="LOC_UNIT_REACH_KNIGHT_II_NAME" or unitType=="LOC_UNIT_SCREAMER_II_NAME" or unitType=="LOC_UNIT_BLOOD_RIDER_II_NAME") then
			isCavalry[1] = true;
		end
	end
	return isCavalry;
end

function IsTargetDragon(unitType)
	local isDragon = {false, false};
	if(unitType=="LOC_UNIT_DRAGON_NAME" or unitType=="LOC_UNIT_DRAGON_II_NAME") then
		isDragon[0] = true;if(not silent) then
		print("It was a dragon");
	end
		if(unitType=="LOC_UNIT_DRAGON_II_NAME") then
			isDragon[1] = true;
		end
	end
	return isDragon;
end


function WhiteWalkerConvert(loserPID, loserUID, winnerPID, winnerUID)

	if(not silent) then
		print("UnitKilledInCombat:");

		print("Loser PID: ", loserPID, " | Loser UID: ", loserUID);
		print("Winner PID: ", winnerPID, " | Winner UID: ", winnerUID);
	end
	if(winnerPID==eWhiteWalkerPID) then
			if(not silent) then
				print("The Other Unit Won.");
			end
		local wwPlayer = Players[eWhiteWalkerPID];
		local wwUnits :table = wwPlayer:GetUnits();
		local wwPendingUnit = "UNIT_WIGHT";
		local wwUnitID=-1;
		local wwUnitX=-1;
		local wwUnitY=-1;
		local wwUnitType=nil;
		local wwUnitTypeName = "";
		for i, wwUnit in wwUnits:Members() do
			wwUnitID=wwUnit:GetID();
			wwUnitType=UnitManager.GetTypeName(wwUnit);
			if(not silent) then
				print("wwUnitID: ", wwUnitID);
				print("wwUnitType: ", wwUnitType);
			end
			if(wwUnitID==winnerUID and (wwUnitType=="LOC_CIVILIZATION_UNIT_WHITE_WALKER_NAME" or wwUnitType=="LOC_CIVILIZATION_UNIT_WHITE_WALKER_II_NAME" or wwUnitType=="LOC_CIVILIZATION_UNIT_WHITE_WALKER_THROWER_NAME" or wwUnitType=="LOC_CIVILIZATION_UNIT_WHITE_WALKER_THROWER_II_NAME" or wwUnitType=="LOC_CIVILIZATION_UNIT_MOUNTED_WW_NAME" or wwUnitType=="LOC_CIVILIZATION_UNIT_MOUNTED_WW_II_NAME")) then
				if(not silent) then
					print("It was a white walker.");
				end
				wwUnitX=wwUnit:GetX();
				wwUnitY=wwUnit:GetY();
				if(wwUnitType~="LOC_CIVILIZATION_UNIT_MOUNTED_WW_NAME" and wwUnitType ~= "LOC_CIVILIZATION_UNIT_MOUNTED_WW_II_NAME") then
					if(not silent) then
						print("Winner doesn't have a mount.");
					end
					local loserPlayer = Players[loserPID];
					local loserUnits :table = loserPlayer:GetUnits();
					local loserUnitID=-1;
					local loserUnitX=-1;
					local loserUnitY=-1;
					local loserUnitType=nil;
					local loserUnitTypeName = "";
					for i, loserUnit in loserUnits:Members() do
					
						loserUnitID=loserUnit:GetID();
						loserUnitType=UnitManager.GetTypeName(loserUnit);
						
						if(loserUnitID==loserUID) then 
							
							if(not silent) then
								print("loserUnitID: ", loserUnitID);
								print("loserUnitType: ", loserUnitType);
							end
							local isDragon = IsTargetDragon(loserUnitType);
							local isCavalry = IsTargetCavalry(loserUnitType);
							if(isDragon[0]) then
								if(not silent) then
									print("Loser was a dragon unit.");
									print("Spawning an undead dragon unit.");
								end
								if(isDragon[1]) then
									if(not silent) then
										print("Level II");
									end
									--wwPendingUnit = "UNIT_WIGHT_II";
								else 
									--wwPendingUnit = "UNIT_WIGHT";
								end
							elseif(isCavalry[0] and (wwUnitType=="LOC_CIVILIZATION_UNIT_WHITE_WALKER_NAME" or wwUnitType=="LOC_CIVILIZATION_UNIT_WHITE_WALKER_II_NAME")) then
								if(not silent) then
									print("Loser was a cavalry unit.");
									print("Deleting White Walker unit.");
									print("Spawning a mounted white walker unit.");
								end
								UnitManager.Kill(wwUnit);
								if(isCavalry[1]) then
									if(not silent) then
										print("Level II");
									end
									wwPendingUnit = "UNIT_MOUNTED_WW_II";
								else 
									wwPendingUnit = "UNIT_MOUNTED_WW";
								end
							end
						end
					end
				end
				
				if(wwPendingUnit=="UNIT_WIGHT" and not silent) then
					print("Not a special case, just summoning a wight.");
				end
				UnitManager.InitUnit(eWhiteWalkerPID, wwPendingUnit, wwUnitX,wwUnitY);
			end
		end
	end
end

GameEvents.PlayerTurnStarted.Add(OnPlayerTurnActivated);
Events.UnitKilledInCombat.Add(WhiteWalkerConvert);

Initialize();
print("White Walkers Script Loaded.");
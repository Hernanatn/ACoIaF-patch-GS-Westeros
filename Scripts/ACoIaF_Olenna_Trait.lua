print("Queen of Throns Script Loading");

local aPlayersMajor = PlayerManager.GetAlive();
local eOlennaPID = -100;
local eOlennaPlayer;
local tyrellFarm = GameInfo.Improvements['IMPROVEMENT_FARM'].Index;
local tyrellFarmCount = 0;

for loop, pPlayer in ipairs(aPlayersMajor) do
	local iPlayer = pPlayer:GetID();
	local iPlayerStartPlot = pPlayer:GetStartingPlot();
	if(pPlayer ~= nil) then
		local config = PlayerConfigurations[iPlayer];
		if(GameInfo.Leaders["LEADER_OLENNA"].Hash == config:GetLeaderTypeID()) then 
			eOlennaPID=iPlayer;
			eOlennaPlayer=Players[eOlennaPID];
			print("Olenna Found! OlennaID: ", eOlennaPID, "!");
		end
	end
end



function Olenna_TyrellFarm_AddCheck(PlotX, PlotY, ImprovementID, PlayerID, ResourceID, Unknown1, Unknown2)
	if (ImprovementID == tyrellFarm) then									
		plot = Map.GetPlot(PlotX, PlotY)
		tyrellFarmCount=tyrellFarmCount+1;
		print("Tyrell farm created at X:"..PlotX.." PlotY: "..PlotY);
	end
end

function Olenna_TyrellFarm_RemovedCheck(PlotX, PlotY, PlayerID)
	pPlot=Map.GetPlot(PlotX, PlotY);
	local ImprovementID = pPlot:GetImprovementType();
	print("PlayerID: "..PlayerID.." removed "..ImprovementID.."at X:"..PlotX.." PlotY: "..PlotY);
	if (ImprovementID == tyrellFarm) then	
		print("Tyrell farm removed at X:"..PlotX.." PlotY: "..PlotY);
	end
end 

function Olenna_TyrellFarm_RemovedCheck(PlotX, PlotY, ImprovementID, PlayerID, ResourceID, Unknown1, Unknown2)
	if (ImprovementID == tyrellFarm) then									
		plot = Map.GetPlot(PlotX, PlotY)
		tyrellFarmCount=tyrellFarmCount+1;
		print("Tyrell farm created at X:"..PlotX.." PlotY: "..PlotY);
	end
end

Events.ImprovementAddedToMap.Add(Olenna_TyrellFarm_AddCheck);
Events.OnImprovementRemovedFromMap.Add(Olenna_TyrellFarm_RemovedCheck);

print("Queen of Throns Script Loaded");
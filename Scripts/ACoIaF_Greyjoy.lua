-- ==================================ACoIaF - Greyjoy Script===============================================================================
local silent=true;
if(not silent) then
	print("Greyjoy Script loading...");
end
--Iron Islands Leaders
iBalonPlayer = -1;
iEuronPlayer = -1;

function Initialize()
	local aPlayers = PlayerManager.GetAlive();
	local aPlayersMajor = PlayerManager.GetAliveMajors();
	for loop, pPlayer in ipairs(aPlayers) do
		local iPlayer = pPlayer:GetID();
		local config = PlayerConfigurations[iPlayer];
		if(pPlayer ~= nil) then
			if(GameInfo.Leaders["LEADER_BALON"].Hash == config:GetLeaderTypeID()) then --Iron Islands
				if(not silent) then
					print("Found Balon, PlayerID: "..iPlayer);
					print("Unlocking sailing.");
				end
				iBalonPlayer=iPlayer;
				local pScience:table = pPlayer:GetTechs();
				pScience:SetTech(GameInfo.Technologies["TECH_SAILING"].Index, true);
			elseif(GameInfo.Leaders["LEADER_EURON"].Hash == config:GetLeaderTypeID()) then
				if(not silent) then
					print("Found Euron, PlayerID: "..iPlayer);
					print("Unlocking sailing.");
				end
				iEuronPlayer=iPlayer;
				local pScience:table = pPlayer:GetTechs();
				pScience:SetTech(GameInfo.Technologies["TECH_SAILING"].Index, true);
			end
		end
	end
end
Initialize();
if(not silent) then
	print("What is dead may never die.");
	print("Greyjoy Script loaded");
end
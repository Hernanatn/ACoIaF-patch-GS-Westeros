local district2 = "DISTRICT_HARBOR";
local district3 = "DISTRICT_COMMERCIAL_HUB";
local district4 = "DISTRICT_CITY_CENTER";



function OnButton2()
	local tParameters = {};
	tParameters[ PlayerOperations.PARAM_DISTRICT_TYPE ] = GameInfo.Districts[district2].Index;
	UI.RequestPlayerOperation(Game.GetLocalPlayer(), PlayerOperations.SET_ESCAPE_ROUTE, tParameters);	
	ContextPtr:SetHide(true);
end
function OnButton3()
	local tParameters = {};
	tParameters[ PlayerOperations.PARAM_DISTRICT_TYPE ] = GameInfo.Districts[district3].Index;
	UI.RequestPlayerOperation(Game.GetLocalPlayer(), PlayerOperations.SET_ESCAPE_ROUTE, tParameters);	
	ContextPtr:SetHide(true);
end
function OnButton4()
	local tParameters = {};
	tParameters[ PlayerOperations.PARAM_DISTRICT_TYPE ] = GameInfo.Districts[district4].Index;
	UI.RequestPlayerOperation(Game.GetLocalPlayer(), PlayerOperations.SET_ESCAPE_ROUTE, tParameters);	
	ContextPtr:SetHide(true);
end

function OnOpen(testParam)

	print (testParam);

	local localPlayer = Players[Game.GetLocalPlayer()];
	if (localPlayer == nil) then
		return;
	end

	local spyUnitID = localPlayer:GetDiplomacy():GetNextEscapingSpyID();
	local spyUnit :table = localPlayer:GetUnits():FindID(spyUnitID);

	local currentCity = Cities.GetPlotPurchaseCity(spyUnit:GetX(), spyUnit:GetY());
	local spyName = spyUnit:GetName();
	local lootName = spyUnit:GetLootName();
	local pursuitSpyName = spyUnit:GetPursuingSpyName();

	local choice2Turns = GameInfo.Districts[district2].TravelTime;
	local choice3Turns = GameInfo.Districts[district3].TravelTime;
	local choice4Turns = GameInfo.Districts[district4].TravelTime;

	Controls.PanelHeader:LocalizeAndSetText("LOC_ESPIONAGE_ESCAPE_PANEL_HEADER");
	Controls.CityHeader:LocalizeAndSetText("LOC_ESPIONAGE_ESCAPE_CITY_HEADER", currentCity:GetName());
	Controls.AgentLabel:LocalizeAndSetText("LOC_ESPIONAGE_ESCAPE_AGENT_LABEL");
	Controls.AgentDetails:LocalizeAndSetText(spyName);
	Controls.LootLabel:LocalizeAndSetText("LOC_ESPIONAGE_ESCAPE_LOOT_LABEL");
	Controls.LootDetails:LocalizeAndSetText(lootName);
	Controls.PursuitLabel:LocalizeAndSetText("LOC_ESPIONAGE_ESCAPE_PURSUIT_LABEL");
	if (pursuitSpyName == "") then
		Controls.PursuitDetails:LocalizeAndSetText("LOC_ESPIONAGE_ESCAPE_PURSUIT_POLICE");
	else
		Controls.PursuitDetails:LocalizeAndSetText("LOC_ESPIONAGE_ESCAPE_PURSUIT_COUNTERSPY", pursuitSpyName);
	end
	Controls.ChoiceHeader:LocalizeAndSetText("LOC_ESPIONAGE_ESCAPE_CHOICE_HEADER");
	
	Controls.Button2:LocalizeAndSetText("LOC_ESPIONAGE_ESCAPE_CHOICE_2");
	if (currentCity:GetDistricts():HasDistrict(GameInfo.Districts[district2].Index, true, true)) then
		Controls.Label2:LocalizeAndSetText("LOC_ESPIONAGE_ESCAPE_TURNS", choice2Turns);
		Controls.Label2:SetColorByName("BodyTextBlue");
		Controls.Button2:SetDisabled(false);
		Controls.Button2:LocalizeAndSetToolTip("LOC_ESPIONAGE_ESCAPE_TOOLTIP");
	else
		Controls.Label2:LocalizeAndSetText("LOC_ESPIONAGE_ESCAPE_NO_DISTRICT", GameInfo.Districts[district2].Name);
		Controls.Label2:SetColorByName("BodyTextBlueAlt");
		Controls.Button2:SetDisabled(true);
	end
	Controls.Button3:LocalizeAndSetText("LOC_ESPIONAGE_ESCAPE_CHOICE_3");
	if (currentCity:GetDistricts():HasDistrict(GameInfo.Districts[district3].Index, true, true)) then
		Controls.Label3:LocalizeAndSetText("LOC_ESPIONAGE_ESCAPE_TURNS", choice3Turns);
		Controls.Label3:SetColorByName("BodyTextBlue");
		Controls.Button3:SetDisabled(false);
		Controls.Button3:LocalizeAndSetToolTip("LOC_ESPIONAGE_ESCAPE_TOOLTIP");
	else
		Controls.Label3:LocalizeAndSetText("LOC_ESPIONAGE_ESCAPE_NO_DISTRICT", GameInfo.Districts[district3].Name);
		Controls.Label3:SetColorByName("BodyTextBlueAlt");
		Controls.Button3:SetDisabled(true);
	end
	Controls.Button4:LocalizeAndSetText("LOC_ESPIONAGE_ESCAPE_CHOICE_4");
	Controls.Label4:LocalizeAndSetText("LOC_ESPIONAGE_ESCAPE_TURNS", choice4Turns);
	Controls.Button4:LocalizeAndSetToolTip("LOC_ESPIONAGE_ESCAPE_TOOLTIP");

	ContextPtr:SetHide(false);
	Controls.PopupAlphaIn:SetToBeginning();
	Controls.PopupAlphaIn:Play();
	Controls.PopupSlideIn:SetToBeginning();
	Controls.PopupSlideIn:Play();
end

-- ===========================================================================
function Initialize()
	Controls.Button2:RegisterCallback(Mouse.eLClick, OnButton2);
	Controls.Button3:RegisterCallback(Mouse.eLClick, OnButton3);
	Controls.Button4:RegisterCallback(Mouse.eLClick, OnButton4);
	LuaEvents.NotificationPanel_OpenEspionageEscape.Add(OnOpen);
end
Initialize();

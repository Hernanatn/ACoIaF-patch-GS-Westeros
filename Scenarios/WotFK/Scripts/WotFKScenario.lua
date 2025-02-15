-- ==================================City Score Values===============================================================================

local lastLocalTurnNumber = 0;
-- {x, y, scoreValue}
--King's Landing
local iKingsLanding = {21, 26, 20};
--Dragonstone
local iDragonstone = {29, 30, 12};
--WotFK Other Capitols
local iStormsEnd = {26, 21, 8};
local iWinterfell = {16, 60, 8};
local iPyke = {6, 38, 10};
--NPC Capitols
local iCasterlyRock = {5, 29, 4};
local iRiverrun = {14, 35, 4};
local iStoneySept = {17, 28, 1};
local iSunspear = {29, 7, 4};
local iEryie = {23, 39, 4};
local iHighgarden = {10, 18, 4}; 
--Regular City
local iRegularCity = 1; 

-- Player Slots
local eBalonPlayer = -1;
local eJofferyPlayer = -1;
local eRenlyPlayer = -1;
local eRobbPlayer = -1;
local eStannisPlayer = -1;

-- NPC Slots
local ePetyr = 5;
local eOlenna = 7;
local eDoran = 8;
local eTywin = 6;
local eEdmure = 9;
local eMance = 10;

-- City-State Slots
local eBraavos = 11;
local ePentos = 12;
local eMyr = 13;
local eLys = 14;
local eTyrosh = 15;
local eHightower = 16;
local eRedwyne = 17;
local eDayne = 18;
local eTarly = 19;
local eWyl = 20;
local eSelmy = 21;
local eTarth = 22;
local eMassey = 23;
local eRykker = 24;
local eHoare = 25;
local eClegane = 26;
local eReyne = 27;
local eRoyce = 28;
local eFrey = 29;
local eReed = 30;
local eColdwater = 31;
local eBolton = 32;
local eKarstark = 33;
local eGlover = 34;
local eUmber = 35;
local eMormont = 36;
local eNightswatch = 37;

local bOldGodsFounded = false;
local bRedGodFounded = false;
local bSevenGodsFounded = false;
local bDrownedGodFounded = false;
local bManyFacedGodFounded = false;

-- ==================================================================================================================================

function Initialize()
	-- Assign variables
	local aPlayers = PlayerManager.GetAliveMajors();
	for loop, pPlayer in ipairs(aPlayers) do
		local iPlayer = pPlayer:GetID();
		local pkPlot = pPlayer:GetStartingPlot();
		if (pkPlot:GetX() == iPyke[1] and pkPlot:GetY() == iPyke[2]) then
			eBalonPlayer = iPlayer;		
		elseif (pkPlot:GetX() == iKingsLanding[1] and pkPlot:GetY() == iKingsLanding[2]) then
			eJofferyPlayer = iPlayer;
		elseif (pkPlot:GetX() == iStormsEnd[1] and pkPlot:GetY() == iStormsEnd[2]) then
			eRenlyPlayer = iPlayer;
		elseif (pkPlot:GetX() == iWinterfell[1] and pkPlot:GetY() == iWinterfell[2]) then
			eRobbPlayer = iPlayer;
		elseif (pkPlot:GetX() == iDragonstone[1] and pkPlot:GetY() == iDragonstone[2]) then
			eStannisPlayer = iPlayer;
		elseif (pkPlot:GetX() == iCasterlyRock[1] and pkPlot:GetY() == iCasterlyRock[2]) then
			eTywin = iPlayer;
		elseif (pkPlot:GetX() == iRiverrun[1] and pkPlot:GetY() == iRiverrun[2]) then
			eEdmure = iPlayer;
		elseif (pkPlot:GetX() == iSunspear[1] and pkPlot:GetY() == iSunspear[2]) then
			eDoran = iPlayer;
		elseif (pkPlot:GetX() == iEryie[1] and pkPlot:GetY() == iEryie[2]) then
			ePetyr = iPlayer;
		elseif (pkPlot:GetX() == iHighgarden[1] and pkPlot:GetY() == iHighgarden[2]) then
			eOlenna = iPlayer;
	    else 
			eMance = iPlayer;
		end
	end
end

function InitializeNewGame()
	
	
	-- Majors have met
	-- For City-State Delegation
	Players[eOlenna]:GetDiplomacy():SetHasMet(eRedwyne);
	Players[eJofferyPlayer]:GetDiplomacy():SetHasMet(eBalonPlayer);
	Players[eJofferyPlayer]:GetDiplomacy():SetHasMet(eTywin);
	Players[eJofferyPlayer]:GetDiplomacy():SetHasMet(eFrey);
	Players[eJofferyPlayer]:GetDiplomacy():SetHasMet(eTarth);
	Players[eJofferyPlayer]:GetDiplomacy():SetHasMet(eMance);
	
	Players[eBalonPlayer]:GetDiplomacy():SetHasMet(eOlenna);
	Players[eBalonPlayer]:GetDiplomacy():SetHasMet(eDoran);
	Players[eBalonPlayer]:GetDiplomacy():SetHasMet(ePetyr);
	Players[eBalonPlayer]:GetDiplomacy():SetHasMet(eStannisPlayer);
	Players[eBalonPlayer]:GetDiplomacy():SetHasMet(eMance);
	
	Players[eRenlyPlayer]:GetDiplomacy():SetHasMet(eBalonPlayer);
	Players[eRenlyPlayer]:GetDiplomacy():SetHasMet(eRobbPlayer);
	Players[eRenlyPlayer]:GetDiplomacy():SetHasMet(eEdmure);
	Players[eRenlyPlayer]:GetDiplomacy():SetHasMet(ePetyr);
	Players[eRenlyPlayer]:GetDiplomacy():SetHasMet(eStannisPlayer);
	Players[eRenlyPlayer]:GetDiplomacy():SetHasMet(eMance);
	
	Players[eRobbPlayer]:GetDiplomacy():SetHasMet(eStannisPlayer);
	Players[eRobbPlayer]:GetDiplomacy():SetHasMet(eOlenna);
	Players[eRobbPlayer]:GetDiplomacy():SetHasMet(eDoran);
	Players[eRobbPlayer]:GetDiplomacy():SetHasMet(ePetyr);
	Players[eRobbPlayer]:GetDiplomacy():SetHasMet(eEdmure);
	Players[eRobbPlayer]:GetDiplomacy():SetHasMet(eMance);
	
	
	Players[eStannisPlayer]:GetDiplomacy():SetHasMet(eOlenna);
	Players[eStannisPlayer]:GetDiplomacy():SetHasMet(eDoran);
	Players[eStannisPlayer]:GetDiplomacy():SetHasMet(eEdmure);
	Players[eStannisPlayer]:GetDiplomacy():SetHasMet(eMance);
	
	
	
	-- Majors are allied
	Players[eJofferyPlayer]:GetDiplomacy():SetPermanentAlliance(eTywin);
	Players[eRenlyPlayer]:GetDiplomacy():SetPermanentAlliance(eOlenna);
	Players[eRobbPlayer]:GetDiplomacy():SetPermanentAlliance(eEdmure);
	
	-- Majors are at war
	
	local iFormalWar = WarTypes.FORMAL_WAR; --Stannis and Renly on everyone
	local iLibWar = WarTypes.LIBERATION_WAR; --Robb on Tywin and Joffery
	local iReconWar = WarTypes.RECONQUEST_WAR; --Edmure on Tywin and Joffery
	
	Players[eStannisPlayer]:GetDiplomacy():DeclareWarOn(eJofferyPlayer, WarTypes.FORMAL_WAR, true);
	Players[eStannisPlayer]:GetDiplomacy():DeclareWarOn(eTywin, WarTypes.FORMAL_WAR, true);
	Players[eStannisPlayer]:GetDiplomacy():DeclareWarOn(eRenlyPlayer, WarTypes.FORMAL_WAR, true);
	Players[eStannisPlayer]:GetDiplomacy():DeclareWarOn(eOlenna, WarTypes.FORMAL_WAR, true);

	Players[eRobbPlayer]:GetDiplomacy():DeclareWarOn(eJofferyPlayer, WarTypes.FORMAL_WAR, true);
	Players[eRobbPlayer]:GetDiplomacy():DeclareWarOn(eTywin, WarTypes.FORMAL_WAR, true);

	Players[eEdmure]:GetDiplomacy():DeclareWarOn(eJofferyPlayer, WarTypes.FORMAL_WAR, true);
	Players[eEdmure]:GetDiplomacy():DeclareWarOn(eTywin, WarTypes.FORMAL_WAR, true);

	Players[eRenlyPlayer]:GetDiplomacy():DeclareWarOn(eJofferyPlayer, WarTypes.FORMAL_WAR, true);
	Players[eRenlyPlayer]:GetDiplomacy():DeclareWarOn(eTywin, WarTypes.FORMAL_WAR, true);

	Players[eOlenna]:GetDiplomacy():DeclareWarOn(eJofferyPlayer, WarTypes.FORMAL_WAR, true);
	Players[eOlenna]:GetDiplomacy():DeclareWarOn(eTywin, WarTypes.FORMAL_WAR, true);
	
	
	-- Majors also have delegations
	
	for i = 0, 3 do -- Only add a token to get the player to 3, balances the total number of tokens to 6 for suzerains in case they were the first person to meet them generating the free token
		if(Players[eHoare]:GetInfluence():GetSuzerain()~=eJofferyPlayer) then Players[eJofferyPlayer]:GetInfluence():GiveFreeTokenToPlayer(eHoare); end
		if(Players[eSelmy]:GetInfluence():GetSuzerain()~=eJofferyPlayer) then Players[eJofferyPlayer]:GetInfluence():GiveFreeTokenToPlayer(eSelmy); end
		if(Players[eTarth]:GetInfluence():GetSuzerain()~=eJofferyPlayer) then Players[eJofferyPlayer]:GetInfluence():GiveFreeTokenToPlayer(eTarth); end
		if(Players[eRykker]:GetInfluence():GetSuzerain()~=eJofferyPlayer) then Players[eJofferyPlayer]:GetInfluence():GiveFreeTokenToPlayer(eRykker); end
		if(Players[eMassey]:GetInfluence():GetSuzerain()~=eJofferyPlayer) then Players[eJofferyPlayer]:GetInfluence():GiveFreeTokenToPlayer(eMassey); end
		if(Players[eFrey]:GetInfluence():GetSuzerain()~=eJofferyPlayer) then Players[eJofferyPlayer]:GetInfluence():GiveFreeTokenToPlayer(eFrey); end
		
		if(Players[eMormont]:GetInfluence():GetSuzerain()~=eRobbPlayer) then Players[eRobbPlayer]:GetInfluence():GiveFreeTokenToPlayer(eMormont); end
		if(Players[eBolton]:GetInfluence():GetSuzerain()~=eRobbPlayer) then Players[eRobbPlayer]:GetInfluence():GiveFreeTokenToPlayer(eBolton); end
		if(Players[eGlover]:GetInfluence():GetSuzerain()~=eRobbPlayer) then Players[eRobbPlayer]:GetInfluence():GiveFreeTokenToPlayer(eGlover); end
		if(Players[eKarstark]:GetInfluence():GetSuzerain()~=eRobbPlayer) then Players[eRobbPlayer]:GetInfluence():GiveFreeTokenToPlayer(eKarstark); end
		if(Players[eUmber]:GetInfluence():GetSuzerain()~=eRobbPlayer) then Players[eRobbPlayer]:GetInfluence():GiveFreeTokenToPlayer(eUmber); end
		if(Players[eReed]:GetInfluence():GetSuzerain()~=eRobbPlayer) then Players[eRobbPlayer]:GetInfluence():GiveFreeTokenToPlayer(eReed); end
		if(Players[eNightswatch]:GetInfluence():GetSuzerain()~=eRobbPlayer) then Players[eRobbPlayer]:GetInfluence():GiveFreeTokenToPlayer(eNightswatch); end
		
		if(Players[eClegane]:GetInfluence():GetSuzerain()~=eTywin) then Players[eTywin]:GetInfluence():GiveFreeTokenToPlayer(eClegane); end
		if(Players[eReyne]:GetInfluence():GetSuzerain()~=eTywin) then Players[eTywin]:GetInfluence():GiveFreeTokenToPlayer(eReyne); end
		
		if(Players[eWyl]:GetInfluence():GetSuzerain()~=eDoran) then Players[eDoran]:GetInfluence():GiveFreeTokenToPlayer(eWyl); end
		if(Players[eDayne]:GetInfluence():GetSuzerain()~=eDoran) then Players[eDoran]:GetInfluence():GiveFreeTokenToPlayer(eDayne); end
		
		if(Players[eRoyce]:GetInfluence():GetSuzerain()~=ePetyr) then Players[ePetyr]:GetInfluence():GiveFreeTokenToPlayer(eRoyce); end
		if(Players[eColdwater]:GetInfluence():GetSuzerain()~=ePetyr) then Players[ePetyr]:GetInfluence():GiveFreeTokenToPlayer(eColdwater); end
		
		if(Players[eHightower]:GetInfluence():GetSuzerain()~=eOlenna) then Players[eOlenna]:GetInfluence():GiveFreeTokenToPlayer(eHightower); end
		if(Players[eTarly]:GetInfluence():GetSuzerain()~=eOlenna) then Players[eOlenna]:GetInfluence():GiveFreeTokenToPlayer(eTarly); end
		if(Players[eRedwyne]:GetInfluence():GetSuzerain()~=eOlenna) then Players[eOlenna]:GetInfluence():GiveFreeTokenToPlayer(eRedwyne); end
	end
	for i = 1, 3 do -- Add the final 3 tokens to get full suzerain bonus
		Players[eJofferyPlayer]:GetInfluence():GiveFreeTokenToPlayer(eHoare);
		Players[eJofferyPlayer]:GetInfluence():GiveFreeTokenToPlayer(eSelmy);
		Players[eJofferyPlayer]:GetInfluence():GiveFreeTokenToPlayer(eTarth);
		Players[eJofferyPlayer]:GetInfluence():GiveFreeTokenToPlayer(eRykker);
		Players[eJofferyPlayer]:GetInfluence():GiveFreeTokenToPlayer(eMassey);
		Players[eJofferyPlayer]:GetInfluence():GiveFreeTokenToPlayer(eFrey);
		
		Players[eRobbPlayer]:GetInfluence():GiveFreeTokenToPlayer(eMormont);
		Players[eRobbPlayer]:GetInfluence():GiveFreeTokenToPlayer(eBolton);
		Players[eRobbPlayer]:GetInfluence():GiveFreeTokenToPlayer(eGlover);
		Players[eRobbPlayer]:GetInfluence():GiveFreeTokenToPlayer(eKarstark);
		Players[eRobbPlayer]:GetInfluence():GiveFreeTokenToPlayer(eUmber);
		Players[eRobbPlayer]:GetInfluence():GiveFreeTokenToPlayer(eReed);
		Players[eRobbPlayer]:GetInfluence():GiveFreeTokenToPlayer(eNightswatch);
		
		Players[eTywin]:GetInfluence():GiveFreeTokenToPlayer(eClegane);
		Players[eTywin]:GetInfluence():GiveFreeTokenToPlayer(eReyne);
		
		Players[eDoran]:GetInfluence():GiveFreeTokenToPlayer(eWyl);
		Players[eDoran]:GetInfluence():GiveFreeTokenToPlayer(eDayne);
		
		Players[ePetyr]:GetInfluence():GiveFreeTokenToPlayer(eRoyce);
		Players[ePetyr]:GetInfluence():GiveFreeTokenToPlayer(eColdwater);
		
		Players[eOlenna]:GetInfluence():GiveFreeTokenToPlayer(eHightower);
		Players[eOlenna]:GetInfluence():GiveFreeTokenToPlayer(eTarly);
		Players[eOlenna]:GetInfluence():GiveFreeTokenToPlayer(eRedwyne);
	end

	
	
	
	local aPlayers = PlayerManager.GetAlive();
	local aPlayersMajor = PlayerManager.GetAliveMajors();
	local aPlayersMinor = PlayerManager.GetAliveMinors();
	
	-- Found religion
	local pGameReligion:table = Game.GetReligion();
	for loop, pPlayer in ipairs(aPlayersMajor) do
		local pReligion:table = pPlayer:GetReligion();
		local iPlayer = pPlayer:GetID();
		local religion = -1;
		if(pPlayer ~= nil) then
			local config = PlayerConfigurations[iPlayer];
			if(GameInfo.Leaders["LEADER_JOFFERY"].Hash == config:GetLeaderTypeID()) then 
				--print("Player Id: ", iPlayer);
				pGameReligion:FoundPantheonHash(iPlayer,  GameInfo.Beliefs["BELIEF_GOD_OF_HEALING"].Hash);
				pReligion:SetHolyCity(pPlayer:GetCities():GetCapitalCity());
				pGameReligion:FoundReligion(iPlayer,  GameInfo.Religions["RELIGION_SEVEN_GODS"].Index);
				pGameReligion:AddBeliefHash(iPlayer,  GameInfo.Beliefs["BELIEF_DIVINE_INSPIRATION"].Hash);
				pGameReligion:AddBeliefHash(iPlayer,  GameInfo.Beliefs["BELIEF_PAPAL_PRIMACY"].Hash);
				pGameReligion:AddBeliefHash(iPlayer,  GameInfo.Beliefs["BELIEF_PAGODA"].Hash);
				pGameReligion:AddBeliefHash(iPlayer,  GameInfo.Beliefs["BELIEF_MONASTIC_ISOLATION"].Hash);
				pReligion:ChangeNumBeliefsEarned(1);
				religion = GameInfo.Religions["RELIGION_SEVEN_GODS"].Index;
				pPlayer:GetAi_Religion():SetFavoredReligion(religion);
				SetPlayerCitiesReligion(pPlayer, religion, false);
				bSevenGodsFounded = true;
			elseif(GameInfo.Leaders["LEADER_ROBB"].Hash == config:GetLeaderTypeID()) then 
				--print("Player Id: ", iPlayer);
				pGameReligion:FoundPantheonHash(iPlayer,  GameInfo.Beliefs["BELIEF_DANCE_OF_THE_AURORA"].Hash);
				pReligion:SetHolyCity(pPlayer:GetCities():GetCapitalCity());
				pGameReligion:FoundReligion(iPlayer,  GameInfo.Religions["RELIGION_OLD_GODS"].Index);
				pGameReligion:AddBeliefHash(iPlayer,  GameInfo.Beliefs["BELIEF_FEED_THE_WORLD"].Hash);
				pGameReligion:AddBeliefHash(iPlayer,  GameInfo.Beliefs["BELIEF_TITHE"].Hash);
				pGameReligion:AddBeliefHash(iPlayer,  GameInfo.Beliefs["BELIEF_SYNAGOGUE"].Hash);
				pGameReligion:AddBeliefHash(iPlayer,  GameInfo.Beliefs["BELIEF_DEFENDER_OF_FAITH"].Hash);
				pReligion:ChangeNumBeliefsEarned(1);
				religion = GameInfo.Religions["RELIGION_OLD_GODS"].Index;
				pPlayer:GetAi_Religion():SetFavoredReligion(religion);
				SetPlayerCitiesReligion(pPlayer, religion, false);
				bOldGodsFounded = true;
			elseif(GameInfo.Leaders["LEADER_STANNIS"].Hash == config:GetLeaderTypeID()) then 
				--print("Player Id: ", iPlayer);
				pGameReligion:FoundPantheonHash(iPlayer,  GameInfo.Beliefs["BELIEF_GOD_OF_WAR"].Hash);
				pReligion:SetHolyCity(pPlayer:GetCities():GetCapitalCity());
				pGameReligion:FoundReligion(iPlayer,  GameInfo.Religions["RELIGION_RED_GOD"].Index);
				pGameReligion:AddBeliefHash(iPlayer,  GameInfo.Beliefs["BELIEF_JESUIT_EDUCATION"].Hash);
				pGameReligion:AddBeliefHash(iPlayer,  GameInfo.Beliefs["BELIEF_PILGRIMAGE"].Hash);
				pGameReligion:AddBeliefHash(iPlayer,  GameInfo.Beliefs["BELIEF_MOSQUE"].Hash);
				pGameReligion:AddBeliefHash(iPlayer,  GameInfo.Beliefs["BELIEF_JUST_WAR"].Hash);
				pReligion:ChangeNumBeliefsEarned(1);
				religion = GameInfo.Religions["RELIGION_RED_GOD"].Index;
				pPlayer:GetAi_Religion():SetFavoredReligion(religion);
				SetPlayerCitiesReligion(pPlayer, religion, false);
				bRedGodFounded = true;
			elseif(GameInfo.Leaders["LEADER_BALON"].Hash == config:GetLeaderTypeID()) then 
				--print("Player Id: ", iPlayer);
				pGameReligion:FoundPantheonHash(iPlayer,  GameInfo.Beliefs["BELIEF_GOD_OF_THE_SEA"].Hash);
				pReligion:SetHolyCity(pPlayer:GetCities():GetCapitalCity());
				pGameReligion:FoundReligion(iPlayer,  GameInfo.Religions["RELIGION_DROWNED_GOD"].Index);
				pGameReligion:AddBeliefHash(iPlayer,  GameInfo.Beliefs["BELIEF_WORK_ETHIC"].Hash);
				pGameReligion:AddBeliefHash(iPlayer,  GameInfo.Beliefs["BELIEF_CHURCH_PROPERTY"].Hash);
				pGameReligion:AddBeliefHash(iPlayer,  GameInfo.Beliefs["BELIEF_MEETING_HOUSE"].Hash);
				pGameReligion:AddBeliefHash(iPlayer,  GameInfo.Beliefs["BELIEF_ITINERANT_PREACHERS"].Hash);
				pReligion:ChangeNumBeliefsEarned(1);
				religion = GameInfo.Religions["RELIGION_DROWNED_GOD"].Index;
				pPlayer:GetAi_Religion():SetFavoredReligion(religion);
				SetPlayerCitiesReligion(pPlayer, religion, false);
				bDrownedGodFounded = true;
			end
		end
	end
	
	-- Spread Religions
	local pGameReligion:table = Game.GetReligion();
	local aPlayers = PlayerManager.GetAliveMajors();
	for loop, pPlayer in ipairs(aPlayers) do
		local iPlayer = pPlayer:GetID();
		local pPlayerCities:table = pPlayer:GetCities();
		local pReligion = pPlayer:GetReligion();
		if (iPlayer == eJofferyPlayer or iPlayer == eRenlyPlayer or iPlayer == eTywin or iPlayer == eEdmure or iPlayer == ePetyr or iPlayer == eOlenna or iPlayer == eDoran) then
			local eReligion = GameInfo.Religions["RELIGION_SEVEN_GODS"].Index;
			if (iPlayer == eJofferyPlayer) then
				pReligion:SetHolyCity(pPlayer:GetCities():GetCapitalCity());
			end
			for i, pCity in pPlayerCities:Members() do
				local pCityReligion = pCity:GetReligion();
				if (pCityReligion:GetMajorityReligion() ~= eReligion) then
					pCityReligion:SetAllCityToReligion(eReligion);
				end
			end
		elseif (iPlayer == eRobbPlayer or iPlayer == eMance) then
			local eReligion = GameInfo.Religions["RELIGION_OLD_GODS"].Index;
			if (iPlayer == eRobbPlayer) then
				pReligion:SetHolyCity(pPlayer:GetCities():GetCapitalCity());
			end
			for i, pCity in pPlayerCities:Members() do
				local pCityReligion = pCity:GetReligion();
				if (pCityReligion:GetMajorityReligion() ~= eReligion) then
					pCityReligion:SetAllCityToReligion(eReligion);
				end
			end
		elseif (iPlayer == eStannisPlayer) then
			local eReligion = GameInfo.Religions["RELIGION_RED_GOD"].Index;
			if (iPlayer == eStannisPlayer) then
				pReligion:SetHolyCity(pPlayer:GetCities():GetCapitalCity());
			end
			for i, pCity in pPlayerCities:Members() do
				local pCityReligion = pCity:GetReligion();
				if (pCityReligion:GetMajorityReligion() ~= eReligion) then
					pCityReligion:SetAllCityToReligion(eReligion);
				end
			end
		elseif (iPlayer == eBalonPlayer) then
			local eReligion = GameInfo.Religions["RELIGION_DROWNED_GOD"].Index;
			if (iPlayer == eBalonPlayer) then
				pReligion:SetHolyCity(pPlayer:GetCities():GetCapitalCity());
			end
			for i, pCity in pPlayerCities:Members() do
				local pCityReligion = pCity:GetReligion();
				if (pCityReligion:GetMajorityReligion() ~= eReligion) then
					pCityReligion:SetAllCityToReligion(eReligion);
				end
			end
		end
	end
	
	local aMinors = PlayerManager.GetAliveMinors();
	for loop, pMinor in ipairs(aMinors) do
		local iMinor = pMinor:GetID();
		local pMinorCities:table = pMinor:GetCities();
		local pReligion = pMinor:GetReligion();
		if (iMinor == eBraavos) then
			pGameReligion:FoundPantheonHash(iMinor,  GameInfo.Beliefs["BELIEF_STONE_CIRCLES"].Hash);
			pReligion:SetHolyCity(pMinor:GetCities():GetCapitalCity());
			pGameReligion:FoundReligion(iMinor,  GameInfo.Religions["RELIGION_MANY_FACED_GOD"].Index);
			pGameReligion:AddBeliefHash(iMinor,  GameInfo.Beliefs["BELIEF_WARRIOR_MONKS"].Hash);
			pGameReligion:AddBeliefHash(iMinor,  GameInfo.Beliefs["BELIEF_LAY_MINISTRY"].Hash);
			pGameReligion:AddBeliefHash(iMinor,  GameInfo.Beliefs["BELIEF_DAR_E_MEHR"].Hash);
			pGameReligion:AddBeliefHash(iMinor,  GameInfo.Beliefs["BELIEF_BURIAL_GROUNDS"].Hash);
			pReligion:ChangeNumBeliefsEarned(1);
			religion = GameInfo.Religions["RELIGION_MANY_FACED_GOD"].Index;
			pMinor:GetAi_Religion():SetFavoredReligion(religion);
			SetPlayerCitiesReligion(pMinor, religion, false);
			bManyFacedGodFounded = true;
		elseif (iMinor == eRedwyne or iMinor == eFrey or iMinor == eDayne or iMinor == eHightower or iMinor == eReyne or iMinor == eHoare or iMinor == eRoyce or iMinor == eColdwater or iMinor == eClegane or iMinor == eRykker or iMinor == eMassey or iMinor == eTarly or iMinor == eTarth or iMinor == eSelmy or iMinor == eWyl) then	
			local eReligion = GameInfo.Religions["RELIGION_SEVEN_GODS"].Index;
			for i, pCity in pMinorCities:Members() do
				local pCityReligion = pCity:GetReligion();
				if (pCityReligion:GetMajorityReligion() ~= eReligion) then
					pCityReligion:SetAllCityToReligion(eReligion);
				end
			end
		elseif (iMinor == eNightswatch or iMinor == eMormont or iMinor == eBolton or iMinor == eKarstark or iMinor == eGlover or iMinor == eUmber or iMinor == eReed) then
			local eReligion = GameInfo.Religions["RELIGION_OLD_GODS"].Index;
			for i, pCity in pMinorCities:Members() do
				local pCityReligion = pCity:GetReligion();
				if (pCityReligion:GetMajorityReligion() ~= eReligion) then
					pCityReligion:SetAllCityToReligion(eReligion);
				end
			end
		end
	end
	
	-- Set up player government
	local aPlayers = PlayerManager.GetAlive();
	local aPlayersMajor = PlayerManager.GetAliveMajors();
	local aPlayersMinor = PlayerManager.GetAliveMinors();
	for loop, pPlayer in ipairs(aPlayers) do
		local iPlayer = pPlayer:GetID();
		local pDiplomacy:table = pPlayer:GetDiplomacy();
		local pCulture:table = pPlayer:GetCulture();
		local config = PlayerConfigurations[iPlayer];
		pCulture:SetCurrentGovernment(GameInfo.Governments["GOVERNMENT_MONARCHY"].Index);
	end
	
	-- Apply updates to all majors
	for loop, pPlayer in ipairs(aPlayers) do
		local iPlayer = pPlayer:GetID();
	
		-- Almost finished with Medieval era
		local pCulture:table = pPlayer:GetCulture();
		local pScience:table = pPlayer:GetTechs();
		
		-- Civics
		pCulture:SetCivic(GameInfo.Civics["CIVIC_CRAFTSMANSHIP"].Index, true);
		pCulture:SetCivic(GameInfo.Civics["CIVIC_FOREIGN_TRADE"].Index, true);
		pCulture:SetCivic(GameInfo.Civics["CIVIC_MILITARY_TRADITION"].Index, true);
		pCulture:SetCivic(GameInfo.Civics["CIVIC_STATE_WORKFORCE"].Index, true);
		pCulture:SetCivic(GameInfo.Civics["CIVIC_EARLY_EMPIRE"].Index, true);
		pCulture:SetCivic(GameInfo.Civics["CIVIC_MYSTICISM"].Index, true);
		pCulture:SetCivic(GameInfo.Civics["CIVIC_GAMES_RECREATION"].Index, true);
		pCulture:SetCivic(GameInfo.Civics["CIVIC_POLITICAL_PHILOSOPHY"].Index, true);
		pCulture:SetCivic(GameInfo.Civics["CIVIC_DRAMA_POETRY"].Index, true);
		pCulture:SetCivic(GameInfo.Civics["CIVIC_MILITARY_TRAINING"].Index, true);
		pCulture:SetCivic(GameInfo.Civics["CIVIC_DEFENSIVE_TACTICS"].Index, true);
		pCulture:SetCivic(GameInfo.Civics["CIVIC_RECORDED_HISTORY"].Index, true);
		pCulture:SetCivic(GameInfo.Civics["CIVIC_THEOLOGY"].Index, true);
		pCulture:SetCivic(GameInfo.Civics["CIVIC_DIVINE_RIGHT"].Index, true);
		
		-- Techs
		pScience:SetTech(GameInfo.Technologies["TECH_POTTERY"].Index, true);
		pScience:SetTech(GameInfo.Technologies["TECH_ANIMAL_HUSBANDRY"].Index, true);
		pScience:SetTech(GameInfo.Technologies["TECH_MINING"].Index, true);
		pScience:SetTech(GameInfo.Technologies["TECH_SAILING"].Index, true);
		pScience:SetTech(GameInfo.Technologies["TECH_ASTROLOGY"].Index, true);
		pScience:SetTech(GameInfo.Technologies["TECH_IRRIGATION"].Index, true);
		pScience:SetTech(GameInfo.Technologies["TECH_ARCHERY"].Index, true);
		pScience:SetTech(GameInfo.Technologies["TECH_WRITING"].Index, true);
		pScience:SetTech(GameInfo.Technologies["TECH_MASONRY"].Index, true);
		pScience:SetTech(GameInfo.Technologies["TECH_BRONZE_WORKING"].Index, true);
		pScience:SetTech(GameInfo.Technologies["TECH_THE_WHEEL"].Index, true);
		pScience:SetTech(GameInfo.Technologies["TECH_CELESTIAL_NAVIGATION"].Index, true);
		pScience:SetTech(GameInfo.Technologies["TECH_CURRENCY"].Index, true);
		pScience:SetTech(GameInfo.Technologies["TECH_HORSEBACK_RIDING"].Index, true);
		pScience:SetTech(GameInfo.Technologies["TECH_IRON_WORKING"].Index, true);
		pScience:SetTech(GameInfo.Technologies["TECH_SHIPBUILDING"].Index, true);
		pScience:SetTech(GameInfo.Technologies["TECH_MATHEMATICS"].Index, true);
		pScience:SetTech(GameInfo.Technologies["TECH_CONSTRUCTION"].Index, true);
		pScience:SetTech(GameInfo.Technologies["TECH_ENGINEERING"].Index, true);
		pScience:SetTech(GameInfo.Technologies["TECH_APPRENTICESHIP"].Index, true);
	end
	
	-- Damage cities
	for loop, pPlayer in ipairs(aPlayers) do
		local iPlayer = pPlayer:GetID();
		local pPlayerCities:table = pPlayer:GetCities();
		for i, pCity in pPlayerCities:Members() do
			if(pCity ~= nil) then
				local iX = pCity:GetX();
				local iY = pCity:GetY();
				if((iX==iStoneySept[1]) and (iY==iStoneySept[2])) then
					local pCityID=pCity:GetID();
					--print("Found Stoney Sept at ID :", pCityID);
					local pCityDistricts:table = pCity:GetDistricts();
					--print("Got Stoney Sept's Districts");
					local pCityPlot:table = Map.GetPlot(iX, iY);
					local pCityCenterID:number = pCityPlot:GetDistrictID();
					--print("pCityCenterID:", pCityCenterID);
				end
			end
		end
	end
	
	-- Assign buildings to cities
	for loop, pPlayer in ipairs(aPlayers) do
		if (pPlayer ~= nil) then
			local iPlayer = pPlayer:GetID();
			AddBuildingsPlayerCities(pPlayer);
		end
	end
end


local function SetInitialVisibility()

	print("SetInitialVisibility");

	-- Apply updates to all majors
	local aPlayers = PlayerManager.GetAliveMajors();
	for loop, pPlayer in ipairs(aPlayers) do
		local iPlayer = pPlayer:GetID();
		local pCurPlayerVisibility = PlayersVisibility[pPlayer:GetID()];
		if(pCurPlayerVisibility ~= nil) then
		
			-- Reveal Westeros
			for iX = 0, 44, 1 do
				for iY = 0, 79, 1 do
					local iPlotIndex = Map.GetPlot(iX, iY):GetIndex();
					pCurPlayerVisibility:ChangeVisibilityCount(iPlotIndex, 0);
				end
			end
		end
	end
end

local function OnPlayerTurnActivated( player )
	local currentTurn = Game.GetCurrentGameTurn();
	if (player == 0) then
		local aPlayers = PlayerManager.GetAliveMajors();
		for loop, pPlayer in ipairs(aPlayers) do
			local iPlayer = pPlayer:GetID();
			local iScore = 0; 
			if ((iPlayer == eJofferyPlayer or iPlayer == eRenlyPlayer or iPlayer == eRobbPlayer or iPlayer == eBalonPlayer or iPlayer == eStannisPlayer ) and iPlayer ~= nil) then
				if(pPlayer ~= nil and pPlayer:IsBarbarian() == false ) then
					local config = PlayerConfigurations[iPlayer];
					local pPlayerCities:table = pPlayer:GetCities();
					for i, pCity in pPlayerCities:Members() do
						local x = pCity:GetX();
						local y = pCity:GetY();
						if (x==iKingsLanding[1] and y==iKingsLanding[2]) then
							iScore=iScore+iKingsLanding[3];
						elseif (x==iDragonstone[1] and y==iDragonstone[2]) then
							iScore=iScore+iDragonstone[3];
						elseif (x==iStormsEnd[1] and y==iStormsEnd[2]) then
							iScore=iScore+iStormsEnd[3];
						elseif (x==iWinterfell[1] and y==iWinterfell[2]) then
							iScore=iScore+iWinterfell[3];
						elseif (x==iPyke[1] and y==iPyke[2]) then
							iScore=iScore+iPyke[3];
						elseif (x==iCasterlyRock[1] and y==iCasterlyRock[2]) then
							iScore=iScore+iCasterlyRock[3];
						elseif (x==iRiverrun[1] and y==iRiverrun[2]) then
							iScore=iScore+iRiverrun[3];
						elseif (x==iSunspear[1] and y==iSunspear[2]) then
							iScore=iScore+iSunspear[3];
						elseif (x==iEryie[1] and y==iEryie[2]) then
							iScore=iScore+iEryie[3];
						elseif (x==iHighgarden[1] and y==iHighgarden[2]) then
							iScore=iScore+iHighgarden[3];
						else
							iScore=iScore+iRegularCity;
						end
					end
				end
				pPlayer:ChangeScoringScenario3(iScore);
			end
		end
	end
		
		
	if (player == 0) then
		if (currentTurn > lastLocalTurnNumber) then
			lastLocalTurnNumber = currentTurn;
		end
	end
	if (currentTurn == 1) then
		SetInitialVisibility();
	end
end

GameEvents.PlayerTurnStarted.Add(OnPlayerTurnActivated);

function AddBuildingsPlayerCities(pPlayer)
	print("Add Buildings for player: ", iPlayer);
	local iPlayer = pPlayer:GetID();
	local config = PlayerConfigurations[iPlayer];

	local iBarracksCount = 0;
	local iStableCount = 0;

	local iArtMuseumCount = 0;
	local iNatMuseumCount = 0;

	local pPlayerCities:table = pPlayer:GetCities();
	for i, pCity in pPlayerCities:Members() do
		if(pCity ~= nil) then
			local iX = pCity:GetX();
			local iY = pCity:GetY();
			local pPlot = Map.GetPlot(iX, iY);
			
			-- City Center 
				-- Build walls in capitols
			if ((iX==iKingsLanding[1]) and (iY==iKingsLanding[2])) then
				pCity:GetBuildQueue():CreateIncompleteBuilding(GameInfo.Buildings["BUILDING_WALLS"].Index, 100);
			elseif((iX==iDragonstone[1]) and (iY==iDragonstone[2])) then
				pCity:GetBuildQueue():CreateIncompleteBuilding(GameInfo.Buildings["BUILDING_WALLS"].Index, 100);
			elseif((iX==iStormsEnd[1]) and (iY==iStormsEnd[2])) then
				pCity:GetBuildQueue():CreateIncompleteBuilding(GameInfo.Buildings["BUILDING_WALLS"].Index, 100);
			elseif((iX==iWinterfell[1]) and (iY==iWinterfell[2])) then
				pCity:GetBuildQueue():CreateIncompleteBuilding(GameInfo.Buildings["BUILDING_WALLS"].Index, 100);
			elseif((iX==iPyke[1]) and (iY==iPyke[2])) then
				pCity:GetBuildQueue():CreateIncompleteBuilding(GameInfo.Buildings["BUILDING_WALLS"].Index, 100);
			elseif((iX==iCasterlyRock[1]) and (iY==iCasterlyRock[2])) then
				pCity:GetBuildQueue():CreateIncompleteBuilding(GameInfo.Buildings["BUILDING_WALLS"].Index, 100);
			elseif((iX==iRiverrun[1]) and (iY==iRiverrun[2])) then
				pCity:GetBuildQueue():CreateIncompleteBuilding(GameInfo.Buildings["BUILDING_WALLS"].Index, 100);
			elseif((iX==iSunspear[1]) and (iY==iSunspear[2])) then
				pCity:GetBuildQueue():CreateIncompleteBuilding(GameInfo.Buildings["BUILDING_WALLS"].Index, 100);
			elseif((iX==iEryie[1]) and (iY==iEryie[2])) then
				pCity:GetBuildQueue():CreateIncompleteBuilding(GameInfo.Buildings["BUILDING_WALLS"].Index, 100);
			elseif((iX==iHighgarden[1]) and (iY==iHighgarden[2])) then
				pCity:GetBuildQueue():CreateIncompleteBuilding(GameInfo.Buildings["BUILDING_WALLS"].Index, 100);
			end
			
				-- Build granary
			if (GameInfo.Civilizations["CIVILIZATION_TYRELL"].Hash == config:GetCivilizationTypeID()) then
				pCity:GetBuildQueue():CreateIncompleteBuilding(GameInfo.Buildings["BUILDING_TYRELL_GRANARY"].Index, 100);
			else
				pCity:GetBuildQueue():CreateIncompleteBuilding(GameInfo.Buildings["BUILDING_GRANARY"].Index, 100);
			end
			
				-- Build monument
			if (GameInfo.Leaders["LEADER_STANNIS"].Hash == config:GetLeaderTypeID()) then
				pCity:GetBuildQueue():CreateIncompleteBuilding(GameInfo.Buildings["BUILDING_PYRE_OF_RHLLOR"].Index, 100);
			else
				pCity:GetBuildQueue():CreateIncompleteBuilding(GameInfo.Buildings["BUILDING_MONUMENT"].Index, 100);
			end
			
				-- Build water mill
			if (pPlot:IsRiver()) then
				if (GameInfo.Civilizations["CIVILIZATION_TULLY"].Hash == config:GetCivilizationTypeID()) then
					pCity:GetBuildQueue():CreateIncompleteBuilding(GameInfo.Buildings["BUILDING_TULLY_WATER_MILL"].Index, 100);
				else
					pCity:GetBuildQueue():CreateIncompleteBuilding(GameInfo.Buildings["BUILDING_WATER_MILL"].Index, 100);
				end
			end
			
			-- Holy Site 
			if pCity:GetDistricts():HasDistrict(GameInfo.Districts["DISTRICT_HOLY_SITE"].Index) then
				if (GameInfo.Civilizations["CIVILIZATION_STARK"].Hash == config:GetCivilizationTypeID()) then
					pCity:GetBuildQueue():CreateIncompleteBuilding(GameInfo.Buildings["BUILDING_WEIRWOOD_TREE"].Index, 100);
				else
					pCity:GetBuildQueue():CreateIncompleteBuilding(GameInfo.Buildings["BUILDING_SHRINE"].Index, 100);
				end
			end
			
			-- Campus 
			if pCity:GetDistricts():HasDistrict(GameInfo.Districts["DISTRICT_CAMPUS"].Index) then
				pCity:GetBuildQueue():CreateIncompleteBuilding(GameInfo.Buildings["BUILDING_LIBRARY"].Index, 100);
			end
			
			-- Encampment 
			if pCity:GetDistricts():HasDistrict(GameInfo.Districts["DISTRICT_ENCAMPMENT"].Index) then
				if (GameInfo.Civilizations["CIVILIZATION_ARRYN"].Hash == config:GetCivilizationTypeID()) then
					pCity:GetBuildQueue():CreateIncompleteBuilding(GameInfo.Buildings["BUILDING_STABLE"].Index, 100);
				elseif (GameInfo.Civilizations["CIVILIZATION_LANNISTER"].Hash == config:GetCivilizationTypeID()) then
					pCity:GetBuildQueue():CreateIncompleteBuilding(GameInfo.Buildings["BUILDING_HALL_OF_HEROES"].Index, 100);
				else 
					pCity:GetBuildQueue():CreateIncompleteBuilding(GameInfo.Buildings["BUILDING_BARRACKS"].Index, 100);
				end
			end
			
			-- Harbor 
			if pCity:GetDistricts():HasDistrict(GameInfo.Districts["DISTRICT_HARBOR"].Index) then
				pCity:GetBuildQueue():CreateIncompleteBuilding(GameInfo.Buildings["BUILDING_LIGHTHOUSE"].Index, 100);
			end
			
			-- Iron Harbor
			if pCity:GetDistricts():HasDistrict(GameInfo.Districts["DISTRICT_IRON_HARBOR"].Index) then
				pCity:GetBuildQueue():CreateIncompleteBuilding(GameInfo.Buildings["BUILDING_LIGHTHOUSE"].Index, 100);
			end
			
			-- Commercial Hub
			if pCity:GetDistricts():HasDistrict(GameInfo.Districts["DISTRICT_COMMERCIAL_HUB"].Index) then
				pCity:GetBuildQueue():CreateIncompleteBuilding(GameInfo.Buildings["BUILDING_MARKET"].Index, 100);
			end
			
			-- Industrial Zone
			if pCity:GetDistricts():HasDistrict(GameInfo.Districts["DISTRICT_INDUSTRIAL_ZONE"].Index) then
				pCity:GetBuildQueue():CreateIncompleteBuilding(GameInfo.Buildings["BUILDING_WORKSHOP"].Index, 100);
			end
			
			-- Entertainment Complex
			if pCity:GetDistricts():HasDistrict(GameInfo.Districts["DISTRICT_ENTERTAINMENT_COMPLEX"].Index) then
				if((GameInfo.Leaders["LEADER_JOFFERY"].Hash == config:GetLeaderTypeID()) or (GameInfo.Leaders["LEADER_RENLY"].Hash == config:GetLeaderTypeID())) then
					pCity:GetBuildQueue():CreateIncompleteBuilding(GameInfo.Buildings["BUILDING_TOURNAMENT_GROUNDS"].Index, 100);
				else
					pCity:GetBuildQueue():CreateIncompleteBuilding(GameInfo.Buildings["BUILDING_ARENA"].Index, 100);
				end
			end
			
			-- Theater Square
			if pCity:GetDistricts():HasDistrict(GameInfo.Districts["DISTRICT_THEATER"].Index) then
				pCity:GetBuildQueue():CreateIncompleteBuilding(GameInfo.Buildings["BUILDING_AMPHITHEATER"].Index, 100);
			end
		end
	end
end





-- Function to set the religion of a city (borrowed from Firaxis)
function SetPlayerCitiesReligion(pPlayer, religion, cityState)
	if(religion == -1) then
		return;
	end
		
	if(cityState == true) then
		local pCity:table = pPlayer:GetCities():GetCapitalCity();
		if(pCity ~= nil) then
		--print("Player Id: ", iPlayer);
			pCity:GetReligion():SetAllCityToReligion(religion);
		end
	else
		local pPlayerCities:table = pPlayer:GetCities();
		for i, pCity in pPlayerCities:Members() do
			if(pCity ~= nil) then
				local pReligion = pCity:GetReligion();
				if(pReligion ~= nil) then
					pReligion:SetAllCityToReligion(religion);
				else
					--print("City Religion is nil");
				end
			else
				--print("City is nil and ID is ", iCity);
			end
		end
	end
end


function OnClickAvailableCityTest(player, valueType, subType)
	print("City Clicked");
	print(player:GetID());
end
GameEvents.OnClickAvailableCity.Add(OnClickAvailableCityTest);
LuaEvents.OnClickAvailableCity.Add(OnClickAvailableCityTest);


LuaEvents.NewGameInitialized.Add(InitializeNewGame);
Initialize();
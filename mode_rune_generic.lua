_G.savedEnv = getfenv()
module( "mode_generic_rune", package.seeall )

--[[
local safeLane;
local offlane;
local lane = {
[TEAM_DIRE]    = function () safeLane=LANE_TOP; offlane=LANE_BOT; end,
[TEAM_RADIANT] = function () safeLane=LANE_BOT; offlane=LANE_TOP; end,
}

local laneRuneDesires = {
[LANE_MID] =
	function (doing)

	end, -- Mid might wnat rune,
[safeLane] =
	function (doing)
		if (doing == BOT_MODE_LANING)
		then

		elseif (doing == BOT_MODE_FARM)

		end
	end, --person farming safe lane won't want rune but maybe support
[offlane]  =
	function (doing)

	end, --offlane should probably get bounty
[] 		   =
	function (doing)

	end, --roamer might wnat to tyr and get rune
}
--]]

function minRuneDistances(me)
	local pwr1, pwr2, bty1, bty2, bty3, bty4;
	pwr1 = GetUnitToLocationDistance(me, GetRuneSpawnLocation(RUNE_POWERUP_1));
	pwr2 = GetUnitToLocationDistance(me, GetRuneSpawnLocation(RUNE_POWERUP_2));
	bty1 = GetUnitToLocationDistance(me, GetRuneSpawnLocation(RUNE_BOUNTY_1));
	bty2 = GetUnitToLocationDistance(me, GetRuneSpawnLocation(RUNE_BOUNTY_2));
	bty3 = GetUnitToLocationDistance(me, GetRuneSpawnLocation(RUNE_BOUNTY_3));
	bty4 = GetUnitToLocationDistance(me, GetRuneSpawnLocation(RUNE_BOUNTY_4));
	return math.min(pwr1, pwr2, bty1, bty2, bty3, bty4);
end


function GetDesire()
	--Before First Rune Spawn
	if (DotaTime() < 3)
	then
		return BOT_MODE_DESIRE_HIGH;
	end

	local npcBot = GetBot();
    local timeFromSpawn = GameTime() % 120;
	local distance = RemapValClamped(minRuneDistances(npcBot), 0, 1, BOT_MODE_DESIRE_NONE, BOT_MODE_DESIRE_HIGH);
	timeFromSpawn = RemapValClamped(timeFromSpawn, 0, 1, BOT_MODE_DESIRE_NONE, BOT_MODE_DESIRE_MODERATE);

	return Clamp(1 - distance - timeFromSpawn, BOT_MODE_DESIRE_NONE, BOT_MODE_DESIRE_HIGH);
end

for k,v in pairs( mode_generic_rune ) do _G.savedEnv[k] = v end


BotsInit = require("game/botsinit");
local my_mode_generic_rune =  BotsInit.CreateGeneric();
my_mode_generic_rune.GetDesire = GetDesire;
return my_mode_generic_rune;

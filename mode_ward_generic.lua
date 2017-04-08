_G.savedEnv = getfenv()
module( "mode_generic_ward", package.seeall )


function GetDesire()
	local npcBot = GetBot();
	local active_wards;

	active_wards = table.getn(GetUnitList(UNIT_LIST_ALLIED_WARDS))

	if (active_wards > 2)
	then
		return BOT_MODE_DESIRE_NONE;
	end

	return GetItemStockCount("item_ward_observer")/4;
end

function OnStart()

end

function OnEnd()

end

function Think()

end

for k,v in pairs( mode_generic_ward ) do _G.savedEnv[k] = v end

BotsInit = require("game/botsinit");
local my_mode_generic_ward =  BotsInit.CreateGeneric();
my_mode_generic_ward.GetDesire = GetDesire;
my_mode_generic_ward.OnStart = OnStart;
my_mode_generic_ward.OnEnd = OnEnd;
my_mode_generic_ward.Think = Think;
return my_mode_generic_ward;

_G.savedEnv = getfenv()
module( "mode_generic_push_tower_mid", package.seeall )

function GetDesire()

end

function OnStart()

end

function OnEnd()

end

function Think()

end

for k,v in pairs( mode_generic_push_tower_mid ) do _G.savedEnv[k] = v end


BotsInit = require("game/botsinit");
local my_generic_push_tower_mid =  BotsInit.CreateGeneric();
my_generic_push_tower_mid.GetDesire = GetDesire;
my_generic_push_tower_mid.OnStart = OnStart;
my_generic_push_tower_mid.OnEnd = OnEnd;
my_generic_push_tower_mid.Think = Think;
return my_generic_push_tower_mid;

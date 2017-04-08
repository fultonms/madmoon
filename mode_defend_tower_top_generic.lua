_G.savedEnv = getfenv()
module( "mode_generic_defend_tower_top", package.seeall )

function GetDesire()

end

function OnStart()

end

function OnEnd()

end

function Think()

end

for k,v in pairs( mode_generic_defend_tower_top ) do _G.savedEnv[k] = v end


BotsInit = require("game/botsinit");
local my_generic_defend_tower_top =  BotsInit.CreateGeneric();
my_generic_defend_tower_top.GetDesire = GetDesire;
my_generic_defend_tower_top.OnStart = OnStart;
my_generic_defend_tower_top.OnEnd = OnEnd;
my_generic_defend_tower_top.Think = Think;
return my_generic_defend_tower_top;

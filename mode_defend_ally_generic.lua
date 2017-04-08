_G.savedEnv = getfenv()
module( "mode_generic_defend_ally", package.seeall )

function GetDesire()

end

function OnStart()

end

function OnEnd()

end

function Think()

end

for k,v in pairs( mode_generic_defend_ally ) do _G.savedEnv[k] = v end

BotsInit = require("game/botsinit");
local my_generic_defend_ally =  BotsInit.CreateGeneric();
my_generic_defend_ally.GetDesire = GetDesire;
my_generic_defend_ally.OnStart = OnStart;
my_generic_defend_ally.OnEnd = OnEnd;
my_generic_defend_ally.Think = Think;
return my_generic_defend_ally;

_G.savedEnv = getfenv()
module( "mode_generic_retreat", package.seeall )

function GetDesire()

end

function OnStart()

end

function OnEnd()

end

function Think()

end

for k,v in pairs( mode_generic_retreat ) do _G.savedEnv[k] = v end


BotsInit = require("game/botsinit");
local my_generic_retreat =  BotsInit.CreateGeneric();
my_generic_retreat.GetDesire = GetDesire;
my_generic_retreat.OnStart = OnStart;
my_generic_retreat.OnEnd = OnEnd;
my_generic_retreat.Think = Think;
return my_generic_retreat;

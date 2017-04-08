_G.savedEnv = getfenv()
module( "mode_generic_roam", package.seeall )

function GetDesire()

end

function OnStart()

end

function OnEnd()

end

function Think()

end

for k,v in pairs( mode_generic_roam ) do _G.savedEnv[k] = v end


BotsInit = require("game/botsinit");
local my_generic_roam =  BotsInit.CreateGeneric();
my_generic_roam.GetDesire = GetDesire;
my_generic_roam.OnStart = OnStart;
my_generic_roam.OnEnd = OnEnd;
my_generic_roam.Think = Think;
return my_generic_roam;

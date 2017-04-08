_G.savedEnv = getfenv()
module( "mode_generic_farm", package.seeall )

function GetDesire()

end

function OnStart()

end

function OnEnd()

end

function Think()

end

for k,v in pairs( mode_generic_farm ) do _G.savedEnv[k] = v end


BotsInit = require("game/botsinit");
local my_generic_farm =  BotsInit.CreateGeneric();
my_generic_farm.GetDesire = GetDesire;
my_generic_farm.OnStart = OnStart;
my_generic_farm.OnEnd = OnEnd;
my_generic_farm.Think = Think;
return my_generic_farm;

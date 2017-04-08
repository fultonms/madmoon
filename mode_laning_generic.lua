_G.savedEnv = getfenv()
module( "mode_generic_laning", package.seeall )

function GetDesire()

end

function OnStart()

end

function OnEnd()

end

function Think()

end

for k,v in pairs( mode_generic_laning ) do _G.savedEnv[k] = v end


BotsInit = require("game/botsinit");
local my_generic_laning =  BotsInit.CreateGeneric();
my_generic_laning.GetDesire = GetDesire;
my_generic_laning.OnStart = OnStart;
my_generic_laning.OnEnd = OnEnd;
my_generic_laning.Think = Think;
return my_generic_laning;

_G.savedEnv = getfenv()
module( "mode_generic_roshan", package.seeall )

function GetDesire()

end

function OnStart()

end

function OnEnd()

end

function Think()

end

for k,v in pairs( mode_generic_roshan ) do _G.savedEnv[k] = v end


BotsInit = require("game/botsinit");
local my_generic_roshan =  BotsInit.CreateGeneric();
my_generic_roshan.GetDesire = GetDesire;
my_generic_roshan.OnStart = OnStart;
my_generic_roshan.OnEnd = OnEnd;
my_generic_roshan.Think = Think;
return my_generic_roshan;

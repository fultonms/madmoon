_G.savedEnv = getfenv()
module( "mode_generic_assemble", package.seeall )

function GetDesire()

end

function OnStart()

end

function OnEnd()

end

function Think()

end

for k,v in pairs( mode_generic_rune ) do _G.savedEnv[k] = v end


BotsInit = require("game/botsinit");
local my_generic_assemble =  BotsInit.CreateGeneric();
my_generic_assemble.GetDesire = GetDesire;
my_generic_assemble.OnStart = OnStart;
my_generic_assemble.OnEnd = OnEnd;
my_generic_assemble.Think = Think;
return my_generic_assemble;

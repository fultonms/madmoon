_G.savedEnv = getfenv()
module( "mode_generic_attack", package.seeall )

function GetDesire()

end

function OnStart()

end

function OnEnd()

end

function Think()

end

for k,v in pairs( mode_generic_attack ) do _G.savedEnv[k] = v end


BotsInit = require("game/botsinit");
local my_generic_attack =  BotsInit.CreateGeneric();
my_generic_attack.GetDesire = GetDesire;
my_generic_attack.OnStart = OnStart;
my_generic_attack.OnEnd = OnEnd;
my_generic_attack.Think = Think;
return my_generic_attack;

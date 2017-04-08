_G.savedEnv = getfenv()
module( "mode_generic_evasive_maneuvers", package.seeall )

function GetDesire()

end

function OnStart()

end

function OnEnd()

end

function Think()

end

for k,v in pairs( mode_generic_evasive_maneuvers ) do _G.savedEnv[k] = v end


BotsInit = require("game/botsinit");
local my_generic_evasive_maneuvers =  BotsInit.CreateGeneric();
my_generic_evasive_maneuvers.GetDesire = GetDesire;
my_generic_evasive_maneuvers.OnStart = OnStart;
my_generic_evasive_maneuvers.OnEnd = OnEnd;
my_generic_evasive_maneuvers.Think = Think;
return my_generic_evasive_maneuvers;

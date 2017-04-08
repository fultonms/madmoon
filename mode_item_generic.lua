_G.savedEnv = getfenv()
module( "mode_generic_item", package.seeall )

function GetDesire()

end

function OnStart()

end

function OnEnd()

end

function Think()

end

for k,v in pairs( mode_generic_item ) do _G.savedEnv[k] = v end


BotsInit = require("game/botsinit");
local my_generic_item =  BotsInit.CreateGeneric();
my_generic_item.GetDesire = GetDesire;
my_generic_item.OnStart = OnStart;
my_generic_item.OnEnd = OnEnd;
my_generic_item.Think = Think;
return my_generic_item;

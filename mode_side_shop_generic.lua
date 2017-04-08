_G.savedEnv = getfenv()
module( "mode_generic_side_shop", package.seeall )

function GetDesire()

end

function OnStart()

end

function OnEnd()

end

function Think()

end

for k,v in pairs( mode_generic_side_shop ) do _G.savedEnv[k] = v end


BotsInit = require("game/botsinit");
local my_generic_side_shop =  BotsInit.CreateGeneric();
my_generic_side_shop.GetDesire = GetDesire;
my_generic_side_shop.OnStart = OnStart;
my_generic_side_shop.OnEnd = OnEnd;
my_generic_side_shop.Think = Think;
return my_generic_side_shop;

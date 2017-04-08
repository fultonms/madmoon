_G.savedEnv = getfenv()
module( "mode_generic_push_tower_bot", package.seeall )

function GetDesire()

end

function OnStart()

end

function OnEnd()

end

function Think()

end

for k,v in pairs( mode_generic_push_tower_bot ) do _G.savedEnv[k] = v end


BotsInit = require("game/botsinit");
local my_generic_push_tower_bot =  BotsInit.CreateGeneric();
my_generic_push_tower_bot.GetDesire = GetDesire;
my_generic_push_tower_bot.OnStart = OnStart;
my_generic_push_tower_bot.OnEnd = OnEnd;
my_generic_push_tower_bot.Think = Think;
return my_generic_push_tower_bot;

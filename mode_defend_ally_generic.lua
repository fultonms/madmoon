_G.savedEnv = getfenv()
module( "mode_generic_defend_ally", package.seeall )

function GetDesire()
    --Reflex action, so the desire is processed here instead of calling out.
    --If the action is desired, the desire is set to 1.0 to override strategy actions.
    bot = GetBot()
    retAllies = bot:GetNearbyHeroes(1200, false, BOT_MODE_RETREAT)
    jukeAllies = bot:GetNearbyHeroes(1200, false, BOT_MODE_EVASIVE_MANEUVERS)


    -- Bot should also evaluate its capability to help defend to avoid feeding
    if (#retAllies > 0) or (#jukeAllies > 0) then
        return BOT_MODE_DESIRE_ABSOLUTE
    else
        return BOT_MODE_DESIRE_NONE

end

function OnStart()
    print("Bot entering mode: Retreat")

end

function OnEnd()
    print("Bot exiting mode: Retreat")

end

function Think()

end

for k,v in pairs( mode_generic_defend_ally ) do _G.savedEnv[k] = v end

BotsInit = require("game/botsinit");
local my_generic_defend_ally =  BotsInit.CreateGeneric();
my_generic_defend_ally.GetDesire = GetDesire;
my_generic_defend_ally.OnStart = OnStart;
my_generic_defend_ally.OnEnd = OnEnd;
my_generic_defend_ally.Think = Think;
return my_generic_defend_ally;

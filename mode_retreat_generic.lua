_G.savedEnv = getfenv()
module( "mode_generic_retreat", package.seeall )

function GetDesire()
    --Reflex action, so the desire is processed here instead of calling out.
    --If the action is desired, the desire is set to 1.0 to override strategy actions.
    bot = GetBot()
    curHP = bot:GetHealth()
    maxHP = bot:GetMaxHealth()
    perHP = (curHP / maxHP) * 100

    curMP = bot:GetMana()
    maxMP = bot:GetMaxMana()
    perMP = (curMP / maxMP) * 100

    if (perHP < 10) and (perMP < 5) then
        return BOT_MODE_DESIRE_ABSOLUTE - 0.05
    elseif perHP < 10 then
        return BOT_MODE_DESIRE_VERY_HIGH - 0.05
    else
        return BOT_MODE_DESIRE_NONE
    end
end

function OnStart()
    print("Bot entering mode: Retreat")

end

function OnEnd()
    print("Bot exiting mode: Retreat")

end

function Think()

end

for k,v in pairs( mode_generic_retreat ) do _G.savedEnv[k] = v end

BotsInit = require("game/botsinit");
local my_generic_retreat =  BotsInit.CreateGeneric();
my_generic_retreat.GetDesire = GetDesire;
my_generic_retreat.OnStart = OnStart;
my_generic_retreat.OnEnd = OnEnd;
my_generic_retreat.Think = Think;
return my_generic_retreat;
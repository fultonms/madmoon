_G.savedEnv = getfenv()
module( "mode_generic_evasive_maneuvers", package.seeall )
tTresh = 1.0

function GetDesire()
    --Reflex action, so the desire is processed here instead of calling out.
    --If the action is desired, the desire is set to 1.0 to override strategy actions.
    bot = GetBot()
    curHP = bot:GetHealth()
    maxHP = bot:GetMaxHealth()
    perHP = (curHP / maxHP) * 100

    recDamage = bot:WasRecentlyDamagedByAnyHero(tThresh)
    nearHeroes = bot:GetNeabyHeroes(1200, true, BOT_MODE_NONE)

    if (perHP < 10) and (recDamage) and (#nearHeroes > 1) then
        return BOT_MODE_DESIRE_ABSOLUTE
    else if (perHP < 10) and (recDamage) and (#nearHeroes > 0) then
        return BOT_MODE_DESIRE_ABSOLUTE - 0.05
    else if (perHP < 10) and (recDamage) then
        return BOT_MODE_DESIRE_VERY_HIGH
    else 
        return BOT_MODE_DESIRE_NONE
    end

end

function OnStart()
    tThresh = 5.0
    bot = GetBot()
    print("Bot entering mode:Evasive maneuvers.")
end

function OnEnd()
    tThresh = 1.0
    bot = GetBot()
    print("Bot exiting mode:Evasive maneuvers.")
end

function Think()

end

for k,v in pairs( mode_generic_evasive_maneuvers ) do _G.savedEnv[k] = v end

BotsInit = require("game/botsinit")
local my_generic_evasive_maneuvers =  BotsInit.CreateGeneric()
my_generic_evasive_maneuvers.GetDesire = GetDesire
my_generic_evasive_maneuvers.OnStart = OnStart
my_generic_evasive_maneuvers.OnEnd = OnEnd
my_generic_evasive_maneuvers.Think = Think
return my_generic_evasive_maneuvers

_G.savedEnv = getfenv()
module( "mode_generic_attack", package.seeall )

function GetDesire()
    --Reflex action, so the desire is processed here instead of calling out.
    --If the action is desired, the desire is set to 1.0 to override strategy actions.
    bot = GetBot()
    power = bot:GetOffensivePower()
    enemies = bot:GetNearbyHeroes(bot:GetCurrentVisionRange(), true, BOT_MODE_NONE)

    vulnerableTargets = {}
    for k, v in pairs(enemies) do
        curHP = v:GetHealth()
        if (curHP <= power) then
            vulnerableTargets[#vulnerableTargets] = v
        end 
    end

    --Should also take into account your teammates.
    if (#vulnerableTargets > 0) and (#enemies - #vulnerableTargets <= #vulnerableTargets) then
        return BOT_MODE_DESIRE_VERY_HIGH
    else
        return BOT_MODE_DESIRE_NONE
    end 

end

function OnStart()
    print("Bot entering mode: Attack")
end

function OnEnd()
    print("Bot exiting mode: Attack")
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

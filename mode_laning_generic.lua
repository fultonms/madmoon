_G.savedEnv = getfenv()
module( "mode_generic_laning", package.seeall )

bot = nil 
team = nil
lane = nil
role = nil 

function GetDesire()
    -- if hero is roamer, consider roaming and switch to roaming mode 
    return BOT_MODE_DESIRE_HIGH

end

function OnStart()
    bot = GetBot()
    print(bot:GetUnitName() .. " entering mode: Laning")

    team = bot:GetTeam()
    lane = bot:GetAssignedLane()

    -- For debugging purposes
    if lane == LANE_NONE then
        lane = LANE_MID
    end

    print(bot:GetUnitName() .. " assigned lane: " .. lane)
    role = 0
end

function OnEnd()
    bot = GetBot()
    print(bot:GetUnitName() .. " entering mode: Laning")
    
    team = nil 
    lane = nil 
    role = nil
end

function Think()
    if role == 0 then 
        lastHitAndDeny()
    elseif role == 1 then
        if not pull() then
            if not stack() then
                if not harrass() then
                    lastHitAndDeny()
                end
            end
        end
    else
        -- call generic roaming?
    end 

end

function lastHitAndDeny()
    laneFront = GetLaneFrontLocation(team, lane, -(bot:GetAttackRange()))

    if GetUnitToLocationDistance(bot, laneFront) > (bot:GetAttackRange())then
        bot:Action_MoveToLocation(laneFront)
    else
        creeps = bot:GetNearbyCreeps(1200, true)
        croops = bot:GetNearbyCreeps(1200, false)

        lowest = nil
        for k, v in pairs(creeps) do
            if lowest == nil then
                lowest = v
            elseif(lowest:GetHealth() > v:GetHealth()) then
                lowest = v 
            end
        end 

        -- Should add range from lane front and general agro avoidance.
        if lowest ~= nill then 
            closeEnough = (bot:GetAttackRange() >=  GetUnitToUnitDistance(bot, lowest))
            killable = (lowest:GetHealth() < (bot:GetAttackDamage() * 1.5))

            if closeEnough and killable then
                bot:Action_AttackUnit(lowest, false)
            elseif not closeEnough then
                bot:Action_MoveToUnit(lowest)
            elseif not killable then 
                return false
            else 
                return false
            end 
        end
    end
    return true

end

function pull()
    return false
end

function stack()
    return false
end

function harrass()
    return false
end

for k,v in pairs( mode_generic_laning ) do _G.savedEnv[k] = v end


BotsInit = require("game/botsinit");
local my_generic_laning =  BotsInit.CreateGeneric();
my_generic_laning.GetDesire = GetDesire;
my_generic_laning.OnStart = OnStart;
my_generic_laning.OnEnd = OnEnd;
my_generic_laning.Think = Think;
return my_generic_laning;

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

        laneFront = GetLaneFrontLocation(team, lane, -(bot:GetAttackRange() - 100))

        if GetUnitToLocationDistance(bot, laneFront) > (bot:GetAttackRange() - 100)then
            bot:Action_MoveToLocation(laneFront)
        else
            creeps = bot:GetNearbyCreeps(1200, true)

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
                killable = (lowest:GetHealth() <= bot:GetAttackRange())

                if closeEnough and killable then
                    bot:Action_AttackUnit(lowest, false)
                elseif not closeEnough then
                    bot:Action_MoveToUnit(lowest)
                --elseif not killable then 
                  --  bot:Action_ClearActions(false)
                else 
                    return nil
                end 
            end
        end

    elseif role == 1 then
        wards = GetUnitList(UNIT_LIST_ALLIED_WARDS)
        --if #wards < 2 then
            --consider warding
        
        --consider pulling
        --consider stacking 
        --consider harrasing
        --consider denying
        --consider last hitting 
    else
        -- call generic roaming?
    end 

end

for k,v in pairs( mode_generic_laning ) do _G.savedEnv[k] = v end


BotsInit = require("game/botsinit");
local my_generic_laning =  BotsInit.CreateGeneric();
my_generic_laning.GetDesire = GetDesire;
my_generic_laning.OnStart = OnStart;
my_generic_laning.OnEnd = OnEnd;
my_generic_laning.Think = Think;
return my_generic_laning;

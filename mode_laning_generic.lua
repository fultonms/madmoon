_G.savedEnv = getfenv()
module( "mode_generic_laning", package.seeall )
bot = nil 
team
lane = nil
role = nil 

function GetDesire()
    -- if hero is roamer, consider roaming and switch to roaming mode 

end

function OnStart()
    print("Bot entering mode: Laning")
    bot = GetBot()
    team = bot:GetTeam()
    lane = bot:GetAssignedLane()
    role = 0
end

function OnEnd()
    print("Bot entering mode: Laning")
    bot = nil 
    team = nil 
    lane = nil 
    role = nil
end

function Think()
    if role == 0 then 
        laneFront = GetLaneFrontLocation(team, lane, 0.0)

        if bot:GetLocation() != laneFront then
            bot:Action_MoveToLocation(laneFront)
        else
            creeps = bot:GetNearbyCreeps(bot:GetCurrentVisionRange(), true )

            lowest = nil
            for k, v in creeps do
                if(lowest:GetCurrentHP() < v:GetCurrentHP()) then
                    lowest = v 
                end
            end 

            closeEnough = (bot:GetAttackRange() >=  GetUnitToUnitDistance(bot, lowest))
            killable = (lowest:GetCurrentHP() <= bot:GetAttackRange)

            if closeEnough and killable then
                bot:Action_AttackUnit(lowest, false)
            else if not closeEnough then
                bot:Action_MoveToUnit(lowest)
            else if not killable then 
                bot:Action_ClearActions(false)
            else 
                return nil
            end 
        end 

    else if role == 1 then
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

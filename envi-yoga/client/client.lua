local doingYoga = false
local function LoadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(5)
    end
end

local yogamats = {}
for k, v in pairs(Config.YogaMats) do
    table.insert(yogamats, v)
end

RegisterNetEvent('envi-yoga:placemat', function(item, model)
    local ped = PlayerPedId()
    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(ped, 0.0, 1.0, 0))
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(0)
    end
    LoadAnimDict('amb@medic@standing@kneel@base')
    LoadAnimDict('anim@gangops@facility@servers@bodysearch@')
    TaskPlayAnim(ped, "amb@medic@standing@kneel@base", "base", 8.0, -8.0, -1, 1, 0, false, false, false)
    TaskPlayAnim(ped, "anim@gangops@facility@servers@bodysearch@", "player_search", 8.0, -8.0, -1, 48, 0, false, false, false)
    Wait(2500)
    ClearPedTasks(ped)
    local yogaMat = CreateObjectNoOffset(model, x, y, z + 1.5, true, false)
    SetModelAsNoLongerNeeded(model)
    PlaceObjectOnGroundProperly(yogaMat)
    SetEntityAsMissionEntity(yogaMat, false, true)
    RemoveAnimDict('amb@medic@standing@kneel@base')
    RemoveAnimDict('anim@gangops@facility@servers@bodysearch@')
end)

if Config.Target == 'qtarget' then
    exports['qtarget']:AddTargetModel(yogamats, {
        options = {
            {
                icon = "fa-solid fa-arrow-up-from-bracket",
                label = "Pick Up",
                action = function(entity)
                    TriggerEvent('envi-yoga:pickup', entity)
                end,
                canInteract = function()
                    if IsEntityAMissionEntity(entity) then
                        return true
                    end
                    return false
                end
            },
            {
                event = 'envi-yoga:lotusflower',
                icon = "fa-solid fa-lungs",
                label = "Lotus Flower",
                canInteract = function(entity)
                    if not doingYoga then
                        return true
                    end
                    return false
                end,
            },
        },
        distance = 1.0,
    })
elseif Config.Target == 'ox_target' then
    exports.ox_target:addModel(yogamats, {
         {
            event = 'envi-yoga:lotusflower',
            icon = "fa-solid fa-lungs",
            label = "Lotus Flower",
            canInteract = function(entity)
                if not doingYoga then
                    return true
                end
                return false
            end,
            distance = 1.5
        },
        {
            icon = "fa-solid fa-arrow-up-from-bracket",
            label = "Pick Up",
            onSelect = function(data)
                TriggerEvent('envi-yoga:pickup', data.entity)
            end,
            canInteract = function(entity)
                if not doingYoga and IsEntityAMissionEntity(entity) then
                    return true
                end
                return false
            end,
            distance = 1.3

        }
    })
elseif Config.Target == 'qb-target' then
    exports['qb-target']:AddTargetModel(yogamats, {
        options = {
            {
                icon = "fa-solid fa-arrow-up-from-bracket",
                label = "Pick Up",
                action = function(entity)
                    TriggerEvent('envi-yoga:pickup', entity)
                end,
                canInteract = function(entity)
                    if IsEntityAMissionEntity(entity) then
                        return true
                    end
                    return true
                end,
            },
            {
                event = 'envi-yoga:lotusflower',
                icon = "fa-solid fa-lungs",
                label = "Lotus Flower",
                canInteract = function(entity)
                    if not doingYoga then
                        return true
                    end
                    return false
                end,
            },
        },
        distance = 1.8,
    }) 
end

RegisterNetEvent('envi-yoga:pickup', function(entity)
    local ped = PlayerPedId()
    NetworkRequestControlOfEntity(entity)
    while not NetworkRequestControlOfEntity(entity) do
        Wait(0)
    end
    LoadAnimDict('amb@medic@standing@kneel@base')
    LoadAnimDict('anim@gangops@facility@servers@bodysearch@')
    TaskPlayAnim(ped, "amb@medic@standing@kneel@base", "base", 8.0, -8.0, -1, 1, 0, false, false, false)
    TaskPlayAnim(ped, "anim@gangops@facility@servers@bodysearch@", "player_search", 8.0, -8.0, -1, 48, 0, false, false, false)
    Wait(5000)
    ClearPedTasks(ped)
    TriggerServerEvent('envi-yoga:pickup', GetEntityModel(entity))
    SetEntityAsMissionEntity(yogaMat, false, false)
    SetEntityAsNoLongerNeeded(yogaMat)
    DeleteEntity(entity)
    RemoveAnimDict('amb@medic@standing@kneel@base')
    RemoveAnimDict('anim@gangops@facility@servers@bodysearch@')
end)

RegisterNetEvent('envi-yoga:lotusflower',function()
    local ped = PlayerPedId()
    doingYoga = true
    TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_YOGA', 0, true)
	Wait(35000)
    -- ADD YOUR CUSTOM STRESS TRIGGER HERE -- 

    if Config.Framework == 'qb' then
	    TriggerServerEvent('hud:server:RelieveStress', math.random(25,60))
    end
	Wait(5000)
	ClearPedTasks(ped)
    doingYoga = false
end)

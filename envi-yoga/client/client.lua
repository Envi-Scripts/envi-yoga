local ped = PlayerPedId()
local yogamats = {`p_yoga_mat_01_s`, 'prop_yoga_mat_03', 'prop_yoga_mat_02', 'prop_yoga_mat_01'}

RegisterNetEvent('envi-yoga:mat',function()
    local hash = GetHashKey('p_yoga_mat_01_s')
    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(ped,0.0,1.0,-0.85))
	RequestModel(hash)
	while not HasModelLoaded(hash) do 
        Wait(0) 
    end
	LoadAnimDict('amb@medic@standing@kneel@base')
	LoadAnimDict('anim@gangops@facility@servers@bodysearch@')
	TaskPlayAnim(ped, "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
	TaskPlayAnim(ped, "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 48, 0, false, false, false )
	Wait(2500)
	ClearPedTasks(ped)
	yogaMat = CreateObjectNoOffset(hash, x, y, z, true, false)
	SetModelAsNoLongerNeeded(hash)
	PlaceObjectOnGroundProperly(yogaMat)
    RemoveAnimDict('amb@medic@standing@kneel@base')
    RemoveAnimDict('anim@gangops@facility@servers@bodysearch@')
end)

RegisterNetEvent('envi-yoga:mat1',function()
    local hash = GetHashKey('prop_yoga_mat_01')
    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(ped,0.0,1.0,-0.85))
	RequestModel(hash)
	while not HasModelLoaded(hash) do 
        Wait(0) 
    end
	LoadAnimDict('amb@medic@standing@kneel@base')
	LoadAnimDict('anim@gangops@facility@servers@bodysearch@')
	TaskPlayAnim(ped, "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
	TaskPlayAnim(ped, "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 48, 0, false, false, false )
	Wait(2500)
	ClearPedTasks(ped)
	yogaMat = CreateObjectNoOffset(hash, x, y, z, true, false)
	SetModelAsNoLongerNeeded(hash)
	PlaceObjectOnGroundProperly(yogaMat)
    RemoveAnimDict('amb@medic@standing@kneel@base')
    RemoveAnimDict('anim@gangops@facility@servers@bodysearch@')
end)

RegisterNetEvent('envi-yoga:mat2',function()
    local hash = GetHashKey('prop_yoga_mat_02')
    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(ped,0.0,1.0,-0.85))
	RequestModel(hash)
	while not HasModelLoaded(hash) do 
        Wait(0) 
    end
	LoadAnimDict('amb@medic@standing@kneel@base')
	LoadAnimDict('anim@gangops@facility@servers@bodysearch@')
	TaskPlayAnim(ped, "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
	TaskPlayAnim(ped, "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 48, 0, false, false, false )
	Wait(2500)
	ClearPedTasks(ped)
	yogaMat = CreateObjectNoOffset(hash, x, y, z, true, false)
	SetModelAsNoLongerNeeded(hash)
	PlaceObjectOnGroundProperly(yogaMat)
    RemoveAnimDict('amb@medic@standing@kneel@base')
    RemoveAnimDict('anim@gangops@facility@servers@bodysearch@')

end)

RegisterNetEvent('envi-yoga:mat3',function()
    local hash = GetHashKey('prop_yoga_mat_03')
    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(ped,0.0,1.0,-0.85))
	RequestModel(hash)
	while not HasModelLoaded(hash) do 
        Wait(0) 
    end
	LoadAnimDict('amb@medic@standing@kneel@base')
	LoadAnimDict('anim@gangops@facility@servers@bodysearch@')
	TaskPlayAnim(ped, "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
	TaskPlayAnim(ped, "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 48, 0, false, false, false )
	Wait(2500)
	ClearPedTasks(ped)
	yogaMat = CreateObjectNoOffset(hash, x, y, z, true, false)
	SetModelAsNoLongerNeeded(hash)
	PlaceObjectOnGroundProperly(yogaMat)
    RemoveAnimDict('amb@medic@standing@kneel@base')
    RemoveAnimDict('anim@gangops@facility@servers@bodysearch@')
end)

RegisterNetEvent('envi-yoga:1',function()
    TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_YOGA', 0, true)
	Wait(35000)
    -- ADD YOUR CUSTOM STRESS TRIGGER HERE -- 

    if Config.Framework == 'qb' then
	    TriggerServerEvent('hud:server:RelieveStress', math.random(25,60))
    end
	Wait(5000)
	ClearPedTasks(ped)
end)

if Config.Target == 'qtarget' then
    exports['qtarget']:AddTargetModel(yogamats, {
        options = {
            {
                event = "envi-yoga:pickup",
                icon = "fa-solid fa-arrow-up-from-bracket",
                label = "Pick Up"
            },
            {
                event = 'envi-yoga:1',
                icon = "fa-solid fa-lungs",
                label = "Lotus Flower"
            },       
    },
        distance = 1.0,
    })

    RegisterNetEvent('envi-yoga:pickup',function(data)
        NetworkRequestControlOfEntity(data.entity)
        while not NetworkRequestControlOfEntity(data.entity) do
            Wait(0)
        end
        LoadAnimDict('amb@medic@standing@kneel@base')
        LoadAnimDict('anim@gangops@facility@servers@bodysearch@')
        TaskPlayAnim(ped, "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
        TaskPlayAnim(ped, "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 48, 0, false, false, false )
        Wait(5000)
        ClearPedTasks(ped)
        TriggerServerEvent('envi-yoga:pickupS')
        DeleteEntity(data.entity)
        RemoveAnimDict('amb@medic@standing@kneel@base')
        RemoveAnimDict('anim@gangops@facility@servers@bodysearch@')
    end)
elseif Config.Target == 'ox_target' then
    local doYoga = {

        {
            event = 'envi-yoga:1',
            icon = "fa-solid fa-lungs",
            label = "Lotus Flower",
            distance = 1.4
        },
        {
            event = "envi-yoga:pickup",
            icon = "fa-solid fa-arrow-up-from-bracket",
            label = "Pick Up",
            distance = 1.2

        },
    }
    exports.ox_target:addModel(yogamats, doYoga)

    RegisterNetEvent('envi-yoga:pickup',function(data)
        NetworkRequestControlOfEntity(data.entity)
        while not NetworkRequestControlOfEntity(data.entity) do
            Wait(0)
        end
        LoadAnimDict('amb@medic@standing@kneel@base')
        LoadAnimDict('anim@gangops@facility@servers@bodysearch@')
        TaskPlayAnim(ped, "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
        TaskPlayAnim(ped, "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 48, 0, false, false, false )
        Wait(5000)
        ClearPedTasks(ped)
        local variation = GetEntityModel(data.entity)
        print(variation)
        TriggerServerEvent('envi-yoga:pickupS', variation)
        DeleteEntity(data.entity)
        RemoveAnimDict('amb@medic@standing@kneel@base')
        RemoveAnimDict('anim@gangops@facility@servers@bodysearch@')
    end)
elseif Config.Target == 'qb-target' then
    exports['qb-target']:AddTargetModel(yogamats, {
        options = {
        {
            event = "envi-yoga:pickup",
            icon = "fa-solid fa-arrow-up-from-bracket",
            label = "Pick Up"    
        },
        {
            event = 'envi-yoga:1',
            icon = "fa-solid fa-lungs",
            label = "Lotus Flower"
        },        
    },
        distance = 1.0,
    })

    RegisterNetEvent('envi-yoga:pickup',function(data)
        NetworkRequestControlOfEntity(data.entity)
        while not NetworkRequestControlOfEntity(data.entity) do
            Wait(0)
        end
        LoadAnimDict('amb@medic@standing@kneel@base')
        LoadAnimDict('anim@gangops@facility@servers@bodysearch@')
        TaskPlayAnim(ped, "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
        TaskPlayAnim(ped, "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 48, 0, false, false, false )
        Wait(5000)
        ClearPedTasks(ped)
        TriggerServerEvent('envi-yoga:pickupS')
        DeleteEntity(data.entity)
        RemoveAnimDict('amb@medic@standing@kneel@base')
        RemoveAnimDict('anim@gangops@facility@servers@bodysearch@')
    end)
end

function LoadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(5)
    end
end 
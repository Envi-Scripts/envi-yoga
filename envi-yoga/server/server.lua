if Config.Framework == 'esx' then    
    ESX = exports["es_extended"]:getSharedObject()

    for k, v in pairs(Config.YogaMats) do
        ESX.RegisterUsableItem(k, function(source)
            local xPlayer = ESX.GetPlayerFromId(source)
            TriggerClientEvent('envi-yoga:placemat', source, k, v)
            xPlayer.removeInventoryItem(k, 1)
        end)
    end
elseif Config.Framework == 'qb' then
    local QBCore = exports['qb-core']:GetCoreObject()
    for k, v in pairs(Config.YogaMats) do
        QBCore.Functions.CreateUseableItem(k, function(source, item)
            local player = QBCore.Functions.GetPlayer(source)
            TriggerClientEvent('envi-yoga:placemat', source, item, v)
            player.Functions.RemoveItem(item, 1)
        end)
    end
end

local function GetItemFromModel(model)
    for k, v in pairs(Config.YogaMats) do
        if model == v then
            return k
        end
    end
end

RegisterNetEvent('envi-yoga:pickup', function(model)
    -- this could probablyy use some validation
    local item = GetItemFromModel(model)
    if Config.Framework == 'esx' then
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.addInventoryItem(item, 1)
    elseif Config.Framework == 'qb' then
        local player = QBCore.Functions.GetPlayer(source)
        player.Functions.AddItem(item, 1)
    end
end)

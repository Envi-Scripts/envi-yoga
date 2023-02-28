if Config.Framework == 'esx' then    
    ESX = nil
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

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
            local Player = QBCore.Functions.GetPlayer(source)
            TriggerClientEvent('envi-yoga:placemat', source, item, v)
            Player.Functions.RemoveItem(item, 1)
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
    local item = GetItemFromModel(model)
    if Config.Framework == 'esx' then
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.addInventoryItem(item, 1)
    elseif Config.Framework == 'qb' then
        local Player = QBCore.Functions.GetPlayer(source)
        Player.Functions.AddItem(item, 1)
    end
end)

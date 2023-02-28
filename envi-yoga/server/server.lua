if Config.Framework == 'esx' then	
	ESX = nil
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

	ESX.RegisterUsableItem('yogamat_pro',function(source)
		local xPlayer = ESX.GetPlayerFromId(source)
		TriggerClientEvent('envi-yoga:mat',source)
		xPlayer.removeInventoryItem('yogamat_pro',1)
	end)

	ESX.RegisterUsableItem('yogamat_blue',function(source)
		local xPlayer = ESX.GetPlayerFromId(source)
		TriggerClientEvent('envi-yoga:mat1',source)
		xPlayer.removeInventoryItem('yogamat_blue',1)
	end)

	ESX.RegisterUsableItem('yogamat_black',function(source)
		local xPlayer = ESX.GetPlayerFromId(source)
		TriggerClientEvent('envi-yoga:mat2',source)
		xPlayer.removeInventoryItem('yogamat_black',1)
	end)

	ESX.RegisterUsableItem('yogamat_red',function(source)
		local xPlayer = ESX.GetPlayerFromId(source)
		TriggerClientEvent('envi-yoga:mat3',source)
		xPlayer.removeInventoryItem('yogamat_red',1)
	end)

	RegisterNetEvent('envi-yoga:pickupS',function(variation)
		local xPlayer = ESX.GetPlayerFromId(source)
		if variation == 876225403 then
			xPlayer.addInventoryItem('yogamat_pro',1)
		elseif variation == -232023078 then
			xPlayer.addInventoryItem('yogamat_blue',1)
		elseif variation == 2057317573 then
			xPlayer.addInventoryItem('yogamat_black',1)
		elseif variation == -1978741854 then
			xPlayer.addInventoryItem('yogamat_red',1)
		end
	end)
elseif Config.Framework == 'qb' then
	local QBCore = exports['qb-core']:GetCoreObject()
	QBCore.Functions.CreateUseableItem('yogamat_pro',function(source)
		local Player = QBCore.Functions.GetPlayer(source)
		TriggerClientEvent('envi-yoga:mat',source)
		Player.Functions.RemoveItem('yogamat_pro',1)
	end)

	QBCore.Functions.CreateUseableItem('yogamat_blue',function(source)
		local Player = QBCore.Functions.GetPlayer(source)
		TriggerClientEvent('envi-yoga:mat1',source)
		Player.Functions.RemoveItem('yogamat_blue',1)
	end)

	QBCore.Functions.CreateUseableItem('yogamat_black',function(source)
		local Player = QBCore.Functions.GetPlayer(source)
		TriggerClientEvent('envi-yoga:mat2',source)
		Player.Functions.RemoveItem('yogamat_black',1)
	end)

	QBCore.Functions.CreateUseableItem('yogamat_red',function(source)
		local Player = QBCore.Functions.GetPlayer(source)
		TriggerClientEvent('envi-yoga:mat3',source)
		Player.Functions.RemoveItem('yogamat_red',1)
	end)

	RegisterNetEvent('envi-yoga:pickupS',function(variation)
		local Player = QBCore.Functions.GetPlayer(source)
		if variation == 876225403 then
			Player.Functions.AddItem('yogamat_pro',1)
		elseif variation == -232023078 then
			Player.Functions.AddItem('yogamat_blue',1)
		elseif variation == 2057317573 then
			Player.Functions.AddItem('yogamat_black',1)
		elseif variation == -1978741854 then
			Player.Functions.AddItem('yogamat_red',1)
		end
	end)
end



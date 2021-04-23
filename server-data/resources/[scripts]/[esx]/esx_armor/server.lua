ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('armor', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	--xPlayer.getInventoryItem('armor', 1)
	xPlayer.removeInventoryItem('armor', 1)
	TriggerClientEvent('esx_armor:armor', source)
end)

ESX.RegisterUsableItem('armorhalf', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	--xPlayer.getInventoryItem('armorhalf', 1)
	xPlayer.removeInventoryItem('armorhalf', 1)
	TriggerClientEvent('esx_armor:armorhalf', source)
end)
ESX = nil
plates = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('lockpick', function(source)
    TriggerClientEvent('m3:vehiclelock:useLockpick', source)
end)

Citizen.CreateThread(function()
    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles', {}, function(results)
		for i=1, #results, 1 do
			-- if string.find(results[i].owner, 'Char1') then -- for kashacters
			-- 	table.insert(plates, {plate = results[i].plate, owner = string.gsub(results[i].owner, "Char1", "steam")})
			-- end
			-- if string.find(results[i].owner, 'Char2') then 
			-- 	table.insert(plates, {plate = results[i].plate, owner = string.gsub(results[i].owner, "Char2", "steam")})
			-- end
			-- if string.find(results[i].owner, 'Char3') then 
			-- 	table.insert(plates, {plate = results[i].plate, owner = string.gsub(results[i].owner, "Char3", "steam")})
			-- end
			-- if string.find(results[i].owner, 'Char4') then 
			-- 	table.insert(plates, {plate = results[i].plate, owner = string.gsub(results[i].owner, "Char4", "steam")})
			-- end
			if string.find(results[i].owner, 'steam') then 
				table.insert(plates, {plate = results[i].plate, owner = results[i].owner})
			end
        end
	end)
end)

RegisterServerEvent('m3:vehiclelock:delLockpick')
AddEventHandler('m3:vehiclelock:delLockpick', function(count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('lockpick', count)
end)

-- for debug
-- Citizen.CreateThread(function()
-- 	while true do
-- 		Citizen.Wait(10000)
-- 		for k, v in pairs(plates) do
-- 			print(plates[k].plate)
-- 		end
-- 	end
-- end)

RegisterServerEvent('m3:vehiclelock:giveKeys')
AddEventHandler('m3:vehiclelock:giveKeys', function(targetPlayer, plate)
	local xPlayer = ESX.GetPlayerFromId(targetPlayer)

	if plate ~= nil then
		if xPlayer ~= nil then
			found = false
			for k, v in pairs(plates) do
				if plates[k].plate == plate then
					if plates[k].owner == xPlayer.identifier then
						TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = plate ..' plakalı aracın anahtarlarına zaten sahipsin!'})
						found = true
					end
				end
			end

			if not found then
				table.insert(plates, {plate = plate, owner = xPlayer.identifier})
				TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'inform', text = plate ..' plakalı aracın anahtarlarını aldın!'})
			end
		end
	end
end)

RegisterServerEvent('m3:vehiclelock:plateRegister')
AddEventHandler('m3:vehiclelock:plateRegister', function(plate)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if plate ~= nil then
		if xPlayer ~= nil then
			table.insert(plates, {plate = plate, owner = xPlayer.identifier})
		end
	end
end)

ESX.RegisterServerCallback('m3:vehiclelock:checkPlate', function(source, cb, plate)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	for k, v in pairs(plates) do
		if plates[k].plate == plate then
			if plates[k].owner == xPlayer.identifier then
				cb(true)
				return
			end
		end
	end

	cb(false)
end)

RegisterServerEvent('m3:vehiclelock:changePlate')
AddEventHandler('m3:vehiclelock:changePlate', function(oldplate, newplate)
	for k, v in pairs(plates) do
		if plates[k].plate == ESX.Math.Trim(oldplate) then
			table.insert(plates, {plate = ESX.Math.Trim(newplate), owner = plates[k].owner})
		end
	end
end)

ESX.RegisterServerCallback('m3:vehiclelock:doesPlateExist', function(source, cb, plate)
	for k, v in pairs(plates) do
		if plates[k].plate == plate then
			cb(true)
			return
		end
	end

	cb(false)
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		plates = {}
		print('[^2m3:vehiclelock^0] - Plaka tablosu bosaltildi.')
	end
end)
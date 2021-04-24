ESX = nil
currentChannel = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('radio', function(source)
	TriggerClientEvent('m3:radio:use', source)
end)

ESX.RegisterServerCallback('m3:radio:getItemAmount', function(source, cb, item)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer ~= nil then
		local items = xPlayer.getInventoryItem(item)
		if items == nil then
			cb(0)
		else
			cb(items.count)
		end
	end
end)

AddEventHandler('esx:onRemoveInventoryItem', function(source, item, count)
	if item.name == 'radio' and item.count < 1 then
		TriggerClientEvent('m3:radio:leave', source)
		exports["saltychat"]:RemovePlayerRadioChannel(source, tostring(currentChannel))
	end
end)

RegisterNetEvent('m3:radio:setCurrentRadioChannel')
AddEventHandler('m3:radio:setCurrentRadioChannel', function(value)
	currentChannel[source] = value
end)

RegisterCommand('baglan', function(source, args)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	local channelid = args[1]

	if GetCurrentResourceName() == 'm3_radio' then
		local radiocount = xPlayer.getInventoryItem('radio').count
		if radiocount > 0 then
			if channelid ~= nil then
				if tonumber(channelid) >= (Config.MaxChannelCount + 1) then
					TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'error', text = 'Kanal numarası '..Config.MaxChannelCount..'ten yüksek olamaz!'})
				elseif tonumber(channelid) <= Config.MaxChannelCount then
					TriggerClientEvent('m3:radio:join', src, channelid)
				end
			else
				TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'error', text = 'Kanal numarası boş olamaz!'})
			end
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'error', text = 'Üzerinizde telsiz yok!'})
		end
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = 'error', text = 'Script adını m3_radio olarak ayarlayınız!'})
	end
end)

RegisterCommand('ayril', function(source, args)
	TriggerClientEvent('m3:radio:leave', source, false)
	exports["saltychat"]:RemovePlayerRadioChannel(source, tostring(currentChannel[source]))
	currentChannel[source] = nil
end)

RegisterNetEvent('m3:radio:leaveRadio')
AddEventHandler('m3:radio:leaveRadio', function(value)
	if currentChannel[source] ~= nil then
		TriggerClientEvent('m3:radio:leave', source, true)
		exports["saltychat"]:RemovePlayerRadioChannel(source, tostring(currentChannel[source]))
		currentChannel[source] = nil
	end
end)

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		Citizen.Wait(5000)
		print('[^2m3:radio^0] - Started!')
	end
end)
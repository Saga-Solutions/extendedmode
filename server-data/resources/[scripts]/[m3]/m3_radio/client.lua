ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
end)

RegisterNetEvent('m3:radio:use')
AddEventHandler('m3:radio:use', function()
	TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', text = '/baglan [0 - 499] - /ayril', length = 4000})
end)

RegisterNetEvent('m3:radio:join')
AddEventHandler('m3:radio:join', function(channelid)
	local channelid = math.ceil(tonumber(channelid))
	-- ESX.TriggerServerCallback('m3:radio:getItemAmount', function(count)
	-- 	if count >= 1 then
			RadioAnimation()
			local playerName = GetPlayerName(PlayerId())
			-- local getPlayerRadioChannel = exports.tokovoip_script:getPlayerData(playerName, "radio:channel")
			local getPlayerRadioChannel = exports["saltychat"]:GetRadioChannel()

			if tonumber(channelid) ~= tonumber(getPlayerRadioChannel) then
				if tonumber(channelid) <= Config.PrivateChannelCount then
					PlayerData = ESX.GetPlayerData()
					if (PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'sheriff' or PlayerData.job.name == 'moj') then
						-- exports.tokovoip_script:removePlayerFromRadio(getPlayerRadioChannel)
						-- exports.tokovoip_script:setPlayerData(playerName, "radio:channel", tonumber(channelid), true);
						-- exports.tokovoip_script:addPlayerToRadio(tonumber(channelid))
						exports["saltychat"]:SetRadioChannel(tostring(channelid), false)
						TriggerServerEvent('m3:radio:setCurrentRadioChannel', channelid)
						TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', text = 'Kanala katıldın. Katıldığın kanal: ' .. tonumber(channelid) .. '.00 MHz', length = 4000})
						SendNUIMessage({
							action = "join",
							label = Config.Channels[tonumber(channelid)].name
						})
					elseif not (PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'sheriff' or PlayerData.job.name == 'moj') then
						TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Şifreli kanal!', length = 4000})
					end
				end
				
				if tonumber(channelid) > Config.PrivateChannelCount then
					-- exports.tokovoip_script:removePlayerFromRadio(getPlayerRadioChannel)
					-- exports.tokovoip_script:setPlayerData(playerName, "radio:channel", tonumber(channelid), true);
					-- exports.tokovoip_script:addPlayerToRadio(tonumber(channelid))
					exports["saltychat"]:SetRadioChannel(tostring(channelid), false)
					TriggerServerEvent('m3:radio:setCurrentRadioChannel', channelid)
					TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', text = 'Kanala katıldın. Katıldığın kanal: ' .. tonumber(channelid) .. '.00 MHz', length = 4000})
					SendNUIMessage({
						action = "join",
						label = Config.Channels[tonumber(channelid)].name
					})
				end
			else
				TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Zaten bu kanaldasın! Bulunduğun kanal: ' .. tonumber(channelid) .. '.00 MHz', length = 4000})
			end
	-- 	else
	-- 		TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Telsiziniz yok!', length = 4000})
	-- 	end
	-- end, 'radio')
end)

RegisterNetEvent('m3:radio:leave')
AddEventHandler('m3:radio:leave', function(isDead)
	local playerName = GetPlayerName(PlayerId())
	  -- local getPlayerRadioChannel = exports.tokovoip_script:getPlayerData(playerName, "radio:channel")
	  local getPlayerRadioChannel = exports["saltychat"]:GetRadioChannel(false)

	if getPlayerRadioChannel ~= nil then
		if not isDead then
			ESX.TriggerServerCallback('m3:radio:getItemAmount', function(count)
				if count >= 1 then
					RadioAnimation()
				end
			end, 'radio')
		end
		
		-- exports.tokovoip_script:removePlayerFromRadio(getPlayerRadioChannel)
		-- exports.tokovoip_script:setPlayerData(playerName, "radio:channel", "nil", true)
		exports['mythic_notify']:SendAlert('inform', 'Kanaldan ayrıldın. Ayrıldığın kanal: '.. getPlayerRadioChannel .. '.00 MHz </b>')

		SendNUIMessage({
			action = "leave"
		})
	end
end)

--anims
local oObjectProp = "prop_cs_hand_radio"
local objects = {}

function RadioAnimation()
	local player = PlayerPedId()
	local plyCoords = GetOffsetFromEntityInWorldCoords(player, 0.0, 0.0, -5.0)
	local phoneRspawned = CreateObject(GetHashKey(oObjectProp), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
	local ad = "amb@world_human_stand_mobile@female@text@enter"
	local ad2 = "amb@world_human_stand_mobile@female@text@base"
	local ad3 = "amb@world_human_stand_mobile@female@text@exit"
  
	if (DoesEntityExist(player) and not IsEntityDead(player)) then
		if IsPedInAnyVehicle(player, false) then
			dict = "anim@cellphone@in_car@ps"
			loadAnimDict(dict)
			RequestModel(GetHashKey(oObjectProp))

			Wait(500)
			TaskPlayAnim(player, dict, "cellphone_text_in", 8.0, 1.0, -1, 50, 0, 0, 0, 0)
			Wait(900)
			AttachEntityToEntity(phoneRspawned, player, GetPedBoneIndex(player, 28422),-0.005,0.0,0.0,360.0,360.0,0.0,1,1,0,1,0,1)
			table.insert(objects, phoneRspawned)
			Wait(200)

			Citizen.Wait(2500)
			
			TaskPlayAnim(player, dict, "cellphone_text_out", 8.0, 1.0, -1, 50, 0, 0, 0, 0)
			Wait(1840)
			DetachEntity(phoneRspawned, 1, 1)
			DeleteEntity(phoneRspawned)
			for i=1, #objects, 1 do
				DeleteEntity(objects[i])
				Citizen.Wait(1)
			end
			Wait(750)
			ClearPedSecondaryTask(player)
		else
			loadAnimDict(ad)
			loadAnimDict(ad2)
			loadAnimDict(ad3)
			RequestModel(GetHashKey(oObjectProp))

			Wait(500)
			TaskPlayAnim(player, ad, "enter", 8.0, 1.0, -1, 50, 0, 0, 0, 0)
			Wait(1360)
			AttachEntityToEntity(phoneRspawned, player, GetPedBoneIndex(player, 28422),-0.005,0.0,0.0,360.0,360.0,0.0,1,1,0,1,0,1)
			table.insert(objects, phoneRspawned)
			Wait(200)
			
			Citizen.Wait(2500)

			TaskPlayAnim(player, ad3, "exit", 8.0, 1.0, -1, 50, 0, 0, 0, 0)
			Wait(1840)
			DetachEntity(phoneRspawned, 1, 1)
			DeleteEntity(phoneRspawned)
			for i=1, #objects, 1 do
				DeleteEntity(objects[i])
				Citizen.Wait(1)
			end
			Wait(750)
			ClearPedSecondaryTask(player)
		end
	end
end

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end

RegisterCommand('telsizses', function(source, args)
	if args[1] == nil or args[1] == '' then
		exports['mythic_notify']:SendAlert('error', 'Telsiz ses seviyesi bir seviye girmeniz gerekiyor(/telsizses 1, /telsizses 2, /telsizses 3).')
		return
	end

	local voicelevel = tonumber(args[1])
	if voicelevel == 1 then
		exports['mythic_notify']:SendAlert('inform', 'Telsiz ses seviyesi düşüğe alındı.')
		exports["saltychat"]:SetRadioVolume(0.5)
	elseif voicelevel == 2 then
		exports['mythic_notify']:SendAlert('inform', 'Telsiz ses seviyesi normale alındı.')
		exports["saltychat"]:setRadioVolume(1.0)
	elseif voicelevel == 3 then
		exports['mythic_notify']:SendAlert('inform', 'Telsiz ses seviyesi yükseğe alındı.')
		exports["saltychat"]:setRadioVolume(1.5)
	end
end)
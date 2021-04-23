ESX              = nil
local PlayerData = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

RegisterNetEvent('esx_armor:armor')
AddEventHandler('esx_armor:armor', function()
		local playerPed = GetPlayerPed(-1)
		TriggerEvent("mythic_progbar:client:progress", {
			name = "armor_giyme",
			duration = 5000,
			label = "Ağır zırh giyiliyor.",
			useWhileDead = false,
			canCancel = false,
			controlDisables = {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = true,
				disableCombat = false,
			},
			animation = {
            animDict = "missheistdockssetup1clipboard@idle_a",
            anim = "idle_a",
			},
			prop = {
            model = "prop_armour_pickup",
			}
		}, function(status)
			if not status then
				-- Do Something If Event Wasn't Cancelled
			end
		end)    
			Citizen.Wait(5100)
		Citizen.CreateThread(function()
		SetPedArmour(playerPed, 100)
		end)
end)

RegisterNetEvent('esx_armor:armorhalf')
AddEventHandler('esx_armor:armorhalf', function()
		local playerPed = GetPlayerPed(-1)
		TriggerEvent("mythic_progbar:client:progress", {
			name = "armor_giyme",
			duration = 5000,
			label = "Hafif zırh giyiliyor.",
			useWhileDead = false,
			canCancel = false,
			controlDisables = {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = true,
				disableCombat = false,
			},
			animation = {
            animDict = "missheistdockssetup1clipboard@idle_a",
            anim = "idle_a",
			},
			prop = {
            model = "prop_bodyarmour_06",
			}
		}, function(status)
			if not status then
				-- Do Something If Event Wasn't Cancelled
			end
		end)    
			Citizen.Wait(5100)
		Citizen.CreateThread(function()
		SetPedArmour(playerPed, 50)
		end)
end)
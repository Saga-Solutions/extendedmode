ESX  = nil
local IsDead = false
local IsAnimated = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

AddEventHandler('esx_basicneeds:resetStatus', function()
	TriggerEvent('esx_status:set', 'hunger', 500000)
	TriggerEvent('esx_status:set', 'thirst', 500000)
	--TriggerEvent('esx_status:set', 'stress', 100000)
end)

RegisterNetEvent('esx_basicneeds:healPlayer')
AddEventHandler('esx_basicneeds:healPlayer', function()
	-- restore hunger & thirst
	TriggerEvent('esx_status:set', 'hunger', 1000000)
	TriggerEvent('esx_status:set', 'thirst', 1000000)
	--TriggerEvent('esx_status:set', 'stress', 2000000)

	-- restore hp
	local playerPed = PlayerPedId()
	SetEntityHealth(playerPed, GetEntityMaxHealth(playerPed))
end)

AddEventHandler('playerSpawned', function()

	if IsDead then
		TriggerEvent('esx_basicneeds:resetStatus')
	end

	IsDead = false
end)

AddEventHandler('esx_status:loaded', function(status)

	TriggerEvent('esx_status:registerStatus', 'hunger', 1000000, '#ba3d3d', function(status)
		return false
	end, function(status)
		status.remove(100)
	end)

	TriggerEvent('esx_status:registerStatus', 'thirst', 1000000, '#3891c9', function(status)
		return false
	end, function(status)
		status.remove(75)
	end)
	
	--TriggerEvent('esx_status:registerStatus', 'stress', 1000000, '#3dc499', function(status)
	--	return false
	---end, function(status)
	--	status.add(20)
	--end)

	Citizen.CreateThread(function()

		while true do

			Wait(1000)

			local playerPed  = GetPlayerPed(-1)
			local prevHealth = GetEntityHealth(playerPed)
			local health     = prevHealth

			TriggerEvent('esx_status:getStatus', 'hunger', function(status)
				
				if status.val == 0 then

					if prevHealth <= 150 then
						health = health - 5
					else
						health = health - 1
					end

				end

			end)

			TriggerEvent('esx_status:getStatus', 'thirst', function(status)
				
				if status.val == 0 then

					if prevHealth <= 150 then
						health = health - 5
					else
						health = health - 1
					end

				end

			end
			
			--TriggerEvent('esx_status:getStatus', 'stress', function(status)
			--	stressVal = status.val
			--end)
			

			--if health ~= prevHealth then
			--	SetEntityHealth(playerPed,  health)
			--end
			--	
			--if stressVal >= 750000 then
			--	Citizen.Wait(2000)
			--	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 0.12)
			--elseif stressVal >= 700000 then
			--	Citizen.Wait(2000)
			--	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 0.08)
			--elseif stressVal >= 600000 then
			--	Citizen.Wait(2000)
			--	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 0.05)
			--elseif stressVal >= 450000 then
			--	Citizen.Wait(2000)
			--	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 0.03)
			--elseif stressVal >= 250000 then
			--	Citizen.Wait(2000)
			--	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 0.01)
			--	
			--end

		end

	end)

	Citizen.CreateThread(function()

		while true do

			Wait(0)

			local playerPed = GetPlayerPed(-1)
			
			if IsEntityDead(playerPed) and not IsDead then
				IsDead = true
			end

		end

	end)

end)


AddEventHandler('esx_basicneeds:isEating', function(cb)
	cb(IsAnimated)
end)

RegisterNetEvent('esx_basicneeds:onEat')
AddEventHandler('esx_basicneeds:onEat', function(prop_name)
    if not IsAnimated then
		local prop_name = prop_name or ''
    	IsAnimated = true
	    local playerPed = GetPlayerPed(-1)
	    Citizen.CreateThread(function()
	        local x,y,z = table.unpack(GetEntityCoords(playerPed))
	        prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
	        AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 18905), 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)
	        RequestAnimDict('mp_player_inteat@burger')
	        while not HasAnimDictLoaded('mp_player_inteat@burger') do
	            Wait(0)
	        end
	        TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)
	    TriggerEvent("mythic_progbar:client:progress", {
			name = "yemek_yeme",
			duration = 2000,
			label = "Yiyorsun",
			useWhileDead = false,
			canCancel = false,
			controlDisables = {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        },
    }, function(status)
        if not status then
            -- Do Something If Event Wasn't Cancelled
        end
    end)    
			Wait(3000)
	        IsAnimated = false
	        ClearPedSecondaryTask(playerPed)
	        DeleteObject(prop)
	    end)
	end
end)

RegisterNetEvent('esx_basicneeds:onDrink')
AddEventHandler('esx_basicneeds:onDrink', function(prop_name)
	if not IsAnimated then
		local prop_name = prop_name or ''
		IsAnimated = true
		local playerPed = GetPlayerPed(-1)
		Citizen.CreateThread(function()
			local x,y,z = table.unpack(GetEntityCoords(playerPed))
			prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)			
	        AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 18905), 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)
			RequestAnimDict('mp_player_intdrink')  
			while not HasAnimDictLoaded('mp_player_intdrink') do
				Wait(0)
			end
			TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, 2000, 0, 1, true, true, true)
			TriggerEvent("mythic_progbar:client:progress", {
			name = "icecek_icme",
			duration = 2000,
			label = "Içiyorsun",
			useWhileDead = false,
			canCancel = false,
			controlDisables = {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        },
    }, function(status)
        if not status then
            -- Do Something If Event Wasn't Cancelled
        end
    end) 
			Wait(3000)
	        IsAnimated = false
	        ClearPedSecondaryTask(playerPed)
			DeleteObject(prop)
		end)
	end
end)

RegisterNetEvent('esx_basicneeds:startSmoke')
AddEventHandler('esx_basicneeds:startSmoke', function(source)
	SmokeAnimation()
end)

function SmokeAnimation()
	local playerPed = GetPlayerPed(-1)
	TriggerEvent("mythic_progbar:client:progress", {
        name = "sigara_icme",
        duration = 15000,
        label = "Sigara iciyorsun stresin azalıyor",
        useWhileDead = false,
        canCancel = false,
        controlDisables = {
            disableMovement = false,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
    }, function(status)
        if not status then
            -- Do Something If Event Wasn't Cancelled
        end
    end) 
	Citizen.CreateThread(function()
        TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING", 0, true)   
            
	end)
end
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local pPed = PlayerPedId()
		if DoesEntityExist(GetVehiclePedIsTryingToEnter(pPed)) then
			local vehicle = GetVehiclePedIsTryingToEnter(pPed)
			local plate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))
			local lock = GetVehicleDoorLockStatus(vehicle)
			local driver = GetPedInVehicleSeat(vehicle, -1)
			if DoesEntityExist(driver) and driver ~= pPed then
				-- if driver then
				-- 	SetPedCanBeDraggedOut(driver, false)
				-- end
				if lock == 7 and not IsEntityDead(driver) then
					SetVehicleDoorsLocked(vehicle, 2)
				end
				if IsEntityDead(driver) then
					SetVehicleDoorsLocked(vehicle, 1)
					GiveVehicleKey(plate)
				end
			end
			if lockpickedplate == plate then
				SetVehicleDoorsLocked(vehicle, 1)
			else
				ESX.TriggerServerCallback('m3:vehiclelock:doesPlateExist', function(exist)
					if not exist then
						SetVehicleDoorsLocked(vehicle, 2)
					end
				end, plate)
			end
			Citizen.Wait(3000)
		end
	end
end)

function GiveVehicleKey(plate)
	TriggerServerEvent('m3:vehiclelock:plateRegister', plate)
	TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', text = 'Anahtarları aldın.'})
end

RegisterCommand('anahtarver', function()
	local pPed = PlayerPedId()
	local vehicle = GetVehiclePedIsIn(pPed, false)

	if DoesEntityExist(vehicle) then
		local plate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))
		ESX.TriggerServerCallback('m3:vehiclelock:checkPlate', function(owner)
			if owner then
				local targetPlayer, distance = ESX.Game.GetClosestPlayer()
				if targetPlayer ~= -1 and distance < Config.GiveDistance then
					TriggerServerEvent('m3:vehiclelock:giveKeys', GetPlayerServerId(targetPlayer), plate)
					TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', text = 'Anahtarları verdin.'})
				else
					TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Yakınında kimse yok!'})
				end
			else
				TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Aracın sahibi sen değilsin!'})
			end
		end, plate)
	else
		TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Aracın içinde olman gerekiyor!'})
	end
end)

Citizen.CreateThread(function()
	local animdict = "anim@heists@keycard@" -- anim "exit"
	RequestAnimDict(animdict)
	while not HasAnimDictLoaded(animdict) do
		Citizen.Wait(1)
	end

	while true do
		Citizen.Wait(5)
		if IsControlJustReleased(1, Config.LockKey) then
			local pPed = PlayerPedId()
			local pCoords = GetEntityCoords(pPed)
			vehicles = ESX.Game.GetVehiclesInArea(pCoords, Config.LockDistance)
			if #vehicles == 0 then
				TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Yakınında kilitleyebileceğin bir araç yok!'})
			else
				found = false
				for i=1, #vehicles, 1 do
					if found then
						break
					end

					local vCoords = GetEntityCoords(vehicles[i])
					local distance = GetDistanceBetweenCoords(pCoords, vCoords.x, vCoords.y, vCoords.z, true)
					if distance < 25.0 then
						local plate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicles[i]))
						ESX.TriggerServerCallback('m3:vehiclelock:checkPlate', function(owner)
							if owner then
								local prop = GetHashKey('p_car_keys_01')
								loadModel(prop)
								local keyFob = CreateObject(prop, 1.0, 1.0, 1.0, 1, 1, 0)
								found = true
								local lock = GetVehicleDoorLockStatus(vehicles[i])
								AttachEntityToEntity(keyFob, pPed, GetPedBoneIndex(pPed, 57005), 0.09, 0.04, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
								if lock == 1 or lock == 0 then
									SetVehicleDoorShut(vehicles[i], 0, false)
									SetVehicleDoorShut(vehicles[i], 1, false)
									SetVehicleDoorShut(vehicles[i], 2, false)
									SetVehicleDoorShut(vehicles[i], 3, false)
									SetVehicleDoorsLocked(vehicles[i], 2)
									TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, "lock", 1.0)
									TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Aracınız kilitlendi.'})
									if not IsPedInAnyVehicle(PlayerPedId(), true) then
										TaskPlayAnim(PlayerPedId(), animdict, "exit", 8.0, 8.0, -1, 48, 1, false, false, false)
									end
									SetVehicleLights(vehicles[i], 2)
									Citizen.Wait(150)
									SetVehicleLights(vehicles[i], 0)
									Citizen.Wait(150)
									SetVehicleLights(vehicles[i], 2)
									Citizen.Wait(150)
									SetVehicleLights(vehicles[i], 0)
								elseif lock == 2 then
									SetVehicleDoorsLocked(vehicles[i], 1)
									TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, "unlock", 1.0)
									TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', text = 'Aracınız açıldı.'})
									if not IsPedInAnyVehicle(PlayerPedId(), true) then
										TaskPlayAnim(PlayerPedId(), animdict, "exit", 8.0, 8.0, -1, 48, 1, false, false, false)
									end
									SetVehicleLights(vehicles[i], 2)
									Citizen.Wait(150)
									SetVehicleLights(vehicles[i], 0)
									Citizen.Wait(150)
									SetVehicleLights(vehicles[i], 2)
									Citizen.Wait(150)
									SetVehicleLights(vehicles[i], 0)
								end
								Citizen.Wait(2000)
								DeleteObject(keyFob)
								SetModelAsNoLongerNeeded(prop)
								return
							end
						end, plate)
					end
				end
			end
		end
	end
end)

RegisterNetEvent('m3:vehiclelock:useLockpick')
AddEventHandler('m3:vehiclelock:useLockpick', function()
	local pPed = PlayerPedId()
    if IsPedInAnyVehicle(pPed) then
        local vehicle = GetVehiclePedIsIn(pPed)
        if not GetIsVehicleEngineRunning(vehicle) then
            exports['mythic_progbar']:Progress({
                name = "hotwire",
                duration = Config.HotWireTime,
                label = 'Düz kontak yapılıyor...',
                useWhileDead = false,
                canCancel = true,
                controlDisables = {
                    disableMovement = false,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                },
                animation = {
                    animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                    anim = "machinic_loop_mechandplayer",
                    flags = 49,
                },
            }, function(cancelled)
				if not cancelled then
					lockpicked = false
					lockpickedplate = nil
                    ClearPedSecondaryTask(pPed)
					TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', text = 'Düz kontak tamamlandı.'})
					SetVehicleEngineOn(vehicle, true, false, false)
                end
            end)
        end
    else
        local vehicle = ESX.Game.GetVehicleInDirection()
        if vehicle then
            LockPick(vehicle)
        end
    end
end)

function loadModel(prop)
	while not HasModelLoaded(prop) do
		RequestModel(prop)
		Citizen.Wait(10)
	end
end

function LockPick(vehicle)
	local pPed = PlayerPedId()
		exports['mythic_progbar']:Progress({
			name = "lockpickcar",
			duration = Config.LockpickTime,
			label = 'Maymuncuk kullanılıyor...',
			useWhileDead = false,
			canCancel = false,
			controlDisables = {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = false,
				disableCombat = true,
			},
			animation = {
				animDict = "missheistfbisetup1",
				anim = "unlock_loop_janitor",
				flags = 49,
			},
		}, function(cancelled)
			if not cancelled then
				local luck = math.random(1, 100)
				if luck <= Config.LockpickChance then
					lockpicked = true
					lockpickedplate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))
					ClearPedTasksImmediately(pPed)
					SetVehicleDoorsLocked(vehicle, 1)
					TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, "unlock", 1.0)
					TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', text = 'Kapı açıldı!'})
					TaskEnterVehicle(pPed, vehicle, 5.0, -1, 1.0, 1, 0)
					TriggerServerEvent('m3:vehiclelock:plateRegister', lockpickedplate)
					Citizen.Wait(2000)
					TriggerEvent('m3:vehiclelock:useLockpick')
					--TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', text = 'Anahtarları torpidoda buldun.'})
					lockpicked = false
					lockpickedplate = nil
				else
					if Config.DeleteLockpickOnFail then
						TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Maymuncuk kırıldı!'})
						TriggerServerEvent('m3:vehiclelock:delLockpick', 1)
					else
						TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Başarısız oldun!'})
					end
				end
			end
		end)
end

lockpicked = false
lockpickedplate = nil

Citizen.CreateThread( function()
	while true do
		Citizen.Wait(0)
		if lockpicked then
			local pPed = PlayerPedId()
			if IsPedInAnyVehicle(pPed) then
				local vehicle = GetVehiclePedIsIn(pPed)
				local plate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))
				if lockpickedplate == plate then
					SetVehicleEngineOn(vehicle, false, false, false)
				end
			end
		end
	end
end)

ESX = nil
local PlayerData = {}
random = 0
spawned = false
satiyor = false
local textcoords = vector3(20.55, -1505.38, 31.85)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function DrawText3D(x,y,z,text,size)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35,0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    --DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 100)
end

local DeliveryLocations = {
	[1] = {coords = vector3(197.41, -1499.97, 29.14)}, 
	[2] = {coords = vector3(4.13, -1476.94, 30.51)}, 
	[3] = {coords = vector3(231.22, -1752.63, 28.99)}, 
	[4] = {coords = vector3(64.77, -1574.44, 29.6)}, 
	[5] = {coords = vector3(-37.9, -1298.48, 29.35)}, 
	[6] = {coords = vector3(-158.98, -1451.0, 31.47)}, 
	[7] = {coords = vector3(-299.29, -1368.69, 31.27)}, 
	[8] = {coords = vector3(153.24, -1441.38, 29.24)}, 
	[9] = {coords = vector3(160.61, -1541.65, 29.14)}, 
	
}

RegisterNetEvent('satis')
AddEventHandler('satis', function()
	ESX.TriggerServerCallback('kaypuz:getItemAmount', function(qtty)
		if qtty >= 1 then
	while true do 
		Citizen.Wait(0)
		local ped = GetPlayerPed(-1)
		local playercoords = GetEntityCoords(ped)
		if random == 0 then
			random = math.random(1, 6)
		end
		if not spawned then
			RequestModel(-257153498)
			while not HasModelLoaded(-257153498) do
				Wait(1)
			end

			meth_dealer_seller = CreatePed(1, -257153498, DeliveryLocations[random].coords.x, DeliveryLocations[random].coords.y, DeliveryLocations[random].coords.z, 203.01, false, true)
			SetBlockingOfNonTemporaryEvents(meth_dealer_seller, true)
			SetPedDiesWhenInjured(meth_dealer_seller, false)
			SetPedCanPlayAmbientAnims(meth_dealer_seller, true)
			SetPedCanRagdollFromPlayerImpact(meth_dealer_seller, false)
			SetEntityInvincible(D, true)
			SetEntityAsMissionEntity(meth_dealer_seller)
			spawned = true
			print(DeliveryLocations[random].coords)
		end


		if spawned then
			local distance = GetDistanceBetweenCoords(playercoords["x"],playercoords["y"],playercoords["z"],DeliveryLocations[random].coords.x, DeliveryLocations[random].coords.y, DeliveryLocations[random].coords.z,true)
			if distance <= 2.0 then
				if not satiyor then
					ESX.Game.Utils.DrawText3D(DeliveryLocations[random].coords, "[~g~E~s~]", 1.0)
				end
				if IsControlPressed(0,46) then
					satiyor = true
					ExecuteCommand('e kolbağla')
					Citizen.Wait(100)
					TaskStartScenarioInPlace(meth_dealer_seller, "PROP_HUMAN_ATM", 0, true);
					Citizen.Wait(3000)
					ClearPedTasksImmediately(meth_dealer_seller)
					TriggerServerEvent('kaypuz:rolexsat', 'rolex')
					TriggerServerEvent('kaypuz:addMoney')
					Citizen.Wait(1000)
					ExecuteCommand('e c')
					SetPedAsNoLongerNeeded(meth_dealer_seller, true)
					TriggerEvent('again')
					Citizen.Wait(500)
					end
				end
			end
		end
	end
end, 'rolex')
end)


RegisterNetEvent('again')
AddEventHandler('again', function()
	Citizen.Wait(5000)
	random = 0
	spawned = false
	satiyor = false
	pussy()
end)


function pussy()
	Citizen.Wait(100)
	SetNewWaypoint(DeliveryLocations[random].coords.x, DeliveryLocations[random].coords.y)
end


Citizen.CreateThread(function()
	local plyPed = GetPlayerPed(-1)
	while true do 
		Citizen.Wait(0)
		if Vdist2(GetEntityCoords(PlayerPedId(), false), textcoords) < 1.5 then
			DrawText3D(textcoords.x, textcoords.y, textcoords.z, "~g~E~s~'ye basarak saat satisina basla")
			if IsControlJustReleased(0,46) then
				TaskPlayAnim(plyPed, "timetable@jimmy@doorknock@", "knockdoor_idle", 8.0, 8.0, -1, 4, 0, 0, 0, 0 )  
				TriggerEvent('satis')
				ClearPedTasksImmediately(GetPlayerPed(-1))
				exports['mythic_notify']:SendAlert('inform', 'Müşteriler ile iletişime geçildi')
				Citizen.Wait(math.random(2500, 5000))
				exports['mythic_notify']:SendAlert('inform', 'Yeni Bir Müşteri Alındı GPS ine konumu gönderiyorum')
				Citizen.Wait(500)
				SetNewWaypoint(DeliveryLocations[random].coords.x, DeliveryLocations[random].coords.y)
			end
		end 
	end
end)
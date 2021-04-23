ESX = nil
local phcoordstarted = false
local target = nil
local boost = false
local failed = false
local canOpen = true
local lastcredit = 0
local lastengine = 0
local lastradio = 0
local lastident = 0
local lastenginepw = 0
local lastphcoord = 0

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('m3:fsociety:usedTablet')
AddEventHandler('m3:fsociety:usedTablet', function()
	local elements = {}

	local PlayerData = ESX.GetPlayerData()

	if PlayerData.job.name ~= 'police' and PlayerData.job.name ~= 'ambulance' and PlayerData.job.name ~= 'savci' and PlayerData.job.name ~= 'hakim' then
		if canOpen then
			ESX.TriggerServerCallback('m3:fsociety:getLevel', function(level, currentexp)
				if level == nil then
					local level = 0
				end
				if currentexp == nil then
					local currentexp = 0
				end
				table.insert(elements, {label = 'Level: ' .. level .. ' - Mevcut Deneyim: ' .. currentexp .. '', value = nil}) --
				table.insert(elements, {label = 'Kredi Kartı Hackle', value = 'creditcard'}) --
				-- table.insert(elements, {label = 'Araç Kilidini Aç', value = 'vehiclelock'}) --
				if level >= 1 then
					table.insert(elements, {label = 'LSPD Aktif Memur Sayısını Öğren', value = 'countlspd'}) --
					table.insert(elements, {label = 'Araç Motorunu Boz', value = 'enginecrash'}) --
				end
				if level >= 2 then
					table.insert(elements, {label = 'Telefon Numarasıyla Telsizden Düşür', value = 'radiodrop'}) --
				end
				if level >= 3 then
					-- table.insert(elements, {label = 'Telefon Numarasından Kimlik Sorgulama', value = 'idenhack'}) --
				end
				if level >= 4 then
					table.insert(elements, {label = 'Telefon Numarasından Konum Öğren', value = 'phonecoord'}) --
					table.insert(elements, {label = 'LSPD Telsize Sız', value = 'radiohack'}) --
				end
				if level >= 5 then
					-- table.insert(elements, {label = 'Twitter Hesabı Hackle', value = 'twitterhack'}) --
					-- table.insert(elements, {label = 'Araç Motorunu Güçlendir', value = 'enginepw'}) --
				end
				if level >= 6 then
					table.insert(elements, {label = 'Kişinin Banka Hesabından Para Çal', value = 'stealbank'}) --
					-- table.insert(elements, {label = 'Kimlik Numarasıyla Sabıka Kaydı Sil - Ücret 42000$', value = 'poldata'}) --
				end
				-- if level >= 7 then
				-- 	table.insert(elements, {label = 'Aktif Memurların Konumunu 10 Dakika Açığa Çıkart', value = 'gpshack'}) --
				-- end

				ESX.UI.Menu.CloseAll()

				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'hackmenu', {
					title    = 'Tablet İşlemleri',
					align    = 'right',
					elements = elements
				}, function(data, menu)

					if data.current.value == 'creditcard' then
						menu.close()
						creditcard()
					elseif data.current.value == 'vehiclelock' then
						menu.close()
						vehiclelock()
					elseif data.current.value == 'countlspd' then
						menu.close()
						countlspd()
					elseif data.current.value == 'enginecrash' then
						menu.close()
						enginecrash()
					elseif data.current.value == 'radiodrop' then
						menu.close()
						radiodrop()
					elseif data.current.value == 'stealbank' then
						menu.close()
						stealbank()
					elseif data.current.value == 'twitterhack' then
						menu.close()
						twitterhack()
					elseif data.current.value == 'radiohack' then
						menu.close()
						radiohack()
					elseif data.current.value == 'idenhack' then
						menu.close()
						idenhack()
					elseif data.current.value == 'poldata' then
						menu.close()
						poldata()
					elseif data.current.value == 'enginepw' then 
						menu.close()
						enginepw()
					elseif data.current.value == 'phonecoord' then
						menu.close()
						phonecoord()
					elseif data.current.value == 'gpshack' then
						menu.close()
						gpshack()
					elseif data.current.value == nil then
					end

				end, function(data, menu)
					menu.close()
				end)
			end)
		else
			TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Burada tableti kullanamazsınız!'})
		end
	else
		TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Tablet şifreli!'})
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2000)
		if failed then
			local player = GetPlayerPed(-1)
			local pCoords = GetEntityCoords(player)
			TriggerServerEvent('m3:fsociety:blip', pCoords)
		end
	end
end)

function dispatch()
	local randomcode = math.random(1000, 9999)
	TriggerServerEvent('m3:dispatch:notify', 'Hacker İhbarı', 'Anonim', randomcode, 'Yok', GetEntityCoords(GetPlayerPed(-1)))
end

local bliptimer = 5 
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(60000)
		if failed then
			bliptimer = bliptimer - 1
			if bliptimer == 0 then
                failed = false
				bliptimer = 5
			end
		end
    end
end)

RegisterNetEvent('m3:fsociety:cantOpen')
AddEventHandler('m3:fsociety:cantOpen', function()
	canOpen = false
end)

RegisterNetEvent('m3:fsociety:canOpen')
AddEventHandler('m3:fsociety:canOpen', function()
	canOpen = true
end)

RegisterNetEvent('m3:fsociety:copNotifyC')
AddEventHandler('m3:fsociety:copNotifyC', function()
	PlaySoundFrontend(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0)
	TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'İnternet korsanı ihbarı!', length = 10000})
end)

RegisterNetEvent('m3:fsociety:blipC')
AddEventHandler('m3:fsociety:blipC', function(hackerPos)
    local transT = 250
    local Blip = AddBlipForCoord(hackerPos.x, hackerPos.y, hackerPos.z)
    SetBlipSprite(Blip,  162)
    SetBlipColour(Blip,  51)
    SetBlipAlpha(Blip,  transT)
    SetBlipScale(Blip, 1.0)
    SetBlipAsShortRange(Blip,  false)
    while transT ~= 0 do
        Wait(4)
        transT = transT - 1
        SetBlipAlpha(Blip,  transT)
        if transT == 0 then
            SetBlipSprite(Blip,  2)
            return
        end
    end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(50)
		if phcoordstarted then
			local pCoords = GetEntityCoords(GetPlayerPed(-1))
			local tCoords = GetEntityCoords(target)
			if GetDistanceBetweenCoords(pCoords, tCoords.x, tCoords.y, tCoords.z, true) <= 2.0 then
				phcoordstarted = false
				target = nil
				TriggerEvent("mtracker:stop")
			end
		end
	end
end)

function gpshack()
	ESX.TriggerServerCallback('m3:fsociety:getTime', function(ostime)
		ESX.TriggerServerCallback('m3:fsociety:gpsTime', function(dbgpstime)
			local remainingtime = ostime - dbgpstime
			if ostime - dbgpstime <= 86400 then
				TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = '' .. math.floor((86400 - remainingtime) / 60) .. ' dakika sonra tekrar dene!'})
			elseif ostime - dbgpstime >= 86400 then
				TriggerEvent("mhacking:show")
				TriggerEvent("mhacking:start", 2, 15, mhgps)
			end
		end)
	end)
end

function mhgps(success)
	TriggerEvent('mhacking:hide')
	if success then
		local giveexp = math.random(1, 3)
		TriggerServerEvent('m3:fsociety:giveExp', giveexp)
		TriggerServerEvent('m3:fsociety:gpsTimeUpdate')
		TriggerServerEvent('m3:fsociety:gpshack')
		-- TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', text = '10 dakika boyunca tüm memurların konumu herkese gözükecek!', length = 5000})
	else
		TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Başaramadın! Konumun ifşa oldu!'})
		failed = true
		-- TriggerServerEvent('m3:fsociety:copNotify')
		dispatch()
	end
end

function phonecoord()
	if not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
		TriggerEvent('m3:invUseable', false)
		if GetGameTimer() - lastphcoord > 5 * 60000 then
			TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', text = 'Konumunu bulmak istediğiniz kişinin telefon numarasını giriniz!', length = 5000})
			DisplayOnscreenKeyboard(1, "", "", "", "", "", "", 30)
			while (UpdateOnscreenKeyboard() == 0) do
				DisableAllControlActions(0)
				Wait(0)
			end
			if (GetOnscreenKeyboardResult()) then
				phphone_number = GetOnscreenKeyboardResult()
				TriggerEvent("mhacking:show")
				TriggerEvent("mhacking:start", 3, 20, mhphcoord)
				TriggerEvent('m3:invUseable', true)
			end
		else
			local ctime = 5 * 60000 - (GetGameTimer() - lastphcoord)
			TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = '' .. math.floor(ctime / 60000 + 1) .. ' dakika sonra tekrar dene!'})
			TriggerEvent('m3:invUseable', true)
		end
	else
		TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Bu özelliği araç içerisindeyken başlatamazsınız!'})
	end
end

function mhphcoord(success)
	TriggerEvent('mhacking:hide')
	if success then
		local giveexp = math.random(1, 3)
		TriggerServerEvent('m3:fsociety:giveExp', giveexp)
		ESX.TriggerServerCallback('m3:fsociety:getIdentfromPh', function(targetid)
			target = GetPlayerPed(GetPlayerFromServerId(targetid))
			targetsEntity = {}
			if DoesEntityExist(target) then
				table.insert(targetsEntity, target)
				Citizen.Wait(100)
				TriggerEvent('mtracker:settargets', targetsEntity)
				Citizen.Wait(100)
				TriggerEvent('mtracker:start')
				phcoordstarted = true
				targetsEntity = {}
			end
		end, phphone_number)
		lastphcoord = GetGameTimer()
	else
		TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Başaramadın! Konumun ifşa oldu!'})
		failed = true
		-- TriggerServerEvent('m3:fsociety:copNotify')
		dispatch()
	end
	phphone_number = nil
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(50)
		if phcoordstarted then
			local pCoords = GetEntityCoords(GetPlayerPed(-1))
			local tCoords = GetEntityCoords(target)
			if GetDistanceBetweenCoords(pCoords, tCoords.x, tCoords.y, tCoords.z, true) <= 2.0 then
				phcoordstarted = false
				target = nil
				TriggerEvent("mtracker:stop")
			end
		end
	end
end)

function enginepw()
	if GetGameTimer() - lastenginepw > 5 * 60000 then
		if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
			local player = GetPlayerPed(-1)
			local vehicle = GetVehiclePedIsIn(player, false)

			TriggerEvent("mhacking:show")
			TriggerEvent("mhacking:start", 3, 20, mhenginepw)
		else
			TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Bu özellik araç dışında kullanılamaz.'})
		end
	else
		local ptime = 5 * 60000 - (GetGameTimer() - lastenginepw)
		TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = '' .. math.floor(ptime / 60000 + 1) .. ' dakika sonra tekrar dene!'})
	end
end

function mhenginepw(success)
	local player = GetPlayerPed(-1)
	local vehicle = GetVehiclePedIsIn(player, false)
	TriggerEvent('mhacking:hide')
	if success then
		local giveexp = math.random(1, 3)
		TriggerServerEvent('m3:fsociety:giveExp', giveexp)
		TriggerServerEvent('m3:fsociety:boostEngine', vehicle)
		TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', text = 'Aracın yazılımı 15 dakikalığına %40 oranında güçlendirildi!', length = 5000})
		lastenginepw = GetGameTimer()
	else
		TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Başaramadın! Konumun ifşa oldu!'})
		failed = true
		-- TriggerServerEvent('m3:fsociety:copNotify')
		dispatch()
	end
end

RegisterNetEvent('m3:fsociety:boostEngineC')
AddEventHandler('m3:fsociety:boostEngineC', function(vehicle)
	boost = true
	boostedvehicle = vehicle
	Citizen.Wait(100000)
	boost = false
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		if boost then
			if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
				local player = GetPlayerPed(-1)
				local vehicle = GetVehiclePedIsIn(player, false)
				if boostedvehicle == vehicle then
					SetVehicleEnginePowerMultiplier(boostedvehicle, 40.0)
				end
			end
		else
			if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
				local player = GetPlayerPed(-1)
				local vehicle = GetVehiclePedIsIn(player, false)
				if boostedvehicle == vehicle then
					SetVehicleEnginePowerMultiplier(boostedvehicle, 0.0)
					boostedvehicle = nil
				end
			end
		end
	end
end)

function poldata()
	if not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
		ESX.TriggerServerCallback('m3:fsociety:getTime', function(ostime)
			ESX.TriggerServerCallback('m3:fsociety:poldataTime', function(dbpoldatatime)
				TriggerEvent('m3:invUseable', false)
				local remainingtime = ostime - dbpoldatatime
				if ostime - dbpoldatatime <= 172800 then
					TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = '' .. math.floor((172800 - remainingtime) / 60) .. ' dakika sonra tekrar dene!'})
				elseif ostime - dbpoldatatime >= 172800 then
					TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', text = 'Sicil kaydı silmek istediğiniz kişinin kimlik numarasını giriniz!', length = 5000})
					DisplayOnscreenKeyboard(1, "", "", "", "", "", "", 30)
					while (UpdateOnscreenKeyboard() == 0) do
						DisableAllControlActions(0)
						Wait(0)
					end
					if (GetOnscreenKeyboardResult()) then
						idnumber = GetOnscreenKeyboardResult()
						TriggerEvent("mhacking:show")
						TriggerEvent("mhacking:start", 3, 20, mhpoldata)
					end
				end
				TriggerEvent('m3:invUseable', true)
			end)
		end)
	else
		TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Bu özellik araçtayken kullanılamaz.'})
	end
end

function mhpoldata(success)
	TriggerEvent('mhacking:hide')
	if success then
		local giveexp = math.random(1, 3)
		TriggerServerEvent('m3:fsociety:giveExp', giveexp)
		TriggerServerEvent('m3:fsociety:deletePolData', idnumber)
		TriggerServerEvent('m3:fsociety:poldataTimeUpdate')
	else
		TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Başaramadın! Konumun ifşa oldu!'})
		failed = true
		-- TriggerServerEvent('m3:fsociety:copNotify')
		dispatch()
	end
	idnumber = nil
end

function idenhack()
	if not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
		if GetGameTimer() - lastident > 20 * 60000 then
			TriggerEvent('m3:invUseable', false)
			TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', text = 'Kimliğini öğrenmek istediğiniz kişinin telefon numarasını giriniz!', length = 5000})
			DisplayOnscreenKeyboard(1, "", "", "", "", "", "", 30)
			while (UpdateOnscreenKeyboard() == 0) do
				DisableAllControlActions(0)
				Wait(0)
			end
			if (GetOnscreenKeyboardResult()) then
				iphone_number = GetOnscreenKeyboardResult()
				TriggerEvent("mhacking:show")
				TriggerEvent("mhacking:start", 4, 30, mhident)
				TriggerEvent('m3:invUseable', true)
			end
		else
			local itime = 20 * 60000 - (GetGameTimer() - lastident)
			TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = '' .. math.floor(itime / 60000 + 1) .. ' dakika sonra tekrar dene!'})
			TriggerEvent('m3:invUseable', true)
		end
	else
		TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Bu özellik araçtayken kullanılamaz.'})
	end
end

function mhident(success)
	TriggerEvent('mhacking:hide')
	if success then
		ESX.TriggerServerCallback('m3:fsociety:getIdent', function(job, name, lname)
			if job ~= nil and name ~= nil and lname ~= nil then
				TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', text = 'İsim Soyisim: ' .. name .. ' ' .. lname .. ' Meslek: ' .. job .. ''})
			else
				TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Numara sahibi bulunamadı!'})
			end
		end, iphone_number)
		local giveexp = math.random(1, 3)
		TriggerServerEvent('m3:fsociety:giveExp', giveexp)
		iphone_number = nil
		lastident = GetGameTimer()
	else
		TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Başaramadın! Konumun ifşa oldu!'})
		failed = true
		-- TriggerServerEvent('m3:fsociety:copNotify')
		dispatch()
	end
end

function creditcard()
	if not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
		if GetGameTimer() - lastcredit > 5 * 60000 then
			TriggerEvent("mhacking:show")
			TriggerEvent("mhacking:start", 3, 15, mhcredit)
		else
			local time = 5 * 60000 - (GetGameTimer() - lastcredit)
			TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = '' .. math.floor(time / 60000 + 1) .. ' dakika sonra tekrar dene!'})
		end
	else
		TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Bu özellik araçtayken kullanılamaz.'})
	end
end

function mhcredit(success)
	TriggerEvent('mhacking:hide')
	if success then
		local givemoney = math.random(1800, 2400)
		local giveexp = math.random(10, 25)
		TriggerServerEvent('m3:fsociety:giveMoney', givemoney)
		TriggerServerEvent('m3:fsociety:giveExp', giveexp)
		lastcredit = GetGameTimer()
	else
		TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Başaramadın! Konumun ifşa oldu!'})
		failed = true
		-- TriggerServerEvent('m3:fsociety:copNotify')
		dispatch()
	end
end

function vehiclelock()
	if not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
		local player = GetPlayerPed(-1)
		local pCoords = GetEntityCoords(player, true)

		if IsAnyVehicleNearPoint(pCoords.x, pCoords.y, pCoords.z, 3.0) then
			local vehicle = ESX.Game.GetVehicleInDirection()
			if DoesEntityExist(vehicle) then
				TriggerEvent("mhacking:show")
				TriggerEvent("mhacking:start", 4, 30, mhvehicle)
			else
				TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Araca doğru dönmen gerekiyor!'})
			end
		else
			TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Yakınında herhangi bir araç yok!'})
		end
	else
		TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Bu özellik araçtayken kullanılamaz.'})
	end
end

function mhvehicle(success)
	local vehicle = ESX.Game.GetVehicleInDirection()
	TriggerEvent('mhacking:hide')
	if success then
		local giveexp = math.random(1, 3)
		TriggerServerEvent('m3:fsociety:giveExp', giveexp)
		TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, "unlock", 1.0)
		SetVehicleDoorsLocked(vehicle, 1)
		SetVehicleDoorsLockedForAllPlayers(vehicle, false)
		SetVehicleLights(vehicle, 2)
		Citizen.Wait(150)
		SetVehicleLights(vehicle, 0)
		Citizen.Wait(150)
		SetVehicleLights(vehicle, 2)
		Citizen.Wait(150)
		SetVehicleLights(vehicle, 0)
		TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', text = 'Aracın kilidi açıldı.'})
	else
		TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Başaramadın! Konumun ifşa oldu!'})
		failed = true
		-- TriggerServerEvent('m3:fsociety:copNotify')
		dispatch()
	end
end

function countlspd()
	TriggerEvent("mhacking:show")
	TriggerEvent("mhacking:start", 3, 30, mhcountlspd)
end

function mhcountlspd(success)
	TriggerEvent('mhacking:hide')
	if success then
		local giveexp = math.random(1, 3)
		TriggerServerEvent('m3:fsociety:giveExp', giveexp)
		ESX.TriggerServerCallback('m3:fsociety:copCount', function(count)
			TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', text = 'Aktif ' .. count .. ' LSPD çalışanı var!', length = 4000})
		end)
	else
		TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Başaramadın! Konumun ifşa oldu!'})
		failed = true
		-- TriggerServerEvent('m3:fsociety:copNotify')
		dispatch()
	end
end

function enginecrash()
	if not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
		local player = GetPlayerPed(-1)
		local pCoords = GetEntityCoords(player, true)

		if IsAnyVehicleNearPoint(pCoords.x, pCoords.y, pCoords.z, 3.0) then
			local vehicle = ESX.Game.GetVehicleInDirection()
			if DoesEntityExist(vehicle) then
				TriggerEvent("mhacking:show")
				TriggerEvent("mhacking:start", 3, 20, mhengine)
			else
				TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Araca doğru dönmen gerekiyor!'})
			end
		else
			TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Yakınında herhangi bir araç yok!'})
		end
	else
		TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Bu özellik araçtayken kullanılamaz.'})
	end
end

function mhengine(success)
	local vehicle = ESX.Game.GetVehicleInDirection()
	TriggerEvent('mhacking:hide')
	if success then
		local giveexp = math.random(1, 3)
		TriggerServerEvent('m3:fsociety:giveExp', giveexp)
		TriggerServerEvent('m3:fsociety:engineCrash', vehicle)
		lastengine = GetGameTimer()
	else
		TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Başaramadın! Konumun ifşa oldu!'})
		failed = true
		-- TriggerServerEvent('m3:fsociety:copNotify')
		dispatch()
	end
end

RegisterNetEvent('m3:fsociety:engineCrashC')
AddEventHandler('m3:fsociety:engineCrashC', function(veh)
	local vehicle = veh
	local newvehicle = ESX.Game.GetVehicleInDirection()

	if newvehicle == vehicle then
		SetVehicleEngineHealth(vehicle, 0.0)
	end
end)

function radiodrop()
	TriggerEvent('m3:invUseable', false)
	if GetGameTimer() - lastradio > 5 * 60000 then
		TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', text = 'Telsizden düşürmek istediğiniz kişinin telefon numarasını giriniz!', length = 5000})
		DisplayOnscreenKeyboard(1, "", "", "", "", "", "", 30)
		while (UpdateOnscreenKeyboard() == 0) do
			DisableAllControlActions(0)
			Wait(0)
		end
		if (GetOnscreenKeyboardResult()) then
			phone_number = GetOnscreenKeyboardResult()
			TriggerEvent("mhacking:show")
			TriggerEvent("mhacking:start", 4, 20, mhradio)
			TriggerEvent('m3:invUseable', true)
		end
	else
		local rtime = 5 * 60000 - (GetGameTimer() - lastradio)
		TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = '' .. math.floor(rtime / 60000 + 1) .. ' dakika sonra tekrar dene!'})
		TriggerEvent('m3:invUseable', true)
	end
end

function mhradio(success)
	TriggerEvent('mhacking:hide')
	if success then
		local giveexp = math.random(1, 3)
		TriggerServerEvent('m3:fsociety:giveExp', giveexp)
		TriggerServerEvent('m3:fsociety:radioDrop', phone_number)
		phone_number = nil
		lastradio = GetGameTimer()
	else
		TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Başaramadın! Konumun ifşa oldu!'})
		failed = true
		-- TriggerServerEvent('m3:fsociety:copNotify')
		dispatch()
	end
end

RegisterNetEvent('m3:fsociety:radioDropC')
AddEventHandler('m3:fsociety:radioDropC', function()
	droprad()
	TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Telsizden hackerler tarafından düşürüldün!', length = 5000})
end)

function droprad()
	local playerName = GetPlayerName(PlayerId())
	local getPlayerRadioChannel = exports.tokovoip_script:getPlayerData(playerName, "radio:channel")

	if getPlayerRadioChannel ~= "nil" then
		exports.tokovoip_script:removePlayerFromRadio(getPlayerRadioChannel)
		exports.tokovoip_script:setPlayerData(playerName, "radio:channel", "nil", true)
		exports['mythic_notify']:DoHudText('error', 'Kanaldan düştün. Düştüğün kanal: '.. getPlayerRadioChannel .. '.00 MHz </b>')
	end
end

function stealbank()
	if not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
		ESX.TriggerServerCallback('m3:fsociety:getTime', function(ostime)
			ESX.TriggerServerCallback('m3:fsociety:bankTime', function(dbbanktime)
				TriggerEvent('m3:invUseable', false)
				local remainingtime = ostime - dbbanktime
				if ostime - dbbanktime <= 86400 then
					TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = '' .. math.floor((86400 - remainingtime) / 60) .. ' dakika sonra tekrar dene!'})
					TriggerEvent('m3:invUseable', true)
				elseif ostime - dbbanktime >= 86400 then
					TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', text = 'Bankasından para çalmak istediğiniz kişinin telefon numarasını giriniz!', length = 5000})
					DisplayOnscreenKeyboard(1, "", "", "", "", "", "", 30)
					while (UpdateOnscreenKeyboard() == 0) do
						DisableAllControlActions(0)
						Wait(0)
					end
					if (GetOnscreenKeyboardResult()) then
						bphone_number = GetOnscreenKeyboardResult()
						TriggerEvent("mhacking:show")
						TriggerEvent("mhacking:start", 2, 20, mhbank)
						TriggerEvent('m3:invUseable', true)
					end
				end
			end)
		end)
	else
		TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Bu özellik araçtayken kullanılamaz.'})
	end
end

function mhbank(success)
	TriggerEvent('mhacking:hide')
	if success then
		local giveexp = math.random(1, 3)
		TriggerServerEvent('m3:fsociety:giveExp', giveexp)
		TriggerServerEvent('m3:fsociety:stealBank', bphone_number)
		TriggerServerEvent('m3:fsociety:bankTimeUpdate')
	else
		TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Başaramadın! Konumun ifşa oldu!'})
		failed = true
		-- TriggerServerEvent('m3:fsociety:copNotify')
		dispatch()
	end
	bphone_number = nil
end

function twitterhack()
	if not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
		ESX.TriggerServerCallback('m3:fsociety:getTime', function(ostime)
			ESX.TriggerServerCallback('m3:fsociety:twitTime', function(dbtwittime)
				TriggerEvent('m3:invUseable', false)
				local remainingtime = ostime - dbtwittime
				if ostime - dbtwittime <= 172800 then
					TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = '' .. math.floor((172800 - remainingtime) / 60) .. ' dakika sonra tekrar dene!'})
				elseif ostime - dbtwittime >= 172800 then
					TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', text = 'Şifresini öğrenmek istediğiniz hesabın kullanıcı adını yazınız!', length = 5000})
					DisplayOnscreenKeyboard(1, "", "", "", "", "", "", 30)
					while (UpdateOnscreenKeyboard() == 0) do
						DisableAllControlActions(0)
						Wait(0)
					end
					if (GetOnscreenKeyboardResult()) then
						username = GetOnscreenKeyboardResult()
						TriggerEvent("mhacking:show")
						TriggerEvent("mhacking:start", 4, 20, mhtwit)
					end
				end
				TriggerEvent('m3:invUseable', true)
			end)
		end)
	else
		TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Bu özellik araçtayken kullanılamaz.'})
	end
end

function mhtwit(success)
	TriggerEvent('mhacking:hide')
	if success then
		local giveexp = math.random(1, 3)
		TriggerServerEvent('m3:fsociety:giveExp', giveexp)
		ESX.TriggerServerCallback('m3:fsociety:twitPass', function(password)
			if password ~= nil then
				TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', text = 'Şifreyi kırdın! Şifre: ' .. password .. '', length = 7000})
			else
				TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Şifreyi kıramadın!'})
			end
		end, username)
		TriggerServerEvent('m3:fsociety:twitTimeUpdate')
	else
		TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Başaramadın! Konumun ifşa oldu!'})
		failed = true
		-- TriggerServerEvent('m3:fsociety:copNotify')
		dispatch()
	end
	username = nil
end

function radiohack()
	ESX.TriggerServerCallback('m3:fsociety:getTime', function(ostime)
		ESX.TriggerServerCallback('m3:fsociety:radioTime', function(dbradiotime)
			local remainingtime = ostime - dbradiotime
			if ostime - dbradiotime <= 86400 then
				TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = '' .. math.floor((86400 - remainingtime) / 60) .. ' dakika sonra tekrar dene!'})
			elseif ostime - dbradiotime >= 86400 then
				TriggerEvent("mhacking:show")
				TriggerEvent("mhacking:start", 2, 15, mhleakradio)
			end
		end)
	end)
end

function mhleakradio(success)
	TriggerEvent('mhacking:hide')
	if success then
		local giveexp = math.random(1, 3)
		TriggerServerEvent('m3:fsociety:giveExp', giveexp)
		ESX.TriggerServerCallback('m3:fsociety:getItemAmount', function(count)
			if count >= 1 then
				TriggerServerEvent('m3:fsociety:radioTimeUpdate')
				local playerName = GetPlayerName(PlayerId())
				local getPlayerRadioChannel = exports.tokovoip_script:getPlayerData(playerName, "radio:channel")
				exports.tokovoip_script:removePlayerFromRadio(getPlayerRadioChannel)
				exports.tokovoip_script:setPlayerData(playerName, "radio:channel", 1, true);
				exports.tokovoip_script:addPlayerToRadio(1)
				TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', text = 'Bağlantı 15 dakika sonra kopacaktır!', length = 6000})
				Citizen.Wait(900000)
				droprad()
				TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Bağlantı koptu!', length = 5000})
			else
				TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Telsize sahip değilsin!'})
			end
		end, 'radio')
	else
		TriggerEvent('mythic_notify:client:SendAlert', { type = 'error', text = 'Başaramadın! Konumun ifşa oldu!'})
		failed = true
		-- TriggerServerEvent('m3:fsociety:copNotify')
		dispatch()
	end
end

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		ESX.UI.Menu.CloseAll()
	end
end)
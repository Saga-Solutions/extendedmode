ESX = nil
level1 = 200
level2 = 450
level3 = 750
level4 = 1100
level5 = 1500
level6 = 1950
level7 = 2450


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('m3:fsociety:copCount', function(source, cb)
	local xPlayers = ESX.GetPlayers()

	copConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			copConnected = copConnected + 1
		end
	end

	cb(copConnected)
end)

RegisterCommand('hackertablet', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.fetchAll('SELECT * FROM m3_fsociety WHERE identifier = @identifier', {['@identifier'] = xPlayer.identifier}, function(result)
		if result[1] == nil then
			MySQL.Async.execute('INSERT INTO m3_fsociety (identifier) VALUES (@identifier)',{
				['@identifier'] = xPlayer.identifier})
		else
			if result[1].level == 0 and result[1].currentexp >= level1 then
				MySQL.Async.execute("UPDATE m3_fsociety SET level = @level WHERE identifier = @identifier", {['@identifier'] = xPlayer.identifier, ['level'] = 1})
				TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'Level 1 özelliklerine erişimin açıldı!', length = 4000})
			elseif result[1].level == 1 and result[1].currentexp >= level2 then
				MySQL.Async.execute("UPDATE m3_fsociety SET level = @level WHERE identifier = @identifier", {['@identifier'] = xPlayer.identifier, ['level'] = 2})
				TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'Level 2 özelliklerine erişimin açıldı!', length = 4000})
			elseif result[1].level == 2 and result[1].currentexp >= level3 then
				MySQL.Async.execute("UPDATE m3_fsociety SET level = @level WHERE identifier = @identifier", {['@identifier'] = xPlayer.identifier, ['level'] = 3})
				TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'Level 3 özelliklerine erişimin açıldı!', length = 4000})
			elseif result[1].level == 3 and result[1].currentexp >= level4 then
				MySQL.Async.execute("UPDATE m3_fsociety SET level = @level WHERE identifier = @identifier", {['@identifier'] = xPlayer.identifier, ['level'] = 4})
				TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'Level 4 özelliklerine erişimin açıldı!', length = 4000})
			elseif result[1].level == 4 and result[1].currentexp >= level5 then
				MySQL.Async.execute("UPDATE m3_fsociety SET level = @level WHERE identifier = @identifier", {['@identifier'] = xPlayer.identifier, ['level'] = 5})
				TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'Level 5 özelliklerine erişimin açıldı!', length = 4000})
			elseif result[1].level == 5 and result[1].currentexp >= level6 then
				MySQL.Async.execute("UPDATE m3_fsociety SET level = @level WHERE identifier = @identifier", {['@identifier'] = xPlayer.identifier, ['level'] = 6})
				TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'Level 6 özelliklerine erişimin açıldı!', length = 4000})
			elseif result[1].level == 6 and result[1].currentexp >= level7 then
				MySQL.Async.execute("UPDATE m3_fsociety SET level = @level WHERE identifier = @identifier", {['@identifier'] = xPlayer.identifier, ['level'] = 7})
				TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'Level 7 özelliklerine erişimin açıldı!', length = 4000})
			end
		end
	end)
	TriggerClientEvent('m3:fsociety:usedTablet', source)

end)

ESX.RegisterServerCallback('m3:fsociety:getItemAmount', function(source, cb, item)
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

ESX.RegisterServerCallback('m3:fsociety:getLevel', function(source, cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	MySQL.Async.fetchAll('SELECT * FROM m3_fsociety WHERE identifier = @identifier', {
		['@identifier'] = xPlayer.identifier,
	}, function(result)
		if result[1] ~= nil then
			cb(result[1].level, result[1].currentexp)
		else
			cb(0)
		end
	end)
end)

ESX.RegisterServerCallback('m3:fsociety:getIdent', function(source, cb, phone_number)
	MySQL.Async.fetchAll('SELECT * FROM users WHERE phone_number = @phone_number', {
		['@phone_number'] = phone_number,
	}, function(result)
		if result[1] ~= nil then
			MySQL.Async.fetchAll('SELECT * FROM jobs WHERE name = @name', {
				['@name'] = result[1].job,
			}, function(jlabel)
				if jlabel[1] ~= nil then
					results = {}
					table.insert(results, {
						job   = jlabel[1].label,
						name  = result[1].firstname,
						lname  = result[1].lastname
					})

					cb(jlabel[1].label, result[1].firstname, result[1].lastname)
				else
					cb(nil)
				end
			end)
		else
			cb(nil)
		end
	end)
end)

ESX.RegisterServerCallback('m3:fsociety:getIdentfromPh', function(source, cb, phone_number)
	MySQL.Async.fetchAll('SELECT * FROM users WHERE phone_number = @phone_number', {['@phone_number'] = phone_number}, function(result)
		if result[1] ~= nil then
			local xPlayers = ESX.GetPlayers()

			for i=1, #xPlayers, 1 do
				local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
				if xPlayer.identifier == result[1].identifier then
					cb(tonumber(xPlayer.source))
				end
			end
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Telefon numarası bulunamadı!', length = 4000})
			cb(0)
		end
	end)
end)

ESX.RegisterUsableItem('hackertablet', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	MySQL.Async.fetchAll('SELECT * FROM m3_fsociety WHERE identifier = @identifier', {['@identifier'] = xPlayer.identifier}, function(result)
		if result[1] == nil then
			MySQL.Async.execute('INSERT INTO m3_fsociety (identifier) VALUES (@identifier)',{
				['@identifier'] = xPlayer.identifier})
		else
			if result[1].level == 0 and result[1].currentexp >= level1 then
				MySQL.Async.execute("UPDATE m3_fsociety SET level = @level WHERE identifier = @identifier", {['@identifier'] = xPlayer.identifier, ['level'] = 1})
				TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'Level 1 özelliklerine erişimin açıldı!', length = 4000})
			elseif result[1].level == 1 and result[1].currentexp >= level2 then
				MySQL.Async.execute("UPDATE m3_fsociety SET level = @level WHERE identifier = @identifier", {['@identifier'] = xPlayer.identifier, ['level'] = 2})
				TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'Level 2 özelliklerine erişimin açıldı!', length = 4000})
			elseif result[1].level == 2 and result[1].currentexp >= level3 then
				MySQL.Async.execute("UPDATE m3_fsociety SET level = @level WHERE identifier = @identifier", {['@identifier'] = xPlayer.identifier, ['level'] = 3})
				TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'Level 3 özelliklerine erişimin açıldı!', length = 4000})
			elseif result[1].level == 3 and result[1].currentexp >= level4 then
				MySQL.Async.execute("UPDATE m3_fsociety SET level = @level WHERE identifier = @identifier", {['@identifier'] = xPlayer.identifier, ['level'] = 4})
				TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'Level 4 özelliklerine erişimin açıldı!', length = 4000})
			elseif result[1].level == 4 and result[1].currentexp >= level5 then
				MySQL.Async.execute("UPDATE m3_fsociety SET level = @level WHERE identifier = @identifier", {['@identifier'] = xPlayer.identifier, ['level'] = 5})
				TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'Level 5 özelliklerine erişimin açıldı!', length = 4000})
			elseif result[1].level == 5 and result[1].currentexp >= level6 then
				MySQL.Async.execute("UPDATE m3_fsociety SET level = @level WHERE identifier = @identifier", {['@identifier'] = xPlayer.identifier, ['level'] = 6})
				TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'Level 6 özelliklerine erişimin açıldı!', length = 4000})
			elseif result[1].level == 6 and result[1].currentexp >= level7 then
				MySQL.Async.execute("UPDATE m3_fsociety SET level = @level WHERE identifier = @identifier", {['@identifier'] = xPlayer.identifier, ['level'] = 7})
				TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'Level 7 özelliklerine erişimin açıldı!', length = 4000})
			end
		end
	end)
	TriggerClientEvent('m3:fsociety:usedTablet', source)
end)

RegisterServerEvent('m3:fsociety:giveMoney')
AddEventHandler('m3:fsociety:giveMoney', function(money)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.addBank(money)
	TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = '' .. money .. '$ kazandın!', length = 4000})
end)

RegisterServerEvent('m3:fsociety:giveExp')
AddEventHandler('m3:fsociety:giveExp', function(exp)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	MySQL.Async.fetchAll('SELECT * FROM m3_fsociety WHERE identifier = @identifier', {['@identifier'] = xPlayer.identifier}, function(result)

		MySQL.Async.execute("UPDATE m3_fsociety SET currentexp = @currentexp WHERE identifier = @identifier", {['@identifier'] = xPlayer.identifier, ['currentexp'] = result[1].currentexp + exp})
		TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = '' .. exp .. ' deneyim puanı kazandın!', length = 4000})

	end)
end)

RegisterServerEvent('m3:fsociety:gpshack')
AddEventHandler('m3:fsociety:gpshack', function()
	local xPlayers = ESX.GetPlayers()

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('m3:fsociety:gpshackC', xPlayer.source)
	end
end)

RegisterServerEvent('m3:fsociety:copNotify')
AddEventHandler('m3:fsociety:copNotify', function()
	local xPlayers = ESX.GetPlayers()

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
			TriggerClientEvent('m3:fsociety:copNotifyC', xPlayer.source)
		end
	end
end)

RegisterServerEvent('m3:fsociety:blip')
AddEventHandler('m3:fsociety:blip', function(hackerPos)
	local xPlayers = ESX.GetPlayers()

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' then
			TriggerClientEvent('m3:fsociety:blipC', xPlayer.source, hackerPos)
		end
	end
end)


ESX.RegisterServerCallback('m3:fsociety:gpsTime', function(source, cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	MySQL.Async.fetchAll('SELECT * FROM m3_fsociety WHERE identifier = @identifier', {['@identifier'] = xPlayer.identifier}, function(result)
		if result[1] then
			cb(result[1].gpstime)
		else
			cb(nil)
		end
	end)
end)

RegisterServerEvent('m3:fsociety:gpsTimeUpdate')
AddEventHandler('m3:fsociety:gpsTimeUpdate', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	MySQL.Async.execute("UPDATE m3_fsociety SET gpstime = @gpstime WHERE identifier = @identifier", {['@identifier'] = xPlayer.identifier, ['gpstime'] = os.time()})
end)

RegisterServerEvent('m3:fsociety:boostEngine')
AddEventHandler('m3:fsociety:boostEngine', function(vehicle)
	local xPlayers = ESX.GetPlayers()

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('m3:fsociety:boostEngineC', xPlayer.source, vehicle)
	end
end)

RegisterServerEvent('m3:fsociety:engineCrash')
AddEventHandler('m3:fsociety:engineCrash', function(vehicle)
	local xPlayers = ESX.GetPlayers()

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('m3:fsociety:engineCrashC', xPlayer.source, vehicle)
	end
end)

RegisterServerEvent('m3:fsociety:radioDrop')
AddEventHandler('m3:fsociety:radioDrop', function(phone_number)
	local _source = source
	MySQL.Async.fetchAll('SELECT * FROM users WHERE phone_number = @phone_number', {['@phone_number'] = phone_number}, function(result)
		if result[1] ~= nil then
			local xPlayers = ESX.GetPlayers()

			for i=1, #xPlayers, 1 do
				local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
				if xPlayer.identifier == result[1].identifier then
					TriggerClientEvent('m3:fsociety:radioDropC', xPlayer.source)
				end
			end
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'Telefon numarası bulunamadı!', length = 4000})
		end
	end)
end)

ESX.RegisterServerCallback('m3:fsociety:getTime', function(source, cb)
	cb(os.time())
end)

ESX.RegisterServerCallback('m3:fsociety:bankTime', function(source, cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	MySQL.Async.fetchAll('SELECT * FROM m3_fsociety WHERE identifier = @identifier', {['@identifier'] = xPlayer.identifier}, function(result)
		if result[1] then
			cb(result[1].banktime)
		else
			cb(nil)
		end
	end)
end)

RegisterServerEvent('m3:fsociety:bankTimeUpdate')
AddEventHandler('m3:fsociety:bankTimeUpdate', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	MySQL.Async.execute("UPDATE m3_fsociety SET banktime = @banktime WHERE identifier = @identifier", {['@identifier'] = xPlayer.identifier, ['banktime'] = os.time()})
end)

RegisterServerEvent('m3:fsociety:stealBank')
AddEventHandler('m3:fsociety:stealBank', function(phone_number)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	MySQL.Async.fetchAll('SELECT * FROM users WHERE phone_number = @phone_number', {['@phone_number'] = phone_number}, function(result)
		if result[1] ~= nil then
			local xPlayers = ESX.GetPlayers()

			for i=1, #xPlayers, 1 do
				local xTarget = ESX.GetPlayerFromId(xPlayers[i])
				if xTarget.identifier == result[1].identifier then
					local money = result[1].bank / 20
					xTarget.removeBank(money)
					TriggerClientEvent('mythic_notify:client:SendAlert', xTarget.source, { type = 'error', text = 'Hackerlar banka hesabını soydu! %5 oranında para kaybettin!', length = 4000})
					xPlayer.addBank(money)
				end
			end
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'Telefon numarası bulunamadı!', length = 4000})
		end
	end)
end)

ESX.RegisterServerCallback('m3:fsociety:twitTime', function(source, cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	MySQL.Async.fetchAll('SELECT * FROM m3_fsociety WHERE identifier = @identifier', {['@identifier'] = xPlayer.identifier}, function(result)
		if result[1] then
			cb(result[1].twittime)
		else
			cb(nil)
		end
	end)
end)

RegisterServerEvent('m3:fsociety:twitTimeUpdate')
AddEventHandler('m3:fsociety:twitTimeUpdate', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	MySQL.Async.execute("UPDATE m3_fsociety SET twittime = @twittime WHERE identifier = @identifier", {['@identifier'] = xPlayer.identifier, ['twittime'] = os.time()})
end)

ESX.RegisterServerCallback('m3:fsociety:twitPass', function(source, cb, username)
	MySQL.Async.fetchAll('SELECT * FROM twitter_accounts WHERE username = @username', {['@username'] = username}, function(result)
		if result[1] then
			cb(result[1].password)
		else
			cb(false)
		end
	end)
end)

ESX.RegisterServerCallback('m3:fsociety:radioTime', function(source, cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	MySQL.Async.fetchAll('SELECT * FROM m3_fsociety WHERE identifier = @identifier', {['@identifier'] = xPlayer.identifier}, function(result)
		if result[1] then
			cb(result[1].radiotime)
		else
			cb(nil)
		end
	end)
end)

RegisterServerEvent('m3:fsociety:radioTimeUpdate')
AddEventHandler('m3:fsociety:radioTimeUpdate', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	MySQL.Async.execute("UPDATE m3_fsociety SET radiotime = @radiotime WHERE identifier = @identifier", {['@identifier'] = xPlayer.identifier, ['radiotime'] = os.time()})
end)

ESX.RegisterServerCallback('m3:fsociety:poldataTime', function(source, cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	MySQL.Async.fetchAll('SELECT * FROM m3_fsociety WHERE identifier = @identifier', {['@identifier'] = xPlayer.identifier}, function(result)
		if result[1] then
			cb(result[1].poldatatime)
		else
			cb(nil)
		end
	end)
end)

RegisterServerEvent('m3:fsociety:poldataTimeUpdate')
AddEventHandler('m3:fsociety:poldataTimeUpdate', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	MySQL.Async.execute("UPDATE m3_fsociety SET poldatatime = @poldatatime WHERE identifier = @identifier", {['@identifier'] = xPlayer.identifier, ['poldatatime'] = os.time()})
end)

RegisterServerEvent('m3:fsociety:deletePolData')
AddEventHandler('m3:fsociety:deletePolData', function(idnumber)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	MySQL.Async.fetchAll('SELECT * FROM users WHERE lastdigits = @lastdigits', {['@lastdigits'] = idnumber}, function(result)
		if result[1] ~= nil then
			MySQL.Async.fetchAll('SELECT * FROM jsfour_criminalrecord WHERE identifier = @identifier', {['@identifier'] = result[1].identifier}, function(result2)
				if result2[1] ~= nil then
					if xPlayer.getBank() >= 42000 then
						xPlayer.removeBank(42000)
						MySQL.Async.execute('UPDATE jsfour_criminalrecord SET classified = @classified WHERE identifier = @identifier',{['@identifier'] = result[1].identifier, ['@classified'] = 1})
						TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'Kimlik numarasına ait 1 adet sicil kaydı erişilemez hale getirildi!', length = 4000})
					else
						TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'Bankanda yeterli paran yok!', length = 4000})
					end
				else
					TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'Sicil kaydı bulunamadı!', length = 4000})
				end
			end)
		end
	end)
end)
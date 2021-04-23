ESX = nil
local lastStarted = 0

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('kaypuz:addMoney')
AddEventHandler('kaypuz:addMoney', function(amount)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local kkypz = 2000
	xPlayer.addInventoryItem('black_money', kkypz)
end)


RegisterServerEvent('kaypuz:rolexsat')
AddEventHandler('kaypuz:rolexsat', function(item)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	local item = xPlayer.getInventoryItem('rolex')
	local miktar = math.random(1, 2)


	if item.count >=  miktar then 
		xPlayer.removeInventoryItem('rolex', miktar)
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Müşteri Malları Çok Beğendi Birdahaki Sefere Yine Senden Alacagını Söylüyor.!'})
	else 
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Üzerinizde Satabiliceğiniz Bir Eşya Bulunmamakta!' })
	end 
end)

ESX.RegisterServerCallback('kaypuz:getItemAmount', function(source, cb, item)
    local xPlayer = ESX.GetPlayerFromId(source)
    local qtty = xPlayer.getInventoryItem(item).count
    
    cb(qtty)
end)
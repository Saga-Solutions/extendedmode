enableprice = true -- true = carwash is paid, false = carwash is free

price = 10

RegisterServerEvent('esx_carwash:checkmoney')
AddEventHandler('esx_carwash:checkmoney', function ()
	if enableprice == true then
		TriggerEvent('es:getPlayerFromId', source, function (user)
			userMoney = user.getMoney()
			if userMoney >= price then
				user.removeMoney(price)
				TriggerClientEvent('esx_carwash:success', source, price)
			else
				moneyleft = price - userMoney
				TriggerClientEvent('esx_carwash:notenoughmoney', source, moneyleft)
			end
		end)
	else
		TriggerClientEvent('esx_carwash:free', source)
	end
end)
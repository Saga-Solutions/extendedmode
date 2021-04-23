ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('bread', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('bread', 1)
	TriggerClientEvent('esx_status:add', source, 'hunger', 400000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = _U('used_bread'), })
end)

ESX.RegisterUsableItem('chocolate', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('chocolate', 1)
	TriggerClientEvent('esx_status:remove', source, 'stress', 350000)
	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEatChocolate', source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = _U('used_chocolate'), })

end)

ESX.RegisterUsableItem('donut', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('donut', 1)
	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEatChocolate', source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = _U('used_donut'), })

end)

ESX.RegisterUsableItem('pizza', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('pizza', 1)
	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEatChocolate', source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = _U('used_pizza'), })

end)

ESX.RegisterUsableItem('hotdog', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('hotdog', 1)
	TriggerClientEvent('esx_status:add', source, 'hunger', 300000)
	TriggerClientEvent('esx_basicneeds:onEathotdog', source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = _U('used_hotdog'), })

end)

ESX.RegisterUsableItem('sandwich', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('sandwich', 1)
	TriggerClientEvent('esx_status:add', source, 'hunger', 300000)
	TriggerClientEvent('esx_basicneeds:onEathotdog', source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = _U('used_sandwich'), })

end)


ESX.RegisterUsableItem('picnic', function(source)
	TriggerClientEvent('esx_extraitems:picnic', source)
	local xPlayer  = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('picnic', 1)
end)


ESX.RegisterUsableItem('oxygen_mask', function(source)
	TriggerClientEvent('esx_extraitems:oxygen_mask', source)
	local xPlayer  = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('oxygen_mask', 1)
end)



ESX.RegisterUsableItem('rose', function(source)
	TriggerClientEvent('esx_extraitems:rose', source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('rose', 1)
end)


ESX.RegisterUsableItem('hamburger', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('hamburger', 1)
	TriggerClientEvent('esx_status:add', source, 'hunger', 320000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = _U('used_hamburger'), })

end)

ESX.RegisterUsableItem('cupcake', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('cupcake', 1)
	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEatCupCake', source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = _U('used_cupcake'), })

end)

ESX.RegisterUsableItem('pancakes', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('pancakes', 1)
	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEatCupCake', source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = _U('used_pancakes'), })

end)

ESX.RegisterUsableItem('frenchtoast', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('frenchtoast', 1)
	TriggerClientEvent('esx_status:add', source, 'hunger', 200000)
	TriggerClientEvent('esx_basicneeds:onEatCupCake', source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = _U('used_frenchtoast'), })

end)

ESX.RegisterUsableItem('chips', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('chips', 1)
	TriggerClientEvent('esx_status:add', source, 'hunger', 150000)
	TriggerClientEvent('esx_basicneeds:onEatChips', source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = _U('used_chips'), })

end)

ESX.RegisterUsableItem('water', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('water', 1)
	TriggerClientEvent('esx_status:add', source, 'thirst', 450000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = _U('used_water'), })

end)

ESX.RegisterUsableItem('sprunk', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('sprunk', 1)
	TriggerClientEvent('esx_status:add', source, 'thirst', 450000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = _U('used_water'), })

end)

ESX.RegisterUsableItem('milkshake', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('milkshake', 1)
	TriggerClientEvent('esx_status:add', source, 'thirst', 250000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = _U('used_milkshake'), })

end)

ESX.RegisterUsableItem('coke', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('coke', 1)
	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrinkCocaCola', source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = _U('used_coke'), })

end)

ESX.RegisterUsableItem('frappuccino', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('frappuccino', 1)
	TriggerClientEvent('esx_status:remove', source, 'stress', 350000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrinkCocaCola', source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = _U('used_frappuccino'), })

end)

ESX.RegisterUsableItem('latte', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('latte', 1)
	TriggerClientEvent('esx_status:remove', source, 'stress', 350000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrinkCocaCola', source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = _U('used_latte'), })

end)

ESX.RegisterUsableItem('coffee', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('coffee', 1)
	TriggerClientEvent('esx_status:remove', source, 'stress', 350000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 200000)
	TriggerClientEvent('esx_basicneeds:onDrinkIceTea', source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = _U('used_coffee'), })

end)

ESX.RegisterUsableItem('wine', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('wine', 1)
	TriggerClientEvent('esx_status:add', source, 'drunk', 100000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 350000)
	TriggerClientEvent('esx_basicneeds:onDrinkWine', source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = _U('used_wine'), })

end)

ESX.RegisterUsableItem('beer', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('beer', 1)
	TriggerClientEvent('esx_status:add', source, 'drunk', 100000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 350000)
	TriggerClientEvent('esx_basicneeds:onDrinkBeer', source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = _U('used_beer'), })

end)

ESX.RegisterUsableItem('vodka', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('vodka', 1)
	TriggerClientEvent('esx_status:add', source, 'drunk', 100000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 350000)
	TriggerClientEvent('esx_basicneeds:onDrinkVodka', source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = _U('used_vodka'), })

end)

ESX.RegisterUsableItem('whisky', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('whisky', 1)
	TriggerClientEvent('esx_status:add', source, 'drunk', 100000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 350000)
	TriggerClientEvent('esx_basicneeds:onDrinkWhisky', source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = _U('used_whisky'), })

end)

ESX.RegisterUsableItem('tequila', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('tequila', 1)
	TriggerClientEvent('esx_status:add', source, 'drunk', 100000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 350000)
	TriggerClientEvent('esx_basicneeds:onDrinkTequila', source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = _U('used_tequila'), })

end)

-- Disco Stuff
ESX.RegisterUsableItem('rum', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('rum', 1)
	TriggerClientEvent('esx_status:add', source, 'drunk', 100000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 350000)
	TriggerClientEvent('esx_basicneeds:onDrinkGin', source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = _U('used_rum'), })

end)

ESX.RegisterUsableItem('absinthe', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('absinthe', 1)
	TriggerClientEvent('esx_status:add', source, 'drunk', 100000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 350000)
	TriggerClientEvent('esx_basicneeds:onDrinkAbsinthe', source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = _U('used_absinthe'), })

end)

ESX.RegisterUsableItem('champagne', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('champagne', 1)
	TriggerClientEvent('esx_status:add', source, 'drunk', 100000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 350000)
	TriggerClientEvent('esx_basicneeds:onDrinkChampagne', source)
	TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = _U('used_champagne'), })

end)

ESX.RegisterUsableItem('cigaret', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local lighter = xPlayer.getInventoryItem('lighter')
	
		if lighter.count > 0 then
			xPlayer.removeInventoryItem('cigaret', 1)
			TriggerClientEvent('esx_basicneeds:startSmoke', source)
			Wait(15000)
			TriggerClientEvent('esx_status:remove', source, 'stress', 350000)
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Stresin azaldı.', length = 4000, style = { ['background-color'] = '#2f5c73', ['color'] = '#ffffff' } })
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Çakmaksız sigaranı yakamazsın.' } )
		end
end)

TriggerEvent('es:addGroupCommand', 'heal', 'admin', function(source, args, user)
	-- heal another player - don't heal source
	if args[1] then
		local playerId = tonumber(args[1])

		-- is the argument a number?
		if playerId then
			-- is the number a valid player?
			if GetPlayerName(playerId) then
				print(('esx_basicneeds: %s healed %s'):format(GetPlayerIdentifier(source, 0), GetPlayerIdentifier(playerId, 0)))
				TriggerClientEvent('esx_basicneeds:healPlayer', playerId)
				TriggerClientEvent('chat:addMessage', source, { args = { '^5HEAL', 'You have been healed.' } })
			else
				TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Player not online.' } })
			end
		else
			TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Invalid player id.' } })
		end
	else
		print(('esx_basicneeds: %s yenilendi'):format(GetPlayerIdentifier(source, 0)))
		TriggerClientEvent('esx_basicneeds:healPlayer', source)
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, {help = 'Heal a player, or yourself - restores thirst, hunger and health.', params = {{name = 'playerId', help = '(optional) player id'}}})
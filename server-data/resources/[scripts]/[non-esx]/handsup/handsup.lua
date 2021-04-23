
local canHandsUp = true

AddEventHandler('handsup:toggle', function(param)
	canHandsUp = param
end)

Citizen.CreateThread(function()
	local handsup = false

	while true do
		Citizen.Wait(0)

		if canHandsUp then
			if IsControlJustReleased(0, 73) then
				local playerPed = PlayerPedId()
				DisableControlAction(0,21,true) -- disable sprint
				DisableControlAction(0,24,true) -- disable attack
				DisableControlAction(0,25,true) -- disable aim
				DisableControlAction(0,47,true) -- disable weapon
				DisableControlAction(0,58,true) -- disable weapon
				DisableControlAction(0,263,true) -- disable melee
				DisableControlAction(0,264,true) -- disable melee
				DisableControlAction(0,257,true) -- disable melee
				DisableControlAction(0,140,true) -- disable melee
				DisableControlAction(0,141,true) -- disable melee
				DisableControlAction(0,142,true) -- disable melee
				DisableControlAction(0,143,true) -- disable melee
				RequestAnimDict('random@mugging3')
				while not HasAnimDictLoaded('random@mugging3') do
					Citizen.Wait(100)
				end

				if handsup then
					handsup = false
					ClearPedSecondaryTask(playerPed)
					TriggerServerEvent('esx_thief:update', handsup)
				else
					handsup = true
					TaskPlayAnim(playerPed, 'random@mugging3', 'handsup_standing_base', 6.0, -6.0, -1, 49, 0, 0, 0, 0)
					TriggerServerEvent('esx_thief:update', handsup)
				end
			end
		end
	end
end)
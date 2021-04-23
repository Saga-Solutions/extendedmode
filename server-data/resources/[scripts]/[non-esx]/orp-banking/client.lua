local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX = nil

local showBankBlips = true
local atBank = false
local bankMenu = true
local inMenu = false
local atATM = false
local bankColor = "green"

local bankLocations = {
    {i = 108, c = 77, x = 237.33, y = 217.78, z = 106.29, s = 0.8, n = "Pacific Bank"}, -- blip id, blip color, x, y, z, scale, name/label
	{i = 108, c = 0, x = 150.266, y = -1040.203, z = 29.374, s = 0.7, n = "Fleeca Bank"},
	{i = 108, c = 0, x = -1212.980, y = -330.841, z = 37.787, s = 0.7, n = "Fleeca Bank"},
	{i = 108, c = 0, x = -2962.582, y = 482.627, z = 15.703, s = 0.7, n = "Fleeca Bank"},
	{i = 108, c = 0, x = -112.202, y = 6469.295, z = 31.626, s = 0.7, n = "Fleeca Bank"},
	{i = 108, c = 0, x = 314.187, y = -278.621, z = 54.170, s = 0.7, n = "Fleeca Bank"},
	{i = 108, c = 0, x = -351.534, y = -49.529, z = 49.042, s = 0.7, n = "Fleeca Bank"},
	{i = 108, c = 0, x = 1175.0643310547, y = 2706.6435546875, z = 38.094036102295, s = 0.7, n = "Fleeca Bank"}
}

-- ATM Object Models
local ATMs = {
    {o = -870868698, c = 'blue'}, 
    {o = -1126237515, c = 'blue'}, 
    {o = -1364697528, c = 'red'}, 
    {o = 506770882, c = 'green'}
}

Citizen.CreateThread(function()
	while ESX == nil or ORP == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(2000)
	end
	Citizen.Wait(2000)
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        if playerNearBank() and not inMenu then
            DisplayHelpText("~INPUT_PICKUP~ basarak bankana eriş!")
            if IsControlJustPressed(0, 38) then
                openPlayersBank('bank')
                local ped = GetPlayerPed(-1)
            end
        end
        if IsControlJustPressed(0, Keys["BACKSPACE"]) then
            inMenu = false
            SetNuiFocus(false, false)
            SendNUIMessage({type = 'close'})
			
        end
    end
end)

RegisterCommand('atm', function(source, args) -- Command to access ATM when players are near instead of spam notifications when near an ATM
    if playerNearATM() then
        openPlayersBank('atm')
        local ped = GetPlayerPed(-1)
    else
        exports['mythic_notify']:SendAlert('error', 'Yakınlarda hiç ATM yok!')
    end
end)

function openPlayersBank(type, color)
    local dict = 'anim@amb@prop_human_atm@interior@male@enter'
    local anim = 'enter'
    local ped = GetPlayerPed(-1)
    local time = 2500

    RequestAnimDict(dict)

    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(7)
    end

    TaskPlayAnim(ped, dict, anim, 8.0, 8.0, -1, 0, 0, 0, 0, 0)
    exports['progressBars']:startUI(time, "Kartı sokuyorsun...")
    Citizen.Wait(time)
    ClearPedTasks(ped)
    if type == 'bank' then
        inMenu = true
        SetNuiFocus(true, true)
        bankColor = "green"
        SendNUIMessage({type = 'openBank', color = bankColor})
        TriggerServerEvent('orp:bank:balance')
        atATM = false
    elseif type == 'atm' then
        inMenu = true
        SetNuiFocus(true, true)
        SendNUIMessage({type = 'openBank', color = bankColor})
        TriggerServerEvent('orp:bank:balance')
        atATM = true
    end
end

function playerNearATM() -- Check if a player is near ATM when they use command /atm
    local ped = GetPlayerPed(-1)
    local pos = GetEntityCoords(ped)

    for i = 1, #ATMs do
        local atm = GetClosestObjectOfType(pos.x, pos.y, pos.z, 1.0, ATMs[i].o, false, false, false)
        local atmPos = GetEntityCoords(atm)
        local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, atmPos.x, atmPos.y, atmPos.z, true)
        if dist < 1.5 then
            bankColor = ATMs[i].c
            return true
        end
    end
end

function playerNearBank() -- Checks if a player is near a bank
    local pos = GetEntityCoords(GetPlayerPed(-1))

    for _, search in pairs(bankLocations) do
        local dist = GetDistanceBetweenCoords(search.x, search.y, search.z, pos.x, pos.y, pos.z, true)

        if dist <= 1.0 then
            color = "green"
            return true
        end
    end
end

local blipsLoaded = false

Citizen.CreateThread(function() -- Add bank blips
    while true do
        Citizen.Wait(2000)
        if not blipsLoaded then
            for k, v in ipairs(bankLocations) do
                local blip = AddBlipForCoord(v.x, v.y, v.z)
		        SetBlipSprite(blip, v.i)
		        SetBlipScale(blip, v.s)
		        SetBlipAsShortRange(blip, true)
			    SetBlipColour(blip, 2)
		        BeginTextCommandSetBlipName("STRING")
		        AddTextComponentString(tostring(v.n))
		        EndTextCommandSetBlipName(blip) 
            end
            blipsLoaded = true
        end
    end
end)

RegisterNetEvent('orp:bank:info')
AddEventHandler('orp:bank:info', function(balance)
    local id = PlayerId()
    local playerName = GetPlayerName(id)

    SendNUIMessage({
		type = "updateBalance",
		balance = balance,
        player = playerName,
		})
end)

RegisterNUICallback('deposit', function(data)
    if not atATM then
        TriggerServerEvent('orp:bank:deposit', tonumber(data.amount))
        TriggerServerEvent('orp:bank:balance')
    else
        exports['mythic_notify']:SendAlert('error', 'ATMn\'ye para yatıramazsın!')
    end
end)

RegisterNUICallback('withdrawl', function(data)
    TriggerServerEvent('orp:bank:withdraw', tonumber(data.amountw))
    TriggerServerEvent('orp:bank:balance')
end)

RegisterNUICallback('balance', function()
    TriggerServerEvent('orp:bank:balance')
end)

RegisterNetEvent('orp:balance:back')
AddEventHandler('orp:balance:back', function(balance)
    SendNUIMessage({type = 'balanceReturn', bal = balance})
end)

function closePlayersBank()
    local dict = 'anim@amb@prop_human_atm@interior@male@exit'
    local anim = 'exit'
    local ped = GetPlayerPed(-1)
    local time = 1800

    RequestAnimDict(dict)

    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(7)
    end

    SetNuiFocus(false, false)
    SendNUIMessage({type = 'closeAll'})
    TaskPlayAnim(ped, dict, anim, 8.0, 8.0, -1, 0, 0, 0, 0, 0)
    exports['progressBars']:startUI(time, "Kartını alıyorsun...")
    Citizen.Wait(time)
    ClearPedTasks(ped)
    inMenu = false
end

RegisterNUICallback('transfer', function(data)
    TriggerServerEvent('orp:bank:transfer', data.to, data.amountt)
    TriggerServerEvent('orp:bank:balance')
end)

RegisterNetEvent('orp:bank:notify')
AddEventHandler('orp:bank:notify', function(type, message)
    exports['mythic_notify']:SendAlert(type, message)
end)

AddEventHandler('onResourceStop', function(resource)
    inMenu = false
    SetNuiFocus(false, false)
    SendNUIMessage({type = 'closeAll'})
end)

RegisterNUICallback('NUIFocusOff', function()
    closePlayersBank()
end)

function DisplayHelpText(str)
    SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end
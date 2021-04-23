ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



RegisterServerEvent("dispatch:svNotify")
AddEventHandler("dispatch:svNotify", function(data)
    local xPlayers = ESX.GetPlayers()
    TriggerClientEvent('dispatch:clNotify', -1, data)
    if data.dispatchCode == '10-71A' then
        for i=1, #xPlayers do 
            local player = ESX.GetPlayerFromId(xPlayers[i])
            if player then
                if player.job.name == 'police' then
                    TriggerClientEvent('ia-outlawalert:gunshotInProgress', xPlayers[i], data.origin)
                end
            end
        end
        elseif data.dispatchCode == '10-60' then
        for i=1, #xPlayers do
            local player = ESX.GetPlayerFromId(xPlayers[i])
            if player then
                if player.job.name == 'police' then
                    TriggerClientEvent('ia-alerts:vehiclesteal', xPlayers[i], data.origin)
                end
            end
        end
    elseif data.dispatchCode == '10-90' then
        for i=1, #xPlayers do
            local player = ESX.GetPlayerFromId(xPlayers[i])
            if player then
                if player.job.name == 'police' then
                    TriggerClientEvent('ia-alerts:jewelrobbey', xPlayers[i], data.origin)
                end
            end
        end
    elseif data.dispatchCode == '10-31B' then
        for i=1, #xPlayers do 
            local player = ESX.GetPlayerFromId(xPlayers[i])
            if player then
                if player.job.name == 'police' then
                    TriggerClientEvent('ia-alerts:storerobbery', xPlayers[i], data.origin)
                end
            end
        end
    elseif data.dispatchCode == '10-31A' then
        for i=1, #xPlayers do
            local player = ESX.GetPlayerFromId(xPlayers[i])
            if player then
                if player.job.name == 'police' then
                    TriggerClientEvent('ia-alerts:houserobbery', xPlayers[i], data.origin)
                end
            end
        end
    elseif data.dispatchCode == '10-90' then
        for i=1, #xPlayers do 
            local player = ESX.GetPlayerFromId(xPlayers[i])
            if player then
                if player.job.name == 'police' then
                    TriggerClientEvent('ia-alerts:banktruck', xPlayers[i], data.origin)
                end
            end
        end
    elseif data.dispatchCode == '10-98' then
        for i=1, #xPlayers do
            local player = ESX.GetPlayerFromId(xPlayers[i])
            if player then
                if player.job.name == 'police' then
                    TriggerClientEvent('ia-alerts:jailbreak', xPlayers[i], data.origin)
                end
            end
        end
    elseif data.dispatchCode == '10-41P' then
        for i=1, #xPlayers do 
            local player = ESX.GetPlayerFromId(xPlayers[i])
            if player then
                if player.job.name == 'police' then
                    TriggerClientEvent('ia-alerts:veznerobbery', xPlayers[i], data.origin)
                end
            end
        end
    elseif data.dispatchCode == '10-71B' then
        for i=1, #xPlayers do
            local player = ESX.GetPlayerFromId(xPlayers[i])
            if player then
                if player.job.name == 'police' then
                    TriggerClientEvent('ia-outlawalert:gunshotInProgress', xPlayers[i], data.origin)
                end
            end
        end
    end
end)


RegisterCommand('togglealerts', function(source, args, user)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.job.name == 'police' or xPlayer.job.name == 'ambulance' then
        TriggerClientEvent('dispatch:toggleNotifications', source, args[1])
    end
end)



RegisterNetEvent('server:ia-outlawalert:gunshotInProgress')
AddEventHandler('server:ia-outlawalert:gunshotInProgress', function(targetCoords)
TriggerClientEvent('ia-outlawalert:gunshotInProgress', targetCoords)
end)
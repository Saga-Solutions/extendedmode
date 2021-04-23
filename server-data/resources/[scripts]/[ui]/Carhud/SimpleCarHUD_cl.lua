--  DUMPED BY 20KG TGIAN XD
local w, h = GetActiveScreenResolution()
local tekerPatlak = false

local compass = {
    width = 0.06,
    fov = 180,
    ticksBetweenCardinals = 9.0, -- Ara Çizgiler
    tickColour = {r = 255, g = 255, b = 255, a = 255},
    tickSize = {w = 0.0006, h = 0.003},
    cardinal = {
        textSize = 0.40,
        textOffset = -0.014 ,
        textColour = {r = 255, g = 255, b = 255, a = 255},
        tickSize = {w = 0.013, h = 0.022 },
        tickColour = {r = 0, g = 0, b = 0, a = 100},
    },
    intercardinal = {
        textSize = 0.26,
        textOffset = -0.013,
        textColour = {r = 255, g = 255, b = 255, a = 255},
        tickSize = {w = 0.0005, h = 0.005},
        tickColour = {r = 255, g = 255, b = 255, a = 255},
    }
}

-- GENERAL PARAMETERS
local enableController = true               -- Enable controller inputs

-- SPEEDOMETER PARAMETERS
local speedLimit = 150.0                    -- Speed limit for changing speed color
local speedColorText = {255, 255, 255}      -- Color used to display speed label text
local speedColorUnder = {255, 255, 255}     -- Color used to display speed when under speedLimit
local speedColorOver = {255, 96, 96}        -- Color used to display speed when over speedLimit

-- FUEL PARAMETERS
local fuelShowPercentage = false            -- Show fuel as a percentage (disabled shows fuel in liters)
local fuelWarnLimit = 25.0                  -- Fuel limit for triggering warning color
local fuelColorText = {255, 255, 255}       -- Color used to display fuel text
local fuelColorOver = {255, 255, 255}       -- Color used to display fuel when good
local fuelColorUnder = {255, 96, 96}        -- Color used to display fuel warning

-- SEATBELT PARAMETERS
local seatbeltInput = 311                   -- Toggle seatbelt on/off with K or DPAD down (controller)
local seatbeltPlaySound = true              -- Play seatbelt sound
local seatbeltDisableExit = false           -- Disable vehicle exit when seatbelt is enabled
local seatbeltEjectSpeed = 45.0             -- Speed threshold to eject player (MPH)
local seatbeltEjectAccel = 100.0   

local mbgseatbeltEjectSpeed = 200.0         -- KM CİNSİNDEN CAMDAN UÇMA
local TgiannAracKaza = 260.0             	-- KM CİNSİNDEN TEKER PATLATMA
local mbgseatbeltEjectAccel = 80.0   

local seatbeltColorOn = {160, 255, 160}     -- Color used when seatbelt is on
local seatbeltColorOff = {255, 96, 96}      -- Color used when seatbelt is off

-- CRUISE CONTROL PARAMETERS
local cruiseInput = 246                     -- Toggle cruise on/off with CAPSLOCK or A button (controller)
local cruiseColorOn = {160, 255, 160}       -- Color used when seatbelt is on
local cruiseColorOff = {255, 255, 255}      -- Color used when seatbelt is off

local vehIsMovingFwd = 0

-- LOCATION AND TIME PARAMETERS
local locationColorText = {255, 255, 255}   -- Color used to display location and time


local zones = { ['AIRP'] = "Los Santos International Airport", ['ALAMO'] = "Alamo Sea", ['ALTA'] = "Alta", ['ARMYB'] = "Fort Zancudo", ['BANHAMC'] = "Banham Canyon Dr", ['BANNING'] = "Banning", ['BEACH'] = "Vespucci Beach", ['BHAMCA'] = "Banham Canyon", ['BRADP'] = "Braddock Pass", ['BRADT'] = "Braddock Tunnel", ['BURTON'] = "Burton", ['CALAFB'] = "Calafia Bridge", ['CANNY'] = "Raton Canyon", ['CCREAK'] = "Cassidy Creek", ['CHAMH'] = "Chamberlain Hills", ['CHIL'] = "Vinewood Hills", ['CHU'] = "Chumash", ['CMSW'] = "Chiliad Mountain State Wilderness", ['CYPRE'] = "Cypress Flats", ['DAVIS'] = "Davis", ['DELBE'] = "Del Perro Beach", ['DELPE'] = "Del Perro", ['DELSOL'] = "La Puerta", ['DESRT'] = "Grand Senora Desert", ['DOWNT'] = "Downtown", ['DTVINE'] = "Downtown Vinewood", ['EAST_V'] = "East Vinewood", ['EBURO'] = "El Burro Heights", ['ELGORL'] = "El Gordo Lighthouse", ['ELYSIAN'] = "Elysian Island", ['GALFISH'] = "Galilee", ['GOLF'] = "GWC and Golfing Society", ['GRAPES'] = "Grapeseed", ['GREATC'] = "Great Chaparral", ['HARMO'] = "Harmony", ['HAWICK'] = "Hawick", ['HORS'] = "Vinewood Racetrack", ['HUMLAB'] = "Humane Labs and Research", ['JAIL'] = "Bolingbroke Penitentiary", ['KOREAT'] = "Little Seoul", ['LACT'] = "Land Act Reservoir", ['LAGO'] = "Lago Zancudo", ['LDAM'] = "Land Act Dam", ['LEGSQU'] = "Legion Square", ['LMESA'] = "La Mesa", ['LOSPUER'] = "La Puerta", ['MIRR'] = "Mirror Park", ['MORN'] = "Morningwood", ['MOVIE'] = "Richards Majestic", ['MTCHIL'] = "Mount Chiliad", ['MTGORDO'] = "Mount Gordo", ['MTJOSE'] = "Mount Josiah", ['MURRI'] = "Murrieta Heights", ['NCHU'] = "North Chumash", ['NOOSE'] = "N.O.O.S.E", ['OCEANA'] = "Pacific Ocean", ['PALCOV'] = "Paleto Cove", ['PALETO'] = "Paleto Bay", ['PALFOR'] = "Paleto Forest", ['PALHIGH'] = "Palomino Highlands", ['PALMPOW'] = "Palmer-Taylor Power Station", ['PBLUFF'] = "Pacific Bluffs", ['PBOX'] = "Pillbox Hill", ['PROCOB'] = "Procopio Beach", ['RANCHO'] = "Rancho", ['RGLEN'] = "Richman Glen", ['RICHM'] = "Richman", ['ROCKF'] = "Rockford Hills", ['RTRAK'] = "Redwood Lights Track", ['SANAND'] = "San Andreas", ['SANCHIA'] = "San Chianski Mountain Range", ['SANDY'] = "Sandy Shores", ['SKID'] = "Mission Row", ['SLAB'] = "Stab City", ['STAD'] = "Maze Bank Arena", ['STRAW'] = "Strawberry", ['TATAMO'] = "Tataviam Mountains", ['TERMINA'] = "Terminal", ['TEXTI'] = "Textile City", ['TONGVAH'] = "Tongva Hills", ['TONGVAV'] = "Tongva Valley", ['VCANA'] = "Vespucci Canals", ['VESP'] = "Vespucci", ['VINE'] = "Vinewood", ['WINDF'] = "Ron Alternates Wind Farm", ['WVINE'] = "West Vinewood", ['ZANCUDO'] = "Zancudo River", ['ZP_ORT'] = "Port of South Los Santos", ['ZQ_UAR'] = "Davis Quartz" }

-- Globals
local pedInVeh = false
local timeText = ""
local locationText = ""
local currentFuel = 0.0

local currSpeed = 0.0
local cruiseSpeed = 999.0
local prevVelocity = {x = 0.0, y = 0.0, z = 0.0}
local cruiseIsOn = false
local seatbeltIsOn = false
local kemerSayi = 0

local zorlaMaxHizSiniri = {}
local zorlaHizSabitle = {}

RegisterCommand("hizsabitle", function(source, args)
    local player = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(player, false)
    if (GetPedInVehicleSeat(vehicle, -1) == player) and tonumber(args[1]) > 0 and not zorlaHizSabitle[vehicle] then
        if not IsVehicleTyreBurst(vehicle, 0) and not IsVehicleTyreBurst(vehicle, 1) and not IsVehicleTyreBurst(vehicle, 4) and not IsVehicleTyreBurst(vehicle, 5) then 
            cruiseIsOn = true
            cruiseSpeed = tonumber(args[1]) / 3.6
        end
    end
end)

RegisterNetEvent("simplecarhud:zorlahizsabitle")
AddEventHandler("simplecarhud:zorlahizsabitle", function(vehicle, durum, hiz, script)
    if durum then
        zorlaHizSabitle[vehicle] = true
        local maxHiz = tonumber(hiz) / 3.6
        local aracinHizi = GetEntitySpeed(vehicle)
        if aracinHizi > maxHiz then
            local sayi = aracinHizi - maxHiz
            zorlaMaxHizSiniri[vehicle] = aracinHizi
            for i=1, sayi do
                Citizen.Wait(100)
                zorlaMaxHizSiniri[vehicle] = zorlaMaxHizSiniri[vehicle] - 1
            end
        else
            zorlaMaxHizSiniri[vehicle] = maxHiz
        end
    else
        zorlaHizSabitle[vehicle] = false
        if script == "illegal-ev" then
            zorlaHizSabitle = {}
        end
    end
end)

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/hizsabitle', 'Aracın Hızını Sabitle.', {{ name="Sabitlenecek Hız", help="Aracın Hızını Sabitlemek İçin Bir Değer Girin"}})
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local player = GetPlayerPed(-1)
        if IsPedInAnyVehicle(player, false) then
            if IsControlPressed(0, seatbeltInput) then
                kemerSayi = kemerSayi + 1
                if kemerSayi == 2 then
                    if seatbeltDisableExit then
                        seatbeltDisableExit = false
                        exports['mythic_notify']:DoHudText('error', 'Sıkı Kemer Modu Devre Dışı')
                    else
                        seatbeltDisableExit = true
                        exports['mythic_notify']:DoHudText('success', 'Sıkı Kemer Modu Devrede')
                    end
                end
                Citizen.Wait(500)
            else
                kemerSayi = 0
            end
        end
    end
end)

-- Main thread
Citizen.CreateThread(function()
    -- Initialize local variable
    if w == 1920 and h == 1080 then
        screenPosX = 0.165                    -- X coordinate (top left corner of HUD)
        screenPosY = 0.882                    -- Y coordinate (top left corner of HUD)
    elseif w == 1680 and h == 1050 then
        screenPosX = 0.195                    -- X coordinate (top left corner of HUD)
        screenPosY = 0.882                    -- Y coordinate (top left corner of HUD)
    elseif w == 1600 and h == 1200 then
        screenPosX = 0.190                    -- X coordinate (top left corner of HUD)
        screenPosY = 0.882                    -- Y coordinate (top left corner of HUD)
    elseif w == 1600 and h == 1024 then
        screenPosX = 0.190                    -- X coordinate (top left corner of HUD)
        screenPosY = 0.882 
    elseif w == 1600 and h == 900 then
        screenPosX = 0.190                    -- X coordinate (top left corner of HUD)
        screenPosY = 0.882 
    elseif w == 1440 and h == 900 then
        screenPosX = 0.190                    -- X coordinate (top left corner of HUD)
        screenPosY = 0.882                    -- Y coordinate (top left corner of HUD)
    elseif w == 1366 and h == 768 then
        screenPosX = 0.175                    -- X coordinate (top left corner of HUD)
        screenPosY = 0.882                    -- Y coordinate (top left corner of HUD)
    elseif w == 1360 and h == 768 then
        screenPosX = 0.170                    -- X coordinate (top left corner of HUD)
        screenPosY = 0.882                    -- Y coordinate (top left corner of HUD)
    elseif w == 1280 and h == 1024 then
        screenPosX = 0.240                    -- X coordinate (top left corner of HUD)
        screenPosY = 0.882                    -- Y coordinate (top left corner of HUD)
    elseif w == 1280 and h == 960 then
        screenPosX = 0.220                    -- X coordinate (top left corner of HUD)
        screenPosY = 0.882                    -- Y coordinate (top left corner of HUD)
    elseif w == 1280 and h == 800 then
        screenPosX = 0.190                    -- X coordinate (top left corner of HUD)
        screenPosY = 0.882                    -- Y coordinate (top left corner of HUD)
    elseif w == 1280 and h == 768 then
        screenPosX = 0.185                    -- X coordinate (top left corner of HUD)
        screenPosY = 0.882                    -- Y coordinate (top left corner of HUD)
    elseif w == 1280 and h == 720 or w == 1176 and h == 664 then
        screenPosX = 0.175                    -- X coordinate (top left corner of HUD)
        screenPosY = 0.882                    -- Y coordinate (top left corner of HUD)
    elseif w == 1152 and h == 864 or w == 1024 and h == 768  then
        screenPosX = 0.215                    -- X coordinate (top left corner of HUD)
        screenPosY = 0.882                    -- Y coordinate (top left corner of HUD)
    elseif w == 800 and h == 600 then
        screenPosX = 0.220                    -- X coordinate (top left corner of HUD)
        screenPosY = 0.852      
    else
        screenPosX = 0.165                    -- X coordinate (top left corner of HUD)
        screenPosY = 0.882                    -- Y coordinate (top left corner of HUD) 
    end  

    while true do
        -- Loop forever and update HUD every frame
        Citizen.Wait(0)

        -- Get player PED, position and vehicle and save to locals
        local player = GetPlayerPed(-1)
        local position = GetEntityCoords(player)
        local vehicle = GetVehiclePedIsIn(player, false)
        -- Set vehicle states
        if IsPedInAnyVehicle(player, false) then
            pedInVeh = true
        else
            -- Reset states when not in car
            pedInVeh = false
            cruiseIsOn = false
            seatbeltIsOn = false
        end

        -- Display Location and time when in any vehicle or on foot (if enabled)
      
        -- Get time and display
        local pxDegree = compass.width / compass.fov
        local playerHeadingDegrees = 0
        
        local playerHeadingDegrees = 360.0 - GetEntityHeading( GetPlayerPed( -1 ) )
        
        local tickDegree = playerHeadingDegrees - compass.fov / 2
        local tickDegreeRemainder = compass.ticksBetweenCardinals - (tickDegree % compass.ticksBetweenCardinals)
        local tickPosition = screenPosX + 0.005 + tickDegreeRemainder * pxDegree
        
        tickDegree = tickDegree + tickDegreeRemainder
        
        while tickPosition < screenPosX + 0.0325 do
            
            if (tickDegree % 90.0) == 0 then
                -- Draw cardinal
                
                DrawRect( tickPosition, screenPosY + 0.095, compass.cardinal.tickSize.w, compass.cardinal.tickSize.h, compass.cardinal.tickColour.r, compass.cardinal.tickColour.g, compass.cardinal.tickColour.b, compass.cardinal.tickColour.a )
                
                CompassdrawText( degreesToIntercardinalDirection( tickDegree ), tickPosition, screenPosY + 0.095 + compass.cardinal.textOffset, {
                    size = compass.cardinal.textSize,
                    colour = compass.cardinal.textColour,
                    outline = true,
                    centered = true
                })
            elseif (tickDegree % 45.0) == 0 then
                -- Draw intercardinal
                DrawRect( tickPosition, screenPosY + 0.1025, compass.intercardinal.tickSize.w, compass.intercardinal.tickSize.h, compass.intercardinal.tickColour.r, compass.intercardinal.tickColour.g, compass.intercardinal.tickColour.b, compass.intercardinal.tickColour.a )
                
                CompassdrawText( degreesToIntercardinalDirection( tickDegree ), tickPosition, screenPosY + 0.095 + compass.intercardinal.textOffset, {
                    size = compass.intercardinal.textSize,
                    colour = compass.intercardinal.textColour,
                    outline = true,
                    centered = true
                })
            elseif  (tickDegree % 90.0) == 63.0 or (tickDegree % 90.0) == 54.0 or (tickDegree % 90.0) == 27.0 or (tickDegree % 90.0) == 36.0 then
                DrawRect( tickPosition, screenPosY + 0.104, compass.tickSize.w, compass.tickSize.h, compass.tickColour.r, compass.tickColour.g, compass.tickColour.b, compass.tickColour.a )
            end

            -- Advance to the next tick
            tickDegree = tickDegree + compass.ticksBetweenCardinals
            tickPosition = tickPosition + pxDegree * compass.ticksBetweenCardinals        
        end
           
        if pedInVeh then
            -- Display heading, street name and zone when possible
            drawTxt(locationText, 4, locationColorText, 0.36, screenPosX+ 0.040, screenPosY + 0.0823)
        
            -- Display remainder of HUD when engine is on and vehicle is not a bicycle
            local vehicleClass = GetVehicleClass(vehicle)
            local keepDoorOpen = true
            if pedInVeh and GetIsVehicleEngineRunning(vehicle) and vehicleClass ~= 13 then
                if IsControlJustPressed(2, 75) then
                    Citizen.Wait(150)
                    SetVehicleEngineOn(vehicle, true, true, false)
                end

                -- Save previous speed and get current speed
                local prevSpeed = currSpeed
                currSpeed = GetEntitySpeed(vehicle)

                -- Set PED flags
                SetPedConfigFlag(PlayerPedId(), 32, true)
                
                -- Check if seatbelt button pressed, toggle state and handle seatbelt logic
                if IsControlJustReleased(0, seatbeltInput) and (enableController or GetLastInputMethod(0)) and vehicleClass ~= 8 then
                    -- Toggle seatbelt status and play sound when enabled
                    seatbeltIsOn = not seatbeltIsOn
                    if seatbeltIsOn then
                        TriggerEvent('InteractSound_CL:PlayOnOne', 'tak', 0.5)
                        PlaySoundFrontend(-1, "Faster_Click", "RESPAWN_ONLINE_SOUNDSET", 1)
                    else
                        PlaySoundFrontend(-1, "Faster_Click", "RESPAWN_ONLINE_SOUNDSET", 1)
                        TriggerEvent('InteractSound_CL:PlayOnOne', 'cikar', 0.5)
                    end
                end

                if not seatbeltIsOn then
                    -- Eject PED when moving forward, vehicle was going over 45 MPH and acceleration over 100 G's
                    vehIsMovingFwd = GetEntitySpeedVector(vehicle, true).y > 1.0
                    local vehAcc = (prevSpeed - currSpeed) / GetFrameTime()

                    if (vehIsMovingFwd and (prevSpeed > (seatbeltEjectSpeed/2.237)) and (vehAcc > (seatbeltEjectAccel*9.81))) then
                        SetEntityCoords(player, position.x, position.y, position.z - 0.47, true, true, true)
                        SetEntityVelocity(player, prevVelocity.x, prevVelocity.y, prevVelocity.z)
                        Citizen.Wait(1)
                        SetPedToRagdoll(player, 1000, 1000, 0, 0, 0, 0)
                    else
                        -- Update previous velocity for ejecting player
                        prevVelocity = GetEntityVelocity(vehicle)
                    end

                elseif seatbeltDisableExit then
                    -- Disable vehicle exit when seatbelt is on
                    DisableControlAction(0, 75)
                end   
			  
                -- When player in driver seat, handle cruise control
                if (GetPedInVehicleSeat(vehicle, -1) == player) then
                    -- Check if cruise control button pressed, toggle state and set maximum speed appropriately
                    if IsControlJustReleased(0, cruiseInput) and (enableController or GetLastInputMethod(0)) then
                        cruiseIsOn = not cruiseIsOn
                        cruiseSpeed = currSpeed
                    end

                    local tekerCruiseSpeed = 10.0
                    local maxSpeed = cruiseIsOn and cruiseSpeed or tekerPatlak and tekerCruiseSpeed or zorlaHizSabitle[vehicle] and zorlaMaxHizSiniri[vehicle] or GetVehicleHandlingFloat(vehicle,"CHandlingData","fInitialDriveMaxFlatVel")
                    SetEntityMaxSpeed(vehicle, maxSpeed)
                else
                    -- Reset cruise control
                    cruiseIsOn = false
                end

                -- hızlı giderken ölme
                local vehIsMovingFwd = GetEntitySpeedVector(vehicle, true).y > 1.0
                local vehAcc = (prevSpeed - currSpeed) / GetFrameTime()
                if GetPedInVehicleSeat(vehicle, -1) == player and GetIsVehicleEngineRunning(vehicle) then
                    if (vehIsMovingFwd and (prevSpeed*3.6 > (mbgseatbeltEjectSpeed)) and (vehAcc > (mbgseatbeltEjectAccel*9.81))) then
                        TriggerEvent("iens:motortamiret",vehicle ,10.0)

                        local seatPlayerId = {}
                        for i=1, GetVehicleModelNumberOfSeats(GetEntityModel(vehicle)) do
                            if i ~= 1 then
                                if not IsVehicleSeatFree(vehicle, i-2) then 
                                    local otherPlayerId = GetPedInVehicleSeat(vehicle, i-2) 
                                    local playerHandle = NetworkGetPlayerIndexFromPed(otherPlayerId)
                                    local playerServerId = GetPlayerServerId(playerHandle)
                                    table.insert(seatPlayerId, playerServerId)
                                end
                            end
                        end
                        
                        if #seatPlayerId > 0 then
                            TriggerServerEvent("simpleCarHud:eject-other-player-car", seatPlayerId, prevVelocity)
                        end

                        SetEntityCoords(player, position.x, position.y, position.z - 0.47, true, true, true)
                        SetEntityVelocity(player, prevVelocity.x, prevVelocity.y, prevVelocity.z)
                        Citizen.Wait(1)
                        SetPedToRagdoll(player, 1000, 1000, 0, 0, 0, 0)
                        Citizen.Wait(1000)
                        if math.random(1, 3) == 1 then
                            SetEntityHealth(player, 0)
                        end
                        pedInVeh = false
                        cruiseIsOn = false
                        seatbeltIsOn = false
                        EnableControlAction(0, 75)

                    else
                        -- Update previous velocity for ejecting player
                        prevVelocity = GetEntityVelocity(vehicle)
                    end
                end

                -- Hızli Giderken Araç teker patlama vs
                if GetPedInVehicleSeat(vehicle, -1) == player and GetIsVehicleEngineRunning(vehicle) then
                    if (vehIsMovingFwd and (prevSpeed*3.6 > (TgiannAracKaza)) and (vehAcc > (mbgseatbeltEjectAccel*7.20))) then
                        local vehicle = GetPlayersLastVehicle()
                        local RastgeleTeker = (math.random(1,4))
                        if RastgeleTeker == 1 then
                            SetVehicleTyreBurst(vehicle, 0, 1, 100.0)
                        elseif RastgeleTeker == 2 then
                            SetVehicleTyreBurst(vehicle, 0, 1, 100.0)
                            SetVehicleTyreBurst(vehicle, 4, 1, 100.0)
                        elseif RastgeleTeker == 3 then
                            SetVehicleTyreBurst(vehicle, 0, 1, 100.0)
                            SetVehicleTyreBurst(vehicle, 1, 1, 100.0)
                            SetVehicleTyreBurst(vehicle, 4, 1, 100.0)
                            TriggerEvent("iens:motortamiret",vehicle ,10.0)
                        elseif RastgeleTeker == 4 then
                            SetVehicleTyreBurst(vehicle, 0, 1, 100.0)
                            SetVehicleTyreBurst(vehicle, 1, 1, 100.0)
                            SetVehicleTyreBurst(vehicle, 4, 1, 100.0)
                            SetVehicleTyreBurst(vehicle, 5, 1, 100.0)
                            TriggerEvent("iens:motortamiret",vehicle ,10.0)
                        end
                    end
                end

                if IsVehicleTyreBurst(vehicle, 0) or IsVehicleTyreBurst(vehicle, 1) or IsVehicleTyreBurst(vehicle, 4) or IsVehicleTyreBurst(vehicle, 5) then 
                    tekerPatlak = true
                else
                    tekerPatlak = false
                end

                -- Hız
                local speed = currSpeed*3.6
                local speedColor = (speed >= speedLimit) and speedColorOver or speedColorUnder
               
                -- Draw fuel gauge
                if GetPedInVehicleSeat(vehicle, -1) == player then
                    drawTxt(("%.3d"):format(math.ceil(speed)), 2, speedColor, 0.5, screenPosX+ 0.045, screenPosY + 0.048)
                    speedColorText = cruiseIsOn and cruiseColorOn or cruiseColorOff
                    drawTxt("KM", 2, speedColorText, 0.25, screenPosX + 0.065, screenPosY + 0.051)


                    drawTxt(("%.3d"):format(math.ceil(currentFuel)), 2, {255, 255, 255}, 0.5, screenPosX, screenPosY + 0.048)
                    drawTxt("YAKIT", 2, fuelColorText, 0.25, screenPosX + 0.020, screenPosY + 0.051)

                    -- Draw seatbelt status if not a motorcyle
                    if vehicleClass ~= 8 and vehicleClass ~= 21 and vehicleClass ~= 14 and vehicleClass ~= 13 then
                        local seatbeltColor = seatbeltIsOn and seatbeltColorOn or seatbeltColorOff
                        drawTxt("KEMER", 2, seatbeltColor, 0.3, screenPosX + 0.083, screenPosY + 0.051)
                    end

                else
                    drawTxt(("%.3d"):format(math.ceil(speed)), 2, speedColor, 0.5, screenPosX, screenPosY + 0.048)
                    speedColorText = cruiseIsOn and cruiseColorOn or cruiseColorOff
                    drawTxt("KM", 2, speedColorText, 0.25, screenPosX + 0.020, screenPosY + 0.051)

                    -- Draw seatbelt status if not a motorcyle
                    if vehicleClass ~= 8 and vehicleClass ~= 21 and vehicleClass ~= 14 and vehicleClass ~= 13 then
                        local seatbeltColor = seatbeltIsOn and seatbeltColorOn or seatbeltColorOff
                        drawTxt("KEMER", 2, seatbeltColor, 0.3, screenPosX + 0.041, screenPosY + 0.051)
                    end

                end
                drawTxt(timeText, 4, locationColorText, 0.3, screenPosX, screenPosY + 0.028)
            end
        else
            drawTxt(timeText, 4, locationColorText, 0.3, screenPosX, screenPosY+0.055)
        end
    end
end)

RegisterNetEvent("simpleCarHud:eject-other-player-car-client")
AddEventHandler("simpleCarHud:eject-other-player-car-client", function(velocity)
    local player = GetPlayerPed(-1)
    local position = GetEntityCoords(player)
    SetEntityCoords(player, position.x, position.y, position.z - 0.47, true, true, true)
    SetEntityVelocity(player, velocity.x, velocity.y, velocity.z)
    Citizen.Wait(1)
    SetPedToRagdoll(player, 1000, 1000, 0, 0, 0, 0)
    Citizen.Wait(1000)
    if math.random(1, 3) == 1 then
        SetEntityHealth(player, 0)
    end
    pedInVeh = false
    cruiseIsOn = false
    seatbeltIsOn = false
    EnableControlAction(0, 75)
end)

-- Secondary thread to update strings
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        local player = GetPlayerPed(-1)
        local vehicle = GetVehiclePedIsIn(player, false)
        if vehIsMovingFwd and not seatbeltIsOn and GetPedInVehicleSeat(vehicle, -1) == player and GetIsVehicleEngineRunning(vehicle) and GetVehicleClass(vehicle) ~= 13 and GetVehicleClass(vehicle) ~= 8 and GetVehicleClass(vehicle) ~= 21 and GetVehicleClass(vehicle) ~= 14 and GetVehicleClass(vehicle) ~= 16 and GetVehicleClass(vehicle) ~= 15 then
            TriggerEvent('InteractSound_CL:PlayOnOne', 'alarm', 0.5)
            Citizen.Wait(3000)
        end
    end
end)

-- Secondary thread to update strings
Citizen.CreateThread(function()
    while true do
        -- Update when player is in a vehicle or on foot (if enabled)
        -- Update time text string
        local hour = GetClockHours()
        local minute = GetClockMinutes()
        timeText = hour .. ":" .. minute

        if pedInVeh then
            -- Get player, position and vehicle
            local player = GetPlayerPed(-1)
            local position = GetEntityCoords(player)

            -- Get heading and zone from lookup tables and street name from hash
            local isim = zones[GetNameOfZone(position.x, position.y, position.z)]
            if isim ~= nil then
                zoneNameFull = "[".. isim .. "]" 
            else
                zoneNameFull = "[Bilinmiyor]"
            end
            
            local streetName = GetStreetNameFromHashKey(GetStreetNameAtCoord(position.x, position.y, position.z))
            
            -- Update location text string
            locationText = (streetName == "" or streetName == nil) and (locationText) or (streetName)
            locationText = (zoneNameFull == "" or zoneNameFull == nil) and (locationText) or (locationText .. " | " .. zoneNameFull)

            -- Update fuel when in a vehicle
            if pedInVeh then
                local vehicle = GetVehiclePedIsIn(player, false)
                -- Display remaining fuel as a percentage
                currentFuel = GetVehicleFuelLevel(vehicle)
            end

            -- Update every second
            Citizen.Wait(1000)
        else
            -- Wait until next frame
            Citizen.Wait(0)
        end
    end
end)

-- Helper function to draw text to screen
function drawTxt(content, font, colour, scale, x, y)
    SetTextFont(font)
    SetTextScale(scale, scale)
    SetTextColour(colour[1],colour[2],colour[3], 255)
    SetTextEntry("STRING")
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextDropShadow()
    SetTextEdge(4, 0, 0, 0, 255)
    SetTextOutline()
    AddTextComponentString(content)
    DrawText(x, y)
end

function CompassdrawText( str, x, y, style )
	if style == nil then
		style = {}
	end
	
	SetTextFont(4)
	SetTextScale( 0.0, (style.size ~= nil) and style.size or 1.0 )
	SetTextProportional( 1 )
	
	if style.colour ~= nil then
		SetTextColour( style.colour.r ~= nil and style.colour.r or 255, style.colour.g ~= nil and style.colour.g or 255, style.colour.b ~= nil and style.colour.b or 255, style.colour.a ~= nil and style.colour.a or 255 )
	else
		SetTextColour( 255, 255, 255, 255 )
	end
	
	SetTextDropShadow( 0, 0, 0, 0, 255 )
	
	if style.border ~= nil then
		SetTextEdge( style.border.size ~= nil and style.border.size or 1, style.border.r ~= nil and style.border.r or 0, style.border.g ~= nil and style.border.g or 0, style.border.b ~= nil and style.border.b or 0, style.border.a ~= nil and style.shadow.a or 255 )
	end
	
	if style.centered ~= nil and style.centered == true then
		SetTextCentre( true )
	end
	
	if style.outline ~= nil and style.outline == true then
		SetTextOutline()
	end
	
	SetTextEntry( "STRING" )
	AddTextComponentString( str )
	
	DrawText( x, y )
end

function degreesToIntercardinalDirection( dgr )
	dgr = dgr % 360.0
	
	if (dgr >= 0.0 and dgr < 22.5) or dgr >= 337.5 then
		return "K "
	elseif dgr >= 22.5 and dgr < 67.5 then
		return "KD"
	elseif dgr >= 67.5 and dgr < 112.5 then
		return "D"
	elseif dgr >= 112.5 and dgr < 157.5 then
		return "GD"
	elseif dgr >= 157.5 and dgr < 202.5 then
		return "G"
	elseif dgr >= 202.5 and dgr < 247.5 then
		return "GB"
	elseif dgr >= 247.5 and dgr < 292.5 then
		return "B"
	elseif dgr >= 292.5 and dgr < 337.5 then
		return "KB"
	end
end
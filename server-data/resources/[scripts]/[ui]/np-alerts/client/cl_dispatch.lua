ESX          = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

colors = {
	--[0] = "Metalik Siyah",
	
	[1] = "Metalik Grafit Siyah",
	
	[2] = "Metalik Siyah Çelik",
	
	[3] = "Metalik Kara Gümüş",
	
	[4] = "Metalik Gümüş",
	
	[5] = "Metalik Safir",
	
	[6] = "Metalik Gri Çelik",
	
	[7] = "Metalik Kapalı Gümüş",
	
	[8] = "Metalik Gümüş Mavisi",
	
	[9] = "Metalik Geceyarısı Gümüş",
	
	[10] = "Metalik Koyu Gri",
	
	[11] = "Metalik Antrasit Grisi",
	
	[12] = "Mat Siyah",
	
	[13] = "Mat Gri",
	
	[14] = "Mat Açık Gri",
	
	[15] = "Util Siyah",
	
	[16] = "Util Siyah Poli",
	
	[17] = "Util Kara Gümüş",
	
	[18] = "Util Gümüş",
	
	[19] = "Util Koyu Gri",
	
	[20] = "Util Kapalı Gümüş",
	
	[21] = "Yıpranmış Siyah",
	
	[22] = "Yıpranmış Grafit",
	
	[23] = "Yıpranmış Gümüş Grisi",
	
	[24] = "Yıpranmış Gümüş",
	
	[25] = "Yıpranmış Gümüş Mavisi",
	
	[26] = "Yıpranmış Koyu Gri",
	
	[27] = "Metalik Kırmızı",
	
	[28] = "Metalik Turin Kırmızısı",
	
	[29] = "Metalik Ferrari Kırmızısı",
	
	[30] = "Metalik Alev Kırmızısı",
	
	[31] = "Metalik Zarif Kırmızı",
	
	[32] = "Metalik Lal Kırmızısı",
	
	[33] = "Metalik Çöl Kırmızısı",
	
	[34] = "Metalik Şarap Kırmızısı",
	
	[35] = "Metalik Şeker Kırmızısı",
	
	[36] = "Metalik Turuncu",
	
	[37] = "Metalik Klasik Altın",
	
	[38] = "Metalik Turuncu",
	
	[39] = "Mat Kırmızı",
	
	[40] = "Mat Koyu Kırmızı",
	
	[41] = "Mat Turuncu",
	
	[42] = "Mat Sarı",
	
	[43] = "Util Kırmızı",
	
	[44] = "Util Parlak Kırmızı",
	
	[45] = "Util Lal Kırmızısı",
	
	[46] = "Yıpranmış Kırmızı",
	
	[47] = "Yıpranmış Altın Kırmızısı",
	
	[48] = "Yıpranmış Koyu Kırmızı",
	
	[49] = "Yıpranmış Koyu Yeşil",
	
	[50] = "Metalik Yarış Yeşili",
	
	[51] = "Metalik Deniz Mavisi",
	
	[52] = "Metalik Zeytin Yeşili",
	
	[53] = "Metalik Yeşil",
	
	[54] = "Metalik Camgöbeği",
	
	[55] = "Mat Lime Yeşili",
	
	[56] = "Util Koyu Yeşil",
	
	[57] = "Util Yeşil",
	
	[58] = "Yıpranmış Koyu Yeşil",
	
	[59] = "Yıpranmış Yeşil",
	
	[60] = "Yıpranmış Dalga Yeşili",
	
	[61] = "Metalik Geceyarısı Mavisi",
	
	[62] = "Metalik Koyu Mavi",
	
	[63] = "Metalik Koyu Bebek Mavisi",
	
	[64] = "Metalik Mavi",
	
	[65] = "Metalik Denizci Mavisi",
	
	[66] = "Metalik Liman Mavisi",
	
	[67] = "Metalik Elmas Mavisi",
	
	[68] = "Metalik Sörf Mavisi",
	
	[69] = "Metalik Nautik Mavi",
	
	[70] = "Metalik Parlak Mavi",
	
	[71] = "Metalik Patlıcan Mavisi",
	
	[72] = "Metalik Gemi Mavisi",
	
	[73] = "Metalik Ultra Mavi",
	
	[74] = "Metalik Parlak Mavi",
	
	[75] = "Util Koyu Mavi",
	
	[76] = "Util Geceyarısı Mavisi",
	
	[77] = "Util Mavi",
	
	[78] = "Util Deniz Köpüğü Mavisi",
	
	[79] = "Util Yıldırım Mavisi",
	
	[80] = "Util Bebek Mavisi",
	
	[81] = "Util Parlak Mavi",
	
	[82] = "Mat Koyu Mavi",
	
	[83] = "Mat Mavi",
	
	[84] = "Mat Geceyarısı Mavisi",
	
	[85] = "Yıpranmış Koyu Mavi",
	
	[86] = "Yıpranmış Mavi",
	
	[87] = "Yıpranmış Hafif Mavi",
	
	[88] = "Metalik Taksi Sarısı",
	
	[89] = "Metalik Yarış Sarısı",
	
	[90] = "Metalik Bronz",
	
	[91] = "Metalik Tweety Sarısı",
	
	[92] = "Metalik Lime",
	
	[93] = "Metalik Şampanya",
	
	[94] = "Metalik Pueblo Beige",
	
	[95] = "Metalik Koyu Fildişi",
	
	[96] = "Metalik Ayıcık Kahverengi",
	
	[97] = "Metalik Altın Kahverengi",
	
	[98] = "Metalik Hafif Kahverengi",
	
	[99] = "Metalik Straw Beige",
	
	[100] = "Metalik Yosun Kahverengi",
	
	[101] = "Metalik Biston Kahverengi",
	
	[102] = "Metalik Kayın",
	
	[103] = "Metalik Koyu Kayın",
	
	[104] = "Metalik Ayıcık Turuncusu",
	
	[105] = "Metalik Kumsal Sarısı",
	
	[106] = "Metalik Güneşte Ağartılmış Kumsal Sarısı",
	
	[107] = "Metalik Krema",
	
	[108] = "Util Kahverengi",
	
	[109] = "Util Orta Kahve",
	
	[110] = "Util Hafif Kahverengi",
	
	[111] = "Metalik Beyaz",
	
	[112] = "Metalik Kar Beyazı",
	
	[113] = "Yıpranmış Portakal Kabuğu",
	
	[114] = "Yıpranmış Kahverengi",
	
	[115] = "Yıpranmış Koyu Kahve",
	
	[116] = "Yıpranmış Saman Beji",
	
	[117] = "Pürüzsüz Çelik",
	
	[118] = "Pürüzsüz Kara Çelik",
	
	[119] = "Pürüzsüz Aluminyum",
	
	[120] = "Krom",
	
	[121] = "Az Yıpranmış Beyaz",
	
	[122] = "Az Util Beyaz",
	
	[123] = "Yıpranmış Turuncu",
	
	[124] = "Yıpranmış Parlak Turuncu",
	
	[125] = "Metallic Parlak Yeşil",
	
	[126] = "Yıpranmış Taksi Sarısı",
	
	[127] = "Polis Arabası Mavisi",
	
	[128] = "Mat Yeşil",
	
	[129] = "Mat Kahve",
	
	[130] = "Yıpranmış Turuncu",
	
	[131] = "Mat Beyaz",
	
	[132] = "Yıpranmış Beyaz",
	
	[133] = "Yıpranmış Ordu Yeşili",
	
	[134] = "Saf Beyaz",
	
	[135] = "Sıcak Pembe",
	
	[136] = "Somon Pembesi",
	
	[137] = "Metalik Parlak Pembe",
	
	[138] = "Turuncu",
	
	[139] = "Yeşil",
	
	[140] = "Mavi",
	
	[141] = "Mettalik Kara Mavi",
	
	[142] = "Metalik Kara Mor",
	
	[143] = "Metalik Kara Kırmızı",
	
	[144] = "Avcı Yeşili",
	
	[145] = "Metalik Mor",
	
	[146] = "Metaillik Kara Mavi",
	
	[147] = "Siyah",
	
	[148] = "Mat Mor",
	
	[149] = "Mat Koyu Mor",
	
	[150] = "Metalik Lav Kırmızısı",
	
	[151] = "Mat Orman Yeşili",
	
	[152] = "Mat Monoton Yeşili",
	
	[153] = "Mat Çöl Kahvesi",
	
	[154] = "Mat Çöl Bronzu",
	
	[155] = "Mat Çim Yeşili",
	
	[156] = "Tanımsız",--"DEFAULT ALLOY COLOR",
	
	[157] = "Buz Mavisi",
	
	[158] = "Bilinmiyor"
	
}

local disableNotifications = false
local disableNotificationSounds = false
RegisterNetEvent('dispatch:toggleNotifications')
AddEventHandler('dispatch:toggleNotifications', function(state)
    state = tostring(state)
    if state == "on" then
        disableNotifications = false
        disableNotificationSounds = false
        TriggerEvent('Notification', "Dispatch is now enabled.")
    elseif state == "off" then
        disableNotifications = true
        disableNotificationSounds = true
        TriggerEvent('Notification', "Dispatch is now disabled.")
    elseif state == "mute" then
        disableNotifications = false
        disableNotificationSounds = true
        TriggerEvent('Notification', "Dispatch is now muted.")
    else
        TriggerEvent('Notification', "You need to type in 'on', 'off' or 'mute'.")
    end
end)

local function randomizeBlipLocation(pOrigin)
  local x = pOrigin.x
  local y = pOrigin.y
  local z = pOrigin.z
  local luck = math.random(2)
  y = math.random(25) + y
  if luck == 1 then
      x = math.random(25) + x
  end
  return {x = x, y = y, z = z}
end

RegisterCommand('ialeaks6', function()
    print('trying to send alert')
    AlertGunShot()
    print(ESX.GetPlayerData().job.name)
end)

RegisterCommand('clearblips', function()
  TriggerEvent('clearJobBlips')
end)

RegisterNetEvent('dispatch:clNotify')
AddEventHandler('dispatch:clNotify', function(pNotificationData)
  print(json.encode(pNotificationData.origin))
  if pNotificationData ~= nil then
    if ESX.GetPlayerData().job.name == 'police' or ESX.GetPlayerData().job.name == 'ambulance' then
        if not disableNotifications then
          if pNotificationData.origin ~= nil then
            if pNotificationData.originStatic == nil or not pNotificationData.originStatic then
                pNotificationData.origin = randomizeBlipLocation(pNotificationData.origin)
                else
                  pNotificationData.origin = pNotificationData.origin
                end
            end
            SendNUIMessage({
              mId = "notification",
              eData = pNotificationData
            })
        end
      end
    end
end)

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(0)
        if (IsControlJustReleased(0, 167) and (ESX.GetPlayerData().job.name == 'ambulance' or ESX.GetPlayerData().job.name == 'police')) then
            showDispatchLog = not showDispatchLog
            SetNuiFocus(showDispatchLog, showDispatchLog)
            SetNuiFocusKeepInput(showDispatchLog)
            SendNUIMessage({
                mId = "showDispatchLog",
                eData = showDispatchLog
            })
        end
        if showDispatchLog then
            DisableControlAction(0, 1, true)
            DisableControlAction(0, 2, true)
            DisableControlAction(0, 263, true) -- disable melee
            DisableControlAction(0, 264, true) -- disable melee
            DisableControlAction(0, 257, true) -- disable melee
            DisableControlAction(0, 140, true) -- disable melee
            DisableControlAction(0, 141, true) -- disable melee
            DisableControlAction(0, 142, true) -- disable melee
            DisableControlAction(0, 143, true) -- disable melee
            DisableControlAction(0, 24, true) -- disable attack
            DisableControlAction(0, 25, true) -- disable aim
            DisableControlAction(0, 47, true) -- disable weapon
            DisableControlAction(0, 58, true) -- disable weapon
            DisablePlayerFiring(PlayerPedId(), true) -- Disable weapon firing
        end
    end
end)

RegisterNUICallback('setGPSMarker', function(data, cb)
  SetNewWaypoint(data.gpsMarkerLocation.x, data.gpsMarkerLocation.y)
  TriggerEvent('notification', "Olay yeri işaretlendi.")
end)
RegisterNUICallback('disableGui', function(data, cb)
  showDispatchLog = not showDispatchLog
  SetNuiFocus(showDispatchLog, showDispatchLog)
  SetNuiFocusKeepInput(showDispatchLog)
end)

RegisterNetEvent('alert:noPedCheck')
AddEventHandler('alert:noPedCheck', function(alertType)
  if alertType == "banktruck" then
    AlertBankTruck()
  end
end)

function GetStreetAndZone()
  local plyPos = GetEntityCoords(PlayerPedId(), true)
  local s1, s2 = Citizen.InvokeNative( 0x2EB41072B4C1E4C0, plyPos.x, plyPos.y, plyPos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
  local street1 = GetStreetNameFromHashKey(s1)
  local street2 = GetStreetNameFromHashKey(s2)
  local zone = GetLabelText(GetNameOfZone(plyPos.x, plyPos.y, plyPos.z))
  local street = street1 .. ", " .. zone
  return street
end


local function uuid()
    math.randomseed(GetCloudTimeAsInt())
    local template ='xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
    return string.gsub(template, '[xy]', function (c)
        local v = (c == 'x') and math.random(0, 0xf) or math.random(8, 0xb)
        return string.format('%x', v)
    end)
end

function getCardinalDirectionFromHeading()
    local heading = GetEntityHeading(PlayerPedId())
    if heading >= 315 or heading < 45 then
        return "Kuzey Yönü"
    elseif heading >= 45 and heading < 135 then
        return "Batı Yönü"
    elseif heading >=135 and heading < 225 then
        return "Güney Yönü"
    elseif heading >= 225 and heading < 315 then
        return "Doğu Yönü"
    end
end

function GetVehicleDescription()
    local currentVehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if not DoesEntityExist(currentVehicle) then
      return
    end
  
    plate = GetVehicleNumberPlateText(currentVehicle)
    make = GetDisplayNameFromVehicleModel(GetEntityModel(currentVehicle))
    color1, color2 = GetVehicleColours(currentVehicle)
  
    if color1 == 0 then color1 = 1 end
    if color2 == 0 then color2 = 2 end
    if color1 == -1 then color1 = 158 end
    if color2 == -1 then color2 = 158 end 
  
    if math.random(100) > 25 then
      plate = GetVehicleNumberPlateText(currentVehicle)
    end
  
    local dir = getCardinalDirectionFromHeading()
  
    local vehicleData  = {
      model = make,
      plate = plate,
      firstColor = colors[color1],
      secondColor = colors[color2],
      heading = dir
    }
    return vehicleData
  end

  function canPedBeUsed(ped,isGunshot,isSpeeder)

    if math.random(100) > 15 then
      return false
    end

    if ped == nil then
        return false
    end

    if isSpeeder == nil then
        isSpeeder = false
    end

    if ped == PlayerPedId() then
        return false
    end

    if GetEntityHealth(ped) < GetEntityMaxHealth(ped) then
      return false
    end

    if isSpeeder then
      if not IsPedInAnyVehicle(ped, false) then
          return false
      end
    end

    if `mp_f_deadhooker` == GetEntityModel(ped) then
      return false
    end

    local curcoords = GetEntityCoords(PlayerPedId())
    local startcoords = GetEntityCoords(ped)

    if #(curcoords - startcoords) < 10.0 then
      return false
    end    

    -- here we add areas that peds can not alert the police
    if #(curcoords - vector3( 1088.76, -3187.51, -38.99)) < 15.0 then
      return false
    end  

    if not HasEntityClearLosToEntity( GetPlayerPed( -1 ), ped , 17 ) and not isGunshot then
      return false
    end

    if not DoesEntityExist(ped) then
        return false
    end

    if IsPedAPlayer(ped) then
        return false
    end

    if IsPedFatallyInjured(ped) then
        return false
    end
    
    if IsPedArmed(ped, 7) then
        return false
    end

    if IsPedInMeleeCombat(ped) then
        return false
    end

    if IsPedShooting(ped) then
        return false
    end

    if IsPedDucking(ped) then
        return false
    end

    if IsPedBeingJacked(ped) then
        return false
    end

    if IsPedSwimming(ped) then
        return false
    end

    if IsPedJumpingOutOfVehicle(ped) or IsPedBeingJacked(ped) then
        return false
    end

    local pedType = GetPedType(ped)
    if pedType == 6 or pedType == 27 or pedType == 29 or pedType == 28 then
        return false
    end
    return true
end

  function getRandomNpc(basedistance,isGunshot)

    local basedistance = basedistance
    local playerped = PlayerPedId()
    local playerCoords = GetEntityCoords(playerped)
    local handle, ped = FindFirstPed()
    local success
    local rped = nil
    local distanceFrom
    repeat
        local pos = GetEntityCoords(ped)
        local distance = #(playerCoords - pos)
        if canPedBeUsed(ped,isGunshot) and distance < basedistance and distance > 2.0 and (distanceFrom == nil or distance < distanceFrom) then
            distanceFrom = distance
            rped = ped
        end
        success, ped = FindNextPed(handle)
    until not success

    EndFindPed(handle)

    return rped
end

RegisterNetEvent('civilian:alertPolice')
AddEventHandler("civilian:alertPolice",function(basedistance,alertType,objPassed,isGunshot,isSpeeder)
  local data = ESX.GetPlayerData()
  local job = data.job.name
  local pd = false
  if job == "police" or job == "sheriff" then
      pd = true
  end

    local object = objPassed

    if not daytime then
      basedistance = basedistance * 8.2
    else
      basedistance = basedistance * 3.45
    end

    if alertType == "personRobbed" and not pd then
      AlertpersonRobbed(object)
    end

    if isGunshot == nil then 
      isGunshot = false 
    end
    if isSpeeder == nil then 
      isSpeeder = false 
    end

    local nearNPC = getRandomNpc(basedistance,isGunshot,isSpeeder)
    local dst = 0

    if nearNPC then
        dst = #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(nearNPC))
    end

    if alertType == "lockpick" and math.random(100) > 88 and not pd then
      nearNPC = true
    end

    if nearNPC == nil and alertType ~= "robberyhouseMansion" and not pd then
      --nobody around for the police call.
      return
    else
      if alertType == "robberyhouseMansion" and not pd then 
        alertType = "robberyhouse" 
      end

      if not isSpeeder and alertType ~= "robberyhouse" then
        RequestAnimDict("amb@code_human_wander_texting@male@base")
        while not HasAnimDictLoaded("amb@code_human_wander_texting@male@base") do
          Citizen.Wait(0)
        end
        Citizen.Wait(1000)
        if GetEntityHealth(nearNPC) < GetEntityMaxHealth(nearNPC) then
          return
        end
        if not DoesEntityExist(nearNPC) then
            return
        end
        if IsPedFatallyInjured(nearNPC) then
            return
        end
        if IsPedInMeleeCombat(nearNPC) then
            return
        end
        ClearPedTasks(nearNPC)
        TaskPlayAnim(nearNPC, "cellphone@", "cellphone_call_listen_base", 1.0, 1.0, -1, 49, 0, 0, 0, 0)
      end
    end

    local plyCoords = GetEntityCoords(PlayerPedId())
    local underground = false
    if plyCoords["z"] < -25 then
        underground = true
    end        

    Citizen.Wait(math.random(5000))

    if alertType == "drugsale" and not underground and not pd then
      if dst > 12.0 and dst < 18.0 then
          DrugSale()
      end
    end

    if alertType == "druguse" and not underground and not pd then
      if dst > 12.0 and dst < 18.0 then
          DrugUse()
      end
    end

    if alertType == "carcrash" then
      CarCrash()
    end

    if alertType == "death" then
      AlertDeath()
      local roadtest2 = IsPointOnRoad(GetEntityCoords(PlayerPedId()), PlayerPedId())

      if roadtest2 then
        return
      end

      BringNpcs()
    end

    if alertType == "PDOF" and not robbing and not underground and not pd then
      if dst > 12.0 and dst < 18.0 then
        AlertPdof()
      end
    end

    if alertType == "Suspicious" then
      AlertSuspicious()
    end

    if alertType == "fight" and not underground then
      AlertFight()      
    end

    if (alertType == "gunshot" or alertType == "gunshotvehicle") then
      AlertGunShot()
    end

    if alertType == "lockpick" then
      if dst > 12.0 and dst < 18.0 then
          AlertCheckLockpick(object)
      end
    end


    if alertType == "robberyhouse" and not ESX.GetPlayerData().job.name == 'police' then
      AlertCheckRobbery2()
    end
end)

function BringNpcs()
    for i = 1, #curWatchingPeds do
      if DoesEntityExist(curWatchingPeds[i]) then
        ClearPedTasks(curWatchingPeds[i])
        SetEntityAsNoLongerNeeded(curWatchingPeds[i])
      end
    end
    curWatchingPeds = {}
    local basedistance = 35.0
    local playerped = PlayerPedId()
    local playerCoords = GetEntityCoords(playerped)
    local handle, ped = FindFirstPed()
    local success
    local rped = nil
    local distanceFrom
    repeat

        local pos = GetEntityCoords(ped)
        local distance = #(playerCoords - pos)
        if canPedBeUsed(ped,false) and distance < basedistance and distance > 3.0 then

          if math.random(75) > 45 and #curWatchingPeds < 5 then

            TriggerEvent("TriggerAIRunning",ped)
            curWatchingPeds[#curWatchingPeds] = ped

          end

        end

        success, ped = FindNextPed(handle)

    until not success

    EndFindPed(handle)
end

tasksIdle = {
  [1] = "CODE_HUMAN_MEDIC_KNEEL",
  [2] = "WORLD_HUMAN_STAND_MOBILE",
}

RegisterNetEvent('TriggerAIRunning')
AddEventHandler("TriggerAIRunning",function(p)
    local usingped = p

    local nm1 = math.random(6,9) / 100
    local nm2 = math.random(6,9) / 100
    nm1 = nm1 + 0.3
    nm2 = nm2 + 0.3
    if math.random(10) > 5 then
      nm1 = 0.0 - nm1
    end

    if math.random(10) > 5 then
      nm2 = 0.0 - nm2
    end

    local moveto = GetOffsetFromEntityInWorldCoords(PlayerPedId(), nm1, nm2, 0.0)
    TaskGoStraightToCoord(usingped, moveto, 2.5, -1, 0.0, 0.0)
    SetPedKeepTask(usingped, true) 

    local dist = #(moveto - GetEntityCoords(usingped))
    while dist > 3.5 and (imdead == 1 or imcollapsed == 1) do
      TaskGoStraightToCoord(usingped, moveto, 2.5, -1, 0.0, 0.0)
      dist = #(moveto - GetEntityCoords(usingped))
      Citizen.Wait(100)
    end

    ClearPedTasksImmediately(ped)
  
    TaskLookAtEntity(usingped, PlayerPedId(), 5500.0, 2048, 3)

    TaskTurnPedToFaceEntity(usingped, PlayerPedId(), 5500)

    Citizen.Wait(3000)

    if math.random(3) == 2 then
      TaskStartScenarioInPlace(usingped, tasksIdle[2], 0, 1)
    elseif math.random(2) == 1 then
      TaskStartScenarioInPlace(usingped, tasksIdle[1], 0, 1)
    else
      TaskStartScenarioInPlace(usingped, tasksIdle[2], 0, 1)
      TaskStartScenarioInPlace(usingped, tasksIdle[1], 0, 1)
    end
   
    SetPedKeepTask(usingped, true) 

    while imdead == 1 or imcollapsed == 1 do
      Citizen.Wait(1)
      if not IsPedFacingPed(usingped, PlayerPedId(), 15.0) then
          ClearPedTasksImmediately(ped)
          TaskLookAtEntity(usingped, PlayerPedId(), 5500.0, 2048, 3)
          TaskTurnPedToFaceEntity(usingped, PlayerPedId(), 5500)
          Citizen.Wait(3000)
      end
    end

    SetEntityAsNoLongerNeeded(usingped)
    ClearPedTasks(usingped)

end)

function AlertFight()
  local street1 = GetStreetAndZone()
  local gender = IsPedMale(PlayerPedId())
  local armed = IsPedArmed(PlayerPedId(), 7)
  local plyPos = GetEntityCoords(PlayerPedId(), true)


  local dispatchCode = "10-10"

  if armed then
    dispatchCode = "10-11"
  end

  local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
  local eventId = uuid()
  if ESX.GetPlayerData().job.name == 'police' then
  TriggerServerEvent('dispatch:svNotify', {
    dispatchCode = dispatchCode,
    firstStreet = street1,
    gender = gender,
    eventId = eventId,
    isImportant = false,
    priority = 1,
    origin = {
      x = plyPos.x,
      y = plyPos.y,
      z = plyPos.z
    },
    dispatchMessage = "Kavga İhbarı",
    blipSprite = 458,
    blipColor = 25
  })

  TriggerEvent('ia-outlawalert:combatInProgress')
  Wait(math.random(5000,15000))

  if math.random(10,10) > 3 and IsPedInAnyVehicle(PlayerPedId()) and not isInVehicle then
    vehicleData = GetVehicleDescription() or {}
    plyPos = GetEntityCoords(PlayerPedId(), true)
    if ESX.GetPlayerData().job.name == 'police' then
    TriggerServerEvent('dispatch:svNotify', {
      dispatchCode = 'CarFleeing',
      relatedCode = dispatchCode,
      firstStreet = street1,
      gender = gender,
      model = vehicleData.model,
      plate = vehicleData.plate,
      isImportant = false,
      priority = 1,
      firstColor = vehicleData.firstColor,
      secondColor = vehicleData.secondColor,
      heading = vehicleData.heading,
      eventId = eventId,
      origin = {
        x = plyPos.x,
        y = plyPos.y,
        z = plyPos.z
      }
    })
    TriggerEvent('ia-outlawalert:combatInProgress')
     end
    end
  end
end

function AlertGunShot()
    Citizen.CreateThread(function() 
      local street1 = GetStreetAndZone()
      local gender = IsPedMale(PlayerPedId())
      local plyPos = GetEntityCoords(PlayerPedId())
  
      local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
      local vehicleData = GetVehicleDescription() or {}
      local initialTenCode = (not isInVehicle and '10-71A' or '10-71B')
      local eventId = uuid()
      Wait(math.random(10000))
if ESX.GetPlayerData().job.name == 'police' then
      TriggerServerEvent('dispatch:svNotify', {
        dispatchCode = initialTenCode,
        firstStreet = street1,
        gender = gender,
        model = vehicleData.model,
        plate = vehicleData.plate,
        isImportant = false,
        priority = 1,
        firstColor = vehicleData.firstColor,
        secondColor = vehicleData.secondColor,
        heading = vehicleData.heading,
        eventId = eventId,
        origin = {
          x = plyPos.x,
          y = plyPos.y,
          z = plyPos.z
        },
        dispatchMessage = (isInVehicle and 'Araçtayken ateş edildi!' or "Silah ateş edildi!"),
      })
      Wait(math.random(5000,10000))

    if math.random(1,10) > 3 and IsPedInAnyVehicle(PlayerPedId()) and not isInVehicle then
      vehicleData = GetVehicleDescription() or {}
      plyPos = GetEntityCoords(PlayerPedId())
      if ESX.GetPlayerData().job.name == 'police' then	
      TriggerServerEvent('dispatch:svNotify', {
        dispatchCode = 'CarFleeing',
        relatedCode = initialTenCode,
        firstStreet = street1,
        gender = gender,
        model = vehicleData.model,
        plate = vehicleData.plate,
        isImportant = false,
        priority = 1,
        firstColor = vehicleData.firstColor,
        secondColor = vehicleData.secondColor,
        heading = vehicleData.heading,
        eventId = eventId,
        origin = {
          x = plyPos.x,
          y = plyPos.y,
          z = plyPos.z
        }
      })
      TriggerServerEvent('ia-outlawalert:gunshotInProgress')
    end
        end
    end
  end)
end

--- Kullanılmıyor ---

-- function CarCrash()
--   local street1 = GetStreetAndZone()
--   local plyPos = GetEntityCoords(PlayerPedId(), true)
--   local gender = IsPedMale(PlayerPedId())

--   local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
--   local dispatchCode = "10-50"
--   local eventId = uuid()
--   if ESX.GetPlayerData().job.name == 'police' or ESX.GetPlayerData().job.name == 'ambulance' then
--   TriggerServerEvent('dispatch:svNotify', {
--     dispatchCode = dispatchCode,
--     firstStreet = street1,
--     gender = gender,
--     eventId = eventId,
--     isImportant = false,
--     priority = 3,
--     dispatchMessage = "Vehicle Crash",
--     origin = {
--       x = plyPos.x,
--       y = plyPos.y,
--       z = plyPos.z
--     }
--   })
--   TriggerEvent('ia-alerts:vehiclecrash')

--   Wait(math.random(5000,15000))

--   local job = ESX.GetPlayerData().job.name
--   if ESX.GetPlayerData().job.name == 'police' then
--   if math.random(1,10) > 3 and IsPedInAnyVehicle(PlayerPedId()) and not isInVehicle and job == "police" then
--     vehicleData = GetVehicleDescription() or {}
--     plyPos = GetEntityCoords(PlayerPedId(), true)
--     TriggerServerEvent('dispatch:svNotify', { 
--       dispatchCode = 'CarFleeing',
--       relatedCode = dispatchCode,
--       firstStreet = street1,
--       gender = gender,
--       model = vehicleData.model,
--       plate = vehicleData.plate,
--       firstColor = vehicleData.firstColor,
--       secondColor = vehicleData.secondColor,
--       heading = vehicleData.heading,
--       eventId = eventId,
--       isImportant = false,
--       priority = 3,
--       dispatchMessage = "Vehicle Crash",
--       origin = {
--         x = plyPos.x,
--         y = plyPos.y,
--         z = plyPos.z
--       }
--     })
--     TriggerEvent('ia-alerts:vehiclecrash')
--   end
-- end
--   end
-- end

function AlertCheckLockpick(object)
  local street1 = GetStreetAndZone()
  local gender = IsPedMale(PlayerPedId())
  local targetVehicle = object
  local origin = GetEntityCoords(PlayerPedId())
  if not DoesEntityExist(targetVehicle) then
    vehicleData = GetVehicleDescription() or {}
    plyPos = GetEntityCoords(PlayerPedId(), true)
    if ESX.GetPlayerData().job.name == 'police' then
    TriggerServerEvent('dispatch:svNotify', {
      dispatchCode = '10-60',
      firstStreet = street1,
      gender = gender,
      model = vehicleData.model,
      plate = vehicleData.plate,
      firstColor = vehicleData.firstColor,
      secondColor = vehicleData.secondColor,
      heading = vehicleData.heading,
      isImportant = false,
      priority = 1,
      dispatchMessage = "Çalıntı Araç",
      origin = {
        x = plyPos.x,
        y = plyPos.y,
        z = plyPos.z
      }
    })
    TriggerEvent('ia-alerts:vehiclesteal')
    return
    end
  end
end


function AlertpersonRobbed(vehicle)
  local street1 = GetStreetAndZone()
  local gender = IsPedMale(PlayerPedId())
  local plyPos = GetEntityCoords(PlayerPedId(), true)

  local dispatchCode = "10-31B"
  local eventId = uuid()
  if ESX.GetPlayerData().job.name == 'police' then
  TriggerServerEvent('dispatch:svNotify', {
    dispatchCode = dispatchCode,
    firstStreet = street1,
    gender = gender,
    eventId = eventId,
    isImportant = true,
    priority = 1,
    dispatchMessage = "Market Soygunu İşlemde",
    origin = {
      x = plyPos.x,
      y = plyPos.y,
      z = plyPos.z
    }
  })
  Wait(math.random(5000,15000))

  if math.random(1,10) > 3 and IsPedInAnyVehicle(PlayerPedId()) then
    vehicleData = GetVehicleDescription() or {}
    plyPos = GetEntityCoords(PlayerPedId(), true)
    if ESX.GetPlayerData().job.name == 'police' then
    TriggerServerEvent('dispatch:svNotify', {
      dispatchCode = 'CarFleeing',
      relatedCode = dispatchCode,
      firstStreet = street1,
      gender = gender,
      model = vehicleData.model,
      plate = vehicleData.plate,
      firstColor = vehicleData.firstColor,
      secondColor = vehicleData.secondColor,
      heading = vehicleData.heading,
      eventId = eventId,
      isImportant = true,
      priority = 1,
      origin = {
        x = plyPos.x,
        y = plyPos.y,
        z = plyPos.z
      }
    })
    TriggerEvent('ia-alerts:storerobbery')
  end
end
  end
end

function AlertCheckRobbery2()
  local street1 = GetStreetAndZone()
  local gender = IsPedMale(PlayerPedId()) 
  local plyPos = GetEntityCoords(PlayerPedId(), true)

  local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
  local dispatchCode = "10-31A"
  local eventId = uuid()
  if ESX.GetPlayerData().job.name == 'police' then
  TriggerServerEvent('dispatch:svNotify', {
    dispatchCode = dispatchCode,
    firstStreet = street1,
    gender = gender,
    eventId = eventId,
    isImportant = true,
    priority = 1,
    dispatchMessage = "Ev Soygunu Olabilir",
    origin = {
      x = plyPos.x,
      y = plyPos.y,
      z = plyPos.z
    }
  })

  TriggerEvent('ia-alerts:houserobbery')
  Wait(math.random(5000,15000))

  if math.random(1,10) > 3 and IsPedInAnyVehicle(PlayerPedId()) and not isInVehicle then
    vehicleData = GetVehicleDescription() or {}
    plyPos = GetEntityCoords(PlayerPedId(), true)
    if ESX.GetPlayerData().job.name == 'police' then
    TriggerServerEvent('dispatch:svNotify', {
      dispatchCode = 'CarFleeing',
      relatedCode = dispatchCode,
      firstStreet = street1,
      gender = gender,
      model = vehicleData.model,
      plate = vehicleData.plate,
      firstColor = vehicleData.firstColor,
      secondColor = vehicleData.secondColor,
      heading = vehicleData.heading,
      eventId = eventId,
      isImportant = true,
      priority = 1,
      origin = {
        x = plyPos.x,
        y = plyPos.y,
        z = plyPos.z
      }
    })
    TriggerEvent('ia-alerts:houserobbery')
  end
end
  end
end

function AlertBankTruck()
  local street1 = GetStreetAndZone()
  local gender = IsPedMale(PlayerPedId())
  local plyPos = GetEntityCoords(PlayerPedId())
  local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
  local dispatchCode = "10-90"
  local eventId = uuid()
  if ESX.GetPlayerData().job.name == 'police' then
  TriggerServerEvent('dispatch:svNotify', {
    dispatchCode = dispatchCode,
    firstStreet = street1,
    gender = gender,
    eventId = eventId,
    isImportant = true,
    priority = 1,
    dispatchMessage = "Banka Aracı Soygunu İşlemde!",
    origin = {
      x = plyPos.x,
      y = plyPos.y,
      z = plyPos.z
    }
  })
  
  TriggerEvent('ia-alerts:banktruck')
  Wait(math.random(5000,15000))

  if math.random(1,10) > 3 and IsPedInAnyVehicle(PlayerPedId()) and not isInVehicle then
    plyPos = GetEntityCoords(PlayerPedId())
    vehicleData = GetVehicleDescription() or {}
    if ESX.GetPlayerData().job.name == 'police' then
    TriggerServerEvent('dispatch:svNotify', {
      dispatchCode = 'CarFleeing',
      relatedCode = dispatchCode,
      firstStreet = street1,
      gender = gender,
      model = vehicleData.model,
      plate = vehicleData.plate,
      firstColor = vehicleData.firstColor,
      secondColor = vehicleData.secondColor,
      heading = vehicleData.heading,
      eventId = eventId,
      isImportant = true,
      priority = 1,
      origin = {
        x = plyPos.x,
        y = plyPos.y,
        z = plyPos.z
      }
    })
    TriggerEvent('ia-alerts:banktruck')
  end
end
  end
end

function AlertJewelRob()
  local street1 = GetStreetAndZone()
  local gender = IsPedMale(PlayerPedId())
  local plyPos = GetEntityCoords(PlayerPedId())
  local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
  local dispatchCode = "10-90"
  local eventId = uuid()
  if ESX.GetPlayerData().job.name == 'police' then
  TriggerServerEvent('dispatch:svNotify', {
    dispatchCode = dispatchCode,
    firstStreet = street1,
    gender = gender,
    eventId = eventId,
    isImportant = true,
    priority = 1,
    dispatchMessage = "Kuyumcu Alarmı Tetiklendi",
    origin = {
      x = plyPos.x,
      y = plyPos.y,
      z = plyPos.z
    }
  })
  
  TriggerEvent('ia-alerts:jewelrobbey')
  Wait(math.random(5000,15000))

  if math.random(1,10) > 3 and IsPedInAnyVehicle(PlayerPedId()) and not isInVehicle then
    plyPos = GetEntityCoords(PlayerPedId())
    vehicleData = GetVehicleDescription() or {}
    if ESX.GetPlayerData().job.name == 'police' then
    TriggerServerEvent('dispatch:svNotify', {
      dispatchCode = 'CarFleeing',
      relatedCode = dispatchCode,
      firstStreet = street1,
      gender = gender,
      model = vehicleData.model,
      plate = vehicleData.plate,
      firstColor = vehicleData.firstColor,
      secondColor = vehicleData.secondColor,
      heading = vehicleData.heading,
      eventId = eventId,
      isImportant = true,
      priority = 1,
      origin = {
        x = plyPos.x,
        y = plyPos.y,
        z = plyPos.z
      }
    })
    TriggerEvent('ia-alerts:jewelrobbey')
  end
end
  end
end

function AlertJailBreak()
  local street1 = GetStreetAndZone()
  local gender = IsPedMale(PlayerPedId())
  local plyPos = GetEntityCoords(PlayerPedId())
  local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
  local dispatchCode = "10-98"
  local eventId = uuid()
  if ESX.GetPlayerData().job.name == 'police' then
  TriggerServerEvent('dispatch:svNotify', {
    dispatchCode = dispatchCode,
    firstStreet = street1,
    gender = gender,
    eventId = eventId,
    isImportant = true,
    priority = 1,
    dispatchMessage = "Hapis Alarmları Yükseldi!",
    origin = {
      x = plyPos.x,
      y = plyPos.y,
      z = plyPos.z
    }
  })
  
  TriggerEvent('ia-alerts:jailbreak')
  Wait(math.random(5000,15000))

  if math.random(1,10) > 3 and IsPedInAnyVehicle(PlayerPedId()) and not isInVehicle then
    plyPos = GetEntityCoords(PlayerPedId())
    vehicleData = GetVehicleDescription() or {}
    if ESX.GetPlayerData().job.name == 'police' then
    TriggerServerEvent('dispatch:svNotify', {
      dispatchCode = 'CarFleeing',
      relatedCode = dispatchCode,
      firstStreet = street1,
      gender = gender,
      model = vehicleData.model,
      plate = vehicleData.plate,
      firstColor = vehicleData.firstColor,
      secondColor = vehicleData.secondColor,
      heading = vehicleData.heading,
      eventId = eventId,
      isImportant = true,
      priority = 1,
      origin = {
        x = plyPos.x,
        y = plyPos.y,
        z = plyPos.z
      }
    })
    TriggerEvent('ia-alerts:jailbreak')
  end
end
  end
end

function AlertFleecaRobbery()
  local street1 = GetStreetAndZone()
  local gender = IsPedMale(PlayerPedId())
  local plyPos = GetEntityCoords(PlayerPedId())
  local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
  local dispatchCode = "10-41P"
  local eventId = uuid()
  if ESX.GetPlayerData().job.name == 'police' then
  TriggerServerEvent('dispatch:svNotify', {
    dispatchCode = dispatchCode,
    firstStreet = street1,
    gender = gender,
    eventId = eventId,
    isImportant = true,
    priority = 1,
    dispatchMessage = "Vezne Soygunu",
    origin = {
      x = plyPos.x,
      y = plyPos.y,
      z = plyPos.z
    }
  })
  TriggerEvent('ia-alerts:veznerobbery')
  Wait(math.random(5000,15000))

  if math.random(1,10) > 3 and IsPedInAnyVehicle(PlayerPedId()) and not isInVehicle then
    plyPos = GetEntityCoords(PlayerPedId())
    vehicleData = GetVehicleDescription() or {}
    if ESX.GetPlayerData().job.name == 'police' then
    TriggerServerEvent('dispatch:svNotify', {
      dispatchCode = 'CarFleeing',
      relatedCode = dispatchCode,
      firstStreet = street1,
      gender = gender,
      model = vehicleData.model,
      plate = vehicleData.plate,
      firstColor = vehicleData.firstColor,
      secondColor = vehicleData.secondColor,
      heading = vehicleData.heading,
      eventId = eventId,
      isImportant = true,
      priority = 1,
      origin = {
        x = plyPos.x,
        y = plyPos.y,
        z = plyPos.z
      }
    })
    TriggerEvent('ia-alerts:veznerobbery')
  end
end
  end
end

function AlertDrugJob()
  local street1 = GetStreetAndZone()
  local gender = IsPedMale(PlayerPedId())
  local plyPos = GetEntityCoords(PlayerPedId())
  local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
  local dispatchCode = "10-15"
  local eventId = uuid()
  if ESX.GetPlayerData().job.name == 'police' then
  TriggerServerEvent('dispatch:svNotify', {
    dispatchCode = dispatchCode,
    firstStreet = street1,
    gender = gender,
    eventId = eventId,
    isImportant = true,
    priority = 1,
    dispatchMessage = "Uyuşturucu Kaçakçılığı Olabilir!",
    origin = {
      x = plyPos.x,
      y = plyPos.y,
      z = plyPos.z
    }
  })

  TriggerEvent('t1ger_drugs:OutlawBlipEvent')
  
  Wait(math.random(5000,15000))

  if IsPedInAnyVehicle(PlayerPedId()) then
    plyPos = GetEntityCoords(PlayerPedId())
    vehicleData = GetVehicleDescription() or {}
    if ESX.GetPlayerData().job.name == 'police' then
    TriggerServerEvent('dispatch:svNotify', {
      dispatchCode = 'CarFleeing',
      relatedCode = dispatchCode,
      firstStreet = street1,
      gender = gender,
      model = vehicleData.model,
      plate = vehicleData.plate,
      firstColor = vehicleData.firstColor,
      secondColor = vehicleData.secondColor,
      heading = vehicleData.heading,
      eventId = eventId,
      isImportant = true,
      priority = 1,
      origin = {
        x = plyPos.x,
        y = plyPos.y,
        z = plyPos.z
      }
    })
    TriggerEvent('t1ger_drugs:OutlawBlipEvent')
  end
end
  end
end

function AlertOfficerDown()
    local street1 = GetStreetAndZone()
    local gender = IsPedMale(PlayerPedId())
    local plyPos = GetEntityCoords(PlayerPedId())
    local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
    local dispatchCode = "10-13A"
    local eventId = uuid()
    if ESX.GetPlayerData().job.name == 'police' then
    TriggerServerEvent('ia-outlawalert:gunshotInProgress', {
      dispatchCode = dispatchCode,
      firstStreet = street1,
      gender = gender,
      eventId = eventId,
      isImportant = true,
      priority = 1,
      dispatchMessage = "Yaralı Memur",
      origin = {
        x = plyPos.x,
        y = plyPos.y,
        z = plyPos.z
      }
    })
    
    TriggerEvent('police:tenThirteenA')
    Wait(math.random(5000,15000))
  
    if math.random(1,10) > 3 and IsPedInAnyVehicle(PlayerPedId()) and not isInVehicle then
      plyPos = GetEntityCoords(PlayerPedId())
      vehicleData = GetVehicleDescription() or {}
      if ESX.GetPlayerData().job.name == 'police' then
      TriggerServerEvent('ia-outlawalert:gunshotInProgress', {
        dispatchCode = '10-13A',
        relatedCode = dispatchCode,
        firstStreet = street1,
        gender = gender,
        model = vehicleData.model,
        plate = vehicleData.plate,
        firstColor = vehicleData.firstColor,
        secondColor = vehicleData.secondColor,
        heading = vehicleData.heading,
        eventId = eventId,
        isImportant = true,
        priority = 1,
        origin = {
          x = plyPos.x,
          y = plyPos.y,
          z = plyPos.z
        }
      })
      TriggerEvent('ia-alerts:tenThirteenA')
    end
  end
    end
  end

  function AlertMedicDown()
    local street1 = GetStreetAndZone()
    local gender = IsPedMale(PlayerPedId())
    local name = IsPedAPlayer(PlayerPedId())
    local plyPos = GetEntityCoords(PlayerPedId())
    local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
    local dispatchCode = "10-14B"
    local eventId = uuid()
    if ESX.GetPlayerData().job.name == 'police' or ESX.GetPlayerData().job.name == 'ambulance' then	
    TriggerServerEvent('ia-outlawalert:gunshotInProgress', {
      dispatchCode = dispatchCode,
      firstStreet = street1,
      gender = gender,
      eventId = eventId,
      isImportant = true,
      priority = 1,
      dispatchMessage = "Yaralı Doktor",
      origin = {
        x = plyPos.x,
        y = plyPos.y,
        z = plyPos.z
      }
    })
    
    TriggerEvent('doctor:tenForteenB')
    Wait(math.random(5000,15000))
  
    if math.random(1,10) > 3 and IsPedInAnyVehicle(PlayerPedId()) and not isInVehicle then
      plyPos = GetEntityCoords(PlayerPedId())
      name = IsPedAPlayer(PlayerPedId())
      vehicleData = GetVehicleDescription() or {}
      if ESX.GetPlayerData().job.name == 'police' then
      TriggerServerEvent('ia-outlawalert:gunshotInProgress', {
        dispatchCode = '10-13A',
        relatedCode = dispatchCode,
        firstStreet = street1,
        gender = gender,
        model = vehicleData.model,
        plate = vehicleData.plate,
        firstColor = vehicleData.firstColor,
        secondColor = vehicleData.secondColor,
        heading = vehicleData.heading,
        eventId = eventId,
        isImportant = true,
        priority = 1,
        origin = {
          x = plyPos.x,
          y = plyPos.y,
          z = plyPos.z
        }
      })
      TriggerEvent('ia-alerts:tenForteenB')
    end
  end
    end
  end

  function AlertDeath()
    local street1 = GetStreetAndZone()
    local gender = IsPedMale(PlayerPedId())
    local name = IsPedAPlayer(PlayerPedId())
    local plyPos = GetEntityCoords(PlayerPedId())
    local isInVehicle = IsPedInAnyVehicle(PlayerPedId())
    local dispatchCode = "10-11A"
    local eventId = uuid()
    if ESX.GetPlayerData().job.name == 'ambulance' then
    TriggerServerEvent('ia-outlawalert:gunshotInProgress', {
      dispatchCode = dispatchCode,
      firstStreet = street1,
      gender = gender,
      eventId = eventId,
      isImportant = true,
      priority = 1,
      dispatchMessage = "Yaralı İhbarı",
      origin = {
        x = plyPos.x,
        y = plyPos.y,
        z = plyPos.z
      }
    })
    
    TriggerEvent('ambulance-death')
    Wait(math.random(5000,15000))
  
    if math.random(1,10) > 3 and IsPedInAnyVehicle(PlayerPedId()) and not isInVehicle then
      plyPos = GetEntityCoords(PlayerPedId())
      name = IsPedAPlayer(PlayerPedId())
      vehicleData = GetVehicleDescription() or {}
      if ESX.GetPlayerData().job.name == 'police' then
      TriggerServerEvent('ia-outlawalert:gunshotInProgress', {
        dispatchCode = '311-14A',
        relatedCode = dispatchCode,
        firstStreet = street1,
        gender = gender,
        model = vehicleData.model,
        plate = vehicleData.plate,
        firstColor = vehicleData.firstColor,
        secondColor = vehicleData.secondColor,
        heading = vehicleData.heading,
        eventId = eventId,
        isImportant = true,
        priority = 1,
        origin = {
          x = plyPos.x,
          y = plyPos.y,
          z = plyPos.z
        }
      })
      TriggerEvent('ambulance-death')
    end
  end
    end
  end

  RegisterNetEvent('ia-dispatch:drugjob')
  AddEventHandler("ia-dispatch:drugjob",function()
    AlertDrugJob()
  end)
  
  RegisterNetEvent('ia-dispatch:bankrobbery')
  AddEventHandler("ia-dispatch:bankrobbery",function()
    AlertFleecaRobbery()
  end)
  
  RegisterNetEvent('ia-dispatch:jailbreak')
  AddEventHandler("ia-dispatch:jailbreak",function()
    AlertJailBreak()
  end)
  
  RegisterNetEvent('ia-dispatch:jewelrobbery')
  AddEventHandler("ia-dispatch:jewelrobbery",function()
    AlertJewelRob()
  end)
  
  RegisterNetEvent('ia-dispatch:houserobbery')
  AddEventHandler("ia-dispatch:houserobbery",function()
    AlertCheckRobbery2()
  end)
  
  RegisterNetEvent('ia-dispatch:storerobbery')
  AddEventHandler("ia-dispatch:storerobbery",function()
    AlertpersonRobbed(vehicle)
  end)
  
  RegisterNetEvent('ia-dispatch:carjacking')
  AddEventHandler("ia-dispatch:carjacking",function()
    AlertCheckLockpick(object)
  end)
  
  RegisterNetEvent('ia-ambulancejob:downplayer')
  AddEventHandler("ia-ambulancejob:downplayer",function()
      AlertDeath()
  end)
  
  RegisterNetEvent('ia-dispatch:tenThirteenA')
  AddEventHandler("ia-dispatch:tenThirteenA",function()
     AlertOfficerDown()
  end)
  
  RegisterNetEvent('ia-dispatch:tenThirteenB')
  AddEventHandler("ia-dispatch:tenThirteenB",function()
    AlertMedicDown()
  end)

  RegisterNetEvent('ia-dispatch:veznerobbery')
  AddEventHandler("ia-dispatch:veznerobbery",function()
    AlertFleecaRobbery()
  end)

--  RegisterCommand("vezne", function()
--    AlertFleecaRobbery()
--  end)
  



  -- RegisterCommand("ialeaks20", function()
  --   AlertDeath()
  -- end)





  -- RegisterCommand("ialeaks31", function()
  --   AlertMedicDown()
  -- end)






  -- RegisterCommand("ialeaks1", function()
  --   AlertJailBreak()
  -- end)





  -- RegisterCommand("ialeaks2", function()
  --   AlertFleecaRobbery()
  -- end)






  -- RegisterCommand("ialeaks3", function()
  --   AlertpersonRobbed()
  -- end)






  -- RegisterCommand("ialeaks4", function()
  --   AlertDrugJob()
  -- end)






  -- RegisterCommand("ialeaks5", function()
  --   AlertCheckLockpick()
  -- end)

  



  
  -- RegisterCommand("backup", function()
  --   AlertOfficerDown()
  -- end)
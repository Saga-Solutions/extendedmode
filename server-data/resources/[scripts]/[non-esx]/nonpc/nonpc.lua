--- Fonction régulation traffic et PNG Fontion 1 mais pas trop de png
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0) -- prevent crashing

        --These natives have to be called every frame.
        SetVehicleDensityMultiplierThisFrame(0.0) -- set traffic density to 0 
        SetPedDensityMultiplierThisFrame(0.0) -- set npc/ai peds density to 0
        SetRandomVehicleDensityMultiplierThisFrame(0.0) -- set random vehicles (car scenarios / cars driving off from a parking spot etc.) to 0
        SetParkedVehicleDensityMultiplierThisFrame(0.0) -- set random parked vehicles (parked car scenarios) to 0
        SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0) -- set random npc/ai peds or scenario peds to 0
        SetGarbageTrucks(0) -- Stop garbage trucks from randomly spawning
        SetRandomBoats(0) -- Stop random boats from spawning in the water.
        SetCreateRandomCops(false) -- disable random cops walking/driving around.
        SetCreateRandomCopsNotOnScenarios(false) -- stop random cops (not in a scenario) from spawning.
        SetCreateRandomCopsOnScenarios(false) -- stop random cops (in a scenario) from spawning.
		
        
        local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
        ClearAreaOfVehicles(x, y, z, 3000, false, false, false, false, false)
        RemoveVehiclesFromGeneratorsInArea(x -3000.0, y - 3000.0, z - 3000.0, x + 3000.0, y + 3000.0, z + 3000.0)
    end
end)

CreateThread(function()   
    StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE");
    SetAudioFlag("PoliceScannerDisabled",true);
end)
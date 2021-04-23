Config = {}

Config.LockKey = 7 -- default 303 = U for more keys https://docs.fivem.net/docs/game-references/controls/

Config.LockDistance = 25.0

Config.GiveDistance = 4.0

Config.LockpickTime = 14000 --ms

Config.LockpickChance = 65

Config.DeleteLockpickOnFail = true

Config.HotWireTime = 10000 --ms

Config.UseM3Dispatch = false -- only working with m3_dispatch


--you need to add this line wherever you add a vehicle to the data(like policejob, ambulancejob, vehicleshop)
-- TriggerServerEvent('m3:vehiclelock:plateRegister', plate) or TriggerEvent('m3:vehiclelock:plateRegister', source, plate)
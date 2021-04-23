function CreateBlipCircle2(coords, text, radius, color, sprite)
	local blip = AddBlipForRadius(coords, radius)

	SetBlipHighDetail(blip, true)
	SetBlipColour(blip, 2)
	SetBlipAlpha (blip, 128)

	blip = AddBlipForCoord(coords)

	SetBlipHighDetail(blip, true)
	SetBlipSprite (blip, sprite)
	SetBlipPriority (blip,100)
	SetBlipScale  (blip, 0.7)
	SetBlipColour (blip, color)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(text)
	EndTextCommandSetBlipName(blip)
end

Citizen.CreateThread(function()
	for k,zone in pairs(CircleZones2) do
		CreateBlipCircle2(zone.coords, zone.name, zone.radius, zone.color, zone.sprite)
	end
end)

CircleZones2 = {
	--Motel = {coords = vector3(-1276.98,310.37,65.51), name = 'Motel', color = 17, sprite = 475, radius = 0.0},
	Emlak = {coords = vector3(-697.49,271.48,83.11), name = 'Emlak Ofisi', color = 2, sprite = 500, radius = 0.0},
}

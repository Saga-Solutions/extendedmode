Config = {}
Config.Locale = 'en'

Config.MarkerType   = 25
Config.DrawDistance = 100.0
Config.MarkerSize   = {x = 2.0, y = 2.0, z = 0.5}
Config.MarkerColor  = {r = 255, g = 0, b = 0}

Config.BlipHospital = {
	Sprite = 403,
	Color = 2,
	Display = 2,
	Scale = 0.9
}

Config.Price = 100 -- Edit this to your liking.

Config.EnableUnemployedOnly = false -- If true it will only show Blips to Unemployed Players | false shows it to Everyone.
Config.EnableBlips = false -- If true then it will show blips | false does the Opposite.
Config.EnablePeds = true -- If true then it will add Peds on Markers | false does the Opposite.

Config.Locations = {
	{ x = 305.60, y = -594.58, z = 42.3, heading = 340.62 }

}

Config.Zones = {}

for i=1, #Config.Locations, 1 do
	Config.Zones['Shop_' .. i] = {
		Pos   = Config.Locations[i],
		Size  = Config.MarkerSize,
		Color = Config.MarkerColor,
		Type  = Config.MarkerType
	}
end

Citizen.CreateThread(function()
    while true do
        -- Replace the functions below with your own ID and asset-names
        -- This is the Application ID (Replace this with you own)
		SetDiscordAppId(519149893609062401)

        -- Here you will have to put the image name for the "large" icon.
		SetDiscordRichPresenceAsset('logo')

        -- Here you can add hover text for the "large" icon.
        SetDiscordRichPresenceAssetText('Kaypuz V 1.1.2')
       
        -- Here you will have to put the image name for the "small" icon.
        SetDiscordRichPresenceAssetSmall('meeter')

        -- Here you can add hover text for the "small" icon.
        SetDiscordRichPresenceAssetSmallText('https://discord.gg/ghGtzSE')
       
        
        -- Your own playername (Don't touch)
        local playerName = GetPlayerName(PlayerId())

        -- Set here the amount of slots you have (Edit if needed)
        local maxPlayerSlots = 1000

        -- For loop to get active player (Legacy method)
        local playerCount= 0
        for i = 0, maxPlayerSlots do
            if NetworkIsPlayerActive(i) then
                 playerCount = playerCount+1
            end
        end

        -- Sets the string with variables as RichPresence (Don't touch)
        SetRichPresence(string.format("%s - %s/%s", playerName, playerCount, maxPlayerSlots))
        
        -- It updates every one minute just in case.
		Citizen.Wait(60000)
	end
end)
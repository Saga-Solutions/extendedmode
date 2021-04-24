fx_version 'adamant'

game 'gta5'

client_scripts {
    'config.lua',
    'client.lua'
}

server_scripts {
    'config.lua',
    '@mysql-async/lib/MySQL.lua',
    'server.lua'
}

ui_page {
    'html.html'
}

files {
    'html.html',
    'js.js',
}

dependencies {
    'mythic_notify'
}
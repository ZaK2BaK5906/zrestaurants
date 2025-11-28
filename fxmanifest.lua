fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'zrestaurants'
author 'ZaK2BaK5906'
version '1.0.0'
description 'Advanced Restaurant System for FiveM with OX Dependencies'

shared_scripts {
    '@es_extended/imports.lua',
    '@ox_lib/init.lua',
    'config/config.lua',
    'config/restaurants.lua',
    'config/ingredients.lua',
    'config/stations.lua',
    'shared/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/database.lua',
    'server/main.lua',
    'server/callbacks.lua',
    'server/society.lua',
    'server/crafting.lua',
    'server/delivery.lua',
    'server/shop.lua'
}

client_scripts {
    'client/main.lua',
    'client/target.lua',
    'client/menu.lua',
    'client/crafting.lua',
    'client/register.lua',
    'client/garage.lua',
    'client/delivery.lua',
    'client/shop.lua',
    'client/drivethru.lua',
    'client/music.lua',
    'client/chairs.lua'
}

dependencies {
    'es_extended',
    'ox_lib',
    'ox_inventory',
    'esx_society',
    '/onesync'
}

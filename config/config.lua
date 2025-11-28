Config = {}

-- Framework Settings
Config.Framework = 'esx' -- Only ESX for now
Config.Locale = 'en'

-- Target System (ox_target or interact)
Config.Target = 'ox_target' -- 'ox_target' or 'interact'

-- Calories System
Config.CaloriesEnabled = true
Config.CaloriesPerHunger = 100 -- 100 calories = 10% hunger
Config.CaloriesPerThirst = 100 -- 100 calories = 10% thirst

-- Recipe Limits
Config.MaxIngredientsPerRecipe = 10
Config.MaxRecipesPerRestaurant = 50
Config.MaxPricePerRecipe = 10000

-- Delivery System
Config.DeliveryEnabled = true
Config.DeliveryCooldown = 900 -- seconds (15 minutes)
Config.DeliveryReward = {min = 500, max = 1500}

-- Offline Shop
Config.OfflineShopEnabled = true
Config.OfflineShopTax = 0.10 -- 10% tax

-- Music System
Config.MusicEnabled = true
Config.MaxMusicVolume = 0.5

-- Garage System
Config.GarageEnabled = true
Config.GarageSpawnDistance = 5.0

-- Drive Thru System
Config.DriveThruEnabled = true
Config.DriveThruDistance = 10.0
Config.DriveThruNotificationDistance = 5.0

-- Blips
Config.ShowBlips = true
Config.BlipSprite = 267
Config.BlipColor = 47
Config.BlipScale = 0.8

-- Debug Mode
Config.Debug = false

-- Animation Settings
Config.Animations = {
    prepare = {
        dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
        anim = 'machinic_loop_mechandplayer',
        flag = 49
    },
    cook = {
        dict = 'amb@prop_human_bbq@male@base',
        anim = 'base',
        flag = 49
    },
    grill = {
        dict = 'amb@prop_human_bbq@male@base',
        anim = 'base',
        flag = 49
    },
    fryer = {
        dict = 'amb@prop_human_parking_meter@female@idle_a',
        anim = 'idle_a',
        flag = 49
    },
    drink = {
        dict = 'mp_ped_interaction',
        anim = 'handshake_guy_a',
        flag = 49
    },
    pack = {
        dict = 'anim@heists@box_carry@',
        anim = 'idle',
        flag = 49
    }
}

-- Notification Settings
Config.Notifications = {
    position = 'top-right',
    duration = 5000
}

-- Permissions
Config.Permissions = {
    managementMenu = {'boss'}, -- ESX job grades
    createRecipes = {'boss', 'manager'},
    editMenu = {'boss', 'manager'},
    accessStash = {'boss', 'manager', 'cook', 'employee'},
    useRegister = {'boss', 'manager', 'cashier', 'employee'},
    delivery = {'employee', 'delivery'},
    garage = {'boss', 'manager', 'employee'}
}

-- Society Settings
Config.SocietyPrefix = 'society_' -- Will be 'society_burgershot', 'society_pizzathis' etc.

-- Currency Symbol
Config.CurrencySymbol = '$'

return Config

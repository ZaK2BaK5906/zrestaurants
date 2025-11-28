Restaurants = {}

Restaurants['burgershot'] = {
    label = 'Burger Shot',
    job = 'burgershot',
    blip = {
        enabled = true,
        coords = vector3(-1193.91, -885.27, 13.98),
        sprite = 106,
        color = 47,
        scale = 0.8
    },

    -- Features Toggle
    features = {
        management = true,
        stash = true,
        trays = true,
        crafting = true,
        register = true,
        delivery = true,
        offlineShop = true,
        garage = true,
        driveThru = true,
        music = true,
        chairs = true,
        peds = true,
        props = true
    },

    -- Management Menu
    management = {
        coords = vector3(-1199.89, -897.87, 13.98),
        heading = 123.0,
        distance = 2.0
    },

    -- Stashes
    stashes = {
        {
            name = 'burgershot_storage',
            label = 'Burger Shot Storage',
            coords = vector3(-1203.77, -897.30, 13.98),
            heading = 35.0,
            slots = 50,
            weight = 100000,
            distance = 2.0
        },
        {
            name = 'burgershot_fridge',
            label = 'Burger Shot Fridge',
            coords = vector3(-1200.44, -898.16, 13.98),
            heading = 35.0,
            slots = 30,
            weight = 50000,
            distance = 2.0
        }
    },

    -- Trays
    trays = {
        {
            name = 'burgershot_tray1',
            label = 'Tray 1',
            coords = vector3(-1195.32, -892.44, 14.98),
            heading = 35.0,
            slots = 10,
            weight = 10000,
            distance = 2.0
        },
        {
            name = 'burgershot_tray2',
            label = 'Tray 2',
            coords = vector3(-1193.88, -893.97, 14.98),
            heading = 35.0,
            slots = 10,
            weight = 10000,
            distance = 2.0
        }
    },

    -- Crafting Stations
    stations = {
        {
            type = 'grill',
            coords = vector3(-1201.80, -900.33, 13.98),
            heading = 303.0,
            distance = 2.0
        },
        {
            type = 'fryer',
            coords = vector3(-1202.63, -899.39, 13.98),
            heading = 303.0,
            distance = 2.0
        },
        {
            type = 'prepare',
            coords = vector3(-1198.66, -897.84, 13.98),
            heading = 213.0,
            distance = 2.0
        },
        {
            type = 'drink',
            coords = vector3(-1199.65, -896.33, 13.98),
            heading = 213.0,
            distance = 2.0
        }
    },

    -- Registers
    registers = {
        {
            coords = vector3(-1195.32, -891.44, 14.98),
            heading = 213.0,
            distance = 2.0
        },
        {
            coords = vector3(-1193.88, -892.97, 14.98),
            heading = 213.0,
            distance = 2.0
        }
    },

    -- Garage
    garage = {
        spawn = vector4(-1177.88, -896.97, 13.80, 303.0),
        delete = vector3(-1177.88, -896.97, 13.80),
        distance = 3.0,
        vehicles = {
            {model = 'burrito3', label = 'Delivery Van', price = 0},
            {model = 'speedo', label = 'Speedo Van', price = 5000}
        }
    },

    -- Drive Thru
    driveThru = {
        enabled = true,
        orderPoint = vector3(-1188.27, -885.23, 13.91),
        pickupPoint = vector3(-1193.91, -885.27, 13.98),
        distance = 5.0
    },

    -- Music Zones
    music = {
        {
            coords = vector3(-1195.0, -895.0, 14.0),
            range = 20.0,
            volume = 0.3,
            allowedJobs = {'burgershot'}
        }
    },

    -- Chairs
    chairs = {
        {coords = vector3(-1191.22, -889.22, 13.98), heading = 213.0},
        {coords = vector3(-1189.78, -890.75, 13.98), heading = 213.0},
        {coords = vector3(-1193.22, -887.22, 13.98), heading = 123.0},
        {coords = vector3(-1191.78, -888.75, 13.98), heading = 123.0}
    },

    -- Peds
    peds = {
        {
            model = 's_f_y_sweatshop_01',
            coords = vector4(-1195.32, -892.44, 13.98, 213.0),
            scenario = 'WORLD_HUMAN_STAND_MOBILE'
        }
    },

    -- Props
    props = {
        {
            model = 'prop_food_bs_tray_01',
            coords = vector3(-1195.32, -892.44, 14.98),
            heading = 35.0
        }
    },

    -- Offline Shop Zone
    shopZone = {
        coords = vector3(-1195.0, -892.0, 14.0),
        size = vector3(10.0, 10.0, 3.0),
        rotation = 35.0
    }
}

Restaurants['pizzathis'] = {
    label = 'Pizza This',
    job = 'pizzathis',
    blip = {
        enabled = true,
        coords = vector3(811.0, -751.0, 26.78),
        sprite = 267,
        color = 1,
        scale = 0.8
    },

    features = {
        management = true,
        stash = true,
        trays = true,
        crafting = true,
        register = true,
        delivery = true,
        offlineShop = true,
        garage = true,
        driveThru = false,
        music = true,
        chairs = true,
        peds = true,
        props = true
    },

    management = {
        coords = vector3(811.27, -750.52, 26.78),
        heading = 0.0,
        distance = 2.0
    },

    stashes = {
        {
            name = 'pizzathis_storage',
            label = 'Pizza This Storage',
            coords = vector3(807.77, -756.30, 26.78),
            heading = 90.0,
            slots = 50,
            weight = 100000,
            distance = 2.0
        }
    },

    trays = {
        {
            name = 'pizzathis_tray1',
            label = 'Tray 1',
            coords = vector3(810.32, -751.44, 27.78),
            heading = 0.0,
            slots = 10,
            weight = 10000,
            distance = 2.0
        }
    },

    stations = {
        {
            type = 'prepare',
            coords = vector3(809.80, -756.33, 26.78),
            heading = 180.0,
            distance = 2.0
        },
        {
            type = 'cook',
            coords = vector3(807.63, -756.39, 26.78),
            heading = 180.0,
            distance = 2.0
        },
        {
            type = 'drink',
            coords = vector3(812.65, -752.33, 26.78),
            heading = 90.0,
            distance = 2.0
        }
    },

    registers = {
        {
            coords = vector3(810.32, -750.44, 27.78),
            heading = 180.0,
            distance = 2.0
        }
    },

    garage = {
        spawn = vector4(799.88, -755.97, 26.78, 90.0),
        delete = vector3(799.88, -755.97, 26.78),
        distance = 3.0,
        vehicles = {
            {model = 'faggio', label = 'Pizza Scooter', price = 0},
            {model = 'pizza', label = 'Pizza Delivery', price = 2000}
        }
    },

    music = {
        {
            coords = vector3(811.0, -751.0, 26.78),
            range = 15.0,
            volume = 0.3,
            allowedJobs = {'pizzathis'}
        }
    },

    chairs = {
        {coords = vector3(813.22, -749.22, 26.78), heading = 180.0},
        {coords = vector3(815.22, -749.22, 26.78), heading = 180.0}
    },

    peds = {
        {
            model = 's_m_m_lathandy_01',
            coords = vector4(810.32, -750.44, 26.78, 180.0),
            scenario = 'WORLD_HUMAN_STAND_MOBILE'
        }
    },

    props = {},

    shopZone = {
        coords = vector3(810.0, -751.0, 26.78),
        size = vector3(8.0, 8.0, 3.0),
        rotation = 0.0
    }
}

-- You can add more restaurants following the same structure
-- Restaurants['tacoshop'] = { ... }
-- Restaurants['catcafe'] = { ... }

return Restaurants

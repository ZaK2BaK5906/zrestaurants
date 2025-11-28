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

Restaurants['unicorn'] = {
    label = 'Unicorn Night Club',
    job = 'unicorn',
    blip = {
        enabled = true,
        coords = vector3(127.83, -1284.67, 29.27),
        sprite = 121,
        color = 48,
        scale = 0.8
    },

    features = {
        management = true,
        stash = true,
        trays = true,
        crafting = true,
        register = true,
        delivery = false,
        offlineShop = true,
        garage = false,
        driveThru = false,
        music = true,
        chairs = true,
        peds = true,
        props = false
    },

    management = {
        coords = vector3(95.20, -1292.80, 29.27),
        heading = 210.0,
        distance = 2.0
    },

    stashes = {
        {
            name = 'unicorn_storage',
            label = 'Unicorn Storage',
            coords = vector3(93.77, -1291.30, 29.27),
            heading = 210.0,
            slots = 50,
            weight = 100000,
            distance = 2.0
        }
    },

    trays = {
        {
            name = 'unicorn_bar',
            label = 'Bar Counter',
            coords = vector3(129.32, -1284.44, 29.27),
            heading = 210.0,
            slots = 10,
            weight = 10000,
            distance = 2.0
        }
    },

    stations = {
        {
            type = 'drink',
            coords = vector3(128.80, -1283.33, 29.27),
            heading = 210.0,
            distance = 2.0
        },
        {
            type = 'prepare',
            coords = vector3(130.65, -1286.33, 29.27),
            heading = 210.0,
            distance = 2.0
        }
    },

    registers = {
        {
            coords = vector3(129.32, -1285.44, 29.27),
            heading = 210.0,
            distance = 2.0
        }
    },

    music = {
        {
            coords = vector3(120.0, -1280.0, 29.27),
            range = 25.0,
            volume = 0.4,
            allowedJobs = {'unicorn'}
        }
    },

    chairs = {
        {coords = vector3(118.22, -1278.22, 29.27), heading = 120.0},
        {coords = vector3(120.22, -1279.22, 29.27), heading = 120.0},
        {coords = vector3(122.22, -1280.22, 29.27), heading = 120.0}
    },

    peds = {
        {
            model = 's_f_y_bartender_01',
            coords = vector4(129.32, -1284.44, 29.27, 210.0),
            scenario = 'WORLD_HUMAN_STAND_MOBILE'
        }
    },

    props = {},

    shopZone = {
        coords = vector3(129.0, -1284.0, 29.27),
        size = vector3(8.0, 8.0, 3.0),
        rotation = 210.0
    }
}

Restaurants['upnatom'] = {
    label = 'Up\'N Atom Burger',
    job = 'upnatom',
    blip = {
        enabled = true,
        coords = vector3(-1166.98, -884.09, 14.0),
        sprite = 106,
        color = 2,
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
        coords = vector3(-1171.89, -886.87, 14.0),
        heading = 123.0,
        distance = 2.0
    },

    stashes = {
        {
            name = 'upnatom_storage',
            label = 'Up\'N Atom Storage',
            coords = vector3(-1173.77, -889.30, 14.0),
            heading = 35.0,
            slots = 50,
            weight = 100000,
            distance = 2.0
        },
        {
            name = 'upnatom_fridge',
            label = 'Up\'N Atom Fridge',
            coords = vector3(-1170.44, -890.16, 14.0),
            heading = 35.0,
            slots = 30,
            weight = 50000,
            distance = 2.0
        }
    },

    trays = {
        {
            name = 'upnatom_tray1',
            label = 'Counter Tray',
            coords = vector3(-1165.32, -883.44, 14.5),
            heading = 35.0,
            slots = 10,
            weight = 10000,
            distance = 2.0
        }
    },

    stations = {
        {
            type = 'grill',
            coords = vector3(-1171.80, -892.33, 14.0),
            heading = 303.0,
            distance = 2.0
        },
        {
            type = 'fryer',
            coords = vector3(-1172.63, -891.39, 14.0),
            heading = 303.0,
            distance = 2.0
        },
        {
            type = 'prepare',
            coords = vector3(-1168.66, -889.84, 14.0),
            heading = 213.0,
            distance = 2.0
        },
        {
            type = 'drink',
            coords = vector3(-1169.65, -888.33, 14.0),
            heading = 213.0,
            distance = 2.0
        }
    },

    registers = {
        {
            coords = vector3(-1165.32, -884.44, 14.5),
            heading = 213.0,
            distance = 2.0
        }
    },

    garage = {
        spawn = vector4(-1155.88, -888.97, 13.80, 303.0),
        delete = vector3(-1155.88, -888.97, 13.80),
        distance = 3.0,
        vehicles = {
            {model = 'burrito3', label = 'Delivery Van', price = 0}
        }
    },

    music = {
        {
            coords = vector3(-1167.0, -886.0, 14.0),
            range = 20.0,
            volume = 0.3,
            allowedJobs = {'upnatom'}
        }
    },

    chairs = {
        {coords = vector3(-1163.22, -882.22, 14.0), heading = 213.0},
        {coords = vector3(-1161.78, -883.75, 14.0), heading = 213.0}
    },

    peds = {
        {
            model = 's_f_y_sweatshop_01',
            coords = vector4(-1165.32, -884.44, 14.0, 213.0),
            scenario = 'WORLD_HUMAN_STAND_MOBILE'
        }
    },

    props = {},

    shopZone = {
        coords = vector3(-1166.0, -885.0, 14.0),
        size = vector3(10.0, 10.0, 3.0),
        rotation = 35.0
    }
}

Restaurants['pops'] = {
    label = 'Pop\'s Diner',
    job = 'pops',
    blip = {
        enabled = true,
        coords = vector3(1588.23, 6452.74, 25.32),
        sprite = 267,
        color = 5,
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
        props = false
    },

    management = {
        coords = vector3(1590.27, 6455.52, 25.32),
        heading = 25.0,
        distance = 2.0
    },

    stashes = {
        {
            name = 'pops_storage',
            label = 'Diner Storage',
            coords = vector3(1587.77, 6457.30, 25.32),
            heading = 245.0,
            slots = 50,
            weight = 100000,
            distance = 2.0
        }
    },

    trays = {
        {
            name = 'pops_counter',
            label = 'Counter',
            coords = vector3(1588.32, 6453.44, 26.0),
            heading = 25.0,
            slots = 10,
            weight = 10000,
            distance = 2.0
        }
    },

    stations = {
        {
            type = 'grill',
            coords = vector3(1589.80, 6456.33, 25.32),
            heading = 245.0,
            distance = 2.0
        },
        {
            type = 'prepare',
            coords = vector3(1588.63, 6458.39, 25.32),
            heading = 245.0,
            distance = 2.0
        },
        {
            type = 'drink',
            coords = vector3(1586.65, 6454.33, 25.32),
            heading = 65.0,
            distance = 2.0
        },
        {
            type = 'cook',
            coords = vector3(1591.20, 6457.80, 25.32),
            heading = 245.0,
            distance = 2.0
        }
    },

    registers = {
        {
            coords = vector3(1587.32, 6453.44, 26.0),
            heading = 65.0,
            distance = 2.0
        }
    },

    garage = {
        spawn = vector4(1580.88, 6450.97, 25.00, 65.0),
        delete = vector3(1580.88, 6450.97, 25.00),
        distance = 3.0,
        vehicles = {
            {model = 'pony', label = 'Delivery Van', price = 0}
        }
    },

    music = {
        {
            coords = vector3(1588.0, 6453.0, 25.32),
            range = 15.0,
            volume = 0.3,
            allowedJobs = {'pops'}
        }
    },

    chairs = {
        {coords = vector3(1585.22, 6450.22, 25.32), heading = 65.0},
        {coords = vector3(1584.22, 6452.22, 25.32), heading = 65.0},
        {coords = vector3(1583.22, 6454.22, 25.32), heading = 65.0}
    },

    peds = {
        {
            model = 's_f_y_waitress_01',
            coords = vector4(1587.32, 6453.44, 25.32, 65.0),
            scenario = 'WORLD_HUMAN_STAND_MOBILE'
        }
    },

    props = {},

    shopZone = {
        coords = vector3(1588.0, 6453.0, 25.32),
        size = vector3(8.0, 8.0, 3.0),
        rotation = 25.0
    }
}

Restaurants['beans'] = {
    label = 'Beans Coffee',
    job = 'beans',
    blip = {
        enabled = true,
        coords = vector3(-628.08, 237.68, 81.88),
        sprite = 52,
        color = 36,
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
        props = false
    },

    management = {
        coords = vector3(-630.20, 234.80, 81.88),
        heading = 280.0,
        distance = 2.0
    },

    stashes = {
        {
            name = 'beans_storage',
            label = 'Beans Coffee Storage',
            coords = vector3(-631.77, 233.30, 81.88),
            heading = 280.0,
            slots = 40,
            weight = 80000,
            distance = 2.0
        }
    },

    trays = {
        {
            name = 'beans_counter',
            label = 'Counter',
            coords = vector3(-628.32, 236.44, 82.0),
            heading = 100.0,
            slots = 10,
            weight = 10000,
            distance = 2.0
        }
    },

    stations = {
        {
            type = 'drink',
            coords = vector3(-630.80, 234.33, 81.88),
            heading = 280.0,
            distance = 2.0
        },
        {
            type = 'prepare',
            coords = vector3(-631.65, 235.33, 81.88),
            heading = 280.0,
            distance = 2.0
        }
    },

    registers = {
        {
            coords = vector3(-627.32, 236.44, 82.0),
            heading = 100.0,
            distance = 2.0
        }
    },

    garage = {
        spawn = vector4(-620.88, 230.97, 81.50, 100.0),
        delete = vector3(-620.88, 230.97, 81.50),
        distance = 3.0,
        vehicles = {
            {model = 'faggio', label = 'Coffee Scooter', price = 0}
        }
    },

    music = {
        {
            coords = vector3(-628.0, 237.0, 81.88),
            range = 15.0,
            volume = 0.3,
            allowedJobs = {'beans'}
        }
    },

    chairs = {
        {coords = vector3(-626.22, 238.22, 81.88), heading = 100.0},
        {coords = vector3(-625.22, 240.22, 81.88), heading = 100.0}
    },

    peds = {
        {
            model = 's_f_y_shop_low',
            coords = vector4(-627.32, 236.44, 81.88, 100.0),
            scenario = 'WORLD_HUMAN_STAND_MOBILE'
        }
    },

    props = {},

    shopZone = {
        coords = vector3(-628.0, 237.0, 81.88),
        size = vector3(8.0, 8.0, 3.0),
        rotation = 10.0
    }
}

return Restaurants

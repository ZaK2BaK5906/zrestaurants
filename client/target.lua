-- Target System (ox_target / interact)

local function AddTargetZone(id, coords, options, distance)
    if Config.Target == 'ox_target' then
        exports.ox_target:addSphereZone({
            coords = coords,
            radius = distance or 1.5,
            debug = Config.Debug,
            options = options
        })
    else
        -- interact integration
        exports.interact:AddInteraction({
            coords = coords,
            distance = distance or 1.5,
            options = options
        })
    end
end

---Initialize target zones for all restaurants
CreateThread(function()
    Wait(2000) -- Wait for everything to load

    for restaurantKey, restaurant in pairs(Restaurants) do
        -- Management menu
        if restaurant.features.management and restaurant.management then
            AddTargetZone('restaurant_management_' .. restaurantKey, restaurant.management.coords, {
                {
                    name = 'restaurant_management',
                    icon = 'fas fa-briefcase',
                    label = _L('management_menu'),
                    onSelect = function()
                        TriggerEvent('zrestaurants:client:openManagement', restaurantKey)
                    end,
                    canInteract = function()
                        return PlayerJob.name == restaurant.job
                    end,
                    distance = restaurant.management.distance
                }
            })
        end

        -- Stashes
        if restaurant.features.stash and restaurant.stashes then
            for i, stash in ipairs(restaurant.stashes) do
                AddTargetZone('restaurant_stash_' .. restaurantKey .. '_' .. i, stash.coords, {
                    {
                        name = 'restaurant_stash',
                        icon = 'fas fa-box',
                        label = _L('open_stash') .. ' - ' .. stash.label,
                        onSelect = function()
                            TriggerServerEvent('zrestaurants:server:openStash', stash.name)
                        end,
                        canInteract = function()
                            return PlayerJob.name == restaurant.job
                        end,
                        distance = stash.distance
                    }
                })
            end
        end

        -- Trays
        if restaurant.features.trays and restaurant.trays then
            for i, tray in ipairs(restaurant.trays) do
                AddTargetZone('restaurant_tray_' .. restaurantKey .. '_' .. i, tray.coords, {
                    {
                        name = 'restaurant_tray',
                        icon = 'fas fa-hamburger',
                        label = _L('open_tray') .. ' - ' .. tray.label,
                        onSelect = function()
                            TriggerServerEvent('zrestaurants:server:openTray', tray.name)
                        end,
                        distance = tray.distance
                    }
                })
            end
        end

        -- Crafting Stations
        if restaurant.features.crafting and restaurant.stations then
            for i, station in ipairs(restaurant.stations) do
                AddTargetZone('restaurant_station_' .. restaurantKey .. '_' .. i, station.coords, {
                    {
                        name = 'restaurant_station',
                        icon = 'fas fa-utensils',
                        label = Stations[station.type].label,
                        onSelect = function()
                            TriggerEvent('zrestaurants:client:openCrafting', restaurantKey, station.type)
                        end,
                        canInteract = function()
                            return PlayerJob.name == restaurant.job
                        end,
                        distance = station.distance
                    }
                })
            end
        end

        -- Registers
        if restaurant.features.register and restaurant.registers then
            for i, register in ipairs(restaurant.registers) do
                AddTargetZone('restaurant_register_' .. restaurantKey .. '_' .. i, register.coords, {
                    {
                        name = 'restaurant_register',
                        icon = 'fas fa-cash-register',
                        label = _L('cash_register'),
                        onSelect = function()
                            TriggerEvent('zrestaurants:client:openRegister', restaurantKey)
                        end,
                        canInteract = function()
                            return PlayerJob.name == restaurant.job
                        end,
                        distance = register.distance
                    }
                })
            end
        end

        -- Garage
        if restaurant.features.garage and restaurant.garage then
            -- Spawn point
            AddTargetZone('restaurant_garage_spawn_' .. restaurantKey, restaurant.garage.spawn.xyz, {
                {
                    name = 'restaurant_garage_spawn',
                    icon = 'fas fa-car',
                    label = _L('take_vehicle'),
                    onSelect = function()
                        TriggerEvent('zrestaurants:client:openGarage', restaurantKey)
                    end,
                    canInteract = function()
                        return PlayerJob.name == restaurant.job and IsPedOnFoot(PlayerPedId())
                    end,
                    distance = restaurant.garage.distance
                }
            })

            -- Delete point
            AddTargetZone('restaurant_garage_delete_' .. restaurantKey, restaurant.garage.delete, {
                {
                    name = 'restaurant_garage_delete',
                    icon = 'fas fa-parking',
                    label = _L('store_vehicle'),
                    onSelect = function()
                        TriggerEvent('zrestaurants:client:storeVehicle', restaurantKey)
                    end,
                    canInteract = function()
                        return PlayerJob.name == restaurant.job and IsPedInAnyVehicle(PlayerPedId(), false)
                    end,
                    distance = restaurant.garage.distance
                }
            })
        end

        -- Offline Shop Zone
        if restaurant.features.offlineShop and restaurant.shopZone then
            AddTargetZone('restaurant_shop_' .. restaurantKey, restaurant.shopZone.coords, {
                {
                    name = 'restaurant_shop',
                    icon = 'fas fa-shopping-cart',
                    label = _L('shop'),
                    onSelect = function()
                        TriggerEvent('zrestaurants:client:openShop', restaurantKey)
                    end,
                    distance = 3.0
                }
            })
        end

        -- Chairs
        if restaurant.features.chairs and restaurant.chairs then
            for i, chair in ipairs(restaurant.chairs) do
                AddTargetZone('restaurant_chair_' .. restaurantKey .. '_' .. i, chair.coords, {
                    {
                        name = 'restaurant_chair',
                        icon = 'fas fa-chair',
                        label = _L('sit_down'),
                        onSelect = function()
                            TriggerEvent('zrestaurants:client:sitOnChair', chair.coords, chair.heading)
                        end,
                        canInteract = function()
                            return IsPedOnFoot(PlayerPedId())
                        end,
                        distance = 1.5
                    }
                })
            end
        end

        -- Drive Thru Order Point
        if restaurant.features.driveThru and restaurant.driveThru and restaurant.driveThru.enabled then
            AddTargetZone('restaurant_drivethru_order_' .. restaurantKey, restaurant.driveThru.orderPoint, {
                {
                    name = 'restaurant_drivethru_order',
                    icon = 'fas fa-microphone',
                    label = _L('place_order'),
                    onSelect = function()
                        TriggerEvent('zrestaurants:client:driveThruOrder', restaurantKey)
                    end,
                    canInteract = function()
                        return IsPedInAnyVehicle(PlayerPedId(), false)
                    end,
                    distance = restaurant.driveThru.distance
                }
            })

            AddTargetZone('restaurant_drivethru_pickup_' .. restaurantKey, restaurant.driveThru.pickupPoint, {
                {
                    name = 'restaurant_drivethru_pickup',
                    icon = 'fas fa-box',
                    label = _L('pickup_order'),
                    onSelect = function()
                        TriggerEvent('zrestaurants:client:driveThruPickup', restaurantKey)
                    end,
                    canInteract = function()
                        return IsPedInAnyVehicle(PlayerPedId(), false)
                    end,
                    distance = restaurant.driveThru.distance
                }
            })
        end
    end

    Utils.Debug('Target zones initialized')
end)

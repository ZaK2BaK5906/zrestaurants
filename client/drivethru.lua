-- Drive Thru System

local CurrentOrder = nil

---Drive thru order
RegisterNetEvent('zrestaurants:client:driveThruOrder', function(restaurantKey)
    local restaurant = Restaurants[restaurantKey]

    -- Get menu items
    lib.callback('zrestaurants:getMenuItems', false, function(menuItems)
        local options = {}

        for _, item in ipairs(menuItems) do
            if item.stock > 0 then
                table.insert(options, {
                    title = item.label,
                    description = Utils.FormatPrice(item.price) .. ' | Stock: ' .. item.stock,
                    icon = 'hamburger',
                    onSelect = function()
                        local input = lib.inputDialog('Order ' .. item.label, {
                            {type = 'number', label = 'Quantity', min = 1, max = item.stock, default = 1}
                        })

                        if input then
                            CurrentOrder = {
                                restaurant = restaurantKey,
                                item = item.item,
                                label = item.label,
                                price = item.price,
                                quantity = input[1]
                            }

                            Utils.Notify('Order placed! Go to pickup window', 'success')

                            -- Notify employees
                            TriggerServerEvent('zrestaurants:server:notifyDriveThru', restaurantKey, item.label, input[1])
                        end
                    end
                })
            end
        end

        if #options == 0 then
            Utils.Notify('No items available', 'error')
            return
        end

        lib.registerContext({
            id = 'restaurant_drivethru_menu',
            title = restaurant.label .. ' - ' .. _L('drivethru'),
            options = options
        })

        lib.showContext('restaurant_drivethru_menu')
    end, restaurantKey)
end)

---Drive thru pickup
RegisterNetEvent('zrestaurants:client:driveThruPickup', function(restaurantKey)
    if not CurrentOrder or CurrentOrder.restaurant ~= restaurantKey then
        Utils.Notify('You have no order', 'error')
        return
    end

    -- Purchase item
    lib.callback('zrestaurants:buyItem', false, function(success, message)
        if success then
            Utils.Notify('Order received!', 'success')
            CurrentOrder = nil
        else
            Utils.Notify(_L(message or 'failed'), 'error')
        end
    end, restaurantKey, CurrentOrder.item, CurrentOrder.quantity)
end)

---Notify employees about drive thru order (server-side event)
RegisterNetEvent('zrestaurants:server:notifyDriveThru', function(restaurantKey, itemLabel, quantity)
    local src = source

    -- Notify all employees
    local xPlayers = ESX.GetExtendedPlayers('job', restaurantKey)

    for _, xPlayer in ipairs(xPlayers) do
        TriggerClientEvent('ox_lib:notify', xPlayer.source, {
            title = _L('drivethru'),
            description = _L('drivethru_order') .. ': ' .. quantity .. 'x ' .. itemLabel,
            type = 'info',
            duration = 10000
        })
    end
end)

Utils.Debug('Client drivethru loaded')

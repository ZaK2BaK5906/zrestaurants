-- Cash Register System

---Open register menu
RegisterNetEvent('zrestaurants:client:openRegister', function(restaurantKey)
    local restaurant = Restaurants[restaurantKey]

    if PlayerJob.name ~= restaurant.job then return end

    lib.registerContext({
        id = 'restaurant_register',
        title = restaurant.label .. ' - ' .. _L('cash_register'),
        options = {
            {
                title = _L('charge_customer'),
                description = 'Charge a nearby customer',
                icon = 'cash-register',
                onSelect = function()
                    TriggerEvent('zrestaurants:client:chargeCustomer', restaurantKey)
                end
            }
        }
    })

    lib.showContext('restaurant_register')
end)

---Charge customer
RegisterNetEvent('zrestaurants:client:chargeCustomer', function(restaurantKey)
    -- Get nearby players
    lib.callback('zrestaurants:getNearbyPlayers', false, function(players)
        if #players == 0 then
            Utils.Notify('No players nearby', 'error')
            return
        end

        local options = {}

        for _, player in ipairs(players) do
            table.insert(options, {
                title = player.name,
                description = 'ID: ' .. player.id,
                icon = 'user',
                onSelect = function()
                    TriggerEvent('zrestaurants:client:createInvoice', restaurantKey, player.id, player.name)
                end
            })
        end

        lib.registerContext({
            id = 'restaurant_nearby_players',
            title = _L('nearby_players'),
            options = options
        })

        lib.showContext('restaurant_nearby_players')
    end)
end)

---Create invoice
RegisterNetEvent('zrestaurants:client:createInvoice', function(restaurantKey, targetId, targetName)
    local input = lib.inputDialog('Invoice for ' .. targetName, {
        {type = 'input', label = 'Item/Description', required = true, default = 'Restaurant Bill'},
        {type = 'number', label = _L('enter_amount'), required = true, min = 1}
    })

    if not input then return end

    local item = input[1]
    local amount = input[2]

    TriggerServerEvent('zrestaurants:server:sendInvoice', targetId, restaurantKey, amount, item)
end)

Utils.Debug('Client register loaded')

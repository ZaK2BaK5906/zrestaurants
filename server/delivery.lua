-- Delivery System

local ActiveDeliveries = {}

local DeliveryLocations = {
    vector3(72.2, -1464.6, 29.3),
    vector3(-1040.7, -2735.0, 20.2),
    vector3(1661.4, 4776.0, 42.0),
    vector3(-3040.0, 594.0, 7.9),
    vector3(1197.7, -3253.4, 7.1),
    vector3(123.6, -1291.5, 29.3),
    vector3(-48.5, -1097.3, 26.4),
    vector3(357.1, -2068.8, 21.7),
    vector3(1136.0, -980.0, 46.4),
    vector3(-1223.9, -906.9, 12.3)
}

---Start delivery
lib.callback.register('zrestaurants:startDelivery', function(source, restaurant)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return false end

    local identifier = xPlayer.identifier

    -- Check if delivery is enabled
    if not Config.DeliveryEnabled then
        return false, 'disabled'
    end

    -- Check if player has job
    if xPlayer.job.name ~= restaurant then
        return false, 'not_in_job'
    end

    -- Check permission
    if not lib.callback.await('zrestaurants:hasPermission', source, restaurant, 'delivery') then
        return false, 'no_permission'
    end

    -- Check if already on delivery
    if ActiveDeliveries[source] then
        return false, 'already_on_delivery'
    end

    -- Check cooldown
    if Database.IsDeliveryOnCooldown(identifier, restaurant) then
        return false, 'cooldown'
    end

    -- Select random location
    local location = DeliveryLocations[math.random(#DeliveryLocations)]

    -- Calculate reward
    local reward = math.random(Config.DeliveryReward.min, Config.DeliveryReward.max)

    -- Create delivery in database
    local deliveryId = Database.CreateDelivery({
        restaurant = restaurant,
        player_identifier = identifier,
        location = {x = location.x, y = location.y, z = location.z},
        reward = reward
    })

    if not deliveryId then
        return false, 'failed'
    end

    -- Store active delivery
    ActiveDeliveries[source] = {
        id = deliveryId,
        restaurant = restaurant,
        location = location,
        reward = reward,
        startTime = os.time()
    }

    return true, {
        location = location,
        reward = reward
    }
end)

---Complete delivery
RegisterNetEvent('zrestaurants:server:completeDelivery', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if not xPlayer then return end

    local delivery = ActiveDeliveries[src]

    if not delivery then
        TriggerClientEvent('ox_lib:notify', src, {
            type = 'error',
            description = _L('failed')
        })
        return
    end

    -- Complete delivery in database
    Database.CompleteDelivery(delivery.id)

    -- Set cooldown
    Database.SetDeliveryCooldown(xPlayer.identifier, delivery.restaurant, Config.DeliveryCooldown)

    -- Add money to society
    local society = Config.SocietyPrefix .. delivery.restaurant
    TriggerEvent('esx_addonaccount:getSharedAccount', society, function(account)
        if account then
            account.addMoney(delivery.reward)
        end
    end)

    -- Give player a portion as tip
    local playerReward = math.floor(delivery.reward * 0.3) -- 30% as tip
    xPlayer.addMoney(playerReward)

    -- Remove active delivery
    ActiveDeliveries[src] = nil

    TriggerClientEvent('ox_lib:notify', src, {
        type = 'success',
        description = _L('delivery_completed', Utils.FormatPrice(playerReward))
    })

    Utils.Debug('Delivery completed by player', src, 'for restaurant', delivery.restaurant)
end)

---Cancel delivery
RegisterNetEvent('zrestaurants:server:cancelDelivery', function()
    local src = source

    if ActiveDeliveries[src] then
        ActiveDeliveries[src] = nil

        TriggerClientEvent('ox_lib:notify', src, {
            type = 'error',
            description = _L('delivery_failed')
        })
    end
end)

---Check if on cooldown
lib.callback.register('zrestaurants:isDeliveryCooldown', function(source, restaurant)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return true end

    return Database.IsDeliveryOnCooldown(xPlayer.identifier, restaurant)
end)

-- Clean up deliveries when player disconnects
AddEventHandler('playerDropped', function()
    local src = source
    if ActiveDeliveries[src] then
        ActiveDeliveries[src] = nil
    end
end)

Utils.Debug('Server delivery loaded')

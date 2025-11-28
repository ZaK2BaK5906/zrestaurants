-- Garage System

local SpawnedVehicles = {}

---Open garage menu
RegisterNetEvent('zrestaurants:client:openGarage', function(restaurantKey)
    local restaurant = Restaurants[restaurantKey]

    if PlayerJob.name ~= restaurant.job then return end

    if not restaurant.garage or not restaurant.garage.vehicles then
        Utils.Notify('No vehicles available', 'error')
        return
    end

    local options = {}

    for _, vehicle in ipairs(restaurant.garage.vehicles) do
        table.insert(options, {
            title = vehicle.label,
            description = vehicle.price > 0 and ('Price: ' .. Utils.FormatPrice(vehicle.price)) or 'Free',
            icon = 'car',
            onSelect = function()
                TriggerEvent('zrestaurants:client:spawnVehicle', restaurantKey, vehicle)
            end
        })
    end

    lib.registerContext({
        id = 'restaurant_garage',
        title = restaurant.label .. ' - ' .. _L('garage'),
        options = options
    })

    lib.showContext('restaurant_garage')
end)

---Spawn vehicle
RegisterNetEvent('zrestaurants:client:spawnVehicle', function(restaurantKey, vehicleData)
    local restaurant = Restaurants[restaurantKey]

    if not restaurant.garage then return end

    local spawnPoint = restaurant.garage.spawn

    -- Check if spawn point is clear
    if IsAnyVehicleNearPoint(spawnPoint.x, spawnPoint.y, spawnPoint.z, 3.0) then
        Utils.Notify('Spawn point is blocked', 'error')
        return
    end

    -- Load vehicle model
    local model = GetHashKey(vehicleData.model)

    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end

    -- Create vehicle
    local vehicle = CreateVehicle(model, spawnPoint.x, spawnPoint.y, spawnPoint.z, spawnPoint.w, true, false)

    -- Set vehicle properties
    SetVehicleNumberPlateText(vehicle, 'REST' .. math.random(1000, 9999))
    SetEntityAsMissionEntity(vehicle, true, true)
    SetVehicleHasBeenOwnedByPlayer(vehicle, true)
    SetVehicleNeedsToBeHotwired(vehicle, false)
    SetVehRadioStation(vehicle, 'OFF')
    SetModelAsNoLongerNeeded(model)

    -- Put player in vehicle
    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)

    -- Store spawned vehicle
    table.insert(SpawnedVehicles, vehicle)

    Utils.Notify(_L('vehicle_spawned'), 'success')

    Utils.Debug('Spawned vehicle:', vehicleData.model)
end)

---Store vehicle
RegisterNetEvent('zrestaurants:client:storeVehicle', function(restaurantKey)
    local restaurant = Restaurants[restaurantKey]

    if PlayerJob.name ~= restaurant.job then return end

    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)

    if vehicle == 0 then
        Utils.Notify(_L('no_vehicle_nearby'), 'error')
        return
    end

    -- Check if it's a restaurant vehicle
    local isRestaurantVehicle = false
    for _, v in ipairs(SpawnedVehicles) do
        if v == vehicle then
            isRestaurantVehicle = true
            break
        end
    end

    if not isRestaurantVehicle then
        Utils.Notify('This is not a restaurant vehicle', 'error')
        return
    end

    -- Delete vehicle
    DeleteVehicle(vehicle)

    -- Remove from spawned vehicles
    for i, v in ipairs(SpawnedVehicles) do
        if v == vehicle then
            table.remove(SpawnedVehicles, i)
            break
        end
    end

    Utils.Notify(_L('vehicle_stored'), 'success')
end)

-- Cleanup on resource stop
AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end

    for _, vehicle in ipairs(SpawnedVehicles) do
        if DoesEntityExist(vehicle) then
            DeleteVehicle(vehicle)
        end
    end
end)

Utils.Debug('Client garage loaded')

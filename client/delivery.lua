-- Delivery System (Client)

local CurrentDelivery = nil
local DeliveryBlip = nil
local DeliveryMarker = nil

---Start delivery
RegisterNetEvent('zrestaurants:client:startDelivery', function(restaurantKey)
    local restaurant = Restaurants[restaurantKey]

    if PlayerJob.name ~= restaurant.job then return end

    -- Check if already on delivery
    if CurrentDelivery then
        Utils.Notify(_L('delivery_in_progress'), 'error')
        return
    end

    -- Check cooldown
    lib.callback('zrestaurants:isDeliveryCooldown', false, function(onCooldown)
        if onCooldown then
            Utils.Notify(_L('delivery_cooldown'), 'error')
            return
        end

        -- Start delivery
        lib.callback('zrestaurants:startDelivery', false, function(success, data)
            if not success then
                Utils.Notify(_L(data or 'failed'), 'error')
                return
            end

            CurrentDelivery = {
                restaurant = restaurantKey,
                location = data.location,
                reward = data.reward
            }

            -- Create blip
            DeliveryBlip = AddBlipForCoord(data.location.x, data.location.y, data.location.z)
            SetBlipSprite(DeliveryBlip, 478)
            SetBlipColour(DeliveryBlip, 5)
            SetBlipRoute(DeliveryBlip, true)
            SetBlipRouteColour(DeliveryBlip, 5)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString(_L('delivery'))
            EndTextCommandSetBlipName(DeliveryBlip)

            Utils.Notify(_L('deliver_to', 'the marked location'), 'info')

            -- Start delivery marker thread
            CreateThread(DeliveryMarkerThread)
        end, restaurantKey)
    end, restaurantKey)
end)

---Delivery marker thread
function DeliveryMarkerThread()
    while CurrentDelivery do
        Wait(0)

        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local location = CurrentDelivery.location
        local distance = #(coords - location)

        -- Draw marker
        DrawMarker(1, location.x, location.y, location.z - 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, 2.0, 1.0, 255, 255, 0, 100, false, true, 2, false, nil, nil, false)

        -- Check if player is close
        if distance < 2.0 then
            lib.showTextUI('[E] Complete Delivery')

            if IsControlJustPressed(0, 38) then -- E key
                lib.hideTextUI()
                CompleteDelivery()
            end
        else
            lib.hideTextUI()
        end
    end
end

---Complete delivery
function CompleteDelivery()
    if not CurrentDelivery then return end

    -- Progress bar
    local success = Utils.Progress(3000, 'Delivering...', {
        dict = 'anim@heists@box_carry@',
        clip = 'idle'
    })

    if not success then
        Utils.Notify(_L('cancelled'), 'error')
        return
    end

    -- Complete delivery
    TriggerServerEvent('zrestaurants:server:completeDelivery')

    -- Cleanup
    if DeliveryBlip then
        RemoveBlip(DeliveryBlip)
        DeliveryBlip = nil
    end

    CurrentDelivery = nil
end

---Cancel delivery
RegisterNetEvent('zrestaurants:client:cancelDelivery', function()
    if not CurrentDelivery then return end

    -- Cleanup
    if DeliveryBlip then
        RemoveBlip(DeliveryBlip)
        DeliveryBlip = nil
    end

    CurrentDelivery = nil

    Utils.Notify(_L('delivery_failed'), 'error')
end)

-- Cleanup on resource stop
AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end

    if DeliveryBlip then
        RemoveBlip(DeliveryBlip)
    end
end)

Utils.Debug('Client delivery loaded')

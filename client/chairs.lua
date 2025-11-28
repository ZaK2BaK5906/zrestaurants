-- Chairs System

local IsSitting = false
local SittingCoords = nil

---Sit on chair
RegisterNetEvent('zrestaurants:client:sitOnChair', function(coords, heading)
    if IsSitting then
        Utils.Notify('You are already sitting', 'error')
        return
    end

    local ped = PlayerPedId()

    -- Teleport to chair
    SetEntityCoords(ped, coords.x, coords.y, coords.z)
    SetEntityHeading(ped, heading)

    -- Play sitting animation
    RequestAnimDict('anim@heists@prison_heiststation@cop_reactions')
    while not HasAnimDictLoaded('anim@heists@prison_heiststation@cop_reactions') do
        Wait(1)
    end

    TaskPlayAnim(ped, 'anim@heists@prison_heiststation@cop_reactions', 'cop_b_idle', 8.0, -8.0, -1, 1, 0, false, false, false)

    IsSitting = true
    SittingCoords = coords

    -- Create text UI to stand up
    lib.showTextUI('[E] ' .. _L('stand_up'), {
        position = 'left-center'
    })

    Utils.Debug('Player sat on chair')
end)

---Stand up from chair
function StandUp()
    if not IsSitting then return end

    local ped = PlayerPedId()

    ClearPedTasks(ped)

    IsSitting = false
    SittingCoords = nil

    lib.hideTextUI()

    Utils.Debug('Player stood up')
end

-- Stand up on E key
CreateThread(function()
    while true do
        Wait(0)

        if IsSitting then
            if IsControlJustPressed(0, 38) then -- E key
                StandUp()
            end
        else
            Wait(500)
        end
    end
end)

-- Stand up if player moves away
CreateThread(function()
    while true do
        Wait(1000)

        if IsSitting and SittingCoords then
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            local distance = #(coords - SittingCoords)

            if distance > 2.0 then
                StandUp()
            end
        end
    end
end)

-- Cleanup on resource stop
AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end

    if IsSitting then
        StandUp()
    end
end)

Utils.Debug('Client chairs loaded')

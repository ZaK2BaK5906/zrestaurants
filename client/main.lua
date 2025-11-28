-- Client Main File
ESX = exports['es_extended']:getSharedObject()
PlayerData = {}
PlayerJob = {}

local SpawnedPeds = {}
local SpawnedProps = {}
local MusicZones = {}

---Initialize player data
RegisterNetEvent('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
    PlayerJob = xPlayer.job
    InitializeRestaurants()
end)

---Update job
RegisterNetEvent('esx:setJob', function(job)
    PlayerJob = job
end)

---Initialize
CreateThread(function()
    while not ESX.IsPlayerLoaded() do
        Wait(100)
    end

    PlayerData = ESX.GetPlayerData()
    PlayerJob = PlayerData.job

    InitializeRestaurants()
end)

---Initialize restaurants
function InitializeRestaurants()
    Utils.Debug('Initializing restaurants...')

    for restaurantKey, restaurant in pairs(Restaurants) do
        -- Create blips
        if Config.ShowBlips and restaurant.blip and restaurant.blip.enabled then
            local blip = AddBlipForCoord(restaurant.blip.coords.x, restaurant.blip.coords.y, restaurant.blip.coords.z)
            SetBlipSprite(blip, restaurant.blip.sprite or Config.BlipSprite)
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, restaurant.blip.scale or Config.BlipScale)
            SetBlipColour(blip, restaurant.blip.color or Config.BlipColor)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString(restaurant.label)
            EndTextCommandSetBlipName(blip)
        end

        -- Spawn peds
        if restaurant.features.peds and restaurant.peds then
            for _, ped in ipairs(restaurant.peds) do
                SpawnPed(ped)
            end
        end

        -- Spawn props
        if restaurant.features.props and restaurant.props then
            for _, prop in ipairs(restaurant.props) do
                SpawnProp(prop)
            end
        end

        -- Create music zones
        if restaurant.features.music and restaurant.music then
            for i, music in ipairs(restaurant.music) do
                CreateMusicZone(restaurantKey, i, music)
            end
        end
    end

    Utils.Debug('Restaurants initialized')
end

---Spawn ped
---@param pedData table
function SpawnPed(pedData)
    local hash = GetHashKey(pedData.model)

    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(1)
    end

    local ped = CreatePed(4, hash, pedData.coords.x, pedData.coords.y, pedData.coords.z - 1.0, pedData.coords.w, false, true)

    SetEntityHeading(ped, pedData.coords.w)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)

    if pedData.scenario then
        TaskStartScenarioInPlace(ped, pedData.scenario, 0, true)
    end

    table.insert(SpawnedPeds, ped)

    Utils.Debug('Spawned ped:', pedData.model)
end

---Spawn prop
---@param propData table
function SpawnProp(propData)
    local hash = GetHashKey(propData.model)

    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(1)
    end

    local prop = CreateObject(hash, propData.coords.x, propData.coords.y, propData.coords.z, false, false, false)

    SetEntityHeading(prop, propData.heading)
    FreezeEntityPosition(prop, true)

    table.insert(SpawnedProps, prop)

    Utils.Debug('Spawned prop:', propData.model)
end

---Create music zone
---@param restaurant string
---@param index number
---@param musicData table
function CreateMusicZone(restaurant, index, musicData)
    local zone = lib.zones.sphere({
        coords = musicData.coords,
        radius = musicData.range,
        debug = Config.Debug,
        onEnter = function()
            -- Load music data from database
            -- This would be implemented with xsound or other music system
            Utils.Debug('Entered music zone for', restaurant)
        end,
        onExit = function()
            Utils.Debug('Exited music zone for', restaurant)
        end
    })

    MusicZones[restaurant .. '_' .. index] = zone
end

---Consume item (calories system)
RegisterNetEvent('zrestaurants:client:consumeItem', function(data)
    Utils.Debug('Consuming item:', data.item)

    -- Progress bar
    local success = Utils.Progress(2000, 'Eating ' .. data.item, {
        dict = 'mp_player_inteat@burger',
        clip = 'mp_player_int_eat_burger'
    })

    if not success then return end

    -- Apply hunger/thirst
    if Config.CaloriesEnabled then
        local hunger = Utils.CaloriesToHunger(data.calories)
        local thirst = Utils.CaloriesToThirst(data.calories)

        TriggerEvent('esx_status:add', 'hunger', hunger * 10000)
        TriggerEvent('esx_status:add', 'thirst', data.thirst * 10000)
    else
        TriggerEvent('esx_status:add', 'hunger', data.hunger * 10000)
        TriggerEvent('esx_status:add', 'thirst', data.thirst * 10000)
    end

    -- Apply buffs if any
    if data.buffs and next(data.buffs) then
        for buff, value in pairs(data.buffs) do
            -- Implement buff system here
            Utils.Debug('Applied buff:', buff, value)
        end
    end

    Utils.Notify('You ate ' .. data.item, 'success')
end)

-- Cleanup on resource stop
AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end

    -- Delete peds
    for _, ped in ipairs(SpawnedPeds) do
        if DoesEntityExist(ped) then
            DeleteEntity(ped)
        end
    end

    -- Delete props
    for _, prop in ipairs(SpawnedProps) do
        if DoesEntityExist(prop) then
            DeleteEntity(prop)
        end
    end

    -- Remove zones
    for _, zone in pairs(MusicZones) do
        zone:remove()
    end
end)

Utils.Debug('Client main loaded')

-- Server Main File
ESX = exports['es_extended']:getSharedObject()

local ActiveDeliveries = {}
local PlayerCooldowns = {}

---Get player identifier
---@param source number
---@return string
local function GetIdentifier(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    return xPlayer and xPlayer.identifier or nil
end

---Check if player has job
---@param source number
---@param job string
---@return boolean
local function HasJob(source, job)
    local xPlayer = ESX.GetPlayerFromId(source)
    return xPlayer and xPlayer.job.name == job
end

---Check if player has permission
---@param source number
---@param job string
---@param permissionType string
---@return boolean
local function HasPermission(source, job, permissionType)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer or xPlayer.job.name ~= job then return false end

    if not Config.Permissions[permissionType] then return false end

    for _, allowedGrade in ipairs(Config.Permissions[permissionType]) do
        if xPlayer.job.grade_name == allowedGrade then
            return true
        end
    end

    return false
end

---Register usable items for all recipes
CreateThread(function()
    Wait(1000) -- Wait for ox_inventory to load

    -- Register all prepared recipes as usable items
    for restaurant, recipes in pairs(PreparedRecipes) do
        for itemName, recipeData in pairs(recipes) do
            exports.ox_inventory:registerUsableItem(itemName, function(event, item, inventory, slot, data)
                local playerId = inventory.id

                if Config.CaloriesEnabled then
                    -- Use calories system
                    TriggerClientEvent('zrestaurants:client:consumeItem', playerId, {
                        item = itemName,
                        hunger = recipeData.hunger,
                        thirst = recipeData.thirst,
                        calories = recipeData.calories,
                        buffs = recipeData.buffs
                    })
                else
                    -- Use basic system
                    TriggerClientEvent('esx_status:add', playerId, 'hunger', recipeData.hunger * 10000)
                    TriggerClientEvent('esx_status:add', playerId, 'thirst', recipeData.thirst * 10000)
                end

                exports.ox_inventory:RemoveItem(playerId, itemName, 1, nil, slot)
            end)
        end
    end

    -- Also register custom recipes from database
    for restaurantKey, _ in pairs(Restaurants) do
        local recipes = Database.GetRecipes(restaurantKey)
        for _, recipe in ipairs(recipes) do
            exports.ox_inventory:registerUsableItem(recipe.name, function(event, item, inventory, slot, data)
                local playerId = inventory.id

                if Config.CaloriesEnabled then
                    TriggerClientEvent('zrestaurants:client:consumeItem', playerId, {
                        item = recipe.name,
                        hunger = recipe.hunger,
                        thirst = recipe.thirst,
                        calories = recipe.calories,
                        buffs = recipe.buffs
                    })
                else
                    TriggerClientEvent('esx_status:add', playerId, 'hunger', recipe.hunger * 10000)
                    TriggerClientEvent('esx_status:add', playerId, 'thirst', recipe.thirst * 10000)
                end

                exports.ox_inventory:RemoveItem(playerId, recipe.name, 1, nil, slot)
            end)
        end
    end

    Utils.Debug('Registered all recipe items as usable')
end)

---Initialize stashes and inventories
CreateThread(function()
    Wait(2000)

    for restaurantKey, restaurant in pairs(Restaurants) do
        -- Register stashes
        if restaurant.features.stash and restaurant.stashes then
            for _, stash in ipairs(restaurant.stashes) do
                exports.ox_inventory:RegisterStash(stash.name, stash.label, stash.slots, stash.weight, nil, nil, stash.coords)
                Utils.Debug('Registered stash:', stash.name)
            end
        end

        -- Register trays
        if restaurant.features.trays and restaurant.trays then
            for _, tray in ipairs(restaurant.trays) do
                exports.ox_inventory:RegisterStash(tray.name, tray.label, tray.slots, tray.weight, nil, nil, tray.coords)
                Utils.Debug('Registered tray:', tray.name)
            end
        end
    end

    Utils.Debug('All inventories registered')
end)

---Open stash
RegisterNetEvent('zrestaurants:server:openStash', function(stashName)
    local src = source
    exports.ox_inventory:forceOpenInventory(src, 'stash', stashName)
end)

---Open tray
RegisterNetEvent('zrestaurants:server:openTray', function(trayName)
    local src = source
    exports.ox_inventory:forceOpenInventory(src, 'stash', trayName)
end)

---Get player job data
lib.callback.register('zrestaurants:getJobData', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return nil end

    return {
        name = xPlayer.job.name,
        label = xPlayer.job.label,
        grade = xPlayer.job.grade,
        grade_name = xPlayer.job.grade_name,
        grade_label = xPlayer.job.grade_label
    }
end)

---Check if player has permission
lib.callback.register('zrestaurants:hasPermission', function(source, job, permissionType)
    return HasPermission(source, job, permissionType)
end)

---Get society money
lib.callback.register('zrestaurants:getSocietyMoney', function(source, job)
    if not HasPermission(source, job, 'managementMenu') then return 0 end

    local society = Config.SocietyPrefix .. job
    local account = MySQL.scalar.await('SELECT money FROM addon_account_data WHERE account_name = ?', {society})

    return account or 0
end)

---Withdraw society money
RegisterNetEvent('zrestaurants:server:withdrawMoney', function(job, amount)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if not xPlayer or not HasPermission(src, job, 'managementMenu') then return end

    local society = Config.SocietyPrefix .. job
    TriggerEvent('esx_addonaccount:getSharedAccount', society, function(account)
        if account and account.money >= amount then
            account.removeMoney(amount)
            xPlayer.addMoney(amount)
            TriggerClientEvent('ox_lib:notify', src, {
                type = 'success',
                description = _L('success')
            })
        else
            TriggerClientEvent('ox_lib:notify', src, {
                type = 'error',
                description = _L('failed')
            })
        end
    end)
end)

---Deposit society money
RegisterNetEvent('zrestaurants:server:depositMoney', function(job, amount)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if not xPlayer or not HasPermission(src, job, 'managementMenu') then return end

    if xPlayer.getMoney() >= amount then
        local society = Config.SocietyPrefix .. job
        TriggerEvent('esx_addonaccount:getSharedAccount', society, function(account)
            if account then
                xPlayer.removeMoney(amount)
                account.addMoney(amount)
                TriggerClientEvent('ox_lib:notify', src, {
                    type = 'success',
                    description = _L('success')
                })
            end
        end)
    else
        TriggerClientEvent('ox_lib:notify', src, {
            type = 'error',
            description = _L('failed')
        })
    end
end)

---Get nearby players for invoice
lib.callback.register('zrestaurants:getNearbyPlayers', function(source)
    local src = source
    local players = {}
    local srcCoords = GetEntityCoords(GetPlayerPed(src))

    for _, playerId in ipairs(GetPlayers()) do
        local targetId = tonumber(playerId)
        if targetId ~= src then
            local targetCoords = GetEntityCoords(GetPlayerPed(targetId))
            local distance = #(srcCoords - targetCoords)

            if distance < 3.0 then
                local xPlayer = ESX.GetPlayerFromId(targetId)
                if xPlayer then
                    table.insert(players, {
                        id = targetId,
                        name = xPlayer.getName()
                    })
                end
            end
        end
    end

    return players
end)

---Send invoice to player
RegisterNetEvent('zrestaurants:server:sendInvoice', function(targetId, job, amount, item)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local xTarget = ESX.GetPlayerFromId(targetId)

    if not xPlayer or not xTarget or not HasJob(src, job) then return end

    local society = Config.SocietyPrefix .. job

    xTarget.showNotification(_L('invoice_received', Utils.FormatPrice(amount)))

    -- Create invoice using ESX billing if available
    if ESX.GetConfig().EnableSocietyPayouts then
        MySQL.insert('INSERT INTO billing (identifier, sender, target_type, target, label, amount) VALUES (?, ?, ?, ?, ?, ?)', {
            xTarget.identifier,
            xPlayer.identifier,
            'society',
            society,
            item or 'Restaurant Bill',
            amount
        })
    end

    TriggerClientEvent('ox_lib:notify', src, {
        type = 'success',
        description = _L('invoice_sent')
    })
end)

Utils.Debug('Server main loaded')

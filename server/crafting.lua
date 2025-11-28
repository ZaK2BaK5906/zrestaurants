-- Crafting System Server

---Add stock to menu when item is crafted
RegisterNetEvent('zrestaurants:server:addStock', function(restaurant, item, quantity)
    local src = source

    -- Verify player has the job
    local xPlayer = ESX.GetPlayerFromId(src)
    if not xPlayer or xPlayer.job.name ~= restaurant then return end

    -- Check if player has the item
    local count = exports.ox_inventory:GetItemCount(src, item)
    if count < quantity then
        TriggerClientEvent('ox_lib:notify', src, {
            type = 'error',
            description = _L('not_enough_items')
        })
        return
    end

    -- Remove item from player
    local removed = exports.ox_inventory:RemoveItem(src, item, quantity)

    if removed then
        -- Add to menu stock
        Database.UpdateMenuStock(restaurant, item, quantity)

        TriggerClientEvent('ox_lib:notify', src, {
            type = 'success',
            description = 'Added ' .. quantity .. 'x ' .. item .. ' to stock'
        })

        Utils.Debug('Player', src, 'added', quantity, 'of', item, 'to', restaurant, 'stock')
    end
end)

---Remove stock from menu
RegisterNetEvent('zrestaurants:server:removeStock', function(restaurant, item, quantity)
    local src = source

    -- Check permission
    if not lib.callback.await('zrestaurants:hasPermission', src, restaurant, 'managementMenu') then
        return
    end

    -- Remove from menu stock
    Database.UpdateMenuStock(restaurant, item, -quantity)

    -- Add to player inventory
    local added = exports.ox_inventory:AddItem(src, item, quantity)

    if added then
        TriggerClientEvent('ox_lib:notify', src, {
            type = 'success',
            description = 'Removed ' .. quantity .. 'x ' .. item .. ' from stock'
        })
    end
end)

Utils.Debug('Server crafting loaded')

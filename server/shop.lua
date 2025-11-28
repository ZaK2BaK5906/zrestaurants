-- Offline Shop System

---Get shop stock
lib.callback.register('zrestaurants:getShopStock', function(source, restaurant)
    return Database.GetMenuItems(restaurant)
end)

---Purchase item from shop
RegisterNetEvent('zrestaurants:server:purchaseItem', function(restaurant, item, quantity)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if not xPlayer then return end

    -- Get menu items
    local menuItems = Database.GetMenuItems(restaurant)
    local menuItem = nil

    for _, data in ipairs(menuItems) do
        if data.item == item then
            menuItem = data
            break
        end
    end

    if not menuItem then
        TriggerClientEvent('ox_lib:notify', src, {
            type = 'error',
            description = _L('failed')
        })
        return
    end

    -- Check stock
    if menuItem.stock < quantity then
        TriggerClientEvent('ox_lib:notify', src, {
            type = 'error',
            description = 'Not enough stock'
        })
        return
    end

    local totalPrice = menuItem.price * quantity

    -- Check if player has enough money
    if xPlayer.getMoney() < totalPrice then
        TriggerClientEvent('ox_lib:notify', src, {
            type = 'error',
            description = 'Not enough money'
        })
        return
    end

    -- Add item
    local success = exports.ox_inventory:AddItem(src, item, quantity)

    if success then
        -- Remove money
        xPlayer.removeMoney(totalPrice)

        -- Update stock
        Database.UpdateMenuStock(restaurant, item, -quantity)

        -- Add to society account with tax
        local society = Config.SocietyPrefix .. restaurant
        TriggerEvent('esx_addonaccount:getSharedAccount', society, function(account)
            if account then
                local tax = math.floor(totalPrice * Config.OfflineShopTax)
                account.addMoney(totalPrice - tax)
            end
        end)

        -- Add sale record
        Database.AddSale({
            restaurant = restaurant,
            item = item,
            quantity = quantity,
            price = menuItem.price,
            total = totalPrice,
            buyer_identifier = xPlayer.identifier,
            sale_type = 'offline'
        })

        TriggerClientEvent('ox_lib:notify', src, {
            type = 'success',
            description = _L('purchased', quantity, menuItem.label, Utils.FormatPrice(totalPrice))
        })

        Utils.Debug('Player', src, 'purchased', quantity, 'of', item, 'for', totalPrice)
    else
        TriggerClientEvent('ox_lib:notify', src, {
            type = 'error',
            description = _L('inventory_full')
        })
    end
end)

Utils.Debug('Server shop loaded')

-- Offline Shop System (Client)

---Open shop
RegisterNetEvent('zrestaurants:client:openShop', function(restaurantKey)
    local restaurant = Restaurants[restaurantKey]

    lib.callback('zrestaurants:getShopStock', false, function(menuItems)
        local options = {}

        for _, item in ipairs(menuItems) do
            if item.enabled and item.stock > 0 then
                table.insert(options, {
                    title = item.label,
                    description = Utils.FormatPrice(item.price) .. ' | Stock: ' .. item.stock,
                    icon = 'shopping-cart',
                    onSelect = function()
                        TriggerEvent('zrestaurants:client:buyItem', restaurantKey, item)
                    end
                })
            end
        end

        if #options == 0 then
            Utils.Notify('No items available', 'error')
            return
        end

        lib.registerContext({
            id = 'restaurant_shop',
            title = restaurant.label .. ' - ' .. _L('shop'),
            options = options
        })

        lib.showContext('restaurant_shop')
    end, restaurantKey)
end)

---Buy item
RegisterNetEvent('zrestaurants:client:buyItem', function(restaurantKey, item)
    local input = lib.inputDialog(_L('buy') .. ' ' .. item.label, {
        {type = 'number', label = _L('quantity'), min = 1, max = item.stock, default = 1}
    })

    if not input then return end

    local quantity = input[1]
    local totalPrice = item.price * quantity

    local alert = lib.alertDialog({
        header = 'Confirm Purchase',
        content = 'Buy ' .. quantity .. 'x ' .. item.label .. ' for ' .. Utils.FormatPrice(totalPrice) .. '?',
        centered = true,
        cancel = true
    })

    if alert ~= 'confirm' then return end

    TriggerServerEvent('zrestaurants:server:purchaseItem', restaurantKey, item.item, quantity)
end)

Utils.Debug('Client shop loaded')

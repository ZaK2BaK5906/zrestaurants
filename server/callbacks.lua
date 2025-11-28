-- Server Callbacks

---Get all recipes for a restaurant
lib.callback.register('zrestaurants:getRecipes', function(source, restaurant)
    -- Get prepared recipes from config
    local configRecipes = PreparedRecipes[restaurant] or {}

    -- Get custom recipes from database
    local dbRecipes = Database.GetRecipes(restaurant)

    -- Merge both
    local allRecipes = {}

    -- Add config recipes
    for name, data in pairs(configRecipes) do
        allRecipes[name] = data
    end

    -- Add database recipes
    for _, recipe in ipairs(dbRecipes) do
        allRecipes[recipe.name] = {
            label = recipe.label,
            image = recipe.image,
            price = recipe.price,
            ingredients = recipe.ingredients,
            station = recipe.station,
            time = recipe.time,
            hunger = recipe.hunger,
            thirst = recipe.thirst,
            calories = recipe.calories,
            buffs = recipe.buffs
        }
    end

    return allRecipes
end)

---Get menu items for offline shop
lib.callback.register('zrestaurants:getMenuItems', function(source, restaurant)
    return Database.GetMenuItems(restaurant)
end)

---Check if player can craft
lib.callback.register('zrestaurants:canCraft', function(source, restaurant, recipeName)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return false end

    -- Get recipe
    local recipes = lib.callback.await('zrestaurants:getRecipes', source, restaurant)
    local recipe = recipes[recipeName]

    if not recipe then return false end

    -- Check if player has all ingredients
    for _, ingredient in ipairs(recipe.ingredients) do
        local count = exports.ox_inventory:GetItemCount(source, ingredient.item)
        if count < ingredient.amount then
            return false
        end
    end

    return true
end)

---Craft item
lib.callback.register('zrestaurants:craftItem', function(source, restaurant, recipeName)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return false end

    -- Get recipe
    local recipes = lib.callback.await('zrestaurants:getRecipes', source, restaurant)
    local recipe = recipes[recipeName]

    if not recipe then return false end

    -- Check if player has all ingredients
    for _, ingredient in ipairs(recipe.ingredients) do
        local count = exports.ox_inventory:GetItemCount(source, ingredient.item)
        if count < ingredient.amount then
            return false
        end
    end

    -- Remove ingredients
    for _, ingredient in ipairs(recipe.ingredients) do
        exports.ox_inventory:RemoveItem(source, ingredient.item, ingredient.amount)
    end

    -- Add crafted item
    local success = exports.ox_inventory:AddItem(source, recipeName, 1)

    if success then
        Utils.Debug('Player', source, 'crafted', recipeName)
        return true
    else
        -- Return ingredients if failed
        for _, ingredient in ipairs(recipe.ingredients) do
            exports.ox_inventory:AddItem(source, ingredient.item, ingredient.amount)
        end
        return false
    end
end)

---Create custom recipe
lib.callback.register('zrestaurants:createRecipe', function(source, restaurant, recipeData)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return false, 'no_permission' end

    -- Check permission
    if not lib.callback.await('zrestaurants:hasPermission', source, restaurant, 'createRecipes') then
        return false, 'no_permission'
    end

    -- Check recipe limit
    local count = Database.CountRecipes(restaurant)
    if count >= Config.MaxRecipesPerRestaurant then
        return false, 'recipe_limit_reached'
    end

    -- Validate data
    if #recipeData.ingredients > Config.MaxIngredientsPerRecipe then
        return false, 'max_ingredients_exceeded'
    end

    if recipeData.price > Config.MaxPricePerRecipe then
        return false, 'max_price_exceeded'
    end

    -- Create recipe
    recipeData.restaurant = restaurant
    recipeData.created_by = xPlayer.identifier

    local success = Database.CreateRecipe(recipeData)

    if success then
        -- Register the item as usable
        exports.ox_inventory:registerUsableItem(recipeData.name, function(event, item, inventory, slot, data)
            local playerId = inventory.id

            if Config.CaloriesEnabled then
                TriggerClientEvent('zrestaurants:client:consumeItem', playerId, {
                    item = recipeData.name,
                    hunger = recipeData.hunger,
                    thirst = recipeData.thirst,
                    calories = recipeData.calories,
                    buffs = recipeData.buffs
                })
            else
                TriggerClientEvent('esx_status:add', playerId, 'hunger', recipeData.hunger * 10000)
                TriggerClientEvent('esx_status:add', playerId, 'thirst', recipeData.thirst * 10000)
            end

            exports.ox_inventory:RemoveItem(playerId, recipeData.name, 1, nil, slot)
        end)

        -- Update menu item
        Database.UpdateMenuItem(restaurant, recipeData.name, {
            label = recipeData.label,
            image = recipeData.image,
            price = recipeData.price,
            stock = 0
        })

        return true, 'success'
    end

    return false, 'failed'
end)

---Delete recipe
lib.callback.register('zrestaurants:deleteRecipe', function(source, restaurant, recipeName)
    -- Check permission
    if not lib.callback.await('zrestaurants:hasPermission', source, restaurant, 'createRecipes') then
        return false, 'no_permission'
    end

    local success = Database.DeleteRecipe(restaurant, recipeName)

    if success then
        return true, 'success'
    end

    return false, 'failed'
end)

---Update menu item image
lib.callback.register('zrestaurants:updateMenuImage', function(source, restaurant, item, image)
    -- Check permission
    if not lib.callback.await('zrestaurants:hasPermission', source, restaurant, 'editMenu') then
        return false
    end

    local menuItem = Database.GetMenuItems(restaurant)
    for _, menuData in ipairs(menuItem) do
        if menuData.item == item then
            return Database.UpdateMenuItem(restaurant, item, {
                label = menuData.label,
                image = image,
                price = menuData.price,
                stock = menuData.stock
            })
        end
    end

    return false
end)

---Buy item from offline shop
lib.callback.register('zrestaurants:buyItem', function(source, restaurant, item, quantity)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return false end

    -- Get menu items
    local menuItems = Database.GetMenuItems(restaurant)
    local menuItem = nil

    for _, data in ipairs(menuItems) do
        if data.item == item then
            menuItem = data
            break
        end
    end

    if not menuItem then return false end

    -- Check stock
    if menuItem.stock < quantity then
        return false, 'not_enough_stock'
    end

    local totalPrice = menuItem.price * quantity

    -- Check if player has enough money
    if xPlayer.getMoney() < totalPrice then
        return false, 'not_enough_money'
    end

    -- Add item
    local success = exports.ox_inventory:AddItem(source, item, quantity)

    if success then
        -- Remove money
        xPlayer.removeMoney(totalPrice)

        -- Update stock
        Database.UpdateMenuStock(restaurant, item, -quantity)

        -- Add to society account
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

        return true, 'success'
    end

    return false, 'inventory_full'
end)

Utils.Debug('Server callbacks loaded')

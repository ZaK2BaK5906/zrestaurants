-- Crafting System

---Open crafting menu
RegisterNetEvent('zrestaurants:client:openCrafting', function(restaurantKey, stationType)
    if PlayerJob.name ~= Restaurants[restaurantKey].job then return end

    lib.callback('zrestaurants:getRecipes', false, function(recipes)
        local options = {}

        -- Filter recipes by station type
        for name, recipe in pairs(recipes) do
            if recipe.station == stationType then
                table.insert(options, {
                    title = recipe.label,
                    description = 'Time: ' .. (recipe.time / 1000) .. 's',
                    icon = 'utensils',
                    onSelect = function()
                        TriggerEvent('zrestaurants:client:craftItem', restaurantKey, name, recipe)
                    end
                })
            end
        end

        if #options == 0 then
            Utils.Notify('No recipes available for this station', 'error')
            return
        end

        lib.registerContext({
            id = 'restaurant_crafting',
            title = Stations[stationType].label,
            options = options
        })

        lib.showContext('restaurant_crafting')
    end, restaurantKey)
end)

---Craft item
RegisterNetEvent('zrestaurants:client:craftItem', function(restaurantKey, recipeName, recipe)
    -- Check if can craft
    lib.callback('zrestaurants:canCraft', false, function(canCraft)
        if not canCraft then
            Utils.Notify(_L('missing_ingredients'), 'error')
            return
        end

        -- Show ingredients list
        local ingredientsList = 'Ingredients:\n'
        for _, ingredient in ipairs(recipe.ingredients) do
            ingredientsList = ingredientsList .. ingredient.amount .. 'x ' .. ingredient.item .. '\n'
        end

        local alert = lib.alertDialog({
            header = 'Craft ' .. recipe.label,
            content = ingredientsList,
            centered = true,
            cancel = true
        })

        if alert ~= 'confirm' then return end

        -- Get animation for station
        local stationData = Stations[recipe.station]
        local animation = stationData.animation or Config.Animations.prepare

        -- Play animation
        RequestAnimDict(animation.dict)
        while not HasAnimDictLoaded(animation.dict) do
            Wait(1)
        end

        TaskPlayAnim(PlayerPedId(), animation.dict, animation.anim, 8.0, -8.0, -1, animation.flag, 0, false, false, false)

        -- Progress bar
        local success = Utils.Progress(recipe.time, _L('crafting'), animation)

        ClearPedTasks(PlayerPedId())

        if not success then
            Utils.Notify(_L('cancelled'), 'error')
            return
        end

        -- Craft item
        lib.callback('zrestaurants:craftItem', false, function(crafted)
            if crafted then
                Utils.Notify(_L('crafted_item', recipe.label), 'success')
            else
                Utils.Notify(_L('failed'), 'error')
            end
        end, restaurantKey, recipeName)

    end, restaurantKey, recipeName)
end)

Utils.Debug('Client crafting loaded')

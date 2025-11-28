-- Management Menu

---Open management menu
RegisterNetEvent('zrestaurants:client:openManagement', function(restaurant)
    if PlayerJob.name ~= restaurant then return end

    local restaurant = Restaurants[restaurant]

    lib.registerContext({
        id = 'restaurant_management',
        title = restaurant.label .. ' - ' .. _L('management_menu'),
        options = {
            {
                title = _L('recipes_menu'),
                description = 'Manage recipes',
                icon = 'utensils',
                onSelect = function()
                    TriggerEvent('zrestaurants:client:recipesMenu', restaurant)
                end
            },
            {
                title = _L('menu_items'),
                description = 'Manage menu items and stock',
                icon = 'book',
                onSelect = function()
                    TriggerEvent('zrestaurants:client:menuItemsMenu', restaurant)
                end
            },
            {
                title = _L('employees'),
                description = 'Manage employees',
                icon = 'users',
                onSelect = function()
                    TriggerEvent('zrestaurants:client:employeesMenu', restaurant)
                end
            },
            {
                title = _L('society_money'),
                description = 'Manage society money',
                icon = 'money-bill',
                onSelect = function()
                    TriggerEvent('zrestaurants:client:societyMenu', restaurant)
                end
            },
            {
                title = _L('delivery'),
                description = 'Start delivery',
                icon = 'truck',
                onSelect = function()
                    TriggerEvent('zrestaurants:client:startDelivery', restaurant)
                end
            }
        }
    })

    lib.showContext('restaurant_management')
end)

---Recipes menu
RegisterNetEvent('zrestaurants:client:recipesMenu', function(restaurant)
    -- Get recipes
    lib.callback('zrestaurants:getRecipes', false, function(recipes)
        local options = {
            {
                title = '← ' .. _L('management_menu'),
                onSelect = function()
                    TriggerEvent('zrestaurants:client:openManagement', restaurant)
                end
            },
            {
                title = _L('create_recipe'),
                description = 'Create a new recipe',
                icon = 'plus',
                onSelect = function()
                    TriggerEvent('zrestaurants:client:createRecipe', restaurant)
                end
            }
        }

        for name, recipe in pairs(recipes) do
            table.insert(options, {
                title = recipe.label,
                description = Utils.FormatPrice(recipe.price),
                icon = 'utensils',
                onSelect = function()
                    TriggerEvent('zrestaurants:client:editRecipe', restaurant, name, recipe)
                end
            })
        end

        lib.registerContext({
            id = 'restaurant_recipes',
            title = restaurant.label .. ' - ' .. _L('recipes_menu'),
            options = options
        })

        lib.showContext('restaurant_recipes')
    end, restaurant)
end)

---Create recipe
RegisterNetEvent('zrestaurants:client:createRecipe', function(restaurant)
    local input = lib.inputDialog(_L('create_recipe'), {
        {type = 'input', label = _L('recipe_name'), required = true},
        {type = 'input', label = 'Label', required = true},
        {type = 'number', label = _L('recipe_price'), required = true, min = 1, max = Config.MaxPricePerRecipe},
        {type = 'input', label = _L('recipe_image'), description = 'Image URL (imgbb, imgur, etc.) or filename', placeholder = 'https://i.ibb.co/xxx/image.png'},
        {type = 'select', label = 'Station', required = true, options = {
            {value = 'prepare', label = 'Preparation'},
            {value = 'cook', label = 'Cooking'},
            {value = 'grill', label = 'Grill'},
            {value = 'fryer', label = 'Fryer'},
            {value = 'drink', label = 'Drink'},
            {value = 'pack', label = 'Pack'}
        }},
        {type = 'number', label = 'Hunger', required = true, min = 0, max = 100},
        {type = 'number', label = 'Thirst', required = true, min = 0, max = 100},
        {type = 'number', label = 'Calories', required = true, min = 0, max = 1000}
    })

    if not input then return end

    -- Get ingredients
    local ingredients = {}
    for i = 1, Config.MaxIngredientsPerRecipe do
        local ingredientInput = lib.inputDialog('Ingredient ' .. i, {
            {type = 'input', label = 'Item Name (leave empty to finish)', placeholder = 'e.g. burger_bun'},
            {type = 'number', label = 'Amount', default = 1, min = 1}
        })

        if not ingredientInput or not ingredientInput[1] or ingredientInput[1] == '' then
            break
        end

        table.insert(ingredients, {
            item = ingredientInput[1],
            amount = ingredientInput[2]
        })
    end

    if #ingredients == 0 then
        Utils.Notify('You must add at least one ingredient', 'error')
        return
    end

    -- Create recipe
    lib.callback('zrestaurants:createRecipe', false, function(success, message)
        if success then
            Utils.Notify(_L('recipe_created'), 'success')
            TriggerEvent('zrestaurants:client:recipesMenu', restaurant)
        else
            Utils.Notify(_L(message), 'error')
        end
    end, restaurant, {
        name = input[1],
        label = input[2],
        price = input[3],
        image = input[4] or 'default.png',
        station = input[5],
        time = 5000,
        hunger = input[6],
        thirst = input[7],
        calories = input[8],
        ingredients = ingredients,
        buffs = {}
    })
end)

---Menu items menu
RegisterNetEvent('zrestaurants:client:menuItemsMenu', function(restaurant)
    lib.callback('zrestaurants:getMenuItems', false, function(menuItems)
        local options = {
            {
                title = '← ' .. _L('management_menu'),
                onSelect = function()
                    TriggerEvent('zrestaurants:client:openManagement', restaurant)
                end
            }
        }

        for _, item in ipairs(menuItems) do
            table.insert(options, {
                title = item.label,
                description = 'Price: ' .. Utils.FormatPrice(item.price) .. ' | Stock: ' .. item.stock,
                icon = 'box',
                onSelect = function()
                    TriggerEvent('zrestaurants:client:editMenuItem', restaurant, item)
                end
            })
        end

        lib.registerContext({
            id = 'restaurant_menu_items',
            title = restaurant.label .. ' - ' .. _L('menu_items'),
            options = options
        })

        lib.showContext('restaurant_menu_items')
    end, restaurant)
end)

---Edit menu item
RegisterNetEvent('zrestaurants:client:editMenuItem', function(restaurant, item)
    lib.registerContext({
        id = 'restaurant_edit_menu_item',
        title = item.label,
        options = {
            {
                title = '← Back',
                onSelect = function()
                    TriggerEvent('zrestaurants:client:menuItemsMenu', restaurant)
                end
            },
            {
                title = 'Change Image',
                description = 'Current: ' .. item.image,
                icon = 'image',
                onSelect = function()
                    local input = lib.inputDialog('Change Image', {
                        {type = 'input', label = 'Image URL', description = 'imgbb, imgur, etc.', placeholder = 'https://i.ibb.co/xxx/image.png', default = item.image}
                    })

                    if input then
                        lib.callback('zrestaurants:updateMenuImage', false, function(success)
                            if success then
                                Utils.Notify('Image updated', 'success')
                            end
                        end, restaurant, item.item, input[1])
                    end
                end
            },
            {
                title = 'Add Stock',
                description = 'Add items to offline shop stock',
                icon = 'plus',
                onSelect = function()
                    local input = lib.inputDialog('Add Stock', {
                        {type = 'number', label = 'Quantity', min = 1, default = 1}
                    })

                    if input then
                        TriggerServerEvent('zrestaurants:server:addStock', restaurant, item.item, input[1])
                    end
                end
            },
            {
                title = 'Remove Stock',
                description = 'Remove items from offline shop stock',
                icon = 'minus',
                onSelect = function()
                    local input = lib.inputDialog('Remove Stock', {
                        {type = 'number', label = 'Quantity', min = 1, max = item.stock, default = 1}
                    })

                    if input then
                        TriggerServerEvent('zrestaurants:server:removeStock', restaurant, item.item, input[1])
                    end
                end
            }
        }
    })

    lib.showContext('restaurant_edit_menu_item')
end)

---Society menu
RegisterNetEvent('zrestaurants:client:societyMenu', function(restaurant)
    lib.callback('zrestaurants:getSocietyMoney', false, function(money)
        lib.registerContext({
            id = 'restaurant_society',
            title = restaurant.label .. ' - ' .. _L('society_money'),
            options = {
                {
                    title = '← ' .. _L('management_menu'),
                    onSelect = function()
                        TriggerEvent('zrestaurants:client:openManagement', restaurant)
                    end
                },
                {
                    title = 'Balance',
                    description = Utils.FormatPrice(money),
                    icon = 'wallet',
                    disabled = true
                },
                {
                    title = _L('withdraw_money'),
                    icon = 'money-bill',
                    onSelect = function()
                        local input = lib.inputDialog(_L('withdraw_money'), {
                            {type = 'number', label = 'Amount', min = 1, max = money}
                        })

                        if input then
                            TriggerServerEvent('zrestaurants:server:withdrawMoney', restaurant, input[1])
                        end
                    end
                },
                {
                    title = _L('deposit_money'),
                    icon = 'piggy-bank',
                    onSelect = function()
                        local input = lib.inputDialog(_L('deposit_money'), {
                            {type = 'number', label = 'Amount', min = 1}
                        })

                        if input then
                            TriggerServerEvent('zrestaurants:server:depositMoney', restaurant, input[1])
                        end
                    end
                }
            }
        })

        lib.showContext('restaurant_society')
    end, restaurant)
end)

Utils.Debug('Client menu loaded')

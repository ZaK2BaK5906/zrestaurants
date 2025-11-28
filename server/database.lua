Database = {}

---Get all recipes for a restaurant
---@param restaurant string
---@return table
function Database.GetRecipes(restaurant)
    local result = MySQL.query.await('SELECT * FROM zrestaurants_recipes WHERE restaurant = ? AND enabled = 1', {restaurant})

    for i = 1, #result do
        result[i].ingredients = json.decode(result[i].ingredients)
        if result[i].buffs then
            result[i].buffs = json.decode(result[i].buffs)
        end
    end

    return result
end

---Get a specific recipe
---@param restaurant string
---@param name string
---@return table|nil
function Database.GetRecipe(restaurant, name)
    local result = MySQL.single.await('SELECT * FROM zrestaurants_recipes WHERE restaurant = ? AND name = ? AND enabled = 1', {restaurant, name})

    if result then
        result.ingredients = json.decode(result.ingredients)
        if result.buffs then
            result.buffs = json.decode(result.buffs)
        end
    end

    return result
end

---Create a new recipe
---@param data table
---@return boolean
function Database.CreateRecipe(data)
    local success = MySQL.insert.await([[
        INSERT INTO zrestaurants_recipes (restaurant, name, label, image, price, ingredients, station, time, hunger, thirst, calories, buffs, created_by)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ]], {
        data.restaurant,
        data.name,
        data.label,
        data.image or 'default.png',
        data.price,
        json.encode(data.ingredients),
        data.station,
        data.time or 5000,
        data.hunger or 0,
        data.thirst or 0,
        data.calories or 0,
        json.encode(data.buffs or {}),
        data.created_by
    })

    return success ~= nil
end

---Update a recipe
---@param restaurant string
---@param name string
---@param data table
---@return boolean
function Database.UpdateRecipe(restaurant, name, data)
    local success = MySQL.update.await([[
        UPDATE zrestaurants_recipes
        SET label = ?, image = ?, price = ?, ingredients = ?, station = ?, time = ?, hunger = ?, thirst = ?, calories = ?, buffs = ?
        WHERE restaurant = ? AND name = ?
    ]], {
        data.label,
        data.image,
        data.price,
        json.encode(data.ingredients),
        data.station,
        data.time,
        data.hunger,
        data.thirst,
        data.calories,
        json.encode(data.buffs or {}),
        restaurant,
        name
    })

    return success > 0
end

---Delete a recipe
---@param restaurant string
---@param name string
---@return boolean
function Database.DeleteRecipe(restaurant, name)
    local success = MySQL.update.await('UPDATE zrestaurants_recipes SET enabled = 0 WHERE restaurant = ? AND name = ?', {restaurant, name})
    return success > 0
end

---Count recipes for a restaurant
---@param restaurant string
---@return number
function Database.CountRecipes(restaurant)
    local result = MySQL.scalar.await('SELECT COUNT(*) FROM zrestaurants_recipes WHERE restaurant = ? AND enabled = 1', {restaurant})
    return result or 0
end

---Get menu items for a restaurant
---@param restaurant string
---@return table
function Database.GetMenuItems(restaurant)
    return MySQL.query.await('SELECT * FROM zrestaurants_menu WHERE restaurant = ? AND enabled = 1', {restaurant})
end

---Update menu item
---@param restaurant string
---@param item string
---@param data table
---@return boolean
function Database.UpdateMenuItem(restaurant, item, data)
    local success = MySQL.update.await([[
        UPDATE zrestaurants_menu
        SET label = ?, image = ?, price = ?, stock = ?
        WHERE restaurant = ? AND item = ?
    ]], {
        data.label,
        data.image,
        data.price,
        data.stock,
        restaurant,
        item
    })

    return success > 0
end

---Update menu item stock
---@param restaurant string
---@param item string
---@param stock number
---@return boolean
function Database.UpdateMenuStock(restaurant, item, stock)
    local success = MySQL.update.await('UPDATE zrestaurants_menu SET stock = stock + ? WHERE restaurant = ? AND item = ?', {stock, restaurant, item})
    return success > 0
end

---Add sale record
---@param data table
---@return boolean
function Database.AddSale(data)
    local success = MySQL.insert.await([[
        INSERT INTO zrestaurants_sales (restaurant, item, quantity, price, total, seller_identifier, buyer_identifier, sale_type)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    ]], {
        data.restaurant,
        data.item,
        data.quantity,
        data.price,
        data.total,
        data.seller_identifier,
        data.buyer_identifier,
        data.sale_type or 'register'
    })

    return success ~= nil
end

---Create delivery
---@param data table
---@return number|nil
function Database.CreateDelivery(data)
    return MySQL.insert.await([[
        INSERT INTO zrestaurants_deliveries (restaurant, player_identifier, location, reward, status)
        VALUES (?, ?, ?, ?, ?)
    ]], {
        data.restaurant,
        data.player_identifier,
        json.encode(data.location),
        data.reward,
        'in_progress'
    })
end

---Complete delivery
---@param id number
---@return boolean
function Database.CompleteDelivery(id)
    local success = MySQL.update.await('UPDATE zrestaurants_deliveries SET status = ?, completed_at = NOW() WHERE id = ?', {'completed', id})
    return success > 0
end

---Check delivery cooldown
---@param identifier string
---@param restaurant string
---@return boolean
function Database.IsDeliveryOnCooldown(identifier, restaurant)
    local result = MySQL.scalar.await([[
        SELECT COUNT(*) FROM zrestaurants_delivery_cooldowns
        WHERE player_identifier = ? AND restaurant = ? AND cooldown_until > NOW()
    ]], {identifier, restaurant})

    return result > 0
end

---Set delivery cooldown
---@param identifier string
---@param restaurant string
---@param seconds number
---@return boolean
function Database.SetDeliveryCooldown(identifier, restaurant, seconds)
    MySQL.query.await([[
        INSERT INTO zrestaurants_delivery_cooldowns (player_identifier, restaurant, cooldown_until)
        VALUES (?, ?, DATE_ADD(NOW(), INTERVAL ? SECOND))
        ON DUPLICATE KEY UPDATE cooldown_until = DATE_ADD(NOW(), INTERVAL ? SECOND)
    ]], {identifier, restaurant, seconds, seconds})

    return true
end

---Get music data for zone
---@param restaurant string
---@param zoneId number
---@return table|nil
function Database.GetMusicData(restaurant, zoneId)
    return MySQL.single.await('SELECT * FROM zrestaurants_music WHERE restaurant = ? AND zone_id = ?', {restaurant, zoneId})
end

---Update music data
---@param restaurant string
---@param zoneId number
---@param url string
---@param volume number
---@param isPlaying boolean
---@return boolean
function Database.UpdateMusicData(restaurant, zoneId, url, volume, isPlaying)
    MySQL.query.await([[
        INSERT INTO zrestaurants_music (restaurant, zone_id, url, volume, is_playing)
        VALUES (?, ?, ?, ?, ?)
        ON DUPLICATE KEY UPDATE url = ?, volume = ?, is_playing = ?
    ]], {restaurant, zoneId, url, volume, isPlaying and 1 or 0, url, volume, isPlaying and 1 or 0})

    return true
end

return Database

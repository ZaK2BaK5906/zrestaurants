Utils = {}

---Check if player has permission
---@param job string
---@param grade number
---@param permissionType string
---@return boolean
function Utils.HasPermission(job, grade, permissionType)
    if not Config.Permissions[permissionType] then return false end

    local jobData = ESX.GetPlayerData().job
    if jobData.name ~= job then return false end

    for _, allowedGrade in ipairs(Config.Permissions[permissionType]) do
        if jobData.grade_name == allowedGrade then
            return true
        end
    end

    return false
end

---Calculate total hunger from calories
---@param calories number
---@return number
function Utils.CaloriesToHunger(calories)
    if not Config.CaloriesEnabled then return 0 end
    return math.floor((calories / Config.CaloriesPerHunger) * 10)
end

---Calculate total thirst from calories
---@param calories number
---@return number
function Utils.CaloriesToThirst(calories)
    if not Config.CaloriesEnabled then return 0 end
    return math.floor((calories / Config.CaloriesPerThirst) * 10)
end

---Show notification
---@param message string
---@param type string
---@param duration number
function Utils.Notify(message, type, duration)
    lib.notify({
        title = 'Restaurant',
        description = message,
        type = type or 'info',
        position = Config.Notifications.position,
        duration = duration or Config.Notifications.duration
    })
end

---Show progress bar
---@param duration number
---@param label string
---@param animation table
---@param prop table
---@return boolean
function Utils.Progress(duration, label, animation, prop)
    return lib.progressBar({
        duration = duration,
        label = label,
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
            combat = true
        },
        anim = animation,
        prop = prop
    })
end

---Get restaurant by job name
---@param job string
---@return table|nil
function Utils.GetRestaurantByJob(job)
    for k, v in pairs(Restaurants) do
        if v.job == job then
            return v
        end
    end
    return nil
end

---Get restaurant key by job name
---@param job string
---@return string|nil
function Utils.GetRestaurantKeyByJob(job)
    for k, v in pairs(Restaurants) do
        if v.job == job then
            return k
        end
    end
    return nil
end

---Format price
---@param price number
---@return string
function Utils.FormatPrice(price)
    return Config.CurrencySymbol .. price
end

---Round number
---@param num number
---@param decimals number
---@return number
function Utils.Round(num, decimals)
    local mult = 10^(decimals or 0)
    return math.floor(num * mult + 0.5) / mult
end

---Check if player is in restaurant job
---@param restaurantJob string
---@return boolean
function Utils.IsPlayerInRestaurant(restaurantJob)
    if IsDuplicityVersion() then
        return false -- Server side, use different method
    end

    local playerData = ESX.GetPlayerData()
    return playerData.job and playerData.job.name == restaurantJob
end

---Debug print
---@param ... any
function Utils.Debug(...)
    if Config.Debug then
        print('[ZRestaurants DEBUG]', ...)
    end
end

---Generate unique ID
---@return string
function Utils.GenerateId()
    local chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'
    local id = ''
    for i = 1, 16 do
        local rand = math.random(#chars)
        id = id .. string.sub(chars, rand, rand)
    end
    return id .. '_' .. os.time()
end

return Utils

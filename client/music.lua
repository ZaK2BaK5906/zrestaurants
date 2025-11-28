-- Music System
-- This is a basic implementation
-- You can integrate with xsound or other music systems

local ActiveMusic = {}

---Play music in zone
---@param restaurant string
---@param zoneId number
---@param url string
---@param volume number
function PlayMusic(restaurant, zoneId, url, volume)
    local musicId = restaurant .. '_' .. zoneId

    -- Stop existing music
    if ActiveMusic[musicId] then
        StopMusic(restaurant, zoneId)
    end

    -- This is where you would integrate with xsound or similar
    -- Example with xsound:
    -- exports.xsound:PlayUrlPos(musicId, url, volume, coords)

    ActiveMusic[musicId] = {
        url = url,
        volume = volume,
        playing = true
    }

    Utils.Debug('Playing music:', musicId, url)
end

---Stop music in zone
---@param restaurant string
---@param zoneId number
function StopMusic(restaurant, zoneId)
    local musicId = restaurant .. '_' .. zoneId

    if not ActiveMusic[musicId] then return end

    -- Example with xsound:
    -- exports.xsound:Destroy(musicId)

    ActiveMusic[musicId] = nil

    Utils.Debug('Stopped music:', musicId)
end

---Change volume
---@param restaurant string
---@param zoneId number
---@param volume number
function ChangeVolume(restaurant, zoneId, volume)
    local musicId = restaurant .. '_' .. zoneId

    if not ActiveMusic[musicId] then return end

    -- Example with xsound:
    -- exports.xsound:setVolume(musicId, volume)

    ActiveMusic[musicId].volume = volume

    Utils.Debug('Changed volume:', musicId, volume)
end

---Open music menu (for employees)
RegisterNetEvent('zrestaurants:client:musicMenu', function(restaurant, zoneId)
    if PlayerJob.name ~= restaurant then return end

    lib.registerContext({
        id = 'restaurant_music',
        title = _L('music'),
        options = {
            {
                title = _L('play_music'),
                icon = 'play',
                onSelect = function()
                    local input = lib.inputDialog(_L('play_music'), {
                        {type = 'input', label = _L('enter_url'), required = true, placeholder = 'https://...'}
                    })

                    if input then
                        PlayMusic(restaurant, zoneId, input[1], 0.3)
                        Utils.Notify('Music started', 'success')
                    end
                end
            },
            {
                title = _L('stop_music'),
                icon = 'stop',
                onSelect = function()
                    StopMusic(restaurant, zoneId)
                    Utils.Notify('Music stopped', 'success')
                end
            },
            {
                title = _L('change_volume'),
                icon = 'volume-up',
                onSelect = function()
                    local input = lib.inputDialog(_L('change_volume'), {
                        {type = 'slider', label = 'Volume', min = 0, max = 100, default = 30}
                    })

                    if input then
                        local volume = input[1] / 100
                        ChangeVolume(restaurant, zoneId, volume)
                        Utils.Notify('Volume changed', 'success')
                    end
                end
            }
        }
    })

    lib.showContext('restaurant_music')
end)

-- Cleanup on resource stop
AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end

    for musicId, _ in pairs(ActiveMusic) do
        -- Example with xsound:
        -- exports.xsound:Destroy(musicId)
    end
end)

Utils.Debug('Client music loaded')

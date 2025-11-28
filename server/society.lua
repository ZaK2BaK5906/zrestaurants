-- Society Management

---Get employees
lib.callback.register('zrestaurants:getEmployees', function(source, job)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer or xPlayer.job.name ~= job then return {} end

    local employees = MySQL.query.await([[
        SELECT users.identifier, users.firstname, users.lastname, job.grade, job_grades.label as grade_label
        FROM users
        LEFT JOIN job_grades ON job_grades.job_name = users.job AND job_grades.grade = users.job_grade
        LEFT JOIN jobs job ON job.name = users.job
        WHERE users.job = ?
    ]], {job})

    return employees or {}
end)

---Set employee grade
RegisterNetEvent('zrestaurants:server:setGrade', function(job, identifier, grade)
    local src = source

    -- Check permission (only boss can change grades)
    if not lib.callback.await('zrestaurants:hasPermission', src, job, 'managementMenu') then
        return
    end

    -- Update employee grade
    MySQL.update('UPDATE users SET job_grade = ? WHERE identifier = ?', {grade, identifier})

    -- If player is online, update their job
    local targetPlayer = ESX.GetPlayerFromIdentifier(identifier)
    if targetPlayer then
        targetPlayer.setJob(job, grade)
    end

    TriggerClientEvent('ox_lib:notify', src, {
        type = 'success',
        description = 'Employee grade updated'
    })
end)

---Fire employee
RegisterNetEvent('zrestaurants:server:fireEmployee', function(job, identifier)
    local src = source

    -- Check permission (only boss can fire)
    if not lib.callback.await('zrestaurants:hasPermission', src, job, 'managementMenu') then
        return
    end

    -- Set employee to unemployed
    MySQL.update('UPDATE users SET job = ?, job_grade = ? WHERE identifier = ?', {'unemployed', 0, identifier})

    -- If player is online, update their job
    local targetPlayer = ESX.GetPlayerFromIdentifier(identifier)
    if targetPlayer then
        targetPlayer.setJob('unemployed', 0)
    end

    TriggerClientEvent('ox_lib:notify', src, {
        type = 'success',
        description = 'Employee fired'
    })
end)

---Hire employee
RegisterNetEvent('zrestaurants:server:hireEmployee', function(job, targetId)
    local src = source
    local xTarget = ESX.GetPlayerFromId(targetId)

    if not xTarget then return end

    -- Check permission (only boss can hire)
    if not lib.callback.await('zrestaurants:hasPermission', src, job, 'managementMenu') then
        return
    end

    -- Set employee job
    xTarget.setJob(job, 0)

    TriggerClientEvent('ox_lib:notify', src, {
        type = 'success',
        description = 'Employee hired'
    })

    TriggerClientEvent('ox_lib:notify', targetId, {
        type = 'success',
        description = 'You have been hired!'
    })
end)

Utils.Debug('Server society loaded')

RegisterNetEvent('qb-admin:server:name', function(Target, Input)
    local src = source
    local TargetInfo = QBCore.Functions.GetPlayer(Target.id)
    local NewInfo = {}

    if not (QBCore.Functions.HasPermission(src, events['playerinformation'])) then return end
    if not type_check({tostring(Input), 'string'}) then return end
    if not TargetInfo then return end

    for token in string.gmatch(Input, "[^%s]+") do
        NewInfo[#NewInfo + 1] = token
    end
    TargetInfo.PlayerData.charinfo.firstname = NewInfo[1]
    if next(NewInfo, 1) then TargetInfo.PlayerData.charinfo.lastname = NewInfo[2] end
    QBCore.Player.CheckPlayerData(Target.id, TargetInfo.PlayerData)
end)

RegisterNetEvent('qb-admin:server:food', function(Target, Input)
    local src = source
    local TargetInfo = QBCore.Functions.GetPlayer(Target.id)

    if not (QBCore.Functions.HasPermission(src, events['playerinformation'])) then return end
    if not type_check({tonumber(Input), 'number'}) then return end
    if not TargetInfo then return end

    TargetInfo.Functions.SetMetaData('hunger', tonumber(Input))
end)

RegisterNetEvent('qb-admin:server:water', function(Target, Input)
    local src = source
    local TargetInfo = QBCore.Functions.GetPlayer(Target.id)

    if not (QBCore.Functions.HasPermission(src, events['playerinformation'])) then return end
    if not type_check({tonumber(Input), 'number'}) then return end
    if not TargetInfo then return end

    TargetInfo.Functions.SetMetaData('thirst', tonumber(Input))
end)

RegisterNetEvent('qb-admin:server:stress', function(Target, Input)
    local src = source
    local TargetInfo = QBCore.Functions.GetPlayer(Target.id)

    if not (QBCore.Functions.HasPermission(src, events['playerinformation'])) then return end
    if not type_check({tonumber(Input), 'number'}) then return end
    if not TargetInfo then return end

    TargetInfo.Functions.SetMetaData('stress', tonumber(Input))
end)

RegisterNetEvent('qb-admin:server:armor', function(Target, Input)
    local src = source
    local TargetInfo = QBCore.Functions.GetPlayer(Target.id)

    if not (QBCore.Functions.HasPermission(src, events['playerinformation'])) then return end
    if not type_check({tonumber(Input), 'number'}) then return end
    if not TargetInfo then return end

    TargetInfo.Functions.SetMetaData('armor', tonumber(Input))
end)

RegisterNetEvent('qb-admin:server:phone', function(Target, Input)
    local src = source
    local TargetInfo = QBCore.Functions.GetPlayer(Target.id)

    if not (QBCore.Functions.HasPermission(src, events['playerinformation'])) then return end
    if not type_check({tostring(Input), 'string'}) then return end
    if not TargetInfo then return end

    TargetInfo.PlayerData.charinfo.phone = Input
    QBCore.Player.CheckPlayerData(Target.id, TargetInfo.PlayerData)
end)

RegisterNetEvent('qb-admin:server:craftingrep', function(Target, Input)
    local src = source
    local TargetInfo = QBCore.Functions.GetPlayer(Target.id)

    if not (QBCore.Functions.HasPermission(src, events['playerinformation'])) then return end
    if not type_check({tonumber(Input), 'number'}) then return end
    if not TargetInfo then return end

    TargetInfo.Functions.SetMetaData('craftingrep', tonumber(Input))
end)

RegisterNetEvent('qb-admin:server:dealerrep', function(Target, Input)
    local src = source
    local TargetInfo = QBCore.Functions.GetPlayer(Target.id)

    if not (QBCore.Functions.HasPermission(src, events['playerinformation'])) then return end
    if not type_check({tonumber(Input), 'number'}) then return end
    if not TargetInfo then return end

    TargetInfo.Functions.SetMetaData('dealerrep', tonumber(Input))
end)

RegisterNetEvent('qb-admin:server:cash', function(Target, Input)
    local src = source
    local TargetInfo = QBCore.Functions.GetPlayer(Target.id)

    if not (QBCore.Functions.HasPermission(src, events['playerinformation'])) then return end
    if not type_check({tonumber(Input), 'number'}) then return end
    if not TargetInfo then return end

    TargetInfo.PlayerData.money['cash'] = tonumber(Input)
    QBCore.Player.CheckPlayerData(Target.id, TargetInfo.PlayerData)
end)

RegisterNetEvent('qb-admin:server:bank', function(Target, Input)
    local src = source
    local TargetInfo = QBCore.Functions.GetPlayer(Target.id)

    if not (QBCore.Functions.HasPermission(src, events['playerinformation'])) then return end
    if not type_check({tonumber(Input), 'number'}) then return end
    if not TargetInfo then return end

    TargetInfo.PlayerData.money['bank'] = tonumber(Input)
    QBCore.Player.CheckPlayerData(Target.id, TargetInfo.PlayerData)
end)

RegisterNetEvent('qb-admin:server:job', function(Target, Input)
    local src = source
    local TargetInfo = QBCore.Functions.GetPlayer(Target.id)
    local NewInfo = {}

    if not (QBCore.Functions.HasPermission(src, events['playerinformation'])) then return end
    if not type_check({tostring(Input), 'string'}) then return end
    if not TargetInfo then return end

    for token in string.gmatch(Input, "[^%s]+") do
        NewInfo[#NewInfo + 1] = token
    end
    if next(NewInfo, 1) then TargetInfo.Functions.SetJob(NewInfo[1], tonumber(NewInfo[2])) return end
    TargetInfo.Functions.SetJob(NewInfo[1])
end)

RegisterNetEvent('qb-admin:server:gang', function(Target, Input)
    local src = source
    local TargetInfo = QBCore.Functions.GetPlayer(Target.id)
    local NewInfo = {}

    if not (QBCore.Functions.HasPermission(src, events['playerinformation'])) then return end
    if not type_check({tostring(Input), 'string'}) then return end
    if not TargetInfo then return end

    for token in string.gmatch(Input, "[^%s]+") do
        NewInfo[#NewInfo + 1] = token
    end
    if next(NewInfo, 1) then TargetInfo.Functions.SetGang(NewInfo[1], tonumber(NewInfo[2])) return end
    TargetInfo.Functions.SetGang(NewInfo[1])
end)

RegisterNetEvent('qb-admin:server:radio', function(Target, Input)
    local src = source
    local TargetInfo = QBCore.Functions.GetPlayer(Target.id)

    if not (QBCore.Functions.HasPermission(src, events['playerinformation'])) then return end
    if not type_check({tonumber(Input), 'number'}) then return end
    if not TargetInfo then return end

    exports['pma-voice']:setPlayerRadio(Target.id, tonumber(Input))
end)

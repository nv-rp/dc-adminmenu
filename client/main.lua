QBCore = exports['qb-core']:GetCoreObject()
banlength = nil
showCoords = false
vehicleDevMode = false
PlayerDetails = nil
banreason = 'Unknown'
kickreason = 'Unknown'
itemname = 'Unknown'
itemamount = 0
soundname = 'Unknown'
soundrange = 0
soundvolume = 0
menuLocation = 'topright' -- e.g. topright (default), topleft, bottomright, bottomleft
menuSize = 'size-125' -- e.g. 'size-100', 'size-110', 'size-125', 'size-150', 'size-175', 'size-200'
r, g, b = 220, 20, 60 -- red, green, blue values for the menu background

MainMenu = MenuV:CreateMenu(false, Lang:t("menu.admin_menu"), menuLocation, r, g, b, menuSize, 'qbcore', 'menuv', 'qb-admin:mainmenu')
SelfMenu = MenuV:CreateMenu(false, Lang:t("menu.admin_options"), menuLocation, r, g, b, menuSize, 'qbcore', 'menuv', 'qb-admin:selfmenu')
PlayerMenu = MenuV:CreateMenu(false, Lang:t("menu.online_players"), menuLocation, r, g, b, menuSize, 'qbcore', 'menuv', 'qb-admin:playermenu')
PlayerDetailMenu = MenuV:CreateMenu(false, Lang:t("info.options"), menuLocation, r, g, b, menuSize, 'qbcore', 'menuv', 'qb-admin:playerdetailmenu')
PlayerGeneralMenu = MenuV:CreateMenu(false, Lang:t("menu.player_general"), menuLocation, r, g, b, menuSize, 'qbcore', 'menuv', 'qb-admin:playergeneral')
PlayerAdminMenu = MenuV:CreateMenu(false, Lang:t("menu.player_administration"), menuLocation, r, g, b, menuSize, 'qbcore', 'menuv', 'qb-admin:playeradministration')
PlayerExtraMenu = MenuV:CreateMenu(false, Lang:t("menu.player_extra"), menuLocation, r, g, b, menuSize, 'qbcore', 'menuv', 'qb-admin:playerextra')
BanMenu = MenuV:CreateMenu(false, Lang:t("menu.ban"), menuLocation, r, g, b, menuSize, 'qbcore', 'menuv', 'qb-admin:banmenu')
KickMenu = MenuV:CreateMenu(false, Lang:t("menu.kick"), menuLocation, r, g, b, menuSize, 'qbcore', 'menuv', 'qb-admin:kickmenu')
PermsMenu = MenuV:CreateMenu(false, Lang:t("menu.permissions"), menuLocation, r, g, b, menuSize, 'qbcore', 'menuv', 'qb-admin:permsmenu')
GiveItemMenu = MenuV:CreateMenu(false, Lang:t("menu.give_item_menu"), menuLocation, r, g, b, menuSize, 'qbcore', 'menuv', 'qb-admin:giveitemmenu')
SoundMenu = MenuV:CreateMenu(false, Lang:t("menu.play_sound"), menuLocation, r, g, b, menuSize, 'qbcore', 'menuv', 'qb-admin:soundmenu')
ServerMenu = MenuV:CreateMenu(false, Lang:t("menu.manage_server"), menuLocation, r, g, b, menuSize, 'qbcore', 'menuv', 'qb-admin:servermenu')
WeatherMenu = MenuV:CreateMenu(false, Lang:t("menu.weather_conditions"), menuLocation, r, g, b, menuSize, 'qbcore', 'menuv', 'qb-admin:weathermenu')
VehicleMenu = MenuV:CreateMenu(false, Lang:t("menu.vehicle_options"), menuLocation, r, g, b, menuSize, 'qbcore', 'menuv', 'qb-admin:vehiclemenu')
VehCategorieMenu = MenuV:CreateMenu(false, Lang:t("menu.vehicle_categories"), menuLocation, r, g, b, menuSize, 'qbcore', 'menuv', 'qb-admin:vehcategoriemenu')
VehNameMenu = MenuV:CreateMenu(false, Lang:t("menu.vehicle_models"), menuLocation, r, g, b, menuSize, 'qbcore', 'menuv', 'qb-admin:vehnamemenu')
DealerMenu = MenuV:CreateMenu(false, Lang:t("menu.dealer_list"), menuLocation, r, g, b, menuSize, 'qbcore', 'menuv', 'qb-admin:dealermenu')
DevMenu = MenuV:CreateMenu(false, Lang:t("menu.developer_options"), menuLocation, r, g, b, menuSize, 'qbcore', 'menuv', 'qb-admin:devmenu')

local MainMenuButton1 = MainMenu:AddButton({
    icon = '😃',
    label = Lang:t("menu.admin_options"),
    value = SelfMenu,
    description = Lang:t("desc.admin_options_desc")
})

local MainMenuButton2 = MainMenu:AddButton({
    icon = '🙍‍♂️',
    label = Lang:t("menu.player_management"),
    value = PlayerMenu,
    description = Lang:t("desc.player_management_desc")
})
MainMenuButton2:On('select', function(item)
    PlayerMenu:ClearItems()
    QBCore.Functions.TriggerCallback('qb-adminmenu:callback:getplayers', function(players)
        for k, v in pairs(players) do
            local PlayerMenuButton = PlayerMenu:AddButton({
                label = Lang:t("info.id") .. v["id"] .. ' | ' .. v["name"],
                value = v,
                description = Lang:t("info.player_name"),
                select = function(btn)
                    PlayerDetails = btn.Value
                    OpenPlayerMenus()
                end
            })
        end
    end)
end)

local MainMenuButton3 = MainMenu:AddButton({
    icon = '🎮',
    label = Lang:t("menu.server_management"),
    value = ServerMenu,
    description = Lang:t("desc.server_management_desc")
})
local MainMenuButton4 = MainMenu:AddButton({
    icon = '🚗',
    label = Lang:t("menu.vehicles"),
    value = VehicleMenu,
    description = Lang:t("desc.vehicles_desc")
})
local MainMenuButton5 = MainMenu:AddButton({
    icon = '💊',
    label = Lang:t("menu.dealer_list"),
    value = DealerMenu,
    description = Lang:t("desc.dealer_desc")
})
local MainMenuButton6 = MainMenu:AddButton({
    icon = '🔧',
    label = Lang:t("menu.developer_options"),
    value = DevMenu,
    description = Lang:t("desc.developer_desc")
})

-- ServerMenu
local ServerMenuButton1 = ServerMenu:AddButton({
    icon = '🌡️',
    label = Lang:t("menu.weather_options"),
    value = WeatherMenu,
    description = Lang:t("desc.weather_desc")
})
ServerMenuButton1:On("select",function()
    WeatherMenu:ClearItems()
    local elements = {
        [1] = {
            icon = '☀️',
            label = Lang:t("weather.extra_sunny"),
            value = "EXTRASUNNY",
            description = Lang:t("weather.extra_sunny_desc")
        },
        [2] = {
            icon = '☀️',
            label = Lang:t("weather.clear"),
            value = "CLEAR",
            description = Lang:t("weather.clear_desc")
        },
        [3] = {
            icon = '☀️',
            label = Lang:t("weather.neutral"),
            value = "NEUTRAL",
            description = Lang:t("weather.neutral_desc")
        },
        [4] = {
            icon = '🌁',
            label = Lang:t("weather.smog"),
            value = "SMOG",
            description = Lang:t("weather.smog_desc")
        },
        [5] = {
            icon = '🌫️',
            label = Lang:t("weather.foggy"),
            value = "FOGGY",
            description = Lang:t("weather.foggy_desc")
        },
        [6] = {
            icon = '⛅',
            label = Lang:t("weather.overcast"),
            value = "OVERCAST",
            description = Lang:t("weather.overcast_desc")
        },
        [7] = {
            icon = '☁️',
            label = Lang:t("weather.clouds"),
            value = "CLOUDS",
            description = Lang:t("weather.clouds_desc")
        },
        [8] = {
            icon = '🌤️',
            label = Lang:t("weather.clearing"),
            value = "CLEARING",
            description = Lang:t("weather.clearing_desc")
        },
        [9] = {
            icon = '☂️',
            label = Lang:t("weather.rain"),
            value = "RAIN",
            description = Lang:t("weather.rain_desc")
        },

        [10] = {
            icon = '⛈️',
            label = Lang:t("weather.thunder"),
            value = "THUNDER",
            description = Lang:t("weather.thunder_desc")
        },
        [11] = {
            icon = '❄️',
            label = Lang:t("weather.snow"),
            value = "SNOW",
            description = Lang:t("weather.snow_desc")
        },
        [12] = {
            icon = '🌨️',
            label = Lang:t("weather.blizzard"),
            value = "BLIZZARD",
            description = Lang:t("weather.blizzed_desc")
        },
        [13] = {
            icon = '❄️',
            label = Lang:t("weather.light_snow"),
            value = "SNOWLIGHT",
            description = Lang:t("weather.light_snow_desc")
        },
        [14] = {
            icon = '🌨️',
            label = Lang:t("weather.heavy_snow"),
            value = "XMAS",
            description = Lang:t("weather.heavy_snow_desc")
        },
        [15] = {
            icon = '🎃',
            label = Lang:t("weather.halloween"),
            value = "HALLOWEEN",
            description = Lang:t("weather.halloween_desc")
        }
    }
    for k, v in ipairs(elements) do
        local WeatherButton = WeatherMenu:AddButton({icon = v.icon,label = v.label,value = v,description = v.description,select = function(btn)
            local selection = btn.Value
            TriggerServerEvent('qb-weathersync:server:setWeather', selection.value)
            QBCore.Functions.Notify(Lang:t("weather.weather_changed", {value = selection.label}))
        end})
    end
end)

local ServerMenuButton2 = ServerMenu:AddSlider({
    icon = '⏲️',
    label = Lang:t("menu.server_time"),
    value = GetClockHours(),
    values = {{
        label = '00',
        value = '00',
        description = Lang:t("menu.time")
    }, {
        label = '01',
        value = '01',
        description = Lang:t("menu.time")
    }, {
        label = '02',
        value = '02',
        description = Lang:t("menu.time")
    }, {
        label = '03',
        value = '03',
        description = Lang:t("menu.time")
    }, {
        label = '04',
        value = '04',
        description = Lang:t("menu.time")
    }, {
        label = '05',
        value = '05',
        description = Lang:t("menu.time")
    }, {
        label = '06',
        value = '06',
        description = Lang:t("menu.time")
    }, {
        label = '07',
        value = '07',
        description = Lang:t("menu.time")
    }, {
        label = '08',
        value = '08',
        description = Lang:t("menu.time")
    }, {
        label = '09',
        value = '09',
        description = Lang:t("menu.time")
    }, {
        label = '10',
        value = '10',
        description = Lang:t("menu.time")
    }, {
        label = '11',
        value = '11',
        description = Lang:t("menu.time")
    }, {
        label = '12',
        value = '12',
        description = Lang:t("menu.time")
    }, {
        label = '13',
        value = '13',
        description = Lang:t("menu.time")
    }, {
        label = '14',
        value = '14',
        description = Lang:t("menu.time")
    }, {
        label = '15',
        value = '15',
        description = Lang:t("menu.time")
    }, {
        label = '16',
        value = '16',
        description = Lang:t("menu.time")
    }, {
        label = '17',
        value = '17',
        description = Lang:t("menu.time")
    }, {
        label = '18',
        value = '18',
        description = Lang:t("menu.time")
    }, {
        label = '19',
        value = '19',
        description = Lang:t("menu.time")
    }, {
        label = '20',
        value = '20',
        description = Lang:t("menu.time")
    }, {
        label = '21',
        value = '21',
        description = Lang:t("menu.time")
    }, {
        label = '22',
        value = '22',
        description = Lang:t("menu.time")
    }, {
        label = '23',
        value = '23',
        description = Lang:t("menu.time")
    }}
})
ServerMenuButton2:On("select", function(item, value)
    TriggerServerEvent("qb-weathersync:server:setTime", value, value)
    QBCore.Functions.Notify(Lang:t("time.changed", {time = value}))
end)

-- Vehicle Menu
local function OpenCarModelsMenu(category)
    VehNameMenu:ClearItems()
    MenuV:OpenMenu(VehNameMenu)
    for k, v in pairs(category) do
        local menu_button10 = VehNameMenu:AddButton({
            label = v["name"],
            value = k,
            description = 'Spawn ' .. v["name"],
            select = function(btn)
                TriggerServerEvent('qb-admin:server:spawnVehicle', k)
            end
        })
    end
end

local VehicleMenuButton1 = VehicleMenu:AddButton({
    icon = '🚗',
    label = Lang:t("menu.spawn_vehicle"),
    value = VehCategorieMenu,
    description = Lang:t("desc.spawn_vehicle_desc")
})
local vehicles = {}
VehicleMenuButton1:On('Select', function(item)
    VehCategorieMenu:ClearItems()
    for k, v in pairs(QBCore.Shared.Vehicles) do
        local category = v["category"]
        if vehicles[category] == nil then
            vehicles[category] = { }
        end
        vehicles[category][k] = v
    end
    for k, v in pairs(vehicles) do
        local menu_button10 = VehCategorieMenu:AddButton({
            label = k,
            value = v,
            description = Lang:t("menu.category_name"),
            select = function(btn)
                local select = btn.Value
                OpenCarModelsMenu(select)
            end
        })
    end
end)

local VehicleMenuButton2 = VehicleMenu:AddButton({
    icon = '🔧',
    label = Lang:t("menu.fix_vehicle"),
    value = 'fix',
    description = Lang:t("desc.fix_vehicle_desc")
})
VehicleMenuButton2:On('Select', function(item)
    TriggerServerEvent('QBCore:CallCommand', "fix", {})
end)

local VehicleMenuButton3 = VehicleMenu:AddButton({
    icon = '💲',
    label = Lang:t("menu.buy"),
    value = 'buy',
    description = Lang:t("desc.buy_desc")
})
VehicleMenuButton3:On('Select', function(item)
    TriggerServerEvent('QBCore:CallCommand', "admincar", {})
end)

local VehicleMenuButton4 = VehicleMenu:AddButton({
    icon = '☠',
    label = Lang:t("menu.remove_vehicle"),
    value = 'remove',
    description = Lang:t("desc.remove_vehicle_desc")
})
VehicleMenuButton4:On('Select', function(item)
    TriggerServerEvent('QBCore:CallCommand', "dv", {})
end)

-- Dealer Menu
local function OpenDealerMenu(dealer)
    local EditDealer = MenuV:CreateMenu(false, Lang:t("menu.edit_dealer") .. dealer["name"], menuLocation, r, g, b, menuSize, 'qbcore', 'menuv')
    EditDealer:ClearItems()
    MenuV:OpenMenu(EditDealer)
    local elements = {
        [1] = {
            icon = '➡️',
            label = Lang:t("info.goto") .. " " .. dealer["name"],
            value = "goto",
            description = Lang:t("desc.dealergoto_desc") .. " " .. dealer["name"]
        },
        [2] = {
            icon = "☠",
            label = Lang:t("info.remove") .. " " .. dealer["name"],
            value = "remove",
            description = Lang:t("desc.dealerremove_desc") .. " " .. dealer["name"]
        }
    }
    for k, v in ipairs(elements) do
        local EditDealerButton = EditDealer:AddButton({
            icon = v.icon,
            label = ' ' .. v.label,
            value = v.value,
            description = v.description,
            select = function(btn)
                local values = btn.Value
                if values == "goto" then
                    TriggerServerEvent('QBCore:CallCommand', "dealergoto", { dealer["name"] })
                elseif values == "remove" then
                    TriggerServerEvent('QBCore:CallCommand', "deletedealer", { dealer["name"] })
                    EditDealer:Close()
                    DealerMenu:Close()
                end
            end
        })
    end
end

MainMenuButton5:On('Select', function(item)
    DealerMenu:ClearItems()
    QBCore.Functions.TriggerCallback('qb-adminmenu:callback:getdealers', function(dealers)
        for k, v in pairs(dealers) do
            local DealerMenuButton1 = DealerMenu:AddButton({
                label = v["name"],
                value = v,
                description = Lang:t("menu.dealer_name"),
                select = function(btn)
                    local select = btn.Value
                    OpenDealerMenu(select)
                end
            })
        end
    end)
end)

-- Developer Menu
local function round(input, decimalPlaces)
    return tonumber(string.format("%." .. (decimalPlaces or 0) .. "f", input))
end

local function CopyToClipboard(dataType)
    local ped = PlayerPedId()
    if dataType == 'coords3' then
        local coords = GetEntityCoords(ped)
        local x = round(coords.x, 2)
        local y = round(coords.y, 2)
        local z = round(coords.z, 2)
        SendNUIMessage({
            string = string.format('vector3(%s, %s, %s)', x, y, z)
        })
        QBCore.Functions.Notify(Lang:t("success.coords_copied"), "success")
    elseif dataType == 'coords4' then
        local coords = GetEntityCoords(ped)
        local x = round(coords.x, 2)
        local y = round(coords.y, 2)
        local z = round(coords.z, 2)
        local heading = GetEntityHeading(ped)
        local h = round(heading, 2)
        SendNUIMessage({
            string = string.format('vector4(%s, %s, %s, %s)', x, y, z, h)
        })
        QBCore.Functions.Notify(Lang:t("success.coords_copied"), "success")
    elseif dataType == 'heading' then
        local heading = GetEntityHeading(ped)
        local h = round(heading, 2)
        SendNUIMessage({
            string = h
        })
        QBCore.Functions.Notify(Lang:t("success.heading_copied"), "success")
    end
end

local function Draw2DText(content, font, colour, scale, x, y)
    SetTextFont(font)
    SetTextScale(scale, scale)
    SetTextColour(colour[1],colour[2],colour[3], 255)
    SetTextEntry("STRING")
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextDropShadow()
    SetTextEdge(4, 0, 0, 0, 255)
    SetTextOutline()
    AddTextComponentString(content)
    DrawText(x, y)
end

local function ToggleShowCoordinates()
    local x = 0.4
    local y = 0.025
    showCoords = not showCoords
    CreateThread(function()
        while showCoords do
            local coords = GetEntityCoords(PlayerPedId())
            local heading = GetEntityHeading(PlayerPedId())
            local c = {}
            c.x = round(coords.x, 2)
            c.y = round(coords.y, 2)
            c.z = round(coords.z, 2)
            heading = round(heading, 2)
            Wait(0)
            Draw2DText(string.format('~w~'..Lang:t("info.ped_coords") .. '~b~ vector4(~w~%s~b~, ~w~%s~b~, ~w~%s~b~, ~w~%s~b~)', c.x, c.y, c.z, heading), 4, {66, 182, 245}, 0.4, x + 0.0, y + 0.0)
        end
    end)
end

local function ToggleVehicleDeveloperMode()
    local x = 0.4
    local y = 0.888
    vehicleDevMode = not vehicleDevMode
    CreateThread(function()
        while vehicleDevMode do
            local ped = PlayerPedId()
            Wait(0)
            if IsPedInAnyVehicle(ped, false) then
                local vehicle = GetVehiclePedIsIn(ped, false)
                local netID = VehToNet(vehicle)
                local hash = GetEntityModel(vehicle)
                local modelName = GetLabelText(GetDisplayNameFromVehicleModel(hash))
                local eHealth = GetVehicleEngineHealth(vehicle)
                local bHealth = GetVehicleBodyHealth(vehicle)
                Draw2DText(Lang:t("info.vehicle_dev_data"), 4, {66, 182, 245}, 0.4, x + 0.0, y + 0.0)
                Draw2DText(string.format(Lang:t("info.ent_id") .. '~b~%s~s~ | ' .. Lang:t("info.net_id") .. '~b~%s~s~', vehicle, netID), 4, {255, 255, 255}, 0.4, x + 0.0, y + 0.025)
                Draw2DText(string.format(Lang:t("info.model") .. '~b~%s~s~ | ' .. Lang:t("info.hash") .. '~b~%s~s~', modelName, hash), 4, {255, 255, 255}, 0.4, x + 0.0, y + 0.050)
                Draw2DText(string.format(Lang:t("info.eng_health") .. '~b~%s~s~ | ' .. Lang:t("info.body_health") .. '~b~%s~s~', round(eHealth, 2), round(bHealth, 2)), 4, {255, 255, 255}, 0.4, x + 0.0, y + 0.075)
            end
        end
    end)
end

local DevMenuButton1 = DevMenu:AddButton({
    icon = '📋',
    label = Lang:t("menu.copy_vector3"),
    value = 'coords',
    description = Lang:t("desc.vector3_desc")
})
DevMenuButton1:On("select", function()
    CopyToClipboard('coords3')
end)

local DevMenuButton2 = DevMenu:AddButton({
    icon = '📋',
    label = Lang:t("menu.copy_vector4"),
    value = 'coords',
    description = Lang:t("desc.vector4_desc")
})
DevMenuButton2:On("select", function()
    CopyToClipboard('coords4')
end)

local DevMenuButton3 = DevMenu:AddCheckbox({
    icon = '📍',
    label = Lang:t("menu.display_coords"),
    value = nil,
    description = Lang:t("desc.display_coords_desc")
})
DevMenuButton3:On('change', function()
    ToggleShowCoordinates()
end)

local DevMenuButton4 = DevMenu:AddButton({
    icon = '📋',
    label = Lang:t("menu.copy_heading"),
    value = 'heading',
    description = Lang:t("desc.copy_heading_desc")
})
DevMenuButton4:On("select", function()
    CopyToClipboard('heading')
end)

local DevMenuButton5 = DevMenu:AddButton({
    icon = '🚘',
    label = Lang:t("menu.vehicle_dev_mode"),
    value = nil,
    description = Lang:t("desc.vehicle_dev_mode_desc")
})
DevMenuButton5:On('select', function()
    ToggleVehicleDeveloperMode()
end)

local DevMenuButton6 = DevMenu:AddCheckbox({
    icon = '⚫',
    label = Lang:t("menu.hud_dev_mode"),
    value = DevMenu,
    description = Lang:t("desc.hud_dev_mode_desc")
})
local dev = false
DevMenuButton6:On('change', function(item, newValue, oldValue)
    dev = not dev
    TriggerEvent('qb-admin:client:ToggleDevmode')
    if dev then
        SetPlayerInvincible(PlayerId(), true)
        while dev do
            TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + 10)
            TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + 10)    
            Wait(5000)
        end
        SetPlayerInvincible(PlayerId(), false)
    end
end)

local DevMenuButton7 = DevMenu:AddCheckbox({
    icon = '🔫',
    label = Lang:t("menu.delete_laser"),
    value = DevMenu,
    description = Lang:t("desc.delete_laser_desc")
})
local deleteLazer = false
DevMenuButton7:On('change', function(item, newValue, oldValue)
    deleteLazer = not deleteLazer
end)

local DevMenuButton8 = DevMenu:AddCheckbox({
    icon = '🎥',
    label = Lang:t("menu.noclip"),
    value = DevMenu,
    description = Lang:t("desc.noclip_desc")
})
DevMenuButton8:On('change', function(item, newValue, oldValue)
    ToggleNoClipMode()
end)

-- NetEvents
RegisterNetEvent('qb-admin:client:openMenu', function()
    MenuV:OpenMenu(MainMenu)
    TriggerServerEvent('qb-admin:server:check')
end)

RegisterNetEvent('qb-admin:client:ToggleCoords', function()
    TriggerServerEvent('qb-admin:server:check')
    ToggleShowCoordinates()
end)

RegisterNetEvent('qb-admin:client:openSoundMenu', function(data)
    soundname = data.name
end)

RegisterNetEvent('qb-admin:client:playsound', function(name, volume, radius)
    TriggerServerEvent('InteractSound_SV:PlayWithinDistance', radius, name, volume)
end)

-- Functions
local function RotationToDirection(rotation)
	local adjustedRotation =
	{
		x = (math.pi / 180) * rotation.x,
		y = (math.pi / 180) * rotation.y,
		z = (math.pi / 180) * rotation.z
	}
	local direction =
	{
		x = -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
		y = math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
		z = math.sin(adjustedRotation.x)
	}
	return direction
end

local function RayCastGamePlayCamera(distance)
    local cameraRotation = GetGameplayCamRot()
	local cameraCoord = GetGameplayCamCoord()
	local direction = RotationToDirection(cameraRotation)
	local destination =
	{
		x = cameraCoord.x + direction.x * distance,
		y = cameraCoord.y + direction.y * distance,
		z = cameraCoord.z + direction.z * distance
	}
	local a, b, c, d, e = GetShapeTestResult(StartShapeTestRay(cameraCoord.x, cameraCoord.y, cameraCoord.z, destination.x, destination.y, destination.z, -1, PlayerPedId(), 0))
	return b, c, e
end

local function DrawEntityBoundingBox(entity, color)
    local model = GetEntityModel(entity)
    local min, max = GetModelDimensions(model)
    local rightVector, forwardVector, upVector, position = GetEntityMatrix(entity)

    -- Calculate size
    local dim =
	{
		x = 0.5*(max.x - min.x),
		y = 0.5*(max.y - min.y),
		z = 0.5*(max.z - min.z)
	}

    local FUR =
    {
		x = position.x + dim.y*rightVector.x + dim.x*forwardVector.x + dim.z*upVector.x,
		y = position.y + dim.y*rightVector.y + dim.x*forwardVector.y + dim.z*upVector.y,
		z = 0
    }

    local FUR_bool, FUR_z = GetGroundZFor_3dCoord(FUR.x, FUR.y, 1000.0, 0)
    FUR.z = FUR_z
    FUR.z = FUR.z + 2 * dim.z

    local BLL =
    {
        x = position.x - dim.y*rightVector.x - dim.x*forwardVector.x - dim.z*upVector.x,
        y = position.y - dim.y*rightVector.y - dim.x*forwardVector.y - dim.z*upVector.y,
        z = 0
    }
    local BLL_bool, BLL_z = GetGroundZFor_3dCoord(FUR.x, FUR.y, 1000.0, 0)
    BLL.z = BLL_z

    -- DEBUG
    local edge1 = BLL
    local edge5 = FUR

    local edge2 =
    {
        x = edge1.x + 2 * dim.y*rightVector.x,
        y = edge1.y + 2 * dim.y*rightVector.y,
        z = edge1.z + 2 * dim.y*rightVector.z
    }

    local edge3 =
    {
        x = edge2.x + 2 * dim.z*upVector.x,
        y = edge2.y + 2 * dim.z*upVector.y,
        z = edge2.z + 2 * dim.z*upVector.z
    }

    local edge4 =
    {
        x = edge1.x + 2 * dim.z*upVector.x,
        y = edge1.y + 2 * dim.z*upVector.y,
        z = edge1.z + 2 * dim.z*upVector.z
    }

    local edge6 =
    {
        x = edge5.x - 2 * dim.y*rightVector.x,
        y = edge5.y - 2 * dim.y*rightVector.y,
        z = edge5.z - 2 * dim.y*rightVector.z
    }

    local edge7 =
    {
        x = edge6.x - 2 * dim.z*upVector.x,
        y = edge6.y - 2 * dim.z*upVector.y,
        z = edge6.z - 2 * dim.z*upVector.z
    }

    local edge8 =
    {
        x = edge5.x - 2 * dim.z*upVector.x,
        y = edge5.y - 2 * dim.z*upVector.y,
        z = edge5.z - 2 * dim.z*upVector.z
    }

    DrawLine(edge1.x, edge1.y, edge1.z, edge2.x, edge2.y, edge2.z, color.r, color.g, color.b, color.a)
    DrawLine(edge1.x, edge1.y, edge1.z, edge4.x, edge4.y, edge4.z, color.r, color.g, color.b, color.a)
    DrawLine(edge2.x, edge2.y, edge2.z, edge3.x, edge3.y, edge3.z, color.r, color.g, color.b, color.a)
    DrawLine(edge3.x, edge3.y, edge3.z, edge4.x, edge4.y, edge4.z, color.r, color.g, color.b, color.a)
    DrawLine(edge5.x, edge5.y, edge5.z, edge6.x, edge6.y, edge6.z, color.r, color.g, color.b, color.a)
    DrawLine(edge5.x, edge5.y, edge5.z, edge8.x, edge8.y, edge8.z, color.r, color.g, color.b, color.a)
    DrawLine(edge6.x, edge6.y, edge6.z, edge7.x, edge7.y, edge7.z, color.r, color.g, color.b, color.a)
    DrawLine(edge7.x, edge7.y, edge7.z, edge8.x, edge8.y, edge8.z, color.r, color.g, color.b, color.a)
    DrawLine(edge1.x, edge1.y, edge1.z, edge7.x, edge7.y, edge7.z, color.r, color.g, color.b, color.a)
    DrawLine(edge2.x, edge2.y, edge2.z, edge8.x, edge8.y, edge8.z, color.r, color.g, color.b, color.a)
    DrawLine(edge3.x, edge3.y, edge3.z, edge5.x, edge5.y, edge5.z, color.r, color.g, color.b, color.a)
    DrawLine(edge4.x, edge4.y, edge4.z, edge6.x, edge6.y, edge6.z, color.r, color.g, color.b, color.a)
end

CreateThread(function()	-- While loop needed for delete lazer
	while true do
		sleep = 1000
		if deleteLazer then
		    sleep = 5
		    local color = {r = 255, g = 50, b = 50, a = 200} -- Changes the color of the lines (currently red)
		    local position = GetEntityCoords(PlayerPedId())
		    local hit, coords, entity = RayCastGamePlayCamera(1000.0)
		    -- If entity is found then verifie entity
		    if hit and (IsEntityAVehicle(entity) or IsEntityAPed(entity) or IsEntityAnObject(entity)) then
                local entityCoord = GetEntityCoords(entity)
                DrawEntityBoundingBox(entity, color)
                DrawLine(position.x, position.y, position.z, coords.x, coords.y, coords.z, color.r, color.g, color.b, color.a)
                Draw2DText(Lang:t("info.health") .. ': ~g~'..GetEntityHealth(entity)..' ~w~' .. Lang:t("info.speed") .. ': ~b~'..GetEntitySpeed(entity)..'~w~', 4, {255, 255, 255}, 0.4, 0.55, 0.888 - 0.050)
                Draw2DText(Lang:t("info.networked") .. ': ~b~'..tostring(NetworkGetEntityIsNetworked(entity))..' ~w~' .. Lang:t("info.networked_owner_id") ..': ~b~'..GetPlayerServerId(NetworkGetEntityOwner(entity))..'~w~', 4, {255, 255, 255}, 0.4, 0.55, 0.888 - 0.025)
                Draw2DText(Lang:t("info.obj") .. ': ~b~' .. entity .. '~w~ ' .. Lang:t("info.model") .. ': ~b~' .. GetEntityModel(entity), 4, {255, 255, 255}, 0.4, 0.55, 0.888)
                Draw2DText(Lang:t("info.delete_object_info"), 4, {255, 255, 255}, 0.4, 0.55, 0.888 + 0.025)

                if IsControlJustReleased(0, 38) then -- When E pressed then remove targeted entity
                    SetEntityAsMissionEntity(entity, true, true) -- Set as missionEntity so the object can be remove (Even map objects)
                    NetworkRequestControlOfEntity(entity) -- Request Network control so we own the object
                    Wait(250) -- Safety Wait
                    DeleteEntity(entity) -- Delete the object
                    DeleteObject(entity) -- Delete the object (failsafe)
                    SetEntityAsNoLongerNeeded(entity) -- Tells the engine this prop isnt needed anymore
                end
		    -- Only draw of not center of map
		    elseif coords.x ~= 0.0 and coords.y ~= 0.0 then
			    -- Draws line to targeted position
			    DrawLine(position.x, position.y, position.z, coords.x, coords.y, coords.z, color.r, color.g, color.b, color.a)
			    DrawMarker(28, coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.1, 0.1, 0.1, color.r, color.g, color.b, color.a, false, true, 2, nil, nil, false)
            end
		end
		Wait(sleep)
	end
end)

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
    icon = '🔧',
    label = Lang:t("menu.developer_options"),
    value = DevMenu,
    description = Lang:t("desc.developer_desc")
})

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

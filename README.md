# dc-adminmenu

An improved version of qb-adminmenu. With better logic and more features.
As always more features planned. Pull requests are welcome as well.

# Admin Options
![image](https://cdn.discordapp.com/attachments/967850345306914826/969989912042565642/unknown.png)

# Player Management
1. General Options
    - Kill
    - Revive
    - Freeze
    - Spectate
    - Go to
    - Bring
    - Sit in vehicle
    - Routingbucket
2. Administration
    - Kick
    - Ban
    - Permissions
3. Extra Options
    - Open Inventory
    - Give Clothing Menu
    - Give An Item
    - Play A Sound
    - Mute Player
4. Player Information List

![image](https://cdn.discordapp.com/attachments/967850345306914826/970852311259807744/unknown.png)

# Server Management
![image](https://cdn.discordapp.com/attachments/967850345306914826/970849625621815316/unknown.png)
![image](https://cdn.discordapp.com/attachments/967850345306914826/970851323656417370/unknown.png)

# Vehicles
![image](https://cdn.discordapp.com/attachments/967850345306914826/969991973039669308/unknown.png)

# Developer Options
![image](https://cdn.discordapp.com/attachments/967850345306914826/969992103356665886/unknown.png)

# Dependencies
Makes usage of
 * [qb-menu](https://github.com/qbcore-framework/qb-menu)
 * [qb-input](https://github.com/qbcore-framework/qb-input)
 * [interact-sound](https://github.com/qbcore-framework/interact-sound)
 * [pma-voice](https://github.com/AvarianKnight/pma-voice)

## I get kicked while using the command /admin?
Make sure you added yourself as an admin or god. When using the deployable QBCore setup the only thing left for you to do is change your ace to `qbcore.god` from whatever it puts there first. This could be `group.admin` or `group.god`. (AS IT STATES IN YOUR SERVER.CFG [HERE](https://github.com/qbcore-framework/txAdminRecipe/blob/642d295fc74e39e5edeef3d5bee01555b9d8d963/server.cfg#L102)). Using the old permission system? Join your server once and the core will print your license in the server console which you need to add to your database.

# License

    QBCore Framework
    Copyright (C) 2021 Joshua Eger

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>

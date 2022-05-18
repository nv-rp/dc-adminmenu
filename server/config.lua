--- If this is somehow something else besides interact-sound. Please so change the name of the event that
--- is triggered when using the play sound option in the menu.
SoundScriptName = 'interact-sound' -- Name of the sound script that you are using
SoundPath = '/client/html/sounds' -- Where the sounds are located
Linux = false -- Wether or not if you use linux. Very important!

--- Who should be able to trigger each NetEvent on the server side?
events = {
    ['kill'] = 'god',
    ['revive'] = 'god',
    ['freeze'] = 'admin',
    ['spectate'] = 'admin',
    ['goto'] = 'admin',
    ['bring'] = 'admin',
    ['intovehicle'] = 'admin',
    ['kick'] = 'admin',
    ['ban'] = 'god',
    ['setPermissions'] = 'god',
    ['cloth'] = 'admin',
    ['spawnVehicle'] = 'admin',
    ['savecar'] = 'god',
    ['playsound'] = 'admin',
    ['usemenu'] = 'admin',
    ['routingbucket'] = 'admin',
    ['getradiolist'] = 'admin',
    ['playerinformation'] = 'god',
}

--- Permission hierarchy order from top to bottom. Important for the PermOrder function.
PermissionOrder = {
    'god',
    'admin',
}

--- Changes the behaviour of the PermOrder function. If set to true it means you still use the database permission system.
OldPermissionSystem = false

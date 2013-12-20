Map Loader for Love2D/Zoetrope
=============

A simple way to stich maps together and save state information in [Zoetrope](http://libzoetrope.org) using the [Tiled Editor](http://www.mapeditor.org/).

Usage
=============
```lua
local MapView = require 'modules.map_loader'

-- Create new app
the.app = App:new
{
    onRun = function (self)

        -- Load our map
        self.view = MapView:new
        {
            player = Hero,
            mapDir = 'assets/map/',
            mapName = 'home',
            playerX = 320,
            playerY = 320
        }
    end
}
```

In Tiled you can now use 2 new objects, Door and Spawn.

Door defines which map to load when passing through it using the property name 'to' and value 'mapname'.

Spawn defines where the player will load when entering that map. Use the property name 'from' and value 'mapname'.

Requirements
=============
* LÖVE 0.8.0
* Zoetrope 1.4
* Tiled 0.9.0

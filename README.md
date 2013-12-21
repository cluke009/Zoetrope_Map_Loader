Map Loader for Love2D/Zoetrope
=============

A simple way to stich maps together in [Zoetrope](http://libzoetrope.org) using the [Tiled Editor](http://www.mapeditor.org/).

Usage
=============
```lua
-- Require module
local MapView = require 'modules.map_loader'

-- Create new app
the.app = App:new
{
    onRun = function (self)

        -- Load our map
        self.view = MapView:new
        {
            player  = Hero, 		 -- The player object
            playerX = 320,			 -- Starting X coordinates
            playerY = 320,			 -- Starting Y coordinates
            mapDir  = 'assets/map/', -- Directory to load all maps from
            mapName = 'home',		 -- The name of the map
        }
    end
}
```

In Tiled you can now use 1 new object `Door`.

Door defines which map to load when passing through it using the property name `'to'` and value `'mapname'`. This is a 2 way process and acts as the spawn location as well.

Notes
=============
1 global is created because it is required by [Zoetrope](http://libzoetrope.org) for tiled objects.

The 'map_loader' directory can be moved to any location because of the way we require necessary files.

We are limited to 1 entry and exit between any 2 maps in Tiled.

Requirements
=============
* LÖVE 0.8.0
* Zoetrope 1.4
* Tiled 0.9.0

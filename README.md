Map Loader for Love2D/Zoetrope
=============

A simple way to stich maps together and save state information in [Zoetrope](http://libzoetrope.org) using the [Tiled Editor](http://www.mapeditor.org/).

Usage
=============
Define your starting map with the global MAP var in main.lua without the extension.

In Tiled you can now use 2 new objects, Door and Spawn.

Door defines which map to load when passing through it using the property name 'to' and value 'mapname'.

Spawn defines where the player will load when entering that map. Use the property name 'from' and value 'mapname'.

```

Example files are in the 'map' directory.

Just load the .tmx files to see how they work.

```

In Game
=============
* 'S' saves state
* 'L' loads state
* 'D' deletes state
* '(space)' opens chests

Requirements
=============
* LÖVE 0.8.0
* Zoetrope 1.4
* Tiled 0.9.0

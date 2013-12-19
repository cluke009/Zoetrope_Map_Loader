local MapSetter = require(... .. '.objects') 

--[[----------------------------------------------------------------------------
--------------------------------------------------------------------------------

    MapView - Our map loader. Reads from 'MAP' global. Assumes map directory.

--------------------------------------------------------------------------------
]]------------------------------------------------------------------------------
local MapLoader = View:extend
{
    onNew = function (self)
        self:loadLayers(self.path)

        -- Coordinates upon entering new room.
        self.player.x = 480 or self.heroStartX
        self.player.y = 480 or self.heroStartY

        self:add(self.player)

        self.focus = self.player
        self:clampTo(self.map)

    end,

    onUpdate = function (self)
        self.map:displace(self.player)
        self.objects:collide(self.player)
    end
}

MapSetter(MapLoader)

return MapLoader
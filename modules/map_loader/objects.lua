local MapView 

local MapSetter = function(map)
    MapView = map
end

--[[----------------------------------------------------------------------------
--------------------------------------------------------------------------------

    DOOR - Where you leave a room.

--------------------------------------------------------------------------------
]]------------------------------------------------------------------------------
Door = Tile:extend
{
    onCollide = function (self, other)
        -- if other:instanceOf(MapView.player) then
        --     MapView.prevmap = MapView.map
        --     MapView.map = self.to
            
        --     the.app.view = MapView:new()
        -- end
    end
}

--[[----------------------------------------------------------------------------
--------------------------------------------------------------------------------

    SPAWN - Where you enter a room

--------------------------------------------------------------------------------
]]------------------------------------------------------------------------------
Spawn = Tile:extend
{
    onNew = function ( self )
        -- if MapView.prevmap and self.from == MapView.prevmap then
        --     heroStartX = self.x
        --     heroStartY = self.y
        -- end
    end
}

return MapSetter
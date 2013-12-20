-- 
-- Get our MapLoader into scope.
-- 
local MapLoader 
local MapSetter = function(map)
    MapLoader = map
end

--[[----------------------------------------------------------------------------
--------------------------------------------------------------------------------

    DOOR - Where you leave a room.

--------------------------------------------------------------------------------
]]------------------------------------------------------------------------------
Door = Tile:extend
{
    onCollide = function (self, other)
        -- Are we coding defensively or is this check truely unecessary?
        if other:instanceOf(the.app.view.player) then

            -- We need to set mapPrev before we change maps 
            -- so X and Y coordinates are accesssible on map creation
            the.app.view._mapPrev = the.app.view.mapName
            the.app.view = MapLoader:new
            {
                player = the.app.view.player,
                mapName = self.to,
                mapDir = the.app.view.mapDir,  
            }
        end
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
        if the.app.view._mapPrev and self.from == the.app.view._mapPrev then
            the.app.view.playerX = self.x
            the.app.view.playerY = self.y
        end
    end
}

return MapSetter
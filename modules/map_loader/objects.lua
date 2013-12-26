--
-- Get our MapLoader into scope.
--
local MapLoader
local MapSetter = function(map)
    MapLoader = map
end

--
-- Class: Door
-- Where you enter and exit a map.
--
-- Extends:
--      <Tile>
--
Door = Tile:extend
{
    -- _collide = true,
    onNew = function(self)

    end,
    onCollide = function(self, other, xOverlap, yOverlap)
        if self._collide and other:instanceOf(the.app.view.player) then
            -- We need to set mapPrev before we change maps
            -- so X and Y coordinates are accesssible on map creation

            local _map = split(self.to, ',')

            -- Set player x, y.
            the.app.view.playerX = _map[2] * 32
            the.app.view.playerY = _map[3] * 32

            if _map[1] ~= 'nil' then
                the.app.view = MapLoader:new
                {
                    player = the.app.view.player,
                    mapName = _map[1], 
                    mapDir = the.app.view.mapDir,
                }    
            else 
                the.app.view._player.x = _map[2] * 32
                the.app.view._player.y = _map[3] * 32     
            end   
        end
    end,
    onUpdate = function(self, elapsed)
        -- Enable collision check after we move off Door.
        local _p = the.app.view._player
        if not self:intersects(_p.x, _p.y, _p.width, _p.height) then
            self._collide = true
        end
    end,
}

return MapSetter

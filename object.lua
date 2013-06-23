--[[----------------------------------------------------------------------------
--------------------------------------------------------------------------------

    DOOR - Where you leave a room.

--------------------------------------------------------------------------------
]]------------------------------------------------------------------------------
Door = Tile:extend
{
    onCollide = function (self, other)
        if other:instanceOf(Hero) then
            self:die()
            PREVMAP = MAP
            MAP = self.to

            the.app.view = MapView:new()
            the.app.view:flash({0, 0, 0}, .75)
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
        if PREVMAP and self.from == PREVMAP then
            heroStartX = self.x
            heroStartY = self.y
        end
    end
}

--[[----------------------------------------------------------------------------
--------------------------------------------------------------------------------

    HERO - Player sprite

--------------------------------------------------------------------------------
]]------------------------------------------------------------------------------
Hero = Animation:extend
{
    width = 32,
    height = 32,
    image = 'img/hero.png',

    onUpdate = function (self)
        self.velocity.x = 0
        self.velocity.y = 0

        if the.keys:pressed('up') then
            self.velocity.y = -300
        elseif the.keys:pressed('down') then
            self.velocity.y = 300
        end
        if the.keys:pressed('left') then
            self.velocity.x = -300
        elseif the.keys:pressed('right') then
            self.velocity.x = 300
        end
    end

}

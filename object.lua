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

            -- Update state
            STATE.map = MAP

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

--[[----------------------------------------------------------------------------
--------------------------------------------------------------------------------

    CHEST

--------------------------------------------------------------------------------
]]------------------------------------------------------------------------------
Chest = Tile:extend
{
    onNew = function ( self )

        -- Add params
        self.uid   = tostring(self.x .. self.y)
        self.id    = tonumber(self.id)
        self.state = STATE

        -- Set state of chest
        if self.state[MAP] == nil then
            self.state[MAP] = {}
            self.state[MAP]['chest'] = {}
        end
        if self.state[MAP]['chest'][self.uid] == nil then
            self.open = 0
            self.image = 'img/chest.gif'
        else
            self.open = 1
            self.image = 'img/chestopen.gif'
        end

    end,
    onCollide = function (self, other)
        if other:instanceOf(Hero) then

            self.other = other
            self:displace(other)
        end
    end,
    onUpdate = function (self)
        if self.other then

            local otherX = self.other.x + (self.other.width/2)
            local otherY = self.other.y + (self.other.height/2)

            local selfX = self.x + (self.width/2)
            local selfY = self.y + (self.height/2)

            local offsetX = (self.width/2) + (self.other.width/2)
            local offsetY = (self.height/2) + (self.other.height/2)

            -- Calculate hero proximity to chest
            if math.abs(otherX - selfX) <= offsetX and math.abs(otherY - selfY) <= offsetY then
                if the.keys:justPressed(' ') and self.open == 0 then
                    self.image = 'img/chestopen.gif'
                    self.open = 1

                    self.state[MAP]['chest'][self.uid] = 1
                end
            end
        end
    end
}

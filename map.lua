--[[----------------------------------------------------------------------------
--------------------------------------------------------------------------------

    MapView - Our map loader. Reads from 'MAP' global. Assumes map directory.

--------------------------------------------------------------------------------
]]------------------------------------------------------------------------------
MapView = View:extend
{
    onNew = function (self)

        self.hero = Hero:new()

        self:loadLayers('map/' .. MAP .. '.lua')

        if PREVMAP then
            -- Coordinates upon entering new room.
            self.hero.x = heroStartX
            self.hero.y = heroStartY
        else
            -- The starting coordinates of our player.
            self.hero.x = 480
            self.hero.y = 480
        end

        self:add(self.hero)

        self.focus = self.hero
        self:clampTo(self.map)

        -- Send map name to hud.
        Hud.text.text = 'map/' .. MAP .. '.lua'
        self:add(Hud)

    end,

    onUpdate = function (self)
        self.map:displace(self.hero)
        self.objects:collide(self.hero)
    end
}

--[[----------------------------------------------------------------------------
--------------------------------------------------------------------------------

    HUD - Displays currently loaded map.

--------------------------------------------------------------------------------
]]------------------------------------------------------------------------------
Hud = Group:new
{
    onNew = function (self)
        self.translateScale.x = 0
        self.translateScale.y = 0
        self:add(Fill:new{
            x = 10,
            y = 10,
            width = 200,
            height = 50,
            fill = {255, 255, 255, 100},
            border = {0, 0, 0, 255}
        })
        self.text = Text:new {
             x = 20, y = 20, tint={255,0,0},
             font = { 24 }
        }
        self:add(self.text)
    end
}

--[[----------------------------------------------------------------------------
--------------------------------------------------------------------------------

    HERO - Player sprite

--------------------------------------------------------------------------------
]]------------------------------------------------------------------------------
Hero = Animation:extend
{
    width = 32,
    height = 32,
    image = 'assets/img/hero.png',

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


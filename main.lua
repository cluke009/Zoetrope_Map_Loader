--[[----------------------------------------------------------------------------
--------------------------------------------------------------------------------

    Map loader demo. Globals used (MAP, PREVMAP, heroStartX, heroStartY)

--------------------------------------------------------------------------------
]]------------------------------------------------------------------------------
STRICT = true
DEBUG = true

MAP = 'home'

require 'zoetrope'
require 'map'
require 'object'

the.app = App:new
{
    onRun = function (self)
        -- Set view to our map loader.
        self.view = MapView:new()
    end
}

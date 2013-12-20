-- Set debug options
STRICT = true
DEBUG  = true
io.stdout:setvbuf("no")

-- Require necessary files
require 'zoetrope'
require 'objects'
local MapView = require 'modules.map_loader'

-- Create new app
the.app = App:new
{
    onRun = function (self)

        -- Load our map
        self.view = MapView:new
        {
            player = Hero,
            mapDir = 'assets/map/',
            mapName = 'home',
            playerX = 480,
            playerY = 480
        }
    end
}

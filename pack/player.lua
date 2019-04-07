--[[
    All about the player class.
    
    The player should only we aware (its game state keeping in memory) the 9 nearby tiles.

    TODO:
    first a(the) player pop on a tile in map.
    He can move on this tile and the camera moves with him, showing seamlessly the other tiles nearby.
]]


local Class = require "ext_pack/hump/class" -- siplified classes syntactic sugar

local player = Class{
    init = function(self, position, nearby_tiles)
        self.position = position -- {x, y}
        self.nearby_tiles = nearby_tiles
    end,

    picture = "rocket.png"
}

function player:displayPosition()
    print(self.position.x .. ", " .. self.position.y)
end


return player

--[[
    All about the tile class.
    Each tile can be different from another (having planets or not).

    A tile has:
    * Attributes:
        - [ {planet1}, {planet2} ]
]]

local Class = require "ext_pack/hump/class" -- siplified classes syntactic sugar

local tile = Class{
    -- constructor function, called when creating a tile, calling tile()
    init = function(self, x_map, y_map)
        self.x_map = x_map
        self.y_map = y_map
    end,
    number_planets = 2 -- static class attribute
}

-- methods
function tile:displaySize() -- : indicate we already pass self to the function
    print("x, y = " .. self.x_map .. "," .. self.y_map)
    print(tile.number_planets)
end

return tile

--[[
    How to use this class in code example:
    local tile = require "pack/tile"
    t0 = tile(x,y)
    t0:displaySize() --> access method with :
]]
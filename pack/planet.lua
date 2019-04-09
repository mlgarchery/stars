--[[
    All about the planet class.
]]
local Class = require "ext_pack/hump/class" -- siplified classes syntactic sugar

local planet = Class{
    init = function(self, position, radius)
        self.x, self.y = position[1], position[2]
        self.radius = radius
    end,

}

function planet:draw()
    love.graphics.circle("fill", self.x, self.y, self.radius)
end


return planet
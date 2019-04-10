--[[
    All about the planet class.
]]
local Class = require "ext_pack/hump/class" -- siplified classes syntactic sugar

local planet = Class{
    init = function(self, position, radius, segments)
        self.x, self.y = position[1], position[2]
        self.radius = radius
        self.segments = segments
    end,

}

function planet:draw()
    love.graphics.circle("line", self.x, self.y, self.radius)
    -- and the segments (the polygon on which we can add buildings)
    love.graphics.circle("line", self.x, self.y, self.radius, self.segments)
end


return planet
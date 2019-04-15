--[[
    All about the planet class.
]]
local Class = require "ext_pack/hump/class" -- siplified classes syntactic sugar
local Moonshine = require "ext_pack/moonshine"

local planet = Class{
    init = function(self, position, radius, segments)
        self.x, self.y = unpack(position)
        self.radius = radius
        self.segments = segments --number of points

        --
        -- self.metal = quantity
        -- self.slots = segments - 1 or

        -- create somethiong similar to an atmosphere
        self.godsray_effect = Moonshine(Moonshine.effects.godsray)
        -- self.godsray_effect.samples = 20   --> doesn't work, issue with the package

        self.slots = {} -- containing the buildings
    end,

}

function planet:draw_buildings()
    -- draw each building at the right slots
end

function planet:draw()
    -- apparently the godsray effect is dramatically impacting the performance
    -- self.godsray_effect(function()
        love.graphics.circle("line", self.x, self.y, self.radius)
    -- end)
    -- and the segments (the polygon on which we can add buildings)
    love.graphics.circle("line", self.x, self.y, self.radius, self.segments)
end

return planet
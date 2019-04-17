--[[
    All about the planet class.
]]
local Class = require "ext_pack/hump/class" -- siplified classes syntactic sugar
local Moonshine = require "ext_pack/moonshine"
local Vector = require "ext_pack/hump/vector"

local planet = Class{
    init = function(self, position, radius, segments)
        self.x, self.y = unpack(position)
        self.radius = radius
        self.segments = segments --number of points
        
        self.angle_shift = 2 * math.pi / segments
        
        --
        -- self.metal = quantity
        -- self.slots = segments - 1 or
        
        -- create somethiong similar to an atmosphere
        self.godsray_effect = Moonshine(Moonshine.effects.godsray)
        -- self.godsray_effect.samples = 20   --> doesn't work, issue with the package
        
        self.slots = {} -- containing the buildings

        -- resources
        self.launcher_picture = love.graphics.newImage("picture/building_launcher.png")
    end,

}

-- SETTERS
function planet:set_slot(slot_number, slot)
    -- slot is a dict with the name of the slot and the image
    self.slots[slot_number] = slot
    
end


-- DRAW
function planet:draw_buildings()
    for slot_num, slot in pairs(self.slots) do
        x1, y1, x2, y2 = unpack(slot[3])
        first_vector = Vector(x1, y1)
        second_vector = Vector(x2, y2)

        mid_slot_x, mid_slot_y = (first_vector + (second_vector-first_vector)/2):unpack()
        love.graphics.draw(
            slot[2], 
            mid_slot_x,
            mid_slot_y,
            math.pi/2 + (slot_num * self.angle_shift /2),
            0.7,
            0.7,
            self.launcher_picture:getWidth()/2,
            self.launcher_picture:getHeight()
        )
    end
    -- draw each building at the right slots
end

function planet:draw()
    -- apparently the godsray effect is dramatically impacting the performance
    self.godsray_effect(function()
        love.graphics.circle("line", self.x, self.y, self.radius)
    end)
    -- and the segments (the polygon on which we can add buildings)
    love.graphics.circle("line", self.x, self.y, self.radius, self.segments)

    -- we draw the buildings on the slots
    self:draw_buildings()
end

return planet
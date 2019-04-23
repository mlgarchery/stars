--[[
    All about the planet class.
]]
local Class = require "ext_pack/hump/class" -- siplified classes syntactic sugar
local Moonshine = require "ext_pack/moonshine"
local Vector = require "ext_pack/hump/vector"

local planet = Class{
    init = function(self, position, radius, nb_slots)
        self.x, self.y = unpack(position)
        self.radius = radius
        self.nb_slots = nb_slots --number of edges/slots
        
        self.angle_shift = 2 * math.pi / nb_slots
        
        --
        -- self.metal = quantity
        -- self.slots = nb_slots - 1 or
        
        -- create somethiong similar to an atmosphere
        self.godsray_effect = Moonshine(Moonshine.effects.godsray)
        -- self.godsray_effect.samples = 20   --> doesn't work, issue with the package
        
        self.slots = {} -- containing the buildings

        -- resources
        self.launcher_picture = love.graphics.newImage("picture/building_launcher_2.png")
        self.building_scale = 2 * radius * math.sin(self.angle_shift/2) / self.launcher_picture:getWidth()
    end,

}

-- SETTERS
function planet:build_on_slot(slot_number, slot)
    -- slot is a dict with the slot_num, and a building dict (later a building object)
    self.slots[slot_number] = slot
    
end


-- DRAW
function planet:draw_buildings()
    -- draw each building at the right slots
    for slot_num, slot in pairs(self.slots) do
        
        x1, y1, x2, y2 = unpack(slot[3])
        first_vector = Vector(x1, y1)
        second_vector = Vector(x2, y2)

        mid_slot_vect = first_vector + (second_vector-first_vector)/2
        -- vector pointing to the middle of the slot line

        -- love.graphics.line(self.x, self.y, mid_slot_vect:unpack())
        love.graphics.draw(
            slot[2], 
            mid_slot_vect.x,
            mid_slot_vect.y,
            -- math.rad(90) +(mid_slot_vect - Vector(self.x, self.y)):angleTo(Vector(1,0)),
            math.rad(90) + slot_num * self.angle_shift + self.angle_shift/2,
            self.building_scale,
            self.building_scale,
            self.launcher_picture:getWidth()/2,
            self.launcher_picture:getHeight()
        )
    end
end

function planet:draw()
    -- apparently the godsray effect is dramatically impacting the performance
    self.godsray_effect(function()
        love.graphics.circle("line", self.x, self.y, self.radius)
    end)
    -- and the nb_slots (the polygon on which we can add buildings)
    love.graphics.circle("line", self.x, self.y, self.radius, self.nb_slots)

    -- we draw the buildings on the slots
    self:draw_buildings()
end

return planet

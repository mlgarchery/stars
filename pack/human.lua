--[[
    All about the human class.
]]

local Class = require "ext_pack/hump/class" -- siplified classes syntactic sugar

local human = Class({
    init = function(self, planet) -- a human is always bound to a planet
        self.planet = planet
        self.picture = love.graphics.newImage("picture/human.png")
        -- self.picture:getHeight()
        self.x = planet.x - self.picture:getWidth()/2
        self.y = planet.y - planet.radius - self.picture:getHeight()
    end,
    speed = 10
})


function human:draw()
    love.graphics.draw(self.picture, self.x, self.y)
end


-- update state
function human:rotate(angle)
    self:updatePosition({
        math.cos(angle)*math.sqrt( 
            math.pow(self.x-self.planet.x,2) + math.pow(self.y-self.planet.y, 2)
        ),
        math.sin(angle)*math.sqrt( 
            math.pow(self.x-self.planet.x,2) + math.pow(self.y-self.planet.y, 2)
        )
    })
end

function human:updatePosition(new_pos)
    self.x, self.y = new_pos[1], new_pos[2]
end

function human:update()
    -- TODO: take the player input from the player class [example player:keyboardInput method]
    -- for now :
    if love.keyboard.isScancodeDown("a") then
        self:rotate(0.001)
    elseif love.keyboard.isScancodeDown("d") then
        self:rotate(-0.001)
    end
end

return human
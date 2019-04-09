

local Class = require "ext_pack/hump/class" -- siplified classes syntactic sugar

local rocket = Class{
    -- Constructor
    init = function(self, pos, nearby_tiles)
        self.pos = pos -- position {x, y}
        self.nearby_tiles = nearby_tiles
    end,
    -- Static class attributes
    picture_name = "rocket.png",
    speed = 10
}

--Methods
function rocket:load()
    self.picture = love.graphics.newImage("picture/" .. rocket.picture_name)
end

-- draw
function rocket:displayPosition()
    print(self.pos.x .. ", " .. self.pos.y)
end

function rocket:draw()
    love.graphics.draw(self.picture, self.pos.x, self.pos.y)
end
-- update state
function rocket:updatePosition(new_pos)
    self.pos = new_pos
end

function rocket:update()
    if love.keyboard.isScancodeDown("w") then
        self:updatePosition(
            {x=self.pos.x, y=self.pos.y - rocket.speed}
        )
    elseif love.keyboard.isScancodeDown("s") then
        self:updatePosition(
            {x=self.pos.x, y=self.pos.y + rocket.speed}
        )
    elseif love.keyboard.isScancodeDown("a") then
        self:updatePosition(
            {x=self.pos.x - rocket.speed, y=self.pos.y}
        )
    elseif love.keyboard.isScancodeDown("d") then
        self:updatePosition(
            {x=self.pos.x + rocket.speed, y=self.pos.y}
        )
    end
end

return rocket

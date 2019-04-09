--[[
    All about the player class.
    
    The player should only be aware (its game state stays in memory) of the 9 nearby tiles.

    TODO:
    first a(the) player pop on a tile in map.
    He can move on this tile and the camera moves with him, showing seamlessly the other tiles nearby.
]]


local Class = require "ext_pack/hump/class" -- siplified classes syntactic sugar

local player = Class{
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
function player:load()
    self.picture = love.graphics.newImage("picture/" .. player.picture_name)
end

-- draw
function player:displayPosition()
    print(self.pos.x .. ", " .. self.pos.y)
end

function player:draw()
    love.graphics.draw(self.picture, self.pos.x, self.pos.y)
end
-- update state
function player:updatePosition(new_pos)
    self.pos = new_pos
end

function player:update()
    if love.keyboard.isScancodeDown("w") then
        self:updatePosition(
            {x=self.pos.x, y=self.pos.y - player.speed}
        )
    elseif love.keyboard.isScancodeDown("s") then
        self:updatePosition(
            {x=self.pos.x, y=self.pos.y + player.speed}
        )
    elseif love.keyboard.isScancodeDown("a") then
        self:updatePosition(
            {x=self.pos.x - player.speed, y=self.pos.y}
        )
    elseif love.keyboard.isScancodeDown("d") then
        self:updatePosition(
            {x=self.pos.x + player.speed, y=self.pos.y}
        )
    end
end

return player

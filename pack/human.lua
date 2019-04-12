--[[
    All about the human class (controlled by a player)
]]

local Class = require "ext_pack/hump/class" -- siplified classes syntactic sugar

local human = Class({
    init = function(self, planet) -- a human is always bound to a planet
        self.planet = planet

        human = love.graphics.newImage("picture/human.png")
        human2 = love.graphics.newImage("picture/human2.png")
        self.animation = {human, human2}
        self.picture = human
        self.timer = 0.1

        self.angle = 0
         -- degres (self made angle). In fact this angle corresponds to +270 degres.
        --[[ In love2D:
        + angle is clockwise (not trigonometry standart)
        and origin is standart
            |
        
        --       -- <- this is 0 deg
            |

        and the
        ]]
        self.angle_shift = 2* math.pi/planet.segments
        
        
    end,
    speed = 10
})

function human:compute_i()
    i = math.floor(
        (math.rad(self.angle) - (3/2)*math.pi) / self.angle_shift
    )
    print(i)
    return i
end

function human:draw_slot()
    i = self:compute_i()
    distance = 5
    -- the distance to add to the line so that it touchs the circle in one point
    x1 = self.planet.x + (self.planet.radius+distance)*math.cos((i-1)*self.angle_shift)
    y1 = self.planet.y + (self.planet.radius+distance)*math.sin((i-1)*self.angle_shift)
    x2 = self.planet.x + (self.planet.radius+distance)*math.cos((i)*self.angle_shift)
    y2 = self.planet.y + (self.planet.radius+distance)*math.sin((i)*self.angle_shift)
    love.graphics.line(x1,y1,x2,y2)
end


function human:draw()
    love.graphics.draw(
        self.picture,
        -- positions the origin of the picture at the center of the planet
        self.planet.x,
        self.planet.y,
        -- rotation angle of the picture around its origin. By default the origin of the picture is the top-left corner (0,0) but it can be changed, see below.
        math.rad(self.angle),
        -- scale_x and scale_y of the image
        1,
        1,
        --[[ Change the origin of the picture.
            this is the new position of the origin in the local coordinates of center
            the top-left corner of the picture.
            If we consider the hypothesis of x_size_picture, y_size_picture as the values of the two variables below, then the picture will be drawn at self.planet.x and self.planet.y but with the origin being in the bottom-right corner.
        ]]
        self.picture:getWidth()/2,
        self.planet.radius + self.picture:getHeight()*0.4
    )
    self:draw_slot()
end

function human:animate(dt)
    if self.timer <0 then
        -- change picture and reset timer
        if self.picture == self.animation[1] then
            self.picture = self.animation[2]
        else
            self.picture = self.animation[1]
        end
        self.timer = 0.1
    else
        self.timer = self.timer - dt
    end
    -- print(self.timer)
end




-- update state
function human:rotate(angle)
    self.angle = (self.angle + angle) % 360
    print(self.angle)
end


function human:update(dt)
    -- TODO: take the player input from the player class [example player:keyboardInput method]
    -- for now :
    if love.keyboard.isScancodeDown("a") then
        self:rotate(-3) --> -3 deg
        self:animate(dt)
    elseif love.keyboard.isScancodeDown("d") then
        self:rotate(3)
        self:animate(dt)
    end
end

return human
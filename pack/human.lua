--[[
    All about the human class (controlled by a player)
]]

local Class = require "ext_pack/hump/class" -- siplified classes syntactic sugar

local human = Class({
    init = function(self, planet) -- a human is always bound to a planet
        self.planet = planet

        self.slot_changed_sound = love.audio.newSource("sound/slot_focus.wav", "static")
        human = love.graphics.newImage("picture/human.png")
        human2 = love.graphics.newImage("picture/human2.png")
        self.animation = {human, human2}
        self.picture = human
        self.timer = 0.1

        self.draw_angle = 0 -- for drawing purpose
        self.angle = (self.draw_angle + 270) % 360
         -- real position of the human
         -- degres (self made draw_angle). In fact this draw_angle corresponds to +270 degres.
        --[[ In love2D:
        + draw_angle is clockwise (not trigonometry standart)
        and origin is standart
            |
        
        --       -- <- this is 0 deg
            |

        and the
        ]]
        self.angle_shift = 2 * math.pi / planet.segments
        self.slot_num = self:get_current_slot()
        
    end,
    speed = 1
})

-- setters of attributes
function human:set_angle(new_angle)
    self.angle = (new_angle) % 360
    self.draw_angle = (self.angle - 270) % 360
end

function human:set_timer(new_timer)
    self.timer = new_timer
end

function human:set_picture(new_picture)
    self.picture = new_picture
end

function human:set_slot_num(new_slot_num)
    self.slot_num = new_slot_num
    -- then need to do something
    love.audio.play(self.slot_changed_sound)

end


-- non defined category (yet)
function human:get_current_slot()
    -- current_slot
    slot_num = math.floor(
        math.rad(self.angle) / self.angle_shift
        --
    )
    if slot_num ~= self.slot_num then
        love.audio.stop()
        self:set_slot_num(slot_num)
    end
    return slot_num
end

function human:get_slot_line(slot_num)
    x1 = self.planet.x + self.planet.radius*math.cos((slot_num)*self.angle_shift)
    y1 = self.planet.y + self.planet.radius*math.sin((slot_num)*self.angle_shift)
    x2 = self.planet.x + self.planet.radius*math.cos((slot_num+1)*self.angle_shift)
    y2 = self.planet.y + self.planet.radius*math.sin((slot_num+1)*self.angle_shift)
    return {x1, y1, x2, y2}
end

-- DRAW FUNCTIONS
--
function human:draw_slot_focus()
    slot_num = self:get_current_slot() + 1 -- the focused slot is next to the human, for more visibility
    -- the distance to add to the line so that it touchs the circle in one point
    x1, y1, x2, y2 = unpack(self:get_slot_line(slot_num))
    love.graphics.setColor(250, 0, 0) -- set color to red
    love.graphics.line(x1,y1,x2,y2)
    love.graphics.setColor(255, 255, 255)
    -- reset color to white
end


function human:draw()
    love.graphics.draw(
        self.picture,
        -- positions the origin of the picture at the center of the planet
        self.planet.x,
        self.planet.y,
        -- rotation draw_angle of the picture around its origin. By default the origin of the picture is the top-left corner (0,0) but it can be changed, see below.
        math.rad(self.draw_angle),
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
    self:draw_slot_focus()
end

-- UPDATE STATE FUNCTIONS
--
function human:animate(dt)
    if self.timer <0 then
        -- change picture and reset timer
        if self.picture == self.animation[1] then
            self:set_picture(self.animation[2])
        else
            self:set_picture(self.animation[1])
        end
        self:set_timer(0.1)
    else
        self:set_timer(self.timer - dt)
    end
    -- print(self.timer)
end

function human:rotate(dtheta)
    self:set_angle(self.angle + dtheta)
end


function human:update(dt)
    -- TODO: take the player input from the player class [example player:keyboardInput method]
    -- for now :
    if love.keyboard.isScancodeDown("a") then
        self:rotate(-human.speed) --> -3 deg
        self:animate(dt)
    elseif love.keyboard.isScancodeDown("d") then
        self:rotate(human.speed)
        self:animate(dt)
    end
end


--
return human
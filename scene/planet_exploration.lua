local human = require "pack/human"
local planet = require "pack/planet"


function love.load()
    -- local success = love.window.setFullscreen( true )
    love.window.setTitle("Stars: Gigantic")
    
    -- set font
    local font = love.graphics.newFont("font/Digital_tech.otf")
    love.graphics.setFont(font)

    
    local width = love.graphics.getWidth() or 0
    local height = love.graphics.getHeight() or 0
    
    
    pl = planet({width/2, height/2}, 200, 7)
    hu = human(pl)
    -- hu.picture:getHeight()
end

function love.draw()
    pl:draw()
    hu:draw()

end

function love.update(dt)
    hu:update(dt)
    
end

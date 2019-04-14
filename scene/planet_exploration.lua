function love.load()
    local success = love.window.setFullscreen( true )
    love.window.setTitle("Stars: Gigantic")

    -- set font
    local font = love.graphics.newFont("font/Digital_tech.otf")
    love.graphics.setFont(font)

    
    width = love.graphics.getWidth() or 0
    height = love.graphics.getHeight() or 0
    
    
    local planet = require"../pack/planet"
    pl = planet({width/2, height/2}, 200, 7)
    local human = require"../pack/human"
    hu = human(pl)
    -- hu.picture:getHeight()
end

function love.draw()
    pl:draw()
    hu:draw()

    love.graphics.print("Slsldk", pl.x, pl.y)
end

function love.update(dt)
    hu:update(dt)
end

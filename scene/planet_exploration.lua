function love.load()
    -- success = love.window.setFullscreen( true )
    love.window.setTitle("Stars: Gigantic")

    width = love.graphics.getWidth() or 0
    height = love.graphics.getHeight() or 0

    local planet = require"../pack/planet"
    pl = planet({width/2, height/2}, 100)
    local human = require"../pack/human"
    hu = human(pl)
    -- hu.picture:getHeight()
end

function love.draw()
    pl:draw()
    hu:draw()
end

function love.update()
    hu:update()
end

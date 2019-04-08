
function love.load()
    success = love.window.setFullscreen( true )
    local width = love.graphics.getWidth() or 0
    local height = love.graphics.getHeight() or 0
    -- print("Full Screen success: " .. tostring(success))
    love.window.setTitle("Stars: Gigantic")
    

    planet = love.graphics.newImage("picture/planet.png")


    -- testing the classes before going handy
    
    -- local tile = require "pack/tile"
    -- t = tile(1,2)
    -- t:displaySize()

    local player = require"pack/player"
    p = player({x=width/2, y=height/2})
    p:load()
    
end


function love.draw()
    love.graphics.draw(planet, 400, 350)
    p:draw()
end


function love.update()
    p:update()
end

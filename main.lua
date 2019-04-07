
function love.load()
    success = love.window.setFullscreen( true )
    print("Full Screen success: " .. tostring(success))
    love.window.setTitle("Stars: Gigantic")
    
    planet = love.graphics.newImage("picture/planet.png")


    -- testing the classes before going handy
    
    
    local tile = require "pack/tile"
    t = tile(1,2)
    t:displaySize()

    local player = require"pack/player"
    
end


function love.draw()
    love.graphics.draw(planet, 400, 350)
end


function love.update()
end

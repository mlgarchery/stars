
function love.load()
    success = love.window.setFullscreen( true )
    print("Full Screen success: " .. tostring(success))
    love.window.setTitle("Duplicata!")
    
    
    Camera = require "ext_pack/hump/camera"
    camera = Camera(100, 400)
    planet = love.graphics.newImage("picture/planet.png")


    -- testing the classes before going handy
    
    
    local tile = require "pack/tile"
    t = tile(1,2)
    t:displaySize()

    local player = require"pack/player"
    
end


function love.draw()
    camera:attach()
    love.graphics.draw(planet, 400, 350)
    camera:detach()
end


function love.update()
    if camera.scale > 2 then
        print(camera.scale)
    end
    camera:zoom(1.001)
end

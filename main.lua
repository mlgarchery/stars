
-- depending on the player command, we move from one mode to the other

mode = "planet"

if mode == "spatial" then
    dofile("scene/spatial_exploration.lua")
else 
    dofile("scene/planet_exploration.lua")
end


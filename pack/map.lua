--[[
    All about the map class.

    This all the universe of the game.
    It is infinitely vast (its depends of how far has been the player). Before leaving the game, this state should be saved in a file for further developpement of the game. It can be seen as a grid of tile (see tile.lua) of size the screen of 
    the player.

    The state of the map is in constant exchange with the player state. Depending of where the player is going, the map extends with new tiles randomly generated.

]]
--[[
    Build Menu class
]]
local Class = require "ext_pack/hump/class"
local Suit = require "ext_pack/suit"

local build_menu = Class({
    init = function(self, planet, human)
        self.planet = planet
        self.choices_table = self:get_build_choices() or {{text="Build something"} }
        self.selected_choice = self.choices_table[1]

        self.ui = Suit.new() -- new ui state
        self.signal_close = false
    end,
    size = {100, 20}
})

function build_menu:draw()
    self.ui:draw()
end

--[[
    return what can be built on the current human slot
]]
function build_menu:get_build_choices()
    return nil
end

function build_menu:update()
    self.ui.layout:reset(self.planet.x, self.planet.y)
    if self.ui:Button("X", self.ui.layout:row(unpack(build_menu.size))).hit then
        self.signal_close = true
    end

    for i=1,#self.choices_table do
        self.ui:Button(self.choices_table[i].text, self.ui.layout:row(unpack(build_menu.size)))
    end
end

return build_menu
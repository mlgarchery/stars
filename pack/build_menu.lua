--[[
    Build Menu class
]]
local Class = require "ext_pack/hump/class"
local Suit = require "ext_pack/suit"

local build_menu = Class({
    init = function(self, planet, human)
        self.planet = planet
        self.human = human
        self.choices_table = self:get_build_choices() or {{text="Build launcher"} }
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

    if self.ui:Button(self.choices_table[1].text, self.ui.layout:row(unpack(build_menu.size))).hit then
        -- if Build launcher is pressed, we set the planet slot to "launcher"
        -- the planet has to render its slots (and the building on it correctly)
        local slot_num = (self.human.slot_num + 1) % self.planet.nb_slots
        self.planet:build_on_slot(
            slot_num, -- slot_num of the building
            {
                "Launcher", -- name
                self.planet.launcher_picture, -- picture
                self.human:get_slot_line(slot_num)
            }
        )
    end
end

return build_menu
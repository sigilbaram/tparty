local party = require('party')
local settings = require('settings')
local string = require('string')
local ui = require('ui')
local windower = require('windower')

local defaults = {
    party_y_offset = 14,
    x_offset = 120,
    text_color = ui.color.rgb(255,255,255,185),
    tp_full_color = ui.color.rgb(0,255,0,185),
    stroke_color = ui.color.rgb(0,0,0,185),
    member_y_spacing = 20
}

local config = settings.load(defaults)

ui.display(function()
    local x_pos = windower.settings.ui_size.width - config.x_offset
    for i=1,party[1].alliance_info.party_1_count do
        local y_pos = windower.settings.ui_size.height -
            config.party_y_offset -
            config.member_y_spacing * (1 - i + party[1].alliance_info.party_1_count)

        local color = config.text_color
        if party[i].tp>=1000 then
            color = config.tp_full_color
        end

        ui.location(x_pos,y_pos)
        ui.text(string.format(
            '[%s]{8pt Arial bold italic stroke:"1px %s" color:%s}',            tostring(party[i].tp),
            ui.color.tohex(config.stroke_color),
            ui.color.tohex(color)
        ))
    end
end)

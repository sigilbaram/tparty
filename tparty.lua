local party = require('party')
local settings = require('settings')
local string = require('string')
local ui = require('ui')
local windower = require('windower')

local defaults = {
    party = {
        x_right = 16,
        y_bottom = 16,
        top_padding = 6,
        total_y_padding = 14,
        width = 112,
        height_per_member = 20,
        tp_x = 6,
        tp_y = 9,
    },
    text = {
        color = ui.color.rgb(255, 255, 255, 185),
        tp_full_color = ui.color.rgb(0, 191, 255, 185),
        stroke_color = ui.color.rgb(0, 0, 0, 185),
        font = 'Arial',
        party_font_size = '9pt',
    },
}

local tparty_party_window_state = {
    title = 'Tparty Party Window',
    style = 'chromeless',
    color = ui.color.transparent,
    x = 0,
    y = 0,
    width = 112,
    height = 134,
    moveable = false,
    closeable = false,
    resizable = false,
}

local config = settings.load(defaults)

ui.display(function()
    if party then
        local party_1_count = party.alliance.party_1_count
        tparty_party_window_state.x = windower.settings.ui_size.width - config.party.x_right - config.party.width
        tparty_party_window_state.y = windower.settings.ui_size.height - config.party.y_bottom - (party_1_count * config.party.height_per_member) - config.party.total_y_padding
        tparty_party_window_state.width = config.party.width
        tparty_party_window_state.height = (party_1_count * config.party.height_per_member) + config.party.total_y_padding

        tparty_party_window_state = ui.window('tparty_party_window', tparty_party_window_state, function()
            for i=1, party_1_count do
                local y = config.party.height_per_member * (i - 1) + config.party.top_padding
                if i > 1 then
                    y = y + 1
                end

                local color = config.text.color
                if party[i].tp>=1000 then
                    color = config.text.tp_full_color
                end
                ui.location(config.party.tp_x, y + config.party.tp_y)
                ui.text(string.format(
                    '[%s]{%s %s bold italic stroke:"1px %s" color:%s}',
                    tostring(party[i].tp),
                    config.text.party_font_size,
                    config.text.font,
                    ui.color.tohex(config.text.stroke_color),
                    ui.color.tohex(color)
                ))
            end
        end)
    end
end)

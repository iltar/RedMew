local Event = require 'utils.event'
local Game = require 'utils.game'

local function console_chat(event)
    if not event.player_index or event.player_index == nil then
        return
    end
    local player = Game.get_player_by_index(event.player_index)
    local player_force = player.force
    for _, force in pairs(game.forces) do
        if (string.find(force.name, 'quadrant')) ~= nil then
            if force.name ~= player_force.name then
                force.print(player.name .. ' ' .. player.tag .. ': ' .. event.message, player.chat_color)
            end
        end
    end
end

Event.add(defines.events.on_console_chat, console_chat)

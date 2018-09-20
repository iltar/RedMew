--[[-- info
    Provides the ability to show stress values on the map.
]]

-- dependencies

local Event = require 'utils.event'
local StressMap = require 'map_gen.Diggy.StressMap'

-- this
local DiggyTileStress = {}

--[[--
    Registers all event handlers.]

    @param config Table {@see Diggy.Config}.
]]
function DiggyTileStress.register(config)
    Event.add(StressMap.events.on_stress_changed, function(event)
        local r = event.value
        local g = 1 - event.value
        if r < 0 then r = 0 end
        if r > 1 then r = 1 end
        if g < 0 then g = 0 end
        if g > 1 then g = 1 end

        local text = math.floor(100 * event.value) / 100   
        local color = { r = r, g = g, b = 0}
        
        local text_entity = event.surface.find_entity('flying-text', event.position)
        
        if text_entity then
            if text == 0 then
                text_entity.destroy()
                return
            end

            text_entity.text = text
            text_entity.color = color

            return
        end

        if (text == 0) then
            return
        end

        event.surface.create_entity{
            name = 'flying-text',
            color = color,
            text = text,
            position = event.position
        }.active = false
    end)
end

--[[--
    Initializes the Feature.

    @param config Table {@see Diggy.Config}.
]]
function DiggyTileStress.initialize(config)

end

return DiggyTileStress
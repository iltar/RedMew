-- dependencies

-- this
local Config = {
    -- enable debug mode, shows extra messages
    debug = true,

    -- allow cheats. Example: by default the player will have 1000 mining speed
    cheats = true,

    -- initial starting position size, values higher than 30 might break
    starting_size = 5,

    -- the daytime value used for cave lighting
    daytime = 0.5,

    -- a list of features to register and enable
    -- to disable a feature, change the flag
    features = {
        StartingZone = {
            enabled = true,
            register = require 'Diggy.Feature.StartingZone'.register,
            initialize = require 'Diggy.Feature.StartingZone'.initialize,
        },
        SetupPlayer = {
            enabled = true,
            register = require 'Diggy.Feature.SetupPlayer'.register,
            initialize = require 'Diggy.Feature.SetupPlayer'.initialize,
        },
        DiggyHole = {
            enabled = true,
            register = require 'Diggy.Feature.DiggyHole'.register,
            initialize = require 'Diggy.Feature.DiggyHole'.initialize,
        },
        DiggyCaveCollapse = {
            enabled = true,
            register = require 'Diggy.Feature.DiggyCaveCollapse'.register,
            initialize = require 'Diggy.Feature.DiggyCaveCollapse'.initialize,
            support_beam_entities = {
                {name = 'stone-wall', strength = 0.6},
                {name = 'sand-rock-big', strength = 1},
            },
        },
        RefreshMap = {
            enabled = true,
            register = require 'Diggy.Feature.RefreshMap'.register,
            initialize = require 'Diggy.Feature.RefreshMap'.initialize,
        },
        SimpleRoomGenerator = {
            enabled = true,
            register = require 'Diggy.Feature.SimpleRoomGenerator'.register,
            initialize = require 'Diggy.Feature.SimpleRoomGenerator'.initialize,
        },
    },
}

return Config

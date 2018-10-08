return {
    enter = function(self)
        self.font_bigger = assets.font.caviarDreamsBold_32
        --music--
        self.choice = assets.music.choice
        self.choice:setLooping(true)
        self.choice:play()

        self.roundStarting = false
        self.highlightIndex = 0

        local seasons = {"wiosna", "lato", "jesien", "zima"}
        
        --players--
        self.players = {}
        for playerIndex = 1, 4 do
            local season = seasons[playerIndex]
            self.players[playerIndex] = {
                index = playerIndex,
                locked = false,
                highlighted = false,
                season = season,
                bg = assets.choice["tlo_" .. season],
                fg = assets.choice["choice_" .. season],
                controls = baton.new {
                    controls = {
                        lock = {"axis:triggerright+"},
                    },
                    joystick = love.joystick.getJoysticks()[playerIndex]
                },
            }
        end
    end,
    draw = require "states.choice.draw",
    update = require "states.choice.update",
    player_update = require "states.choice.player_update",
    keypressed = require "states.choice.keypressed",
}
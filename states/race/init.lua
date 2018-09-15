return {
    init = function(self)
        self.players = {
            player1 = {player_score = 0, season = 1, controls = baton.new {
                controls = {
                    left = {"axis:leftx-"},
                    right = {"axis:leftx+"},
                    up = {"axis:lefty-"},
                    down = {"axis:lefty+"},
                },
                pairs = {
                    move = {"left", "right", "up", "down"}
                },
                joystick = love.joystick.getJoysticks()[1]
            },},
            player2 = {player_score = 0, season = 2, controls = baton.new {
                controls = {
                    left = {"axis:leftx-"},
                    right = {"axis:leftx+"},
                    up = {"axis:lefty-"},
                    down = {"axis:lefty+"},
                },
                pairs = {
                    move = {"left", "right", "up", "down"}
                },
                joystick = love.joystick.getJoysticks()[2]
            },},
            player3 = {player_score = 0, season = 3, controls = baton.new {
                controls = {
                    left = {"axis:leftx-"},
                    right = {"axis:leftx+"},
                    up = {"axis:lefty-"},
                    down = {"axis:lefty+"},
                },
                pairs = {
                    move = {"left", "right", "up", "down"}
                },
                joystick = love.joystick.getJoysticks()[3]
            },},
            player4 = {player_score = 0, season = 4, controls = baton.new {
                controls = {
                    left = {"axis:leftx-"},
                    right = {"axis:leftx+"},
                    up = {"axis:lefty-"},
                    down = {"axis:lefty+"},
                },
                pairs = {
                    move = {"left", "right", "up", "down"}
                },
                joystick = love.joystick.getJoysticks()[4]
            },},
        }
    end,
    draw = require "states.race.draw"
	update = require "states.race.update"
}

return {
    init = function(self)
		--music--
		winter = assets.music.winter
		winter:play()
		--font--
		self.font_big = assets.font.caviarDreams_48
		self.font_small = assets.font.caviarDreams_32
		--graphic--
		self.snow1 = assets.race.snieg
		--graphic_sled--
		self.wiosna_sanie = assets.race.animacja_sanki_wiosna
		self.lato_sanie = assets.race.animacja_sanki_lato
		self.jesien_sanie = assets.race.animacja_sanki_jesien
		self.zima_sanie = assets.race.animacja_sanki_zima
		--graphic_obstacle--
		self.zaspa = assets.race.zaspa
		self.rampa = assets.race.rampa
		self.kamyk = assets.race.kamyk
		--graphic_particle--
		self.slady = assets.race.slady
		--players table--
        self.players = {
            player1 = {player_score = 0, position = 0, acceleration = 0, last_pressed = 0, speed = 0, season = 1, lane = 0, alive = 1, controls = baton.new {
                controls = {
                    left = {"axis:leftx-"},
                    right = {"axis:leftx+"},
                    up = {"axis:lefty-"},
                    down = {"axis:lefty+"},
					move_1 = {"axis:triggerleft+"},
					move_2 = {"axis:triggerright+"},
                },
                pairs = {
                    move = {"left", "right", "up", "down"}
                },
                joystick = love.joystick.getJoysticks()[1]
            },},
            player2 = {player_score = 0, position = 0, acceleration = 0, last_pressed = 0, speed = 0, season = 2, lane = 0, alive = 1, controls = baton.new {
                controls = {
                    left = {"axis:leftx-"},
                    right = {"axis:leftx+"},
                    up = {"axis:lefty-"},
                    down = {"axis:lefty+"},
					move_1 = {"axis:triggerleft+"},
					move_2 = {"axis:triggerright+"},
                },
                pairs = {
                    move = {"left", "right", "up", "down"}
                },
                joystick = love.joystick.getJoysticks()[2]
            },},
            player3 = {player_score = 0, position = 0, acceleration = 0, last_pressed = 0, speed = 0, season = 3, lane = 0, alive = 1, controls = baton.new {
                controls = {
                    left = {"axis:leftx-"},
                    right = {"axis:leftx+"},
                    up = {"axis:lefty-"},
                    down = {"axis:lefty+"},
					move_1 = {"axis:triggerleft+"},
					move_2 = {"axis:triggerright+"},
                },
                pairs = {
                    move = {"left", "right", "up", "down"}
                },
                joystick = love.joystick.getJoysticks()[3]
            },},
            player4 = {player_score = 0, position = 0, acceleration = 0, last_pressed = 0, speed = 0, season = 4, lane = 0, alive = 1, controls = baton.new {
                controls = {
                    left = {"axis:leftx-"},
                    right = {"axis:leftx+"},
                    up = {"axis:lefty-"},
                    down = {"axis:lefty+"},
					move_1 = {"axis:triggerleft+"},
					move_2 = {"axis:triggerright+"},
                },
                pairs = {
                    move = {"left", "right", "up", "down"}
                },
                joystick = love.joystick.getJoysticks()[4]
            },},
        }
		self.timer = 30
		self.lane_timer = 1
    end,
    draw = require "states.race.draw",
	update = require "states.race.update",
	player_update = require "states.race.player_update",
}

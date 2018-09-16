return {
    init = function(self)
		--music--
		winter = love.audio.newSource("mp3/winter.mp3","stream")
		winter:play()
		--font--
		self.font_big = love.graphics.newFont(50)
		self.font_small = love.graphics.newFont(30)
		--graphic--
		self.snow1 = love.graphics.newImage("img/tlozima1.png")
		self.snow2 = love.graphics.newImage("img/tlozima2.png")
		--graphic_sled--
		self.wiosna_sanie = love.graphics.newImage("img/lato-sanki1.png")
		self.lato_sanie = love.graphics.newImage("img/lato-sanki1.png")
		self.jesien_sanie = love.graphics.newImage("img/jesien-sanki1.png")
		self.zima_sanie = love.graphics.newImage("img/zima-sanki1.png")
		--graphic_obstacle--
		self.zaspa = love.graphics.newImage("img/zaspa.png")
		self.rampa = love.graphics.newImage("img/rampa.png")
		self.kamyk = love.graphics.newImage("img/kamyk.png")
		--graphic_particle--
		self.slady = love.graphics.newImage("img/slady.png")
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

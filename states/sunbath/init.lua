return {
    init = function(self)
        self.background1 = love.graphics.newImage("img/tlopiasek1png.png")
		self.background2 = love.graphics.newImage("img/tlopiasek2png.png")
		self.background3 = love.graphics.newImage("img/tlopiasek3png.png")
		self.sand = self.background1
		self.players = {
		player1 = {player_score = 0, turn_grade = 0, angle_difference = 0, rotation_new = nil, rotation_old = nil, controls = baton.new {
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
		player2 = {player_score = 0, turn_grade = 0, angle_difference = 0, rotation_new = nil, rotation_old = nil, controls = baton.new {
                    controls = {
                        left = {"axis:leftx-"},
                        right = {"axis:leftx+"},
                        up = {"axis:lefty-"},
                        down = {"axis:lefty+"},
                        cut = {"axis:triggerleft+"}
                    },
                    pairs = {
                        move = {"left", "right", "up", "down"}
                    },
                    joystick = love.joystick.getJoysticks()[2]
                },},
		player3 = {player_score = 0, turn_grade = 0, angle_difference = 0, rotation_new = nil, rotation_old = nil, controls = baton.new {
                    controls = {
                        left = {"axis:leftx-"},
                        right = {"axis:leftx+"},
                        up = {"axis:lefty-"},
                        down = {"axis:lefty+"},
                        cut = {"axis:triggerleft+"}
                    },
                    pairs = {
                        move = {"left", "right", "up", "down"}
                    },
                    joystick = love.joystick.getJoysticks()[3]
                },},
		player4 = {player_score = 0, turn_grade = 0, angle_difference = 0, rotation_new = nil, rotation_old = nil, controls = baton.new {
                    controls = {
                        left = {"axis:leftx-"},
                        right = {"axis:leftx+"},
                        up = {"axis:lefty-"},
                        down = {"axis:lefty+"},
                        cut = {"axis:triggerleft+"}
                    },
                    pairs = {
                        move = {"left", "right", "up", "down"}
                    },
                    joystick = love.joystick.getJoysticks()[4]
                },},
		}
		self.timer = 30
		self.turn_direction = 1
		self.turn_timer = 5
		self.bck_timer = 5
		
    end,
    draw = require "states.sunbath.draw",
	update = require "states.sunbath.update",
	player_update = require "states.sunbath.player_update"
	
}

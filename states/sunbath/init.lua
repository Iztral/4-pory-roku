return {
    init = function(self)
	--music--
		self.summer = love.audio.newSource("mp3/summer.mp3","stream")
		self.summer:play()
	--timer--
		self.clock = love.graphics.newImage("img/timer.png")
	--font--
		self.font_big = love.graphics.newFont(50)
		self.font_small = love.graphics.newFont(30)
	--background--
        self.background1 = love.graphics.newImage("img/tlopiasek1png.png")
		self.background2 = love.graphics.newImage("img/tlopiasek2png.png")
		self.background3 = love.graphics.newImage("img/tlopiasek3png.png")
		self.sand = self.background1
	--towel--
		self.towel1 = love.graphics.newImage("img/koc1.png")
		self.towel2 = love.graphics.newImage("img/koc2.png")
		self.towel3 = love.graphics.newImage("img/koc3.png")
		self.towel4 = love.graphics.newImage("img/koc4.png")
	--arrow--
		self.arrow = love.graphics.newImage("img/arrow.png")
	--leek--
		--spring--
		self.wiosna0 = love.graphics.newImage("img/wiosna0.png")
		self.wiosna1 = love.graphics.newImage("img/wiosna1.png")
		self.wiosna2 = love.graphics.newImage("img/wiosna2.png")
		self.wiosna3 = love.graphics.newImage("img/wiosna3.png")
		self.wiosna_main = self.wiosna0
		--summer--
		self.lato0 = love.graphics.newImage("img/lato0.png")
		self.lato1 = love.graphics.newImage("img/lato1.png")
		self.lato2 = love.graphics.newImage("img/lato2.png")
		self.lato3 = love.graphics.newImage("img/lato3.png")
		self.lato_main = self.lato0
		--fall--
		self.jesien0 = love.graphics.newImage("img/jesien0.png")
		self.jesien1 = love.graphics.newImage("img/jesien1.png")
		self.jesien2 = love.graphics.newImage("img/jesien2.png")
		self.jesien3 = love.graphics.newImage("img/jesien3.png")
		self.jesien_main = self.jesien0
		--winter--
		self.zima0 = love.graphics.newImage("img/zima0.png")
		self.zima1 = love.graphics.newImage("img/zima1.png")
		self.zima2 = love.graphics.newImage("img/zima2.png")
		self.zima3 = love.graphics.newImage("img/zima3.png")
		self.zima_main = self.zima0
		
	--leek mask--
		self.mask0 = love.graphics.newImage("img/maska0.png")
		self.mask1 = love.graphics.newImage("img/maska1.png")
		self.mask2 = love.graphics.newImage("img/maska2.png")
		self.mask3 = love.graphics.newImage("img/maska3.png")
		self.mask_wiosna = self.mask0
		self.mask_lato = self.mask0
		self.mask_jesien = self.mask0
		self.mask_zima = self.mask0
		
		
		self.players = {
            player1 = {player_score = 0, alfa = 0, turn_grade = 0, angle_difference = 0, rotation_new = nil, rotation_old = nil, season = 1, angle_max = 25, order = 1, controls = baton.new {
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
            player2 = {player_score = 0, alfa = 0, turn_grade = 0, angle_difference = 0, rotation_new = nil, rotation_old = nil, season = 2, angle_max = 25, order = 1, controls = baton.new {
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
            player3 = {player_score = 0, alfa = 0, turn_grade = 0, angle_difference = 0, rotation_new = nil, rotation_old = nil, season = 3, angle_max = 25, order = 1, controls = baton.new {
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
            player4 = {player_score = 0, alfa = 0, turn_grade = 0, angle_difference = 0, rotation_new = nil, rotation_old = nil, season = 4, angle_max = 25, order = 1, controls = baton.new {
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
		self.timer = 30
		self.turn_direction = 1
		self.turn_timer = math.random(3,8)
		self.bck_timer = 5
    end,
    draw = require "states.sunbath.draw",
	update = require "states.sunbath.update",
	player_update = require "states.sunbath.player_update"
	
}

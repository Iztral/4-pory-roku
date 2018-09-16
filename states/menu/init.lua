return {
	init = function(self)
		--music--
		self.menu = love.audio.newSource("mp3/menu.mp3","stream")
		menu:setLooping(true)
		self.menu:play()
		--background--
		self.menu1 = love.graphics.newImage("img/menu_bck1.png")
		self.menu2 = love.graphics.newImage("img/menu_bck2.png")
		self.menu3 = love.graphics.newImage("img/menu_bck3.png")
		self.menu_main = self.background1
		--options--
		self.start = love.graphics.newImage("img/na_start.png")
		self.tytul = love.graphics.newImage("img/na_tytul.png")
		self.wyjscie = love.graphics.newImage("img/na_wyjscie.png")
		self.logo = love.graphics.newImage("img/logopng.png")
		self.bck_timer = 5
		self.controls = baton.new {
                    controls = {
                        start = {"button:start"},
						quit = {"button:back"}
                        
                    },
                    joystick = love.joystick.getJoysticks()[1]
                },
	end
	
	draw = require "states.menu.draw",
	update = require "states.menu.update",
}
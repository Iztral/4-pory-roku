return {
	init = function(self)
		self.font= love.graphics.newFont("font/CaviarDreams.ttf", 48)
		--music--
		self.menu = love.audio.newSource("mp3/menu.mp3","stream")
		self.menu:setLooping(true)
		self.menu:play()
		--background--
		self.menu_bck = love.graphics.newImage("img/menu_bck.png")
		self.menu1 = love.graphics.newImage("img/menu1.png")
		self.menu2 = love.graphics.newImage("img/menu2.png")
		self.menu3 = love.graphics.newImage("img/menu3.png")
		self.menu_main = self.menu1
		--options--
		self.start = love.graphics.newImage("img/na-start.png")
		self.tytul = love.graphics.newImage("img/na-tytul.png")
		self.wyjscie = love.graphics.newImage("img/na-wyjscie.png")
		self.logo = love.graphics.newImage("img/logopng.png")
		self.bck_timer = 5

        local j = love.joystick.getJoysticks()

		self.controls = baton.new {
                    controls = {
                        start = {"button:start"},
						quit = {"button:back"}
                        
                    },
                    joystick = j[1]
                }

        self.bottomLogo = love.graphics.newImage("img/logo/toporybiale.png")
	end,
	draw = require "states.menu.draw",
	update = require "states.menu.update"
}

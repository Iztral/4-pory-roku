return {
	init = function(self)
		self.font= love.graphics.newFont("assets/font/caviarDreams.ttf", 48)
		--music--
		self.menu = love.audio.newSource("assets/music/menu.mp3","stream")
		self.menu:setLooping(true)
		self.menu:play()
		--background--
		self.menu_bck = love.graphics.newImage("assets/menu/menu_bck.png")
		self.menu1 = love.graphics.newImage("assets/menu/menu1.png")
		self.menu2 = love.graphics.newImage("assets/menu/menu2.png")
		self.menu3 = love.graphics.newImage("assets/menu/menu3.png")
		self.menu_main = self.menu1
		--options--
		self.start = love.graphics.newImage("assets/menu/na_start.png")
		self.tytul = love.graphics.newImage("assets/menu/na_tytul.png")
		self.wyjscie = love.graphics.newImage("assets/menu/na_wyjscie.png")
		self.logo = love.graphics.newImage("assets/logo/logo_menu.png")
		self.bck_timer = 5

        local j = love.joystick.getJoysticks()

		self.controls = baton.new {
                    controls = {
                        start = {"button:start"},
						quit = {"button:back"}
                        
                    },
                    joystick = j[1]
                }

        self.bottomLogo = love.graphics.newImage("assets/logo/logo_topory.png")
	end,
	draw = require "states.menu.draw",
	update = require "states.menu.update"
}

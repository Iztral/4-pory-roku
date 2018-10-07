return {
    enter = function(self)
        self.font = assets.font.caviarDreams_48
        --music--
        self.menu = assets.music.menu
        self.menu:setLooping(true)
        self.menu:play()
        --background--
        self.menu_bck = assets.menu.menu_bck
        self.menu1 = assets.menu.menu1
        self.menu2 = assets.menu.menu2
        self.menu3 = assets.menu.menu3
        self.menu_main = self.menu1
        --options--
        self.start = assets.menu.na_start
        self.tytul = assets.menu.na_tytul
        self.wyjscie = assets.menu.na_wyjscie

        self.logo = assets.logo.logo_game
        self.bottomLogo = assets.logo.logo_topory

        self.bck_timer = 5
		self.start_timer = 2

        local j = love.joystick.getJoysticks()

        self.controls = baton.new {
            controls = {
                start = {"button:start"},
                quit = {"button:back"}
                
            },
            joystick = j[1]
        }

        -- board scaling
        self.startBoardTimer = 0
    end,
    draw = require "states.menu.draw",
    update = require "states.menu.update"
}

return {
    enter = function(self)
        self.countdown = require "layers.countdown" :init()

        -- image loading
        self.img = {
            background = assets.bazooka.bazooka_bg,
            timer = assets.general.timer,
        }

        -- players initializing
        self.players:initialize()
        
        self.timer = 40

        self.font = assets.font.caviarDreams_40
        self.font_small = assets.font.caviarDreams_16
        self.fontHeight = self.font:getHeight()
		--tutorial--
		self.tutorial = assets.tutorial.wiosna_tutorial
		self.grzyb = assets.tutorial.kontroller_gala
		self.trigger = assets.tutorial.kontroller_triger
		
        self.plotkiHorizontal = assets.bazooka.bazooka_fg
        --music
        self.spring = assets.music.spring
        self.spring:setLooping(true)
        self.spring:play()

        self.gameStarted = false
        signal.register("countdown layer: go", function()
            self.gameStarted = true
        end)
    end,
    draw = require "states.bazooka.draw",
    update = require "states.bazooka.update",

    -- exported modules
    players = require "states.bazooka.players"
}

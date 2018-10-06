return {
    init = function(self)
        -- image loading
        self.img = {
            background = love.graphics.newImage("assets/bazooka/bazooka_bg.jpg"),
            timer = love.graphics.newImage("assets/general/timer.png")
        }

        -- players initializing
        self.players:initialize()
		
		
        self.timer = 40

        self.font = love.graphics.newFont("assets/font/caviarDreams.ttf", 40)
        self.fontHeight = self.font:getHeight()

        self.plotkiHorizontal = love.graphics.newImage("assets/bazooka/bazooka_fg.png")
		--music
		self.spring = love.audio.newSource("assets/music/spring.mp3","stream")
		self.spring:setLooping(true)
		self.spring:play()
    end,
    draw = require "states.bazooka.draw",
    update = require "states.bazooka.update",

    -- exported modules
    players = require "states.bazooka.players"
}

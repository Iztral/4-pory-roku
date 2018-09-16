return {
    init = function(self)
        -- image loading
        self.img = {
            background = love.graphics.newImage("img/split.jpg"),
            timer = love.graphics.newImage("img/timer.png")
        }

        -- players initializing
        self.players:initialize()
		
		
        self.timer = 40

        self.font = love.graphics.newFont("font/CaviarDreams.ttf", 40)
        self.fontHeight = self.font:getHeight()

        self.plotkiHorizontal = love.graphics.newImage("img/plotek_bok_2.png")
		--music
		self.spring = love.audio.newSource("mp3/spring.mp3","stream")
		self.spring:setLooping(true)
		self.spring:play()
    end,
    draw = require "states.bazooka.draw",
    update = require "states.bazooka.update",

    -- exported modules
    players = require "states.bazooka.players"
}

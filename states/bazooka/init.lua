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

        self.font = love.graphics.newFont(40)
        self.fontHeight = self.font:getHeight()

        self.plotkiHorizontal = love.graphics.newImage("img/plotek_bok_2.png")
    end,
    draw = require "states.bazooka.draw",
    update = require "states.bazooka.update",

    -- exported modules
    players = require "states.bazooka.players"
}

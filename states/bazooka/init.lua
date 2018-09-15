return {
    init = function(self)
        -- image loading
        self.img = {
            background = love.graphics.newImage("img/split.jpg")
        }

        -- players initializing
        self.players:initialize()
    end,
    draw = require "states.bazooka.draw",
    update = require "states.bazooka.update",

    -- exported modules
    players = require "states.bazooka.players"
}

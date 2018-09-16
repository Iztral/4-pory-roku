return {
    init = function(self)
        self.podiumBackground = love.graphics.newImage("img/podium.jpg")
    end,

    draw = function(self)
        love.graphics.setColor(1, 1, 1)
        love.graphics.draw(self.podiumBackground, 0, 0)
    end
}

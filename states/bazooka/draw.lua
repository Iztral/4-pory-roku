return function(self)
    love.graphics.setBackgroundColor(0, 0, 0)

    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(self.img.background, 0, 0)

    self.players:draw()

    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(self.plotkiHorizontal, 0, -24)

    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(self.img.timer, love.graphics.getWidth() * 0.5, love.graphics.getHeight() * 0.5 - 24, 0, 0.3, 0.3, self.img.timer:getWidth() / 2, self.img.timer:getHeight() / 2)

    love.graphics.setColor(0, 0, 0)
    love.graphics.setFont(self.font)
    love.graphics.printf(string.format("%d", math.ceil(self.timer)), 0, love.graphics.getHeight() * 0.5 - self.fontHeight * 0.5, love.graphics.getWidth(), "center")

    love.graphics.setColor(1, 1, 1)
end

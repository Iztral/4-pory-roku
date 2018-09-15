return function(self)
    love.graphics.setBackgroundColor(0, 0, 0)

    love.graphics.draw(self.img.background, 0, 0)

    self.players:draw()

    love.graphics.setColor(1, 1, 1)
    love.graphics.print(love.timer.getFPS(), 300, 10)
end

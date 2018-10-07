return function(self)
    lg.setBackgroundColor(0, 0, 0)

    lg.setColor(1, 1, 1)
    lg.draw(self.img.background, lg.getWidth() * 0.5, lg.getHeight() * 0.5, 0, 1, 1, self.img.background:getWidth() * 0.5, self.img.background:getHeight() * 0.5)

    self.players:draw()

    lg.setColor(1, 1, 1)
    lg.draw(self.plotkiHorizontal, lg.getWidth() * 0.5 - 4, lg.getHeight() * 0.5, 0, 1, 1, self.plotkiHorizontal:getWidth() * 0.5, self.plotkiHorizontal:getHeight() * 0.5)

    if self.gameStarted then
        lg.setColor(1, 1, 1)
        lg.draw(self.img.timer, lg.getWidth() * 0.5, lg.getHeight() * 0.5 - 24, 0, 0.3, 0.3, self.img.timer:getWidth() / 2, self.img.timer:getHeight() / 2)

        lg.setColor(0, 0, 0)
        lg.setFont(self.font)
        lg.printf(string.format("%d", math.ceil(self.timer)), 0, lg.getHeight() * 0.5 - self.fontHeight * 0.5, lg.getWidth(), "center")
    end

    lg.setColor(1, 1, 1)
    self.countdown:draw()
end

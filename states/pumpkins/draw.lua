return function(self)
    love.graphics.setPointSize(4)
    if self.initialPoint then
        love.graphics.setColor(1, 1, 0)
        love.graphics.points(self.initialPoint.x, self.initialPoint.y)
    end

    for k, p in pairs(self.points) do
        love.graphics.setColor(0, 1, 0)
        if p.active then
            love.graphics.setColor(0, 1, 1)
        end
        love.graphics.points(self.initialPoint.x + p.x, self.initialPoint.y + p.y)
    end

    if self.cursorPosition then
        love.graphics.setColor(1, 0, 0, 0.5)
        love.graphics.circle("fill", self.cursorPosition.x, self.cursorPosition.y, self.cursorRadius)
    end
end

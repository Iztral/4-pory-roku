return function(self)
    love.graphics.setPointSize(6)

    for playerIndex, playerPath in pairs(self.playerPaths) do
        for pathIndex, path in pairs(playerPath.paths) do
            for k, p in pairs(path.points) do
                love.graphics.setColor(1, 1, 0)

                if p.active then
                    love.graphics.setColor(1, 0, 0)
                end

                if p.done then
                    love.graphics.setColor(0.5, 0.5, 1)
                end

                love.graphics.points(path.initialPoint.x + p.x, path.initialPoint.y + p.y)
            end

            if path.initialPoint then
                love.graphics.setColor(1, 1, 0)
                love.graphics.points(path.initialPoint.x, path.initialPoint.y)
            end
        end
    end


    if self.cursorPosition then
        love.graphics.setColor(1, 0, 0, 0.5)
        love.graphics.circle("fill", self.cursorPosition.x, self.cursorPosition.y, self.cursorRadius)
    end
end

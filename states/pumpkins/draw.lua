local drawPoints = function(initialPoint, points, allPathsDone)
    for k, point in pairs(points) do
        love.graphics.setColor(1, 1, 0)

        if point.active then
            love.graphics.setColor(1, 0, 0)
        end

        if point.done then
            love.graphics.setColor(0.5, 0.5, 1)
        end

        if allPathsDone then
            love.graphics.setColor(1, 1, 1)
        end

        love.graphics.points(initialPoint.x + point.x, initialPoint.y + point.y)
    end

    if initialPoint then
        love.graphics.setColor(1, 1, 0)
        love.graphics.points(initialPoint.x, initialPoint.y)
    end
end

return function(self)
    love.graphics.setPointSize(6)

    for playerIndex, playerPath in pairs(self.playerPaths) do
        for pathIndex, path in pairs(playerPath.paths) do
            drawPoints(path.initialPoint, path.points, lume.count(playerPath.paths) == lume.count(playerPath.paths, "done"))
        end
    end

    -- debug mouse path draw
    drawPoints(self.initialPoint, self.points)

    if self.cursorPosition then
        love.graphics.setColor(1, 0, 0, 0.5)
        love.graphics.circle("fill", self.cursorPosition.x, self.cursorPosition.y, self.cursorRadius)
    end
end

local drawPoints = function(initialPoint, points, allPathsDone)
    for k, point in pairs(points) do
        love.graphics.setColor(1, 1, 0, 0.75)

        if point.active or point.done then
            love.graphics.setColor(0, 0, 0, 0)
        end

        love.graphics.circle("fill", initialPoint.x + point.x, initialPoint.y + point.y, 3)
    end

    --[[
    if initialPoint then
        love.graphics.setColor(1, 1, 0)
        love.graphics.points(initialPoint.x, initialPoint.y)
    end
    ]]
end

return function(self)
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(self.img.backgrounds[self.lastBackgroundIndex or 1])

    local pumpkinCoords = {}

    for i = 1, 4 do
        local zeroIndex = i - 1

        pumpkinCoords[i] = {(0.25 * zeroIndex + 0.125) * love.graphics.getWidth(), 0.625 * love.graphics.getHeight(), 0, 1, 1, self.img.pumpkinMain:getWidth() * 0.5, self.img.pumpkinMain:getHeight()}
        
        love.graphics.draw(self.img.pumpkinMain, unpack(pumpkinCoords[i]))
    end

    -- draw points
    for playerIndex, playerPath in pairs(self.playerPaths) do
        for pathIndex, path in pairs(playerPath.paths) do
            drawPoints(path.initialPoint, path.points, lume.count(playerPath.paths) == lume.count(playerPath.paths, "done"))

            if path.done then
                love.graphics.setColor(1, 1, 1)
                love.graphics.draw(path.image, unpack(pumpkinCoords[playerIndex]))
            end
        end
    end

    -- debug mouse path draw
    drawPoints(self.initialPoint, self.points)

    if self.cursorPosition then
        love.graphics.setColor(1, 0, 0, 0.5)
        love.graphics.circle("fill", self.cursorPosition.x, self.cursorPosition.y, self.cursorRadius)
    end

    -- draw players
    self.players:draw()
end

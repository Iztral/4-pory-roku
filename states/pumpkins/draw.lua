local drawPoints = function(initialPoint, points, allPathsDone, timeAngle)
    for k, point in pairs(points) do
        local pointSize = 4

        lg.setColor(1, 1, 0, 0.75)

        if point.next then
            lg.setColor(1, 1, 1)
            pointSize = 6 + math.sin(4 * timeAngle)
        end

        if point.active or point.done then
            lg.setColor(0, 0, 0, 0)
        end

        lg.circle("fill", initialPoint.x + point.x, initialPoint.y + point.y, pointSize)
    end

    --[[
    if initialPoint then
        lg.setColor(1, 1, 0)
        lg.points(initialPoint.x, initialPoint.y)
    end
    ]]
end

return function(self)
    lg.setColor(1, 1, 1)
    lg.draw(self.img.backgrounds[self.lastBackgroundIndex or 1])

    local pumpkinCoords = {}

    for i = 1, 4 do
        local zeroIndex = i - 1

        pumpkinCoords[i] = {(0.25 * zeroIndex + 0.125) * lg.getWidth(), 0.625 * love.graphics.getHeight(), 0, 1, 1, self.img.pumpkinMain:getWidth() * 0.5, self.img.pumpkinMain:getHeight()}
        
        lg.draw(self.img.pumpkinMain, unpack(pumpkinCoords[i]))
    end

    -- draw points
    for playerIndex, playerPath in pairs(self.playerPaths) do
        for pathIndex, path in pairs(playerPath.paths) do
            drawPoints(path.initialPoint, path.points, lume.count(playerPath.paths) == lume.count(playerPath.paths, "done"), self.timeAngle)

            if path.done then
                lg.setColor(1, 1, 1)
                lg.draw(path.image, unpack(pumpkinCoords[playerIndex]))
            end
        end
    end

    -- draw win counter
    if self.winCounter ~= nil then
        lg.setColor(1, 1, 1)
        local timerScale = 128 / assets.general.timer:getHeight()
        lg.draw(assets.general.timer, 0.5 * lg.getWidth(), 16, 0, timerScale, timerScale, assets.general.timer:getWidth() * 0.5, 0)

        lg.setColor(0, 0, 0)
        lg.setFont(assets.font.caviarDreams_48)
        lg.printf(string.format("%d", math.ceil(self.winCounter)), 0, 72, lg.getWidth(), "center")

        lg.setColor(1, 1, 1)
    end

    -- debug mouse path draw
    if isDebug then
        drawPoints(self.initialPoint, self.points, false, self.timeAngle)

        if self.cursorPosition then
            lg.setColor(1, 0, 0, 0.5)
            lg.circle("fill", self.cursorPosition.x, self.cursorPosition.y, self.cursorRadius)
        end
    end

    -- draw players
    self.players:draw()

    self.countdown:draw()
end

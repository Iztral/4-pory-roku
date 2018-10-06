return function(self, dt)
    -- updating players
    self.players:update(dt)

    self.timeAngle = self.timeAngle + dt

    if self.timeAngle >= 2 * math.pi then
        self.timeAngle = self.timeAngle - 2 * math.pi
    end

    -- winning condition
    for playerIndex, playerPath in pairs(self.playerPaths) do
        if lume.find(self.playerOrder, "player" .. playerIndex) == nil then
            local activePathsCount = lume.count(playerPath.paths, "done")
            local pathsCount = lume.count(playerPath.paths)

            if activePathsCount == pathsCount then
                table.insert(self.playerOrder, "player" .. playerIndex)
                self.players.data[playerIndex].order = #self.playerOrder
            end
        end
    end

    -- win counter set
    if #self.playerOrder > 0 and self.winCounter == nil then
        self.winCounter = 30
    end

    -- win counter win handling
    if self.winCounter ~= nil then
        self.winCounter = self.winCounter - dt

        if self.winCounter < 0 then
            local restOfPlayers = lume.map({1, 2, 3, 4}, function(i) return "player" .. i end)

            for _k, playerName in pairs(self.playerOrder) do
                lume.remove(restOfPlayers, playerName)
            end

            restOfPlayers = lume.shuffle(restOfPlayers)
            
            lume.push(self.playerOrder, unpack(restOfPlayers))
        end
    end

    if lume.count(self.playerOrder) == lume.count(self.playerPaths) then
        love.audio.stop()
        gamestate.switch(states.summary, self.playerOrder)
    end

    self.backgroundTimer = self.backgroundTimer - dt

    if self.backgroundTimer <= 0 then
        self.backgroundTimer = lume.random(0.1, 0.35)

        if self.lastBackgroundIndex == nil then
            self.lastBackgroundIndex = math.random(1, 3)
        end

        local range = {1, 2, 3}

        lume.remove(range, self.lastBackgroundIndex)

        self.lastBackgroundIndex = lume.randomchoice(range)
    end
end

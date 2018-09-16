return function(self, dt)
    -- updating players
    self.players:update(dt)

    for playerIndex, playerPath in pairs(self.playerPaths) do
        if lume.find(self.playerOrder, "player" .. playerIndex) ~= nil then
            local activePathsCount = lume.count(playerPath.paths, "done")
            local pathsCount = lume.count(playerPath.paths)

            if activePathsCount == pathsCount then
                table.insert(self.playerOrder, "player" .. playerIndex)
            end
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

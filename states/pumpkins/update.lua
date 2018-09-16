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
        gamestate.switch(states.summary, self.playerOrder)
    end
end

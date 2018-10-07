return function(self, dt)
	
    self.players:update(dt)
	
	self.timer = self.timer - dt
	
    if self.timer <= 0 then
		
        local spriteBatchCounts = lume.map(
            self.players.data, 
            function(player)
                return {
                    index = "player" .. player.index,
                    count = lume.reduce(player.flowerSpriteBatches, function(accum, batch) 
                        return accum + batch:getCount()
                    end, 0)
                }
            end
        )
        
        local sortedBatchCounts = lume.sort(spriteBatchCounts, function(a, b) return a.count > b.count end)
		love.audio.stop()
        gamestate.switch(states.summary, lume.map(sortedBatchCounts, "index"))
    end
end

return function(self,dt)

	local sorted_scores = lume.sort(self.players,function(a, b) return a.player_score > b.player_score end)
	--timer function--
	if self.timer and self.timer > 0 then
		self.timer = self.timer - dt
	end
	if self.timer < 0 then
		self.timer = 0
		gamestate.switch(states.summary, sorted_scores)
	end
	
	for index,player in pairs(self.players) do
		self.player_update(player,dt)
	end
		
	
	
	
	
end
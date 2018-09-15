return function(self,dt)

	--timer function--
	if self.timer and self.timer > 0 then
		self.timer = self.timer - dt
	end
	if self.timer < 0 then
		self.timer = 0
		--pause and compare score--
	end
	
	for index,player in pairs(self.players) do
		self.player_update(player,dt)
	end
		
	
	
	
	
end
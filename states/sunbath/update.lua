return function(self,dt)

	--timer function--
	if timer and timer > 0 then
		timer = timer - dt
	end
	if timer < 0 then
		timer = nil
		--pause and compare score--
	end
	
	for index,player in pairs(self.players) do
		self.player_update(player)
	end
		
	
	
	
	
end
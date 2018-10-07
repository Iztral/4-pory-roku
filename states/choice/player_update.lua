return function(self,player,dt)

	player.controls:update(dt)
	local x, y = player.controls:get "move"
	
	if player.controls:pressed("lock") then
		self.light_timer = 8
		self.light_up = 0
		if player.locked == -1 then
			self.buttons[player.index] = self.locked
			self.transparency[player.index] = 1
		end
		if player.locked == 1 then
			self.buttons[player.index] = self.confirm
			self.transparency[player.index] = 0.99
		end
		player.locked = player.locked * (-1)
		--start vibration--
	end
	

end
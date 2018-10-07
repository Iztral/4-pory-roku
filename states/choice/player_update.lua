return function(self,player,dt)

	player.controls:update(dt)
	local x, y = player.controls:get "move"
	
	if player.locked == 1 then
		self.buttons[player.index] = self.locked
	end
	if player.locked == -1 then
		self.buttons[player.index] = self.confirm
	end
	
	if player.controls:pressed("lock") then
		self.light_timer = 9
		self.light_up = 0
		player.locked = player.locked * (-1)
		--start vibration--
	end
	

end
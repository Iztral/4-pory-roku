return function(self,player,dt)

	player.controls:update(dt)
	local x, y = player.controls:get "move"
	
	--jęzeli chcemy wybierać postać--
--	if player.controls:pressed("left") and player.locked == -1 then
		-- if player.leek_choice > 1 then
			-- player.leek_choice = player.leek_choice - 1
		-- end
		-- if player.leek_choice <= 1 then
			-- player.leek_choice = 1
		-- end
		-- self.player_leeks[player.index] = self.leeks[player.leek_choice]
	-- end
	-- if player.controls:pressed("right") and player.locked == -1 then
		-- if player.leek_choice < 4 then
			-- player.leek_choice = player.leek_choice + 1
		-- end
		-- if player.leek_choice >= 4 then
			-- player.leek_choice = 4
		-- end
		-- self.player_leeks[player.index] = self.leeks[player.leek_choice]
	-- end
	
	if player.controls:pressed("lock") then
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
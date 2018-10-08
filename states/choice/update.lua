return function(self,dt)

	for i=1,4 do
		if self.transparency[i] <= 0.99 then
			self.transparency[i] = self.transparency[i] - dt*1.3
		end
		if self.transparency[i] <= 0.2 then
			self.transparency[i] = 0.99
		end
	end
	
	for index,player in pairs(self.players) do
		self:player_update(player,dt)
	end
	
	--start conditions--
	if self.players.player1.locked == 1 and self.players.player2.locked == 1 and self.players.player3.locked == 1 and self.players.player4.locked == 1 then
		self.light_timer = self.light_timer - dt
		if self.light_timer < 9 and self.light_timer > 8 then
			self.light_up = 0
		end
		if self.light_timer < 8 and self.light_timer > 7 then
			self.light_up = 1
			if joystick1 ~= nil then
				sucess1 = joystick1:setVibration( 1, 1, 0.1)
			end
		end
		if self.light_timer < 7 and self.light_timer > 6 then
			self.light_up = 2
			if joystick2 ~= nil then
				sucess2 = joystick2:setVibration( 1, 1, 0.1 )
			end
		end
		if self.light_timer < 5 and self.light_timer > 4 then
			self.light_up = 3
			if joystick3 ~= nil then
				sucess3 = joystick3:setVibration( 1, 1, 0.1 )
			end
		end
		if self.light_timer < 3 and self.light_timer > 2 then
			self.light_up = 4
			if joystick4 ~= nil then
				sucess4 = joystick4:setVibration( 1, 1, 0.1 )
			end
		end
		if self.light_timer < 1 and self.light_timer > 0 then
			self.light_up = 5
		end
		
		if self.light_timer <= 0 then
			love.audio.stop( )
			gamestate.switch(states.stateswitcher, self, states.tutorial)
		end
	end
end


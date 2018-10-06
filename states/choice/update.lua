return function(self,dt)

	for i=1,4 do
		if self.transparency[i] <= 0.99 then
			self.transparency[i] = self.transparency[i] - dt*1.3
		end
		if self.transparency[i] <= 0 then
			self.transparency[i] = 0.99
		end
	end
	
	for index,player in pairs(self.players) do
		self:player_update(player,dt)
	end
	
	--start conditions--
	if self.players.player1.locked == 1 and self.players.player2.locked == 1 and self.players.player3.locked == 1 and self.players.player4.locked == 1 then --all locked--
		if self.players.player1.leek_choice ~= self.players.player2.leek_choice and self.players.player1.leek_choice ~= self.players.player3.leek_choice and self.players.player1.leek_choice ~= self.players.player4.leek_choice then --player 1--
			if self.players.player2.leek_choice ~= self.players.player3.leek_choice and self.players.player2.leek_choice ~= self.players.player4.leek_choice then --player 2--
				if self.players.player3.leek_choice ~= self.players.player4.leek_choice then
					love.audio.stop( )
					gamestate.switch(states[competitionOrder[competitionOrderIndex]])
				end
			end
		end
	end
end


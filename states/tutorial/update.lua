return function(self, dt)

	if self.timer > 0 then
		self.timer = self.timer - dt
	end
	
	if competitionOrderIndex == 1 then
		 self.tutorial_wiosna:update(dt)
	end
	if competitionOrderIndex == 2 then
		 self.tutorial_lato:update(dt)
	end
	if competitionOrderIndex == 3 then
		 self.tutorial_jesien:update(dt)
	end
	if competitionOrderIndex == 4 then
		 self.tutorial_zima:update(dt)
	end
	
    for index,player in pairs(self.players) do
		self.players[index].controls:update(dt)
		if self.players[index].controls:pressed "start" then
			self.timer = 0
		end
	end
	
	if self.timer <= 0 then
		if competitionOrder[competitionOrderIndex] then
			gamestate.switch(states[competitionOrder[competitionOrderIndex]])
			self.timer = 10
		else
			love.event.quit()
		end
	end
	
	
	
end
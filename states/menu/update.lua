return function(self,dt)
	
	--anim timer--
	if self.bck_timer and self.bck_timer > 0 then
		self.bck_timer = self.bck_timer - dt
	end
	
	--anim switch--
	if self.bck_timer < 5 and self.bck_timer > 4 or self.bck_timer < 1 and self.bck_timer > 0 then
		self.menu_main = self.menu1
	end
	if self.bck_timer < 4 and self.bck_timer > 3 or self.bck_timer < 2 and self.bck_timer > 1  then
		self.menu_main = self.menu2
	end
	if self.bck_timer < 3 and self.bck_timer > 2 then
		self.menu_main = self.menu3
	end
	
	if self.bck_timer < 0 then
		self.bck_timer = 5
	end
	
	--click detection--
	self.controls:update(dt)
	if self.controls:pressed("start") then
		love.audio.stop()
		gamestate.switch(states[competitionOrder[competitionOrderIndex]])
		
	end
	if self.controls:pressed("quit") then
		love.event.quit()
		love.audio.stop()
	end
end
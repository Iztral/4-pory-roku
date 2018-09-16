return function(self,dt,player)

	player.controls:update(dt)
	local x, y = player.controls:get "move"
	
	player.speed = player.acceleration
	player.acceleration = math.max(player.acceleration-dt,0)
	--speed--
	if player.controls:pressed("move_1") and player.last_pressed == 2 then
		timer.tween(0.5,player,{acceleration = 1})
		player.last_pressed = 1
	end
	if player.controls:pressed("move_2") and player.last_pressed == 1 then
		timer.tween(0.5,player,{acceleration = 1})
		player.last_pressed = 2
	end
	--lane change--
	if self.lane_timer and self.lane_timer > 0 then
		self.lane_timer = self.lane_timer - dt
	end
	
	if player.controls:pressed("up") and self.lane_timer == 0 then
		player.lane = math.max(player.lane + 1,3)
	end
	if player.controls:pressed("down") and self.lane_timer == 0 then
		player.lane = math.min(player.lane - 1,1)
	end
	
	if self.lane_timer <= 0 then
		self.lane_timer = 1
	end
	--collision--
	
	
end
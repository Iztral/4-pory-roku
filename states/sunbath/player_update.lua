return function(self,player,dt)
	
	player.controls:update(dt)
	local x, y = player.controls:get "move"
	
	if player.rotation_old == nil then
		player.rotation_old = math.atan2(y,x)
	end

	player.rotation_new = math.atan2(y,x)
	
	player.angle_difference = math.deg(player.rotation_new - player.rotation_old)*dt*50

	--grading turn posotive--
	if self.turn_direction == 1 then
		if player.angle_difference < 0 then
			player.turn_grade = 0
		end
		if player.angle_difference > 0 and player.angle_difference < 4 then
			player.turn_grade = 1
		end
		if player.angle_difference > 4 and player.angle_difference < 6 then
			player.turn_grade = 2
		end
		if player.angle_difference > 6 then
			player.turn_grade = 3
		end
	end
	
	--grading turn negative--
	if self.turn_direction == -1 then
		if player.angle_difference > 0 then
			player.turn_grade = 0
		end
		if player.angle_difference < 0 and player.angle_difference > -4 then
			player.turn_grade = 1
		end
		if player.angle_difference < -4 and player.angle_difference > -6 then
			player.turn_grade = 2
		end
		if player.angle_difference < -6 then
			player.turn_grade = 3
		end
	end
	
	--score increase/decrease 
	if player.turn_grade == 0 then
		player.player_score = math.max(player.player_score - 30 * dt,0)
	end
	
	if player.turn_grade == 1 then
		player.player_score = math.max(player.player_score - 10 * dt,0)
	end
	
	if player.turn_grade == 2 then
		player.player_score = math.max(player.player_score + 50 * dt,0)
	end
	
	if player.turn_grade == 3 then
		player.player_score = math.max(player.player_score + 10 * dt,0)
	end
	
	player.rotation_old = player.rotation_new
	--turn animation--
	player.angle = math.max(player.angle + math.abs(player.angle_difference/100),100)
	
	
	
	if player.angle > 0 and player.angle < 25 then
	
	end
	
	if player.angle > 25 and player.angle < 50 then
	
	end
	
	if player.angle > 50 and player.angle < 75 then
	
	end
	
	if player.angle > 75 and player.angle < 100 then
	
	end
	
	
	
end

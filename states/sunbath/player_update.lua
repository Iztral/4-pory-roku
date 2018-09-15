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
		player.player_score = math.max(player.player_score - 300 * dt,0)
	end
	
	if player.turn_grade == 1 then
		player.player_score = math.max(player.player_score - 100 * dt,0)
	end
	
	if player.turn_grade == 2 then
		player.player_score = math.max(player.player_score + 500 * dt,0)
	end
	
	if player.turn_grade == 3 then
		player.player_score = math.max(player.player_score + 100 * dt,0)
	end
	
	player.rotation_old = player.rotation_new
end

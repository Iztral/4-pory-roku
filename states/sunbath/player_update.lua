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
		player.player_score = math.max(player.player_score - 15 * dt,0)
	end
	
	if player.turn_grade == 1 then
		player.player_score = math.max(player.player_score - 5 * dt,0)
	end
	
	if player.turn_grade == 2 then
		player.player_score = math.max(player.player_score + 50 * dt,0)
	end
	
	if player.turn_grade == 3 then
		player.player_score = math.max(player.player_score + 10 * dt,0)
	end
	
	player.rotation_old = player.rotation_new
	--turn animation--
	if angle_old == nil then
		player.angle_old = 0
	end
	
	if player.angle_max > 0 then
		player.angle_max = player.angle_max - math.abs(player.angle_difference/150)
	end
	
	
	if player.season == 1 then
		if player.angle_max <= 0 then
			player.angle_max = 25
			self.wiosna_main = self["wiosna"..player.order]
			if self.turn_direction == 1 then
				player.order = (player.order+1)%4
			end
			if self.turn_direction == -1 then
				player.order = (player.order-1)%4
			end
		end
	end
	
	if player.season == 1 then
		if player.angle_max <= 0 then
			player.angle_max = 25
			self.lato_main = self["lato"..player.order]
			if self.turn_direction == 1 then
				player.order = (player.order+1)%4
			end
			if self.turn_direction == -1 then
				player.order = (player.order-1)%4
			end
		end
	end
	
	if player.season == 1 then
		if player.angle_max <= 0 then
			player.angle_max = 25
			self.jesien_main = self["jesien"..player.order]
			if self.turn_direction == 1 then
				player.order = (player.order+1)%4
			end
			if self.turn_direction == -1 then
				player.order = (player.order-1)%4
			end
		end
	end
	
	if player.season == 1 then
		if player.angle_max <= 0 then
			player.angle_max = 25
			self.zima_main = self["zima"..player.order]
			if self.turn_direction == 1 then
				player.order = (player.order+1)%4
			end
			if self.turn_direction == -1 then
				player.order = (player.order-1)%4
			end
		end
	end
	
end

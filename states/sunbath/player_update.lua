return function(player)
if player.rotation_old == nil then
		player.rotation_old = math.atan2(x,y)
	end
	
	local x, y = player.controls:get "move"
	
	player.rotation_new = math.atan2(y,x)
	
	player.angle_difference = math.deg(player.rotation_new - player.rotation_old)
	
	--grading turn--
	if player.angle_difference == 0
		player.turn_grade = 0
	end
	if player.angle_difference > 0 and player.angle_difference < 2
		player.turn_grade = 1
	end
	if player.angle_difference > 2 and player.angle_difference < 4
		player.turn_grade = 2
	end
	if player.angle_difference > 4
		player.turn grade = 3
	end
	
	--score increase/decrease 
	if player.turn_grade == 0
		player.player_score = player.player_score - 10
	end
	
	if player.turn_grade == 1
		player.player_score = player.player_score - 5
	end
	
	if player.turn_grade == 2
		player.player_score = player.player_score + 10
	end
	
	if player.turn_grade == 3
		player.player_score = player.player_score + 5
	end
end
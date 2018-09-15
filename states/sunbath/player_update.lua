
if players.player1.rotation_old == nil then
		players.player1.rotation_old = math.atan2(x,y)
	end
	
	players.player1.rotation_new = math.atan2(y,x)
	
	players.player1.angle_difference = math.deg(players.player1.rotation_new - players.player1.rotation_old)
	
	--grading turn--
	if players.player1.angle_difference == 0
		players.player1.turn_grade = 0
	end
	if players.player1.angle_difference > 0 and players.player1.angle_difference < 2
		players.player1.turn_grade = 1
	end
	if players.player1.angle_difference > 2 and players.player1.angle_difference < 4
		players.player1.turn_grade = 2
	end
	if players.player1.angle_difference > 4
		players.player1.turn grade = 3
	end
	
	--score increase/decrease 
	if players.player1.turn_grade == 0
		players.player1.player_score = players.player1.player_score - 10
	end
	
	if players.player1.turn_grade == 1
		players.player1.player_score = players.player1.player_score - 5
	end
	
	if players.player1.turn_grade == 2
		players.player1.player_score = players.player1.player_score + 10
	end
	
	if players.player1.turn_grade == 3
		players.player1.player_score = players.player1.player_score + 5
	end
return {
    init = function(self)
        love.graphics.setBackgroundColor(0.25, 0.25, 0.25)
		self.player = {
		player1 = {player_id = 0, player_score = 0, turn_grade = 0, angle_difference = 0, rotation_new = 0, rotation_old = 0},
		player2 = {player_id = 1, player_score = 0, turn_grade = 0, angle_difference = 0, rotation_new = 0, rotation_old = 0},
		player3 = {player_id = 2, player_score = 0, turn_grade = 0, angle_difference = 0, rotation_new = 0, rotation_old = 0},
		player4 = {player_id = 3, player_score = 0, turn_grade = 0, angle_difference = 0, rotation_new = 0, rotation_old = 0},
		}
		self.timer = 30
    end,
    draw = require "states.sunbath.draw"
	update = require "states.sunbath.update"
}

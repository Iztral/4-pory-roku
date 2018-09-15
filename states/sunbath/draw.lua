return function(self)
    love.graphics.setColor(1, 1, 0)
    
	love.graphics.print(string.format("%.0f", self.timer or 0),10, 10)
	love.graphics.print(string.format("%.0f", self.players.player1.player_score or 0),30,30)
	love.graphics.print(self.players.player1.angle_difference,120,120)
	love.graphics.print(string.format("%.0f", self.players.player2.player_score or 0),50,50)
	love.graphics.print(string.format("%.0f", self.players.player3.player_score or 0),70,70)
	love.graphics.print(string.format("%.0f", self.players.player4.player_score or 0),90,90)
end

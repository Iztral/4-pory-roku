return function(self)
    love.graphics.draw(self.sand,0,0)
	love.graphics.print(string.format("%.0f", self.timer or 0),10, 10)
	love.graphics.print(string.format("%.0f", self.players.player1.player_score or 0),30,30)
	love.graphics.print(string.format("%.0f", self.players.player2.player_score or 0),50,50)
	love.graphics.print(string.format("%.0f", self.players.player3.player_score or 0),70,70)
	love.graphics.print(string.format("%.0f", self.players.player4.player_score or 0),90,90)
	love.graphics.print(string.format("%.0f", self.players.player4.angle_difference or 0),120,120)
end

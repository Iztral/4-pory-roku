return function(self)
    love.graphics.draw(self.sand,0,0)
	love.graphics.printf(string.format("%.0f", self.timer or 0),0, 10, love.graphics.getWidth(),"center")
	love.graphics.printf(string.format("%.0f", self.players.player1.player_score or 0),0,50,love.graphics.getWidth()*0.25,"center")
	love.graphics.printf(string.format("%.0f", self.players.player2.player_score or 0),love.graphics.getWidth()*0.25,50,love.graphics.getWidth()*0.25,"center")
	love.graphics.printf(string.format("%.0f", self.players.player3.player_score or 0),love.graphics.getWidth()*0.5,50,love.graphics.getWidth()*0.25,"center")
	love.graphics.printf(string.format("%.0f", self.players.player4.player_score or 0),love.graphics.getWidth()*0.75,50,love.graphics.getWidth()*0.25,"center")
	love.graphics.print(string.format("%.0f", self.players.player4.angle_difference or 0),120,120)
end

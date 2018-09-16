return function(self)
	--background--
	love.graphics.draw(self.snow1,0,0)
	--timer--
	love.graphics.setFont(self.font_big)
	love.graphics.printf(string.format("%.0f", self.timer or 0),0, 10, love.graphics.getWidth(),"center")
	
	--score--
	love.graphics.setFont(self.font_small)
	love.graphics.printf(string.format("%.0f", self.players.player1.player_score or 0),0,50,love.graphics.getWidth()*0.25,"center")
	love.graphics.printf(string.format("%.0f", self.players.player2.player_score or 0),love.graphics.getWidth()*0.25,50,love.graphics.getWidth()*0.25,"center")
	love.graphics.printf(string.format("%.0f", self.players.player3.player_score or 0),love.graphics.getWidth()*0.5,50,love.graphics.getWidth()*0.25,"center")
	love.graphics.printf(string.format("%.0f", self.players.player4.player_score or 0),love.graphics.getWidth()*0.75,50,love.graphics.getWidth()*0.25,"center")
	
	--sled--
end

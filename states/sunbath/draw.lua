return function(self)
    love.graphics.draw(self.sand,0,0)
	love.graphics.printf(string.format("%.0f", self.timer or 0),0, 10, love.graphics.getWidth(),"center") --timer--
	
	--score--
	love.graphics.printf(string.format("%.0f", self.players.player1.player_score or 0),0,50,love.graphics.getWidth()*0.25,"center")
	love.graphics.printf(string.format("%.0f", self.players.player2.player_score or 0),love.graphics.getWidth()*0.25,50,love.graphics.getWidth()*0.25,"center")
	love.graphics.printf(string.format("%.0f", self.players.player3.player_score or 0),love.graphics.getWidth()*0.5,50,love.graphics.getWidth()*0.25,"center")
	love.graphics.printf(string.format("%.0f", self.players.player4.player_score or 0),love.graphics.getWidth()*0.75,50,love.graphics.getWidth()*0.25,"center")
	
	--towel--
	love.graphics.draw(self.towel1,love.graphics.getWidth()*0.125,love.graphics.getHeight()*0.45,0,0.8,0.8,self.towel1:getWidth()/2,self.towel1:getHeight()/2)
	love.graphics.draw(self.towel2,love.graphics.getWidth()*0.375,love.graphics.getHeight()*0.45,0,0.8,0.8,self.towel2:getWidth()/2,self.towel2:getHeight()/2)
	love.graphics.draw(self.towel3,love.graphics.getWidth()*0.625,love.graphics.getHeight()*0.45,0,0.8,0.8,self.towel3:getWidth()/2,self.towel3:getHeight()/2)
	love.graphics.draw(self.towel4,love.graphics.getWidth()*0.875,love.graphics.getHeight()*0.45,0,0.8,0.8,self.towel4:getWidth()/2,self.towel4:getHeight()/2)
	--leek--
	
	
	
	--debug-- love.graphics.draw
end

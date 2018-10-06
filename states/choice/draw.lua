return function(self)
  --background--
	love.graphics.setBackgroundColor(1,1,1)
	love.graphics.draw(self.choice_bg, 0, 0)
  --arrows--
	love.graphics.draw(self.arrow,(love.graphics.getWidth()*0.125)-150,love.graphics.getHeight()*0.45,0,-0.2,0.2,self.arrow:getWidth()/2,self.arrow:getHeight()/2)
	love.graphics.draw(self.arrow,(love.graphics.getWidth()*0.125)+150,love.graphics.getHeight()*0.45,0,0.2,0.2,self.arrow:getWidth()/2,self.arrow:getHeight()/2)
	
	love.graphics.draw(self.arrow,(love.graphics.getWidth()*0.375)-150,love.graphics.getHeight()*0.45,0,-0.2,0.2,self.arrow:getWidth()/2,self.arrow:getHeight()/2)
	love.graphics.draw(self.arrow,(love.graphics.getWidth()*0.375)+150,love.graphics.getHeight()*0.45,0,0.2,0.2,self.arrow:getWidth()/2,self.arrow:getHeight()/2)

	love.graphics.draw(self.arrow,(love.graphics.getWidth()*0.625)-150,love.graphics.getHeight()*0.45,0,-0.2,0.2,self.arrow:getWidth()/2,self.arrow:getHeight()/2)
	love.graphics.draw(self.arrow,(love.graphics.getWidth()*0.625)+150,love.graphics.getHeight()*0.45,0,0.2,0.2,self.arrow:getWidth()/2,self.arrow:getHeight()/2)
	
	love.graphics.draw(self.arrow,(love.graphics.getWidth()*0.875)-150,love.graphics.getHeight()*0.45,0,-0.2,0.2,self.arrow:getWidth()/2,self.arrow:getHeight()/2)
	love.graphics.draw(self.arrow,(love.graphics.getWidth()*0.875)+150,love.graphics.getHeight()*0.45,0,0.2,0.2,self.arrow:getWidth()/2,self.arrow:getHeight()/2)
  --buttons--
	love.graphics.setColor(1, 1, 1, self.transparency[1])
	love.graphics.draw(self.buttons[1],love.graphics.getWidth()*0.125,(love.graphics.getHeight()*0.45)+350,0,0.3,0.3,self.buttons[1]:getWidth()/2,self.buttons[1]:getHeight()/2)
	love.graphics.setColor(1, 1, 1, self.transparency[2])
	love.graphics.draw(self.buttons[2],love.graphics.getWidth()*0.375,(love.graphics.getHeight()*0.45)+350,0,0.3,0.3,self.buttons[2]:getWidth()/2,self.buttons[2]:getHeight()/2)
	love.graphics.setColor(1, 1, 1, self.transparency[3])
	love.graphics.draw(self.buttons[3],love.graphics.getWidth()*0.625,(love.graphics.getHeight()*0.45)+350,0,0.3,0.3,self.buttons[3]:getWidth()/2,self.buttons[3]:getHeight()/2)
	love.graphics.setColor(1, 1, 1, self.transparency[4])
	love.graphics.draw(self.buttons[4],love.graphics.getWidth()*0.875,(love.graphics.getHeight()*0.45)+350,0,0.3,0.3,self.buttons[4]:getWidth()/2,self.buttons[4]:getHeight()/2)
	love.graphics.setColor(1, 1, 1, 1)
  --player_number--
	love.graphics.printf("Player 1",(love.graphics.getWidth()*0.125)-100,(love.graphics.getHeight()*0.45)-400,200,"center")
	love.graphics.printf("Player 2",(love.graphics.getWidth()*0.375)-100,(love.graphics.getHeight()*0.45)-400,200,"center")
	love.graphics.printf("Player 3",(love.graphics.getWidth()*0.625)-100,(love.graphics.getHeight()*0.45)-400,200,"center")
	love.graphics.printf("Player 4",(love.graphics.getWidth()*0.875)-100,(love.graphics.getHeight()*0.45)-400,200,"center")
	love.graphics.setColor(1,1,1)
	--leek--
	love.graphics.draw(self.player_leeks[1],love.graphics.getWidth()*0.125,love.graphics.getHeight()*0.45,0,1.5,1.5,self.player_leeks[1]:getWidth()/2,self.player_leeks[1]:getHeight()/2)
	love.graphics.draw(self.player_leeks[2],love.graphics.getWidth()*0.375,love.graphics.getHeight()*0.45,0,1.5,1.5,self.player_leeks[2]:getWidth()/2,self.player_leeks[2]:getHeight()/2)
	love.graphics.draw(self.player_leeks[3],love.graphics.getWidth()*0.625,love.graphics.getHeight()*0.45,0,1.5,1.5,self.player_leeks[3]:getWidth()/2,self.player_leeks[3]:getHeight()/2)
	love.graphics.draw(self.player_leeks[4],love.graphics.getWidth()*0.875,love.graphics.getHeight()*0.45,0,1.5,1.5,self.player_leeks[4]:getWidth()/2,self.player_leeks[4]:getHeight()/2)
end
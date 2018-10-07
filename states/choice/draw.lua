return function(self)
  --background--
	love.graphics.setBackgroundColor(1,1,1)
	--player1--
	if self.players.player1.locked == 1 then
		love.graphics.setColor(0.5,0.5,0.5)
	end
	if self.light_up == 1 then
		love.graphics.setColor(1,1,1)
	end
	love.graphics.draw(self.wiosna_bg,love.graphics.getWidth()*0.125,love.graphics.getHeight()*0.5,0,0.5,0.5,self.wiosna_bg:getWidth()/2,self.wiosna_bg:getHeight()/2)
	love.graphics.setColor(1,1,1)
	
	if self.players.player1.locked == 1 then
		love.graphics.setColor(0,0,0)
	end
	if self.light_up == 1 then
		love.graphics.setColor(1,1,1)
	end
	love.graphics.draw(self.player_leeks[1],love.graphics.getWidth()*0.125,love.graphics.getHeight()*0.5,0,1.7,1.7,self.player_leeks[1]:getWidth()/2,self.player_leeks[1]:getHeight()/2)
	love.graphics.setColor(1,1,1)
	
	--player2--
	if self.players.player2.locked == 1 then
		love.graphics.setColor(0.5,0.5,0.5)
	end
	if self.light_up == 2 then
		love.graphics.setColor(1,1,1)
	end
	love.graphics.draw(self.lato_bg,love.graphics.getWidth()*0.375,love.graphics.getHeight()*0.5,0,0.5,0.5,self.lato_bg:getWidth()/2,self.lato_bg:getHeight()/2)
	love.graphics.setColor(1,1,1)
	
	if self.players.player2.locked == 1 then
		love.graphics.setColor(0,0,0)
	end
	if self.light_up == 2 then
		love.graphics.setColor(1,1,1)
	end
	love.graphics.draw(self.player_leeks[2],love.graphics.getWidth()*0.375,love.graphics.getHeight()*0.5,0,1.7,1.7,self.player_leeks[2]:getWidth()/2,self.player_leeks[2]:getHeight()/2)
	love.graphics.setColor(1,1,1)
	
	--player3--
	if self.players.player3.locked == 1 then
		love.graphics.setColor(0.5,0.5,0.5)
	end
	if self.light_up == 3 then
		love.graphics.setColor(1,1,1)
	end
	love.graphics.draw(self.jesien_bg,love.graphics.getWidth()*0.625,love.graphics.getHeight()*0.5,0,0.5,0.5,self.jesien_bg:getWidth()/2,self.jesien_bg:getHeight()/2)
	love.graphics.setColor(1,1,1)
	
	if self.players.player3.locked == 1 then
		love.graphics.setColor(0,0,0)
	end
	if self.light_up == 3 then
		love.graphics.setColor(1,1,1)
	end
	love.graphics.draw(self.player_leeks[3],love.graphics.getWidth()*0.625,love.graphics.getHeight()*0.5,0,1.7,1.7,self.player_leeks[3]:getWidth()/2,self.player_leeks[3]:getHeight()/2)
	love.graphics.setColor(1,1,1)
	
	--player4--
	if self.players.player4.locked == 1 then
		love.graphics.setColor(0.5,0.5,0.5)
	end
	if self.light_up == 4 then
		love.graphics.setColor(1,1,1)
	end
	love.graphics.draw(self.zima_bg,love.graphics.getWidth()*0.875,love.graphics.getHeight()*0.5,0,0.5,0.5,self.zima_bg:getWidth()/2,self.zima_bg:getHeight()/2)
	love.graphics.setColor(1,1,1)
	
	if self.players.player4.locked == 1 then
		love.graphics.setColor(0,0,0)
	end
	if self.light_up == 4 then
		love.graphics.setColor(1,1,1)
	end
	love.graphics.draw(self.player_leeks[4],love.graphics.getWidth()*0.875,love.graphics.getHeight()*0.5,0,1.7,1.7,self.player_leeks[4]:getWidth()/2,self.player_leeks[4]:getHeight()/2)
	love.graphics.setColor(1,1,1)
	
	--ramka--
	love.graphics.draw(self.choice_bg, 0, 0)
  --buttons--
	love.graphics.setColor(1, 1, 1, self.transparency[1])
	love.graphics.draw(self.buttons[1],love.graphics.getWidth()*0.125+10,(love.graphics.getHeight()*0.6)+300,0,0.5,0.5,self.buttons[1]:getWidth()/2,self.buttons[1]:getHeight()/2)
	love.graphics.setColor(1, 1, 1, self.transparency[2])
	love.graphics.draw(self.buttons[2],love.graphics.getWidth()*0.375+10,(love.graphics.getHeight()*0.6)+300,0,0.5,0.5,self.buttons[2]:getWidth()/2,self.buttons[2]:getHeight()/2)
	love.graphics.setColor(1, 1, 1, self.transparency[3])
	love.graphics.draw(self.buttons[3],love.graphics.getWidth()*0.625+10,(love.graphics.getHeight()*0.6)+300,0,0.5,0.5,self.buttons[3]:getWidth()/2,self.buttons[3]:getHeight()/2)
	love.graphics.setColor(1, 1, 1, self.transparency[4])
	love.graphics.draw(self.buttons[4],love.graphics.getWidth()*0.875 +10,(love.graphics.getHeight()*0.6)+300,0,0.5,0.5,self.buttons[4]:getWidth()/2,self.buttons[4]:getHeight()/2)
	love.graphics.setColor(1, 1, 1, 1)
  --player_number--
	love.graphics.setFont(self.font_bigger)
	love.graphics.setColor(lume.color("#623d2b"))
	love.graphics.printf("PLAYER 1",(love.graphics.getWidth()*0.125)-120,(love.graphics.getHeight()*0.45)-350,250,"center")
	love.graphics.printf("PLAYER 2",(love.graphics.getWidth()*0.375)-120,(love.graphics.getHeight()*0.45)-350,250,"center")
	love.graphics.printf("PLAYER 3",(love.graphics.getWidth()*0.625)-120,(love.graphics.getHeight()*0.45)-350,250,"center")
	love.graphics.printf("PLAYER 4",(love.graphics.getWidth()*0.875)-120,(love.graphics.getHeight()*0.45)-350,250,"center")
	love.graphics.setColor(1,1,1)
	
end
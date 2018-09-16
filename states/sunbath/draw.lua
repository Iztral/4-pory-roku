return function(self)
	--background--
    love.graphics.draw(self.sand,0,0)
	--score--
	love.graphics.setFont(self.font_small)
	love.graphics.setColor(0,0,0)
	love.graphics.printf(string.format("%.0f", self.players.player1.player_score or 0),0,50,love.graphics.getWidth()*0.25,"center")
	love.graphics.printf(string.format("%.0f", self.players.player2.player_score or 0),love.graphics.getWidth()*0.25,50,love.graphics.getWidth()*0.25,"center")
	love.graphics.printf(string.format("%.0f", self.players.player3.player_score or 0),love.graphics.getWidth()*0.5,50,love.graphics.getWidth()*0.25,"center")
	love.graphics.printf(string.format("%.0f", self.players.player4.player_score or 0),love.graphics.getWidth()*0.75,50,love.graphics.getWidth()*0.25,"center")
	love.graphics.setColor(1,1,1)
	--towel--
	love.graphics.draw(self.towel1,love.graphics.getWidth()*0.125,love.graphics.getHeight()*0.45,0,0.8,0.8,self.towel1:getWidth()/2,self.towel1:getHeight()/2)
	love.graphics.draw(self.towel2,love.graphics.getWidth()*0.375,love.graphics.getHeight()*0.45,0,0.8,0.8,self.towel2:getWidth()/2,self.towel2:getHeight()/2)
	love.graphics.draw(self.towel3,love.graphics.getWidth()*0.625,love.graphics.getHeight()*0.45,0,0.8,0.8,self.towel3:getWidth()/2,self.towel3:getHeight()/2)
	love.graphics.draw(self.towel4,love.graphics.getWidth()*0.875,love.graphics.getHeight()*0.45,0,0.8,0.8,self.towel4:getWidth()/2,self.towel4:getHeight()/2)
	--leek--
	love.graphics.draw(self.wiosna_main,love.graphics.getWidth()*0.125,love.graphics.getHeight()*0.45,0,0.5,0.5,self.wiosna_main:getWidth()/2,self.wiosna_main:getHeight()/2)
	love.graphics.draw(self.lato_main,love.graphics.getWidth()*0.375,love.graphics.getHeight()*0.45,0,0.5,0.5,self.lato_main:getWidth()/2,self.lato_main:getHeight()/2)
	love.graphics.draw(self.jesien_main,love.graphics.getWidth()*0.625,love.graphics.getHeight()*0.45,0,0.5,0.5,self.jesien_main:getWidth()/2,self.jesien_main:getHeight()/2)
	love.graphics.draw(self.zima_main,love.graphics.getWidth()*0.875,love.graphics.getHeight()*0.45,0,0.5,0.5,self.zima_main:getWidth()/2,self.zima_main:getHeight()/2)
	--leek mask--
	love.graphics.setColor(1,1,1,self.players.player1.alfa)
	love.graphics.draw(self.mask_wiosna,love.graphics.getWidth()*0.125,love.graphics.getHeight()*0.45,0,0.5,0.5,self.mask_wiosna:getWidth()/2,self.mask_wiosna:getHeight()/2)
	love.graphics.setColor(1,1,1,self.players.player2.alfa)
	love.graphics.draw(self.mask_lato,love.graphics.getWidth()*0.375,love.graphics.getHeight()*0.45,0,0.5,0.5,self.mask_lato:getWidth()/2,self.mask_lato:getHeight()/2)
	love.graphics.setColor(1,1,1,self.players.player3.alfa)
	love.graphics.draw(self.mask_jesien,love.graphics.getWidth()*0.625,love.graphics.getHeight()*0.45,0,0.5,0.5,self.mask_jesien:getWidth()/2,self.mask_jesien:getHeight()/2)
	love.graphics.setColor(1,1,1,self.players.player4.alfa)
	love.graphics.draw(self.mask_zima,love.graphics.getWidth()*0.875,love.graphics.getHeight()*0.45,0,0.5,0.5,self.mask_zima:getWidth()/2,self.mask_zima:getHeight()/2)
	love.graphics.setColor(1,1,1,1)
	--arrow clock--
	love.graphics.draw(self.arrow,love.graphics.getWidth()*0.5,love.graphics.getHeight()*0.8,0,self.turn_direction*0.9,0.9,self.arrow:getWidth()/2,self.arrow:getHeight()/2)
	--timer--
	love.graphics.setFont(self.font_big)
	love.graphics.draw(self.clock,love.graphics.getWidth()*0.5,10,0,0.3,0.3,self.clock:getWidth()/2,self.clock:getHeight()/100)
	love.graphics.setColor(0,0,0)
	love.graphics.printf(string.format("%.0f", self.timer or 0),0, 75, love.graphics.getWidth(),"center")
	love.graphics.setColor(1,1,1)
	--debug--
end

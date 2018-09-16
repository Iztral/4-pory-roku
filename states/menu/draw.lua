return function(self)

	self.scalex = love.graphics.getWidth()/3840
	self.scaley = love.graphics.getHeight()/2160
	--background--
	love.graphics.draw(self.menu_bck,0,0, 0, self.scalex,self.scaley)
	love.graphics.draw(self.menu_main,0,0, 0, self.scalex,self.scaley)
	--boards--
	love.graphics.draw(self.tytul, 900, 200, 0,self.scalex,self.scaley)
	love.graphics.draw(self.logo, 1000, 200,0,0.6,0.6)
	love.graphics.draw(self.start, 1200, 500,0,self.scalex,self.scaley,self.start:getWidth()/2,self.start:getHeight()/2)
	love.graphics.setFont(self.font)
	love.graphics.print("START", 1150, 475)
	love.graphics.draw(self.wyjscie, 1200, 625,0,self.scalex,self.scaley,self.wyjscie:getWidth()/2,self.wyjscie:getHeight()/2)
	love.graphics.print("WYJŚCIE", 1125, 600)
end
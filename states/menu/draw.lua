return function(self)

	self.scalex = love.graphics.getWidth()/3840
	self.scaley = love.graphics.getHeight()/2160
	--background--
	love.graphics.draw(self.menu_bck,0,0, 0, self.scalex,self.scaley)
	love.graphics.draw(self.menu_main,0,0, 0, self.scalex,self.scaley)
	--boards--
	love.graphics.draw(self.tytul, 900, 200, 0,self.scalex,self.scaley)
	love.graphics.draw(self.logo, 1000, 200,0,0.6,0.6)
	love.graphics.draw(self.start, 1200, 300,0,self.scalex,self.scaley)
	love.graphics.print("START", 1200, 300)
	love.graphics.draw(self.wyjscie, 600, 1000,0,self.scalex,self.scaley)
	love.graphics.print("WYJSCIE", 600, 1000)
end
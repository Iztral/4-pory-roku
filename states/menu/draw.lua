return function(self)
	--background--
	love.graphics.draw(self.menu_main,0,0)
	--boards--
	love.graphics.draw(self.na_tytul, 600, 600)
	love.graphics.draw(self.logopng, 600, 600)
	love.graphics.draw(self.na_start, 600, 800)
	love.graphics.printf("START", 600, 800)
	love.graphics.draw(self.na_wyjscie, 600, 1000)
	love.graphics.printf("WYJSCIE", 600, 1000)
end
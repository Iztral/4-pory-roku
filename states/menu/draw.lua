return function(self)
	self.scalex = love.graphics.getWidth() / 3840
	self.scaley = love.graphics.getHeight() / 2160

	--background--
	love.graphics.draw(self.menu_bck, 0, 0, 0, self.scalex,self.scaley)
	love.graphics.draw(self.menu_main, 0, 0, 0, self.scalex,self.scaley)

    local bgLine = 0.75 * love.graphics.getWidth()

    local logoHeight = 300
    local startHeight = 670
    local wyjscieHeight = 725

	--boards--
	love.graphics.draw(self.tytul, bgLine, logoHeight, 0, self.scalex,self.scaley, self.tytul:getWidth() / 2, self.tytul:getHeight() / 2)
	love.graphics.draw(self.logo, bgLine, logoHeight, 0, 0.6, 0.6, self.logo:getWidth() / 2, self.logo:getHeight() / 2)
	love.graphics.draw(self.start, bgLine, startHeight,0,self.scalex,self.scaley,self.start:getWidth()/2,self.start:getHeight()/2)
    -- love.graphics.draw(self.wyjscie, bgLine, wyjscieHeight,0,self.scalex,self.scaley,self.wyjscie:getWidth()/2,self.wyjscie:getHeight()/2)
	if self.start_timer < 2 and self.start_timer > 1 then
		love.graphics.setFont(self.font)
	end
	if self.start_timer < 1 and self.start_timer > 0 then
		love.graphics.setFont(self.font_bigger)
	end
	love.graphics.printf("PRESS START", bgLine - self.start:getWidth() / 2, startHeight - self.font:getHeight() / 2, self.start:getWidth(), "center")
	-- love.graphics.printf("WYJŚCIE", bgLine - self.wyjscie:getWidth() / 2, wyjscieHeight - self.font:getHeight() / 2, self.wyjscie:getWidth(), "center")

    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(self.bottomLogo, bgLine, love.graphics.getHeight() - 16, 0, 0.2, 0.2, self.bottomLogo:getWidth() / 2, self.bottomLogo:getHeight())
end

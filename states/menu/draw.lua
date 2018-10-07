return function(self)
    self.scalex = lg.getWidth() / 3840
    self.scaley = lg.getHeight() / 2160

    --background--
    lg.draw(self.menu_bck, 0, 0, 0, self.scalex,self.scaley)
    lg.draw(self.menu_main, 0, 0, 0, self.scalex,self.scaley)

    local bgLine = 0.75 * lg.getWidth()

    local logoHeight = 300
    local startHeight = 670
    local wyjscieHeight = 725

    --boards--
    lg.draw(self.tytul, bgLine, logoHeight, 0, self.scalex,self.scaley, self.tytul:getWidth() / 2, self.tytul:getHeight() / 2)
    lg.draw(self.logo, bgLine, logoHeight, 0, 0.6, 0.6, self.logo:getWidth() / 2, self.logo:getHeight() / 2)
    
    -- press start board
    local startBoardScale = 1 + 0.05 * math.abs(math.sin(2 * self.startBoardTimer))
    lg.push()
    lg.translate(bgLine, startHeight)
    lg.scale(startBoardScale)
    lg.translate(-bgLine, -startHeight)

    lg.setFont(self.font)
    lg.draw(self.start, bgLine, startHeight,0,self.scalex,self.scaley,self.start:getWidth()/2,self.start:getHeight()/2)
    lg.printf("PRESS START", bgLine - self.start:getWidth() / 2, startHeight - self.font:getHeight() / 2, self.start:getWidth(), "center")
    lg.pop()

    -- lg.draw(self.wyjscie, bgLine, wyjscieHeight,0,self.scalex,self.scaley,self.wyjscie:getWidth()/2,self.wyjscie:getHeight()/2)
    -- lg.printf("WYJŚCIE", bgLine - self.wyjscie:getWidth() / 2, wyjscieHeight - self.font:getHeight() / 2, self.wyjscie:getWidth(), "center")

    lg.setColor(1, 1, 1)
    lg.draw(self.bottomLogo, bgLine, lg.getHeight() - 16, 0, 0.2, 0.2, self.bottomLogo:getWidth() / 2, self.bottomLogo:getHeight())
end

return {
    init = function(self)
		love.audio.stop()
		self.polka = love.audio.newSource("mp3/polka.mp3","stream")
		self.polka:setLooping(true)
		self.polka:play()
		
        self.podiumBackground = love.graphics.newImage("img/podium.jpg")

        self.fullImages = {
            ["player1"] = love.graphics.newImage("img/full/wiosna.png"),
            ["player2"] = love.graphics.newImage("img/full/lato.png"),
            ["player3"] = love.graphics.newImage("img/full/jesien.png"),
            ["player4"] = love.graphics.newImage("img/full/zima.png")
        }

        self.standingsPositions = {
            {x = 943,  y = 399},
            {x = 660,  y = 540},
            {x = 1239, y = 639},
            {x = 913,  y = 762},
        }
    end,

    draw = function(self)
        love.graphics.setColor(1, 1, 1)
        love.graphics.draw(self.podiumBackground, 0, 0)

        for standingIndex, standingData in pairs(standings) do
            love.graphics.setColor(1, 1, 1)
            local currentStanding = self.standingsPositions[standingIndex]
            local fullImage = self.fullImages["player" .. standingData.index]
            love.graphics.draw(fullImage, currentStanding.x, currentStanding.y, 0, 1, 1, fullImage:getWidth() / 2, fullImage:getHeight() - 15)
        end
    end
}

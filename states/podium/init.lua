return {
    init = function(self)
        love.audio.stop()
        self.polka = assets.music.polka
        self.polka:setLooping(true)
        self.polka:play()
        
        self.podiumBackground = assets.podium.podium_bg

        self.fullImages = {
            ["player1"] = assets.full.wiosna,
            ["player2"] = assets.full.lato,
            ["player3"] = assets.full.jesien,
            ["player4"] = assets.full.zima,
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

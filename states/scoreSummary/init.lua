return {
    init = function(self)
        self.scores = {}

        self.font = love.graphics.newFont(48)
        self.fontHeight = self.font:getHeight()
    end,

    enter = function(self, current, playerKeys)
        for playerPosition, playerKey in pairs(playerKeys) do
            local numericPlayerKey = playerKey:gsub("%D+", "")
            self.scores[numericPlayerKey] = (self.scores[numericPlayerKey] or 0) + lume.count(playerKeys) + 1 - playerPosition
        end
    end,

    draw = function(self)
        love.graphics.setColor(1, 1, 1)
        love.graphics.setFont(self.font)

        local sortedScores = lume.sort(self.scores, function(a, b) return a > b end)

        local i = 1

        for playerIndex, score in pairs(sortedScores) do
            love.graphics.printf("Por " .. playerIndex, love.graphics.getWidth() * 0.25, love.graphics.getHeight() * (0.25 * i - 0.125) - self.fontHeight * 0.5, love.graphics.getWidth() * 0.5, "left")
            love.graphics.printf(score, love.graphics.getWidth() * 0.25, love.graphics.getHeight() * (0.25 * i - 0.125) - self.fontHeight * 0.5, love.graphics.getWidth() * 0.5, "right")

            i = i + 1
        end
    end
}

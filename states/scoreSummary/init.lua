return {
    init = function(self)
        self.scores = {}
        self.addScores = {}

        self.font = love.graphics.newFont(48)
        self.fontHeight = self.font:getHeight()

        self.fontSmall = love.graphics.newFont(32)
        self.fontSmallHeight = self.fontSmall:getHeight()
    end,

    enter = function(self, current, playerKeys)
        for playerPosition, playerKey in pairs(playerKeys) do
            local numericPlayerKey = playerKey:gsub("%D+", "")
            self.addScores[numericPlayerKey] = lume.count(playerKeys) + 1 - playerPosition
            self.scores[numericPlayerKey] = (self.scores[numericPlayerKey] or 0) + self.addScores[numericPlayerKey]
        end

        timer.after(5, function()
            competitionOrderIndex = competitionOrderIndex + 1
            if competitionOrder[competitionOrderIndex] then
                gamestate.switch(states[competitionOrder[competitionOrderIndex]])
            else
                love.event.quit()
            end
        end)
    end,

    draw = function(self)
        love.graphics.setColor(1, 1, 1)

        local keyedScores = {}

        for scoreIndex, score in pairs(self.scores) do
            table.insert(keyedScores, {
                index = scoreIndex,
                score = score,
                addScore = self.addScores[scoreIndex]
            })
        end

        local sortedScores = lume.sort(keyedScores, function(a, b) return a.score > b.score end)

        local i = 1

        for _, scoreData in pairs(sortedScores) do
            love.graphics.setFont(self.font)
            love.graphics.printf("Por " .. scoreData.index, love.graphics.getWidth() * 0.25, love.graphics.getHeight() * (0.25 * i - 0.125) - self.fontHeight * 0.5, love.graphics.getWidth() * 0.4, "left")
            love.graphics.printf(scoreData.score, love.graphics.getWidth() * 0.25, love.graphics.getHeight() * (0.25 * i - 0.125) - self.fontHeight * 0.5, love.graphics.getWidth() * 0.4, "right")

            love.graphics.setFont(self.fontSmall)
            love.graphics.printf("+" .. scoreData.addScore, love.graphics.getWidth() * 0.25, love.graphics.getHeight() * (0.25 * i - 0.125) - self.fontSmallHeight * 0.5, love.graphics.getWidth() * 0.5, "right")

            i = i + 1
        end
    end
}

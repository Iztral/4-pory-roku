return {
    init = function(self)
        self.scores = {}
        self.addScores = {}

        self.font = assets.font.caviarDreams_48
        self.fontHeight = self.font:getHeight()

        self.fontSmall = assets.font.caviarDreams_32
        self.fontSmallHeight = self.fontSmall:getHeight()

        self.background = assets.summary.summary_bg

        self.avatars = {
            player1 = assets.avatars.awatar_wiosna,
            player2 = assets.avatars.awatar_lato,
            player3 = assets.avatars.awatar_jesien,
            player4 = assets.avatars.awatar_zima,
        }
    end,

    enter = function(self, current, playerKeys)
        for playerPosition, playerKey in pairs(playerKeys) do
            local numericPlayerKey = playerKey:gsub("%D+", "")
            self.addScores[numericPlayerKey] = lume.count(playerKeys) + 1 - playerPosition
            self.scores[numericPlayerKey] = (self.scores[numericPlayerKey] or 0) + self.addScores[numericPlayerKey]
        end

        timer.after(5, function()
            competitionOrderIndex = competitionOrderIndex + 1
            if competitionOrder[competitionOrderIndex] and competitionOrderIndex < 5 then
                gamestate.switch(states.stateswitcher, self, states.tutorial)
			elseif competitionOrder[5] then
				gamestate.switch(states.stateswitcher, self, states.podium)
            else
                love.event.quit()
            end
        end)
    end,

    draw = function(self)
        love.graphics.setBackgroundColor(20.4 / 100, 9.4 / 100, 8.2 / 100)
        love.graphics.setColor(1, 1, 1)

        love.graphics.draw(self.background, love.graphics.getWidth() * 0.5, love.graphics.getHeight() * 0.5, 0, 1, 1, self.background:getWidth() * 0.5, self.background:getHeight() * 0.5)

        local keyedScores = {}

        for scoreIndex, score in pairs(self.scores) do
            table.insert(keyedScores, {
                index = scoreIndex,
                score = score,
                addScore = self.addScores[scoreIndex]
            })
        end

        local sortedScores = lume.sort(keyedScores, function(a, b) return a.score > b.score end)

        standings = sortedScores

        local i = 1

        local startingHeight = love.graphics.getHeight() * 0.5 - 284
        local containerHeight = 726

        for position, scoreData in pairs(sortedScores) do
            local scaleModifier = (function() if position == 1 then return 0.5 else return 0.35 end end)()
            love.graphics.setFont(self.font)
            love.graphics.printf(position .. ". Por " .. scoreData.index, love.graphics.getWidth() * 0.25, startingHeight + containerHeight * (0.25 * i - 0.125) - self.fontHeight * 0.5, love.graphics.getWidth() * 0.3, "left")
            love.graphics.printf(scoreData.score, love.graphics.getWidth() * 0.25, startingHeight + containerHeight * (0.25 * i - 0.125) - self.fontHeight * 0.5, love.graphics.getWidth() * 0.3, "right")

            love.graphics.setFont(self.fontSmall)
            love.graphics.printf("+" .. scoreData.addScore, love.graphics.getWidth() * 0.25, startingHeight + containerHeight * (0.25 * i - 0.125) - self.fontSmallHeight * 0.5, love.graphics.getWidth() * 0.4, "right")

            love.graphics.setColor(1, 1, 1)

            local avatar = self.avatars["player" .. scoreData.index]

            love.graphics.draw(avatar, love.graphics.getWidth() * 0.5 + self.background:getWidth() * 0.5 - 160, startingHeight + containerHeight * (0.25 * i - 0.125), 0, scaleModifier, scaleModifier, avatar:getWidth() * 0.5, avatar:getHeight() * 0.5)

            i = i + 1
        end

        love.graphics.setFont(self.font)
        love.graphics.printf(
            "Pora na najlepszego pora",
            love.graphics.getWidth() * 0.5 - self.background:getWidth() * 0.5 + 32,
            love.graphics.getHeight() * 0.5 - self.background:getHeight() * 0.5 + 64 - self.fontHeight * 0.5,
            self.background:getWidth() - 32 * 2,
            "left"
        )
    end
}

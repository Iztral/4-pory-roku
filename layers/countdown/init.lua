return {
    init = function(self)
        self.startTimer = 3
        self.goTimer = nil
        self.startTimerActive = false
        self.startTimerFinished = false
        self.startTimerXPosition = lg.getWidth() * 0.75

        timer.tween(1, self, {startTimerXPosition = 0}, "out-quart", function()
            self.startTimerActive = true
        end)

        self.fnt = assets.font.caviarDreamsBold_128

        return self
    end,

    draw = function(self)
        if not self.startTimerFinished then
            local timerText, timerTextScale
            if self.goTimer == nil then
                timerText = string.format("%d", math.ceil(self.startTimer))
                timerTextScale = self.startTimer - math.floor(self.startTimer)
            else
                timerText = "GO!"
                timerTextScale = self.goTimer - math.floor(self.goTimer)
            end

            lg.push()
            if self.startTimerActive then
                lg.translate(lg.getWidth() * 0.5, lg.getHeight() * 0.5)
                lg.scale(timerTextScale)
                lg.translate(-lg.getWidth() * 0.5, -lg.getHeight() * 0.5)
            end
            lg.setColor(0, 0, 0)
            lg.setFont(self.fnt)
            lg.printf(
                timerText,
                self.startTimerXPosition,
                lg.getHeight() * 0.5 - self.fnt:getHeight() * 0.5,
                lg.getWidth(),
                "center",
                0
            )
            lg.pop()
        end
    end,

    update = function(self, dt)
        if self.startTimerActive and not self.startTimerFinished then
            if self.goTimer == nil then
                self.startTimer = self.startTimer - dt
                if self.startTimer <= 0 then
                    signal.emit("countdown layer: go")
                    self.goTimer = 1
                end
            else
                self.goTimer = self.goTimer - dt
                if self.goTimer <= 0 then
                    self.startTimerFinished = true
                end
            end
        end
    end
}
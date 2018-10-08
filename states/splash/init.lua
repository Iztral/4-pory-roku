return {
    enter = function(self)
        self.axePosition = 1.5 * lg.getWidth()
        self.axeRotation = 8 * math.pi

        self.startTimer = 0.5
        self.animationStarted = false

        self.alphaTopor = 1
        self.alphaLogo = 0
    end,

    draw = function(self)
        lg.setColor(1, 1, 1, self.alphaTopor)
        local topor = assets.logo.logo_topory_topor
        lg.draw(topor, self.axePosition, lg.getHeight() * 0.5, self.axeRotation, 1, 1, topor:getWidth() / 2, topor:getHeight() / 2)

        lg.setColor(1, 1, 1, self.alphaLogo)
        local logo = assets.logo.logo_topory_compact
        lg.draw(logo, lg.getWidth() * 0.5, lg.getHeight() * 0.5, 0, 1, 1, logo:getWidth() / 2, logo:getHeight() / 2)
    end,

    update = function(self, dt)
        if not self.animationStarted then
            self.startTimer = self.startTimer - dt

            if self.startTimer <= 0 then
                self.animationStarted = true
                timer.tween(1.5, self, {
                    axePosition = 0.5 * lg.getWidth() + assets.logo.logo_topory_topor:getWidth() * 0.5 - assets.logo.logo_topory_compact:getWidth() * 0.5,
                    axeRotation = 0
                }, "linear", function()
                    timer.tween(2, self, {
                        alphaLogo = 1
                    }, "linear", function()
                        timer.after(2, function()
                            timer.tween(1, self, {
                                alphaLogo = 0,
                                alphaTopor = 0,
                            }, "linear", function()
                                gamestate.switch(states.stateswitcher, self, states.menu)
                            end)
                        end)
                    end)
                end)
            end
        end
    end
}
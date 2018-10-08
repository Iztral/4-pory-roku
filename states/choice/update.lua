local vibrateJoystick = function(joystick)
    if joystick then
        joystick:setVibration(1, 1, 1)
    end
end

return function(self, dt)
    for index, player in pairs(self.players) do
        self:player_update(player, dt)

        player.highlighted = index == self.highlightIndex
    end

    if not self.roundStarting then
        if lume.count(self.players, "locked") == 4 then
            self.roundStarting = true

            timer.after(1, function()
                self.highlightIndex = self.highlightIndex + 1
                vibrateJoystick(self.players[self.highlightIndex].controls.config.joystick)
                timer.every(2, function()
                    self.highlightIndex = self.highlightIndex + 1

                    if self.highlightIndex >= 5 then
                        timer.after(1, function()
                            love.audio.stop()
                            gamestate.switch(states.stateswitcher, self, states.tutorial)
                        end)
                    else
                        vibrateJoystick(self.players[self.highlightIndex].controls.config.joystick)
                    end
                end, 4)
            end)
        end
    end
end


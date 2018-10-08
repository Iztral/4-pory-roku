return function(self)
    --background--
    lg.setColor(1, 1, 1)
    lg.draw(self.sand,0,0)

    --leek--
    lg.setFont(self.font_small)
    for i = 1, 4 do
        local player = self.players["player" .. i]
        local width = ((i - 1) * 0.25 + 0.125) * lg.getWidth()
        local scoreWidth = ((i - 1) * 0.25) * lg.getWidth()

        local currentFrame = player.frames[player.currentFrameIndex]
        local currentMaskFrame = player.masks[player.currentFrameIndex]

        lg.setColor(0, 0, 0)
        lg.printf("PLAYER " .. i, scoreWidth, 50, 0.25 * lg.getWidth(), "center")
        lg.printf(string.format("%d pts", player.player_score), scoreWidth, 100, 0.25 * lg.getWidth(), "center")

        lg.setColor(1, 1, 1)
        lg.draw(player.towel, width, lg.getHeight()*0.45, 0, 0.8, 0.8, player.towel:getWidth() / 2, player.towel:getHeight() / 2)
        lg.draw(currentFrame, width, lg.getHeight()*0.45, 0, 0.5, 0.5, currentFrame:getWidth() / 2, currentFrame:getHeight() / 2)

        lg.setColor(1, 1, 1, player.alfa)
        lg.draw(currentMaskFrame, width, lg.getHeight()*0.45, 0, 0.5, 0.5, currentMaskFrame:getWidth() / 2, currentMaskFrame:getHeight() / 2)

        -- rotation bars
        lg.setColor(1, 1, 1)
        local maxAngleShift = 0.95 * 0.5 * assets.sunbath.bar_bg:getWidth()
        lg.draw(assets.sunbath.bar_bg, width, lg.getHeight() * 0.8, 0, 1, 1, assets.sunbath.bar_bg:getWidth() * 0.5, assets.sunbath.bar_bg:getHeight() * 0.5)
        lg.draw(
            assets.sunbath.bar_perfect_angle,
            width + player.currentPerfectAngle * maxAngleShift / 25,
            lg.getHeight() * 0.8,
            0,
            1,
            1,
            assets.sunbath.bar_perfect_angle:getWidth() * 0.5,
            assets.sunbath.bar_perfect_angle:getHeight() * 0.5
        )
        lg.draw(
            assets.sunbath.bar_current_angle,
            width + player.angle_difference * maxAngleShift / 25,
            lg.getHeight() * 0.8,
            0,
            1,
            1,
            assets.sunbath.bar_current_angle:getWidth() * 0.5,
            assets.sunbath.bar_current_angle:getHeight() * 0.5
        )

        -- rotation arrows
        local leftArrow, rightArrow = assets.sunbath.bar_arrow_empty, assets.sunbath.bar_arrow_full
        local leftColor, rightColor = {0.7, 0.7, 0.7, 0.4}, {1, 1, 1}
        if player.currentPerfectAngle < 0 then
            leftArrow, rightArrow = assets.sunbath.bar_arrow_full, assets.sunbath.bar_arrow_empty
            leftColor, rightColor = {1, 1, 1}, {0.7, 0.7, 0.7, 0.4}
        end

        lg.setColor(leftColor)
        lg.draw(leftArrow, width - maxAngleShift * 0.5, lg.getHeight() * 0.8 - assets.sunbath.bar_bg:getHeight() * 0.5, 0, -1, 1, leftArrow:getWidth() * 0.5, leftArrow:getHeight())
        lg.setColor(rightColor)
        lg.draw(rightArrow, width + maxAngleShift * 0.5, lg.getHeight() * 0.8 - assets.sunbath.bar_bg:getHeight() * 0.5, 0, 1, 1, rightArrow:getWidth() * 0.5, rightArrow:getHeight())

        -- thermometer
        local thermoImgScale = 48 / assets.sunbath.thermo_bg:getWidth()
        lg.setColor(1, 1, 1)

        local thermoScissorHeight = assets.sunbath.thermo_fg:getHeight() * thermoImgScale * player.alfa

        lg.setScissor(
            width + 0.125 * 0.75 * lg.getWidth() - assets.sunbath.thermo_fg:getWidth() * 0.5 * thermoImgScale,
            lg.getHeight() * 0.45 - assets.sunbath.thermo_fg:getHeight() * 0.5 * thermoImgScale + (assets.sunbath.thermo_fg:getHeight() * thermoImgScale - thermoScissorHeight),
            assets.sunbath.thermo_fg:getWidth() * thermoImgScale,
            thermoScissorHeight
        )
        lg.draw(
            assets.sunbath.thermo_fg,
            width + 0.125 * 0.75 * lg.getWidth(),
            lg.getHeight() * 0.45,
            0,
            thermoImgScale,
            thermoImgScale,
            assets.sunbath.thermo_fg:getWidth() * 0.5,
            assets.sunbath.thermo_fg:getHeight() * 0.5
        )
        lg.setScissor()

        lg.draw(
            assets.sunbath.thermo_bg,
            width + 0.125 * 0.75 * lg.getWidth(),
            lg.getHeight() * 0.45,
            0,
            thermoImgScale,
            thermoImgScale,
            assets.sunbath.thermo_bg:getWidth() * 0.5,
            assets.sunbath.thermo_bg:getHeight() * 0.5
        )
    end

    --timer--
    if self.gameStarted then
        lg.setColor(1, 1, 1)
        lg.setFont(self.font_big)
        lg.draw(self.clock,lg.getWidth()*0.5,10,0,0.3,0.3,self.clock:getWidth()/2,self.clock:getHeight()/100)
        lg.setColor(0, 0, 0)
        lg.printf(string.format("%d", self.timer or 0),0, 75, lg.getWidth(),"center")
    end
    
    self.countdown:draw()
end

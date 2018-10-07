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

        local w = 8
        lg.setColor(0, 0, 1)
        lg.rectangle("fill", width + 2 * player.currentPerfectAngle - w / 2, lg.getHeight() * 0.8 - w * 2, w, w * 4)
        lg.setColor(1, 0, 0)
        lg.rectangle("fill", width + 2 * player.angle_difference - w / 2, lg.getHeight() * 0.8 - w, w, w * 2)
        lg.setColor(0, 0, 0)
        lg.setLineWidth(2)
        lg.line(width, lg.getHeight() * 0.8 - 2 * w, width, lg.getHeight() * 0.8 + 2 * w)
        lg.rectangle("line", width - 60, lg.getHeight() * 0.8 - 2 * w, 120, 4 * w)

        --thermometer
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
    lg.setColor(1, 1, 1)
    lg.setFont(self.font_big)
    lg.draw(self.clock,lg.getWidth()*0.5,10,0,0.3,0.3,self.clock:getWidth()/2,self.clock:getHeight()/100)
    lg.setColor(0, 0, 0)
    lg.printf(string.format("%.0f", self.timer or 0),0, 75, lg.getWidth(),"center")
    --debug--
end

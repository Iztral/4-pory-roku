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
        lg.printf(string.format("%d", player.player_score), scoreWidth, 50, 0.25 * lg.getWidth(), "center")
        lg.printf(string.format("%.1f", player.currentPerfectAngle), scoreWidth, lg.getHeight() - 50, 0.25 * lg.getWidth(),"center")

        lg.setColor(1, 1, 1)
		lg.printf("PLAYER " .. i,width - 120, lg.getHeight()*0.1, 250, "center")
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
    end

    --arrow clock--
    lg.setColor(1,1,1)
    lg.draw(self.arrow,lg.getWidth()*0.5,lg.getHeight()*0.8,0,self.turn_direction*0.9,0.9,self.arrow:getWidth()/2,self.arrow:getHeight()/2)
    --timer--
    lg.setFont(self.font_big)
    lg.draw(self.clock,lg.getWidth()*0.5,10,0,0.3,0.3,self.clock:getWidth()/2,self.clock:getHeight()/100)
    lg.setColor(0,0,0)
    lg.printf(string.format("%.0f", self.timer or 0),0, 75, lg.getWidth(),"center")
    lg.setColor(1,1,1)
    --debug--
end

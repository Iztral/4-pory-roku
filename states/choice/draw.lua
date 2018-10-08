return function(self)
    lume.each(self.players, function(player)
        local zeroIndex = player.index - 1
        local width = (zeroIndex * 0.25 + 0.125) * lg.getWidth()
        local scoreWidth = zeroIndex * 0.25 * lg.getWidth()
        local bgElementScale = 0.25 * lg.getWidth() / player.bg:getWidth()

        lg.setColor(1, 1, 1)
        if player.locked and not player.highlighted then
            lg.setColor(0.3, 0.3, 0.3)
        end
        lg.draw(player.bg, scoreWidth, 0, 0, bgElementScale, bgElementScale)

        lg.setColor(1, 1, 1)
        if player.locked and not player.highlighted then
            lg.setColor(0, 0, 0)
        end
        lg.draw(player.fg, width, 0.5 * lg.getHeight(), 0, 1, 1, player.fg:getWidth() * 0.5, player.fg:getHeight() * 0.5)
        
        lg.setColor(lume.color("#623d2b"))
        if player.locked and not player.highlighted then
            lg.setColor(0, 0, 0)
        end
        lg.setFont(self.font_bigger)
        lg.printf("PLAYER " .. player.index, scoreWidth, lg.getHeight() * 0.25, 0.25 * lg.getWidth(), "center")

        if not player.locked then
            local confirmScale = 128 / assets.choice.confirm:getHeight()
            lg.setColor(1, 1, 1)
            lg.draw(
                assets.choice.confirm,
                width, 0.85 * lg.getHeight(),
                0,
                confirmScale,
                confirmScale,
                assets.choice.confirm:getWidth() * 0.5,
                assets.choice.confirm:getHeight() * 0.5
            )
        end
    end)
    
    lg.setColor(1, 1, 1)
    lg.draw(assets.choice.choice_bg, 0, 0)
end
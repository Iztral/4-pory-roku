return function(self)
    --background--
    lg.setColor(1, 1, 1)

    for bgIndex, bgShift in pairs(self.bgShifts) do
        local mirrorScaleModifier, mirrorShiftModifier

        if bgIndex == 1 then
            mirrorScaleModifier, mirrorShiftModifier = 1, 0
        else
            mirrorScaleModifier, mirrorShiftModifier = -1, 1
        end

        lg.draw(
            assets.race.race_bg,
            bgShift + assets.race.race_bg:getWidth() * self.raceBgScale * mirrorShiftModifier,
            0,
            0,
            mirrorScaleModifier * self.raceBgScale,
            self.raceBgScale
        )
    end

    -- finish line drawing
    lg.setColor(1, 1, 1)
    local finishX, finishY = self.finishLine:center()
    lg.draw(
        assets.race.meta,
        finishX,
        finishY,
        0,
        self.finishLine.finishLineScale,
        self.finishLine.finishLineScale,
        assets.race.meta:getWidth() * 0.5,
        assets.race.meta:getHeight() * 0.5
    )

    -- players & obstacles filtering
    local leftPlayers = lume.filter(self.players, function(player)
        return player.body ~= nil
    end)
    local leftObstacles = lume.filter(self.worldObstacles, function(obstacle)
        return not obstacle.toRemove
    end)

    local sprites = lume.concat(leftPlayers, leftObstacles)

    sprites = lume.sort(sprites, function(a, b)
        local aX, aY, bX, bY

        if a.body then aX, aY = a.body:center() end
        if b.body then bX, bY = b.body:center() end
        if a.data then aX, aY = a:center() end
        if b.data then bX, bY = b:center() end

        return aY < bY
    end)

    -- players & obstacles drawing
    lume.each(sprites, function(sprite)
        lg.setColor(1, 1, 1)
        
        local body

        if sprite.body and sprite.body.data.type == "player" then
            local player = sprite
            body = player.body

            local animation = player.animation
            if player.crashed then
                animation = player.animationEmptySled
            end

            local pX, pY = player.body:center()
            local fW, fH = animation:getDimensions()
            local animScale = 1.25 * player.playerWidth / fW
            animation:draw(player.gridImage, pX, pY, 0, animScale, animScale, fW / 2, fH - player.playerHeight / 2)
        elseif sprite.data and sprite.data.type == "obstacle" then
            body = sprite
            local obstacleType = sprite.data.id
            local oX, oY = sprite:center()
            local obstacleSprite = assets.race[obstacleType]
            local obstacleScale = 1 * sprite.width / obstacleSprite:getWidth()
            lg.draw(obstacleSprite, oX, oY, 0, obstacleScale, obstacleScale, obstacleSprite:getWidth() / 2, obstacleSprite:getHeight() - sprite.height / 2)
        end

        if isDebug then
            lg.setColor(0, 1, 0, 0.4)
            body:draw("fill")
        end
    end)

    -- race finished blinking label
    if self.finishBlinkTimer ~= nil then
        local blinkAlpha = self.finishBlinkTimer - math.floor(self.finishBlinkTimer)
        lg.setFont(assets.font.caviarDreamsBold_64)
        -- lg.setColor(0.82, 0.408, 0, blinkAlpha)
        lg.setColor(0, 0, 0, blinkAlpha)
        lg.printf("FINISH", 0, lg.getHeight() * 0.5 - assets.font.caviarDreamsBold_64:getHeight() * 0.5, lg.getWidth(), "center")
    end
end

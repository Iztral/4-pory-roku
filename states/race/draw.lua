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

    -- distance to finish
    local fnt = assets.font.caviarDreamsBold_48
    local distance = (finishX - lg.getWidth()) / 50
    if distance > 0 then
        lg.setColor(0, 0, 0)
        lg.setFont(fnt)
        lg.printf(string.format("Distance to finish: %dm", distance), 0, lg.getHeight() - 16 - fnt:getHeight(), lg.getWidth(), "center")
    end

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
            
            if player.crashed then
                player.animation:draw(player.gridImage, pX + player.crashPosition.x, pY + player.crashPosition.y, math.rad(player.crashRotation), animScale, animScale, fW / 2, fH - player.playerHeight / 2)
            end

            -- snow sled animation
            local sW, sH = player.snowAnimation:getDimensions()
            local snowAnimScale = 0.625 * player.playerWidth / sW
            local snowAnimation = player.snowAnimation
            if player.speed < 1 then
                snowAnimation = player.snowAnimationIdle
            end
            snowAnimation:draw(player.snowGridImage, pX - sW * snowAnimScale, pY, 0, snowAnimScale, snowAnimScale, sW / 2, sH - player.playerHeight / 2)

            -- player label drawing
            lg.setColor(0, 0, 0)
            lg.setFont(assets.font.caviarDreams_24)
            lg.printf("P" .. player.index, pX - 100, pY + 32, 200, "center")
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
        local fnt = assets.font.caviarDreamsBold_128
        lg.setFont(fnt)
        lg.setColor(0, 0, 0, blinkAlpha)
        lg.printf("FINISH", 0, lg.getHeight() * 0.5 - fnt:getHeight() * 0.5, lg.getWidth(), "center")

        --local labelShiftModifer = self.finishBlinkTimer / self.maxFinishBlinkTimer - 0.5
        --lg.printf("FINISH", 1.25 * lg.getWidth() * labelShiftModifer, lg.getHeight() * 0.5 - fnt:getHeight() * 0.5, lg.getWidth(), "center")
    end

    -- countdown timer
    self.countdown:draw()

    local positions = {"1st", "2nd", "3rd", "4th"}

    lume.each(self.players, function(player)
        -- player avatars
        local avatar = assets.avatars["awatar_" .. player.season]
        local avatarScale = 128 / avatar:getHeight()

        local finishShift = 0
        if player.crashed or player.finished or player.outOfBounds then
            finishShift = 64
        end

        if player.crashed or player.outOfBounds then
            lg.setShader(self.dqEffect)
        end

        lg.setColor(1, 1, 1)
        lg.draw(avatar, ((player.index - 1) * 0.25 + 0.125) * lg.getWidth() - finishShift, 16, 0, avatarScale, avatarScale, avatar:getWidth() * 0.5, 0)
        lg.setShader()

        lg.setColor(0, 0, 0)
        lg.setFont(assets.font.caviarDreams_24)
        lg.printf("PLAYER " .. player.index, (player.index - 1) * 0.25 * lg.getWidth(), 160, 0.25 * lg.getWidth(), "center")

        local finishText
        if player.crashed or player.outOfBounds then
            finishText = "DQ"
        elseif player.finished then
            finishText = positions[player.position or 1]
        end

        if finishText then
            lg.setFont(assets.font.caviarDreamsBold_24)
            lg.printf(finishText, ((player.index - 1) * 0.25 + 0.125) * lg.getWidth(), 80, 128, "center")
        end
    end)
end

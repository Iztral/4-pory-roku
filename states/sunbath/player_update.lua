return function(self,player,dt)
    player.controls:update(dt)
    player.perfectAngleTween:update(dt)

    local x, y = player.controls:get "move"
    
    if player.rotation_old == nil then
        player.rotation_old = vector(x, y):normalized()
    end

    player.rotation_new = vector(x, y):normalized()
    
    local newAngleDifference = math.deg(player.rotation_new:angleTo(player.rotation_old))
    
    if math.abs(newAngleDifference) >= 180 then
        -- very funny way to workaround very big angles while spinning the stick
        local tempRotOld = player.rotation_old:rotated(math.pi)
        local tempRotNew = player.rotation_new:rotated(math.pi)
        newAngleDifference = math.deg(tempRotNew:angleTo(tempRotOld))
    end

    --[[
    if player.season == "wiosna" then
        if player.maxAngle == nil or player.maxAngle < math.abs(player.angle_difference) then
            player.maxAngle = math.abs(player.angle_difference)
            print(player.maxAngle)
        end
    end
    ]]

    -- sampling and averaging angle differences
    local previousAngleSum = lume.reduce(player.previousAngles, function(a, b)
        return a + b
    end)

    local avgAngleDifference = previousAngleSum / lume.count(player.previousAngles)

    player.angle_difference = player.angle_difference + 3.25 * dt * (newAngleDifference - player.angle_difference) + (dt / 20) * previousAngleSum

    player.angle_difference = lume.clamp(player.angle_difference, -25, 25)

    table.insert(player.previousAngles, player.angle_difference)
    table.remove(player.previousAngles, 1)

    player.rotation_old = player.rotation_new

    player.angle = player.angle + player.angle_difference

    -- current frame change
    if math.abs(player.angle) >= 540 then
        local changeFrameDirection = -lume.sign(player.angle)

        player.currentFrameIndex = player.currentFrameIndex + changeFrameDirection

        if player.currentFrameIndex < 1 then
            player.currentFrameIndex = #player.masks
        end

        if player.currentFrameIndex > #player.masks then
            player.currentFrameIndex = 1
        end

        player.angle = 0
    end

    -- changing required spin speed and direction
    player.perfectAngleGenTime = player.perfectAngleGenTime - dt

    if player.perfectAngleGenTime <= 0 then
        player.perfectAngleGenTime = lume.random(1.5, 5)

        player:regenerateCurrentPerfectAngle()
    end

    -- check the perfect angle requirement
    local addNewScore = math.max(-1, -math.abs(player.angle_difference - player.currentPerfectAngle) / 5 + 1)

    if addNewScore < 0 then
        addNewScore = addNewScore * 0.6
    end

    player.alfa = lume.clamp(player.alfa - addNewScore * 0.1 * dt, 0, 1)

    player.player_score = math.max(0, player.player_score + addNewScore * 75 * dt)
end

return function(self,player,dt)
    player.controls:update(dt)
    player.perfectAngleTween:update(dt)

    local x, y = player.controls:get "move"
    
    if player.rotation_old == nil then
        player.rotation_old = vector(x, y):normalized()
    end

    player.rotation_new = vector(x, y):normalized()
    
    player.angle_difference = math.deg(player.rotation_new:angleTo(player.rotation_old))
    
    if math.abs(player.angle_difference) >= 180 then
        -- very funny way to workaround very big angles while spinning the stick
        local tempRotOld = player.rotation_old:rotated(math.pi)
        local tempRotNew = player.rotation_new:rotated(math.pi)
        player.angle_difference = math.deg(tempRotNew:angleTo(tempRotOld))
    end

    --[[
    if player.season == "wiosna" then
        if player.maxAngle == nil or player.maxAngle < math.abs(player.angle_difference) then
            player.maxAngle = math.abs(player.angle_difference)
            print(player.maxAngle)
        end
    end
    ]]

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

        player.perfectAngleTween:tween(0.5, player, { currentPerfectAngle = lume.random(-1, 1) }, "out-cubic")
    end

    -- check the perfect angle requirement

end

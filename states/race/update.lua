return function(self, dt)
    -- countdown timer update
    self.countdown:update(dt)

    if not self.gameStarted then return end

    local relativeWorldSpeed = 1

    for bgIndex, bgShift in pairs(self.bgShifts) do
        self.bgShifts[bgIndex] = bgShift - self.worldSpeed * dt
    end

    for bgIndex, bgShift in pairs(self.bgShifts) do
        if bgShift <= -assets.race.race_bg:getWidth() * self.raceBgScale then
            self.bgShifts[bgIndex] = bgShift + assets.race.race_bg:getWidth() * self.raceBgScale * 2
        end
    end

    -- players iteration
    lume.each(self.players, function(player)
        if player.body == nil then return end

        player.controls:update(dt)
        player.snowAnimation:update(dt)

        player.speed = math.max(0, player.speed - dt * 7.5)

        if player.controls:pressed "forward" and player.speed < player.maxSpeed * 0.5 and not player.crashed then
            player.speed = player.maxSpeed
        end

        if player.finished then
            player.speed = relativeWorldSpeed
        end

        local _, y = player.controls:get "move"

        if player.crashed or player.finished then
            y = 0
        end

        player.body:move((player.speed - relativeWorldSpeed) * self.worldSpeed * dt, y * player.maxVerticalSpeed * dt)

        local collisions = self.world:collisions(player.body)

        if not player.crashed and not player.finished then
            for other, sepVector in pairs(collisions) do
                if other.data then
                    if other.data.type == "player" then
                        player.body:move(sepVector.x, sepVector.y)
                    elseif other.data.type == "wall" then
                        player.body:move(sepVector.x, sepVector.y)
                    elseif other.data.type == "obstacle" then
                        player.body:move(sepVector.x, sepVector.y)
                        player.crashed = true
                        player.dead = true
                        player.speed = 0
                    elseif other.data.type == "finish" then
                        player.finished = true
                        table.insert(self.normalPlayerPositions, "player" .. player.index)
                        player.position = #self.normalPlayerPositions
                    end
                end
            end

            if player.crashed then
                local crashTime = 1.6
                table.insert(self.reversePlayerPositions, "player" .. player.index)
                player.animation:gotoFrame(3)
                -- tween crash position
                timer.tween(crashTime / 2, player.crashPosition, {y = -100}, "out-cubic", function()
                    timer.tween(crashTime / 2, player.crashPosition, {y = 0}, "in-cubic", function()
                        player.animation:gotoFrame(2)
                    end)
                end)

                -- tween crash rotation
                timer.tween(crashTime, player, {crashRotation = 0}, "linear")
                timer.tween(crashTime, player.crashPosition, {x = 600}, "linear")
            end
        end

        local pX, pY = player.body:center()

        local crashTestShift = 0
        if player.crashed then
            crashTestShift = 600
        end

        if pX < -player.playerWidth - crashTestShift or pX > lg.getWidth() + player.playerWidth then
            self.world:remove(player.body)
            if lume.find(self.reversePlayerPositions, "player" .. player.index) == nil then
                table.insert(self.reversePlayerPositions, "player" .. player.index)
            end
            player.outOfBounds = true
            player.dead = true
            player.body = nil
        end
    end)

    -- world speed change
    self.worldSpeed = math.min(self.worldSpeedMax, self.worldSpeed + 50 * dt)

    -- finish line moving
    self.finishLine:move(-self.worldSpeed * dt, 0)

    -- obstacles iteration
    self.worldObstacleTimer = self.worldObstacleTimer - dt
    if self.worldObstacleTimer <= 0 then
        self:regenerateObstacleTimer()

        local finishX, finishY = self.finishLine:center()
        
        if finishX > lg.getWidth() then
            local obstacleYSpread = 64
            local obstacleWidth, obstacleHeight = 128, 24
            local obstacle = self.world:rectangle(lg.getWidth(), lume.random(obstacleYSpread, lg.getHeight() - obstacleYSpread), obstacleWidth, obstacleHeight)

            obstacle.width = obstacleWidth
            obstacle.height = obstacleHeight

            obstacle.data = {
                type = "obstacle",
                id = "zaspa"
            }

            table.insert(self.worldObstacles, obstacle)
        end
    end

    -- obstacles removal
    lume.each(self.worldObstacles, function(obstacle)
        obstacle:move(-self.worldSpeed * dt, 0)

        local oX, oY = obstacle:center()
        if oX <= -obstacle.width then
            self.world:remove(obstacle)
            obstacle.toRemove = true
        end
    end)
    self.worldObstacles = lume.filter(self.worldObstacles, function(obstacle) return not obstacle.toRemove end)

    -- check for finish requirement
    if #self.finishPlayerPositions == 0 and (#self.reversePlayerPositions + #self.normalPlayerPositions == 4 or #self.reversePlayerPositions == 3) then
        if #self.reversePlayerPositions == 3 then
            local alivePlayer = lume.match(self.players, function(player)
                return not player.dead
            end)

            alivePlayer.finished = true
            table.insert(self.normalPlayerPositions, "player" .. alivePlayer.index)
        end
        
        self.finishPlayerPositions = lume.concat(self.finishPlayerPositions, self.normalPlayerPositions)
        for _, playerId in lume.ripairs(self.reversePlayerPositions) do
            table.insert(self.finishPlayerPositions, playerId)
        end

        self.finishBlinkTimer = self.maxFinishBlinkTimer
        timer.after(self.finishBlinkTimer, function()
            gamestate.switch(states.stateswitcher, self, states.summary, self.finishPlayerPositions)
        end)
    end

    -- race finished blinking label
    if self.finishBlinkTimer ~= nil then
        self.finishBlinkTimer = self.finishBlinkTimer - dt
    end
end

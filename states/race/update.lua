return function(self, dt)
    local sorted_scores = lume.sort(self.players,function(a, b) return a.player_score > b.player_score end)
    local sorted_scores_keys = {}

    for playerKey, _ in pairs(sorted_scores) do
        table.insert(sorted_scores_keys, playerKey)
    end

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
                        player.speed = 0
                    elseif other.data.type == "finish" then
                        player.finished = true
                        table.insert(self.normalPlayerPositions, "player" .. player.index)
                    end
                end
            end
        end

        local pX, pY = player.body:center()

        if pX < -player.playerWidth or pX > lg.getWidth() + player.playerWidth then
            self.world:remove(player.body)
            table.insert(self.reversePlayerPositions, "player" .. player.index)
            player.body = nil
        end
    end)

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
            local positions = lume.map({1, 2, 3, 4}, function(i) return "player" .. i end)
            lume.remove(positions, unpack(self.reversePlayerPositions))
            local alivePlayer = positions[1]
            self.players[alivePlayer].finished = true
            table.insert(self.normalPlayerPositions, alivePlayer)
        end
        
        self.finishPlayerPositions = lume.concat(self.finishPlayerPositions, self.normalPlayerPositions)
        for _, playerId in lume.ripairs(self.reversePlayerPositions) do
            table.insert(self.finishPlayerPositions, playerId)
        end

        self.finishBlinkTimer = 5
        timer.after(self.finishBlinkTimer, function()
            gamestate.switch(states.summary, self.finishPlayerPositions)
        end)
    end

    -- race finished blinking label
    if self.finishBlinkTimer ~= nil then
        self.finishBlinkTimer = self.finishBlinkTimer - dt
    end
end

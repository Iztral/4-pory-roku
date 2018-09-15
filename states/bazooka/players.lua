local playerColors = {
    {1, 0.1, 0.1},
    {0.1, 1, 0.1},
    {1, 1, 0.1},
    {1, 0.1, 1}
}

return {
    data = {},
    initialized = false,
    signals = nil,
    
    initialize = function(self)
        self.flowers = {
            love.graphics.newImage("img/kwiatek1.png"),
            love.graphics.newImage("img/kwiatek2.png"),
            love.graphics.newImage("img/kwiatek3.png"),
            love.graphics.newImage("img/kwiatek4.png")
        }

        self.sight = love.graphics.newImage("img/celownik.png")

        -- controls definition
        for playerIndex = 1, 4 do
            local zeroIndex = playerIndex - 1
            self.data[playerIndex] = {
                controls = baton.new {
                    controls = {
                        left = {"axis:leftx-"},
                        right = {"axis:leftx+"},
                        up = {"axis:lefty-"},
                        down = {"axis:lefty+"},
                        shoot = {"axis:triggerleft+"}
                    },
                    pairs = {
                        move = {"left", "right", "up", "down"}
                    },
                    joystick = love.joystick.getJoysticks()[playerIndex]
                },
                position = { 
                    x = love.graphics.getWidth() * (0.25 + 0.5 * (zeroIndex % 2)),
                    y = love.graphics.getHeight() * (0.25 + 0.5 * math.floor(zeroIndex / 2)),
                },
                direction = vector.fromPolar(0, 1),
                speed = 200,
                color = playerColors[playerIndex],
                flowerSpriteBatches = {
                    love.graphics.newSpriteBatch(self.flowers[1], 1000),
                    love.graphics.newSpriteBatch(self.flowers[2], 1000),
                    love.graphics.newSpriteBatch(self.flowers[3], 1000),
                    love.graphics.newSpriteBatch(self.flowers[4], 1000)
                },
                flowerSpriteBatchesIndexes = {
                    {},
                    {},
                    {},
                    {}
                },
                reloadTime = 0,
                time = math.random(),
                sinsin = 0
            }
        end

        -- signals init
        self.signals = signal.new()

        self.initialized = true
    end,

    draw = function(self)
        for playerIndex, player in pairs(self.data) do
            -- draw player dot
            local playerColor = lume.concat(playerColors[playerIndex], { 0.75 })
            love.graphics.setColor(playerColor)
            love.graphics.circle("fill", player.position.x, player.position.y, 8)

            -- draw player sprite batches
            local zeroIndex = playerIndex - 1
            local posX, posY = zeroIndex % 2, math.floor(zeroIndex / 2)
            local minusPosX, minusPosY = posX * 2 - 1, posY * 2 - 1

            love.graphics.setColor(1, 1, 1)
            love.graphics.setScissor(love.graphics.getWidth() * 0.5 * posX, love.graphics.getHeight() * 0.5 * posY, love.graphics.getWidth() * 0.5, love.graphics.getHeight() * 0.5)
            for batchIndex, batch in pairs(player.flowerSpriteBatches) do
                love.graphics.draw(batch)
            end
            love.graphics.setScissor()

            -- draw player sight
            love.graphics.setColor(1, 1, 1, 0.5)
            local sightOffset = player.direction * 64
            love.graphics.draw(self.sight, player.position.x + sightOffset.x, player.position.y + sightOffset.y, 0, 1, 1, self.sight:getWidth() / 2, self.sight:getHeight() / 2)

            -- draw player loading bar
            self.sinsin = 1 - math.abs(math.sin(player.time * 2.5))
            local dposX, dposY = love.graphics.getWidth() * 0.5 + minusPosX * 40, love.graphics.getHeight() * 0.5 + minusPosY * 40
            love.graphics.push()
            love.graphics.translate(dposX, dposY)
            love.graphics.rotate(-math.pi / 2)
            love.graphics.translate(-dposX, -dposY)

            local mod = self.sinsin
            love.graphics.setColor(playerColor)

            if player.reloadTime > 0 then
                love.graphics.setColor(0.75, 0.75, 0.75)
                mod = player.reloadTime
            end

            love.graphics.arc("fill", dposX, dposY, 32, 0, 2 * math.pi * mod)
            love.graphics.pop()
        end
    end,

    update = function(self, dt)
        if self.initialized then
            for playerIndex, player in pairs(self.data) do
                -- update systems
                player.controls:update(dt)
                player.time = player.time + dt

                player.reloadTime = math.max(player.reloadTime - dt, 0)

                -- handle movement
                local moveX, moveY = player.controls:get "move"

                if math.abs(moveX) > 0.1 and math.abs(moveY) > 0.1 then
                    player.direction = vector(moveX, moveY):normalized()
                end

                local zeroIndex = playerIndex - 1
                local posX, posY = zeroIndex % 2, math.floor(zeroIndex / 2)

                local minPosX, maxPosX = 0.5 * posX * love.graphics.getWidth() + 32, (0.5 * posX + 0.5) * love.graphics.getWidth() - 32
                local minPosY, maxPosY = 0.5 * posY * love.graphics.getHeight() + 32, (0.5 * posY + 0.5) * love.graphics.getHeight() - 32

                player.position = {
                    x = lume.clamp(player.position.x + moveX * player.speed * dt, minPosX, maxPosX),
                    y = lume.clamp(player.position.y + moveY * player.speed * dt, minPosY, maxPosY)
                }

                local sightOffset = player.direction * 64
                local sightPosition = {
                    x = player.position.x + sightOffset.x,
                    y = player.position.y + sightOffset.y
                }

                local sightInLimits = sightPosition.x >= minPosX and sightPosition.x <= maxPosX and sightPosition.y >= minPosY and sightPosition.y <= maxPosY

                -- handle shooting
                if player.controls:pressed "shoot" and player.reloadTime <= 0 and sightInLimits then
                    player.reloadTime = 1
                    local shootPower = math.max(math.floor(8.1 * self.sinsin), 1)
                    for i = 1, shootPower do
                        local randomBatchIndex = math.random(1, 4)
                        local randomBatch = player.flowerSpriteBatches[randomBatchIndex]

                        local spriteIndex = randomBatch:add(
                            player.position.x + sightOffset.x + math.random(-64, 64),
                            player.position.y + sightOffset.y + math.random(-64, 64),
                            math.random() * math.pi,
                            0.25,
                            0.25,
                            randomBatch:getTexture():getWidth() / 2,
                            randomBatch:getTexture():getHeight() / 2
                        )
                        table.insert(
                            player.flowerSpriteBatchesIndexes[randomBatchIndex],
                            spriteIndex
                        )
                    end
                end
            end
        end
    end
}

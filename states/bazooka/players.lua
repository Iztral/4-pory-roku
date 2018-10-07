return {
    data = {},
    initialized = false,
    signals = nil,
    
    initialize = function(self)
        self.flowers = {
            assets.bazooka.kwiatek1,
            assets.bazooka.kwiatek2,
            assets.bazooka.kwiatek3,
            assets.bazooka.kwiatek4,
        }

        self.sight = assets.bazooka.celownik

        local legsImage = assets.bazooka.animacja_por_nogi
        local topIndexes = {
            ["1"] = "wiosna",
            ["2"] = "lato",
            ["3"] = "jesien",
            ["4"] = "zima"
        }

        -- controls definition
        for playerIndex = 1, 4 do
            local topImage = assets.bazooka["animacja_por_" .. topIndexes[tostring(playerIndex)]]
            local zeroIndex = playerIndex - 1

            local legGrid = anim8.newGrid(196, 116, legsImage:getWidth(), legsImage:getHeight())
            local topGrid = anim8.newGrid(214, 183, topImage:getWidth(), topImage:getHeight())

            self.data[playerIndex] = {
                controls = baton.new {
                    controls = {
                        left = {"axis:leftx-"},
                        right = {"axis:leftx+"},
                        up = {"axis:lefty-"},
                        down = {"axis:lefty+"},
                        shoot = {"axis:triggerright+"}
                    },
                    pairs = {
                        move = {"left", "right", "up", "down"}
                    },
                    joystick = love.joystick.getJoysticks()[playerIndex]
                },
                position = { 
                    x = lg.getWidth() * (0.25 + 0.5 * (zeroIndex % 2)),
                    y = lg.getHeight() * (0.25 + 0.5 * math.floor(zeroIndex / 2)),
                },
                direction = vector.fromPolar(0, 1),
                speed = 250,
                flowerSpriteBatches = {
                    lg.newSpriteBatch(self.flowers[1], 512),
                    lg.newSpriteBatch(self.flowers[2], 512),
                    lg.newSpriteBatch(self.flowers[3], 512),
                    lg.newSpriteBatch(self.flowers[4], 512)
                },
                flowerSpriteBatchesIndexes = {
                    {},
                    {},
                    {},
                    {}
                },
                flowerAnimations = {},
                reloadTime = 0,
                time = math.random(),
                sinsin = 0,
                index = playerIndex,

                legAnimations = {
                    stop = anim8.newAnimation(legGrid(1, 1), 1/7),
                    walk = anim8.newAnimation(legGrid("2-4", 1, "1-4", 2), 1/7)
                },
                currentLegAnimation = "stop",
                legsImage = legsImage,

                topAnimations = {
                    idle = anim8.newAnimation(topGrid(1, 1), 1/7),
                    shoot = anim8.newAnimation(topGrid("2-3", 1), 1/12, function()
                        self.data[playerIndex].currentTopAnimation = "idle"
                    end)
                },
                currentTopAnimation = "idle",
                topImage = topImage,

                animationDirection = 1,

                sightColor = {1, 1, 1, 0.5}
            }


        end

        -- signals init
        self.signals = signal.new()

        self.initialized = true
    end,

    draw = function(self)
        for playerIndex, player in pairs(self.data) do
            -- draw player sprite batches
            local zeroIndex = playerIndex - 1
            local posX, posY = zeroIndex % 2, math.floor(zeroIndex / 2)
            local minusPosX, minusPosY = posX * 2 - 1, posY * 2 - 1

            lg.setColor(1, 1, 1)
            lg.setScissor(lg.getWidth() * 0.5 * posX, lg.getHeight() * 0.5 * posY, lg.getWidth() * 0.5, lg.getHeight() * 0.5)
            for batchIndex, batch in pairs(player.flowerSpriteBatches) do
                lg.draw(batch)
            end

            lg.setScissor()
            -- draw player animations
            lg.setColor(1, 1, 1)

            local topFrameWidth, topFrameHeight = player.topAnimations[player.currentTopAnimation]:getDimensions()
            player.topAnimations[player.currentTopAnimation]:draw(player.topImage, player.position.x, player.position.y, 0, player.animationDirection * 0.5, 0.5, topFrameWidth / 2 - 25, topFrameHeight - 40)

            local legFrameWidth, legFrameHeight = player.legAnimations[player.currentLegAnimation]:getDimensions()
            player.legAnimations[player.currentLegAnimation]:draw(player.legsImage, player.position.x, player.position.y, 0, player.animationDirection * 0.5, 0.5, legFrameWidth / 2, 0)

            -- draw player sight
            lg.setColor(player.sightColor)
            local sightOffset = player.direction * 64
            lg.draw(self.sight, player.position.x + sightOffset.x, player.position.y + sightOffset.y, 0, 1, 1, self.sight:getWidth() / 2, self.sight:getHeight() / 2)

            -- draw player loading bar
            player.sinsin = 1 - math.abs(math.sin(player.time * 2.5))
            local dposX, dposY = lg.getWidth() * 0.5 + minusPosX * 128, lg.getHeight() * 0.5 + minusPosY * 128

            local mod = player.sinsin

            if player.reloadTime > 0 then
                lg.setColor(0.75, 0.75, 0.75)
                mod = player.reloadTime
            else
                local r, g, b, a = vivid.HSVtoRGB((1 - mod) / 3, 1, 1, 255 * 0.75)
                lg.setColor(r / 255, g / 255, b / 255, a / 255)
            end

            lg.arc("fill", dposX, dposY, 32, math.pi, math.pi + 0.5 * math.pi * mod)

            local fnt = assets.font.caviarDreamsBold_16
            lg.setColor(0, 0, 0)
            lg.setFont(fnt)
            local labelWidth = 300
            lg.printf((player.reloadTime > 0) and "RELOADING" or "SPREADING POWER", dposX - labelWidth / 2 - 16, dposY - fnt:getHeight() / 2 + minusPosY * 48 - 16, labelWidth, "center")
        end
    end,

    update = function(self, dt)
        if self.initialized then
            for playerIndex, player in pairs(self.data) do
                -- update systems
                player.controls:update(dt)
                player.legAnimations[player.currentLegAnimation]:update(dt)
                player.topAnimations[player.currentTopAnimation]:update(dt)
                player.time = player.time + dt

                player.reloadTime = math.max(player.reloadTime - dt, 0)

                -- handle movement
                local moveX, moveY = player.controls:get "move"

                local zeroIndex = playerIndex - 1
                local posX, posY = zeroIndex % 2, math.floor(zeroIndex / 2)

                local minMaxMarginX = 40
                local minMaxMarginY = 64

                local minPosX, maxPosX = 0.5 * posX * lg.getWidth() + minMaxMarginX, (0.5 * posX + 0.5) * lg.getWidth() - minMaxMarginX
                local minPosY, maxPosY = 0.5 * posY * lg.getHeight() + minMaxMarginY, (0.5 * posY + 0.5) * lg.getHeight() - minMaxMarginY

                if math.abs(moveX) > 0.05 or math.abs(moveY) > 0.05 then
                    player.direction = vector(moveX, moveY):normalized()
                    player.currentLegAnimation = "walk"

                    player.position = {
                        x = lume.clamp(player.position.x + moveX * player.speed * dt, minPosX, maxPosX),
                        y = lume.clamp(player.position.y + moveY * player.speed * dt, minPosY, maxPosY)
                    }

                    player.animationDirection = 1

                    if moveX < 0 then
                        player.animationDirection = -1
                    end
                else
                    player.currentLegAnimation = "stop"
                end

                local sightOffset = player.direction * 64
                local sightPosition = {
                    x = player.position.x + sightOffset.x,
                    y = player.position.y + sightOffset.y
                }

                local sightInLimits = sightPosition.x >= minPosX and sightPosition.x <= maxPosX and sightPosition.y >= minPosY and sightPosition.y <= maxPosY

                if sightInLimits then
                    player.sightColor = {1, 1, 1, 0.5}
                else
                    player.sightColor = {1, 0, 0, 0.5}
                end

                -- handle shooting
                if player.controls:pressed "shoot" and player.reloadTime <= 0 and sightInLimits then
                    player.reloadTime = 1
                    player.currentTopAnimation = "shoot"

                    local shootPower = math.max(math.floor(8.1 * player.sinsin), 1)
                    for i = 1, shootPower do
                        local randomBatchIndex = math.random(1, 4)
                        local randomBatch = player.flowerSpriteBatches[randomBatchIndex]

                        local spriteIndex = randomBatch:add(
                            player.position.x + sightOffset.x + math.random(-64, 64),
                            player.position.y + sightOffset.y + math.random(-64, 64),
                            math.random() * math.pi,
                            lume.random(0.2, 0.3),
                            lume.random(0.2, 0.3),
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

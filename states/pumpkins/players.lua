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
                        cut = {"axis:triggerleft+"}
                    },
                    pairs = {
                        move = {"left", "right", "up", "down"}
                    },
                    joystick = love.joystick.getJoysticks()[playerIndex]
                },
                position = {
                    x = 0.25 * zeroIndex * love.graphics.getWidth() + 251,
                    y = 0.5 * love.graphics.getHeight()
                },
                speed = 100,
                color = playerColors[playerIndex],
                cutModifier = 0
            }
        end

        -- signals init
        self.signals = signal.new()

        self.initialized = true
    end,

    draw = function(self)
        -- draw player cursor
        for playerIndex, player in pairs(self.data) do
            love.graphics.setColor(lume.concat(player.color, { 0.9 }))
            love.graphics.circle("fill", player.position.x, player.position.y, 8)
        end
    end,

    update = function(self, dt)
        if self.initialized then
            for playerIndex, player in pairs(self.data) do
                -- update controls
                player.controls:update(dt)

                -- handle movement
                local moveX, moveY = player.controls:get "move"

                player.position = {
                    x = player.position.x + moveX * player.speed * dt,
                    y = player.position.y + moveY * player.speed * dt
                }

                -- handle cutting
                if player.controls:pressed "cut" then
                    if player.cutModifier < 0.5 then
                        player.cutModifier = 1
                    end
                end

                if player.cutModifier >= 0.5 then
                    self.signals:emit("cut", playerIndex, player.position.x, player.position.y)
                end

                player.cutModifier = math.max(player.cutModifier - dt, 0)
            end
        end
    end
}

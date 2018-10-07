local playerColors = {
    {1, 0.1, 0.1},
    {0.1, 1, 0.1},
    {1, 1, 0.1},
    {1, 0.1, 1}
}

local playerAvatars = {
    assets.avatars.awatar_wiosna,
    assets.avatars.awatar_lato,
    assets.avatars.awatar_jesien,
    assets.avatars.awatar_zima,
}

return {
    data = {},
    initialized = false,
    signals = nil,

    font = assets.font.caviarDreams_64,
    
    initialize = function(self)
        -- controls definition
        for playerIndex = 1, 4 do
            local zeroIndex = playerIndex - 1
            self.data[playerIndex] = {
                order = nil,
                controls = baton.new {
                    controls = {
                        left = {"axis:leftx-"},
                        right = {"axis:leftx+"},
                        up = {"axis:lefty-"},
                        down = {"axis:lefty+"},
                        cut = {"axis:triggerright+"}
                    },
                    pairs = {
                        move = {"left", "right", "up", "down"}
                    },
                    joystick = love.joystick.getJoysticks()[playerIndex]
                },
                position = {
                    x = 0.25 * zeroIndex * lg.getWidth() + 251,
                    y = 0.5 * lg.getHeight()
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
        for playerIndex, player in pairs(self.data) do
            local zeroIndex = playerIndex - 1

            -- draw player cursor
            if player.order == nil then
                local alphaMod = 0.5
                if player.cutModifier > 0 then
                    alphaMod = 1
                end
                lg.setColor(lume.concat(player.color, { alphaMod }))
                lg.circle("fill", player.position.x, player.position.y, 8)

                lg.setColor(1, 1, 1)
                lg.setLineWidth(2 * alphaMod)
                lg.circle("line", player.position.x, player.position.y, 9 + 2 * alphaMod)

                lg.setColor(0, 0, 0)
                lg.setLineWidth(2 * alphaMod)
                lg.circle("line", player.position.x, player.position.y, 8 + 2 * alphaMod)
            end

            -- draw player avatar
            lg.setColor(1, 1, 1)
            local avatar = playerAvatars[playerIndex]
            lg.draw(avatar, (zeroIndex * 0.25 + 0.125) * lg.getWidth(), 0.8 * lg.getHeight(), 0, 0.5, 0.5, avatar:getWidth() / 2, avatar:getHeight() / 2)

            -- draw player position
            if player.order ~= nil then
                local positions = {"1st", "2nd", "3rd", "4th"}

                local position = positions[player.order]

                lg.setColor(1, 1, 1)
                lg.setFont(self.font)
                lg.printf(position, zeroIndex * 0.25 * lg.getWidth(), 0.9 * lg.getHeight(), 0.25 * lg.getWidth(), "center")
            end
        end
    end,

    update = function(self, dt)
        if self.initialized then
            for playerIndex, player in pairs(self.data) do
                if player.order == nil then
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
    end
}

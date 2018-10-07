return {
    enter = function(self)
        --countdown timer
        self.countdown = require "layers.countdown" :init()

        -- music
        self.winter = assets.music.winter
        self.winter:setLooping(true)
        self.winter:play()

        -- font
        self.font_big = assets.font.caviarDreams_48

        -- bg shifting modifiers
        self.raceBgScale = lg.getHeight() / assets.race.race_bg:getHeight()
        self.bgShifts = {0, assets.race.race_bg:getWidth() * self.raceBgScale}

        -- world
        self.world = HC.new()
        self.worldSpeed = 0
        self.worldSpeedMax = 600
    
        -- world walls
        local wallOffset = 100
        self.wallTop = self.world:rectangle(-wallOffset, -wallOffset, lg.getWidth() + 2 * wallOffset, wallOffset)
        self.wallBottom = self.world:rectangle(-wallOffset, lg.getHeight(), lg.getWidth() + 2 * wallOffset, wallOffset)

        self.wallTop.data = {
            type = "wall",
            id = "top"
        }

        self.wallBottom.data = {
            type = "wall",
            id = "bottom"
        }

        -- obstacles
        self.worldObstacles = {}
        self.worldObstacleTimer = 0
        self.regenerateObstacleTimer = function(self)
            self.worldObstacleTimer = lume.random(1, 3)
        end
        self:regenerateObstacleTimer()

        -- finish line
        local finishLineScale = lg.getHeight() / assets.race.meta:getHeight()
        self.finishLine = self.world:rectangle(20 * lg.getWidth(), 0, assets.race.meta:getWidth() * finishLineScale, lg.getHeight())
        self.finishLine.data = {
            type = "finish",
            id = "finish"
        }
        self.finishLine.finishLineScale = finishLineScale

        --players table--
        local seasons = {"wiosna", "lato", "jesien", "zima"}

        local playerWidth, playerHeight = 128, 32

        local heightFromBottom = lg.getHeight() - 128

        local startingHeight = lg.getHeight() - heightFromBottom

        self.reversePlayerPositions = {}
        self.normalPlayerPositions = {}
        self.finishPlayerPositions = {}
        self.finishBlinkTimer = nil
        self.maxFinishBlinkTimer = 5
        
        self.dqEffect = lg.newShader[[
            vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
                vec4 texturecolor = Texel(texture, texture_coords);
                float avgTone = (texturecolor.r + texturecolor.g + texturecolor.b) / 3.f;
                return vec4(vec3(avgTone), texturecolor.a) * color;
            }
        ]]

        -- register for countdown signal
        self.gameStarted = false
        signal.register("countdown layer: go", function()
            self.gameStarted = true
        end)
        
        self.players = {}
        for playerIndex = 1, 4 do
            local playerId = "player" .. playerIndex
            local gridImage = assets.race["animacja_sanki_" .. seasons[playerIndex]]
            local animGrid = anim8.newGrid(gridImage:getWidth() / 2, gridImage:getHeight() / 2, gridImage:getWidth(), gridImage:getHeight())

            local snowGridImage = assets.race.animacja_snieg
            local snowGrid = anim8.newGrid(snowGridImage:getWidth() / 2, snowGridImage:getHeight() / 2, snowGridImage:getWidth(), snowGridImage:getHeight())

            self.players[playerId] = {
                animGrid = animGrid,
                gridImage = gridImage,
                snowGrid = snowGrid,
                snowGridImage = snowGridImage,
                speed = 0,
                maxSpeed = 2.75,
                maxVerticalSpeed = 350,
                playerWidth = playerWidth,
                playerHeight = playerHeight,
                index = playerIndex,
                season = seasons[playerIndex],
                crashed = false,
                crashPosition = {x = 0, y = 0},
                crashRotation = -70,
                body = self.world:rectangle(
                    0.5 * lg.getWidth() - 0.5 * playerWidth,
                    startingHeight + ((playerIndex - 1) * 0.25 + 0.125) * heightFromBottom - 0.5 * playerHeight,
                    playerWidth,
                    playerHeight
                ),
                controls = baton.new {
                    controls = {
                        left = {"axis:leftx-"},
                        right = {"axis:leftx+"},
                        up = {"axis:lefty-"},
                        down = {"axis:lefty+"},
                        forward = {"axis:triggerright+"},
                    },
                    pairs = {
                        move = {"left", "right", "up", "down"}
                    },
                    joystick = love.joystick.getJoysticks()[playerIndex]
                }
            }

            self.players[playerId].animation = anim8.newAnimation(
                animGrid(1, 1, "1-2", 2),
                0.1
            )
            self.players[playerId].animationEmptySled = anim8.newAnimation(
                animGrid(2, 1),
                0.1
            )

            self.players[playerId].snowAnimation = anim8.newAnimation(
                snowGrid("1-2", 1, 1, 2),
                0.15
            )
            
            self.players[playerId].snowAnimationIdle = anim8.newAnimation(
                snowGrid(2, 2),
                0.15
            )

            self.players[playerId].body.data = {
                type = "player",
                id = playerIndex
            }
        end
    end,
    draw = require "states.race.draw",
    update = require "states.race.update",
}

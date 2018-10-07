return {
    enter = function(self)
        self.countdown = require "layers.countdown" :init({1, 1, 1})

        self.gameStarted = false
        signal.register("countdown layer: go", function()
            self.gameStarted = true
        end)

        self.img = {
            backgrounds = {
                assets.pumpkins.tlo_pumpkins_1,
                assets.pumpkins.tlo_pumpkins_2,
                assets.pumpkins.tlo_pumpkins_3,
            },
            pumpkinMain = assets.pumpkins.pumpkin_main,
        }

		self.autumn = assets.music.autumn
		self.autumn:setLooping(true)
		self.autumn:play()
		
        self.playerOrder = {}

        self.backgroundTimer = 0

        self.lastBackgroundIndex = nil

        self.timeAngle = 0

        self.winCounter = nil

        local relativePoints = require "states.pumpkins.paths"

        local copyPoints = function(points)
            local newPoints = {}

            for index, point in pairs(points) do
                table.insert(newPoints, index, {x = point.x, y = point.y})
            end

            return newPoints
        end

        local createPumpkin = function(pumpkin, center, index)
            local newPaths = {}

            for partIndex, part in pairs(pumpkin.setting) do
                table.insert(newPaths, {
                    initialPoint = {x = center.x + part.offset.x, y = center.y + part.offset.y},
                    points = copyPoints(pumpkin[part.name]),
                    image = part.image
                })
            end

            return newPaths, pumpkin.pathImage
        end

        self.playerPaths = {}

        for playerIndex = 1, 4 do
            local zeroIndex = playerIndex - 1
            local randomPumpkinData = relativePoints["pumpkin" .. lume.randomchoice({1, 2, 3, 4})]
            local paths, pathImage = createPumpkin(randomPumpkinData, {
                x = love.graphics.getWidth() * (0.25 * zeroIndex + 0.0) + 251,
                y = love.graphics.getHeight() * 0.495
            }, playerIndex)
            self.playerPaths[playerIndex] = {
                paths = paths,
                pathImage = pathImage,
                followInitialIndex = nil,
                followDirection = nil,
                followPreviousIndex = nil,
                followPathIndex = nil
            }
        end

        self.initialPoint = nil
        self.points = {}

        self.cursorPosition = nil
        self.cursorRadius = 8

        self.players:initialize()

        -- register signals for players
        self.players.signals:register("cut", function(playerIndex, x, y)
            self:followpath(playerIndex, x, y) 
        end)
    end,

    -- callback functions
    draw = require "states.pumpkins.draw",
    update = require "states.pumpkins.update",
    mousepressed = require "states.pumpkins.mousepressed",
    mousemoved = require "states.pumpkins.mousemoved",
    keypressed = require "states.pumpkins.keypressed",

    -- exported functions and modules
    followpath = require "states.pumpkins.followpath",
    players = require "states.pumpkins.players"
}

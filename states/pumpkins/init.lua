return {
    init = function(self)
        local relativePoints = {
            pumpkin1 = {
                eye = {
                    {y = 1, x = -43},
                    {y = 13, x = -40},
                    {y = 24, x = -40},
                    {y = 28, x = -34},
                    {y = 39, x = -18},
                    {y = 45, x = -9},
                    {y = 47, x = 3},
                    {y = 51, x = 16},
                    {y = 53, x = 30},
                    {y = 48, x = 47},
                    {y = 27, x = 65},
                    {y = 15, x = 69},
                    {y = -4, x = 70},
                    {y = -23, x = 65},
                    {y = -37, x = 52},
                    {y = -43, x = 41},
                    {y = -52, x = 19},
                    {y = -56, x = 11},
                    {y = -58, x = 1},
                    {y = -56, x = -25},
                    {y = -51, x = -32},
                    {y = -42, x = -40},
                    {y = -22, x = -47}
                },
                mouth = {
                    {y = 4, x = -118},
                    {y = -14, x = -115},
                    {y = -27, x = -108},
                    {y = -38, x = -95},
                    {y = -43, x = -79},
                    {y = -45, x = -63},
                    {y = -46, x = -45},
                    {y = -45, x = -30},
                    {y = -41, x = -8},
                    {y = -39, x = 5},
                    {y = -35, x = 23},
                    {y = -32, x = 39},
                    {y = -34, x = 57},
                    {y = -37, x = 74},
                    {y = -38, x = 101},
                    {y = -32, x = 116},
                    {y = -19, x = 129},
                    {y = -4, x = 131},
                    {y = 10, x = 133},
                    {y = 23, x = 132},
                    {y = 33, x = 126},
                    {y = 38, x = 116},
                    {y = 37, x = 95},
                    {y = 35, x = 72},
                    {y = 32, x = 55},
                    {y = 31, x = 32},
                    {y = 23, x = 14},
                    {y = 25, x = 6},
                    {y = 31, x = -11},
                    {y = 38, x = -36},
                    {y = 39, x = -50},
                    {y = 43, x = -76},
                    {y = 43, x = -98},
                    {y = 40, x = -108},
                    {y = 26, x = -121}
                },
                setting = {
                    {
                        name = "eye",
                        offset = {x = -84, y = -56}
                    },
                    {
                        name = "eye",
                        offset = {x = 96, y = -56}
                    },
                    {
                        name = "mouth",
                        offset = {x = -4, y = 84}
                    }
                }
            }
        }

        local copyPoints = function(points)
            local newPoints = {}

            for index, point in pairs(points) do
                table.insert(newPoints, index, {x = point.x, y = point.y})
            end

            return newPoints
        end

        local createPumpkin = function(pumpkin, center)
            local newPaths = {}

            for partIndex, part in pairs(pumpkin.setting) do
                table.insert(newPaths, {
                    initialPoint = {x = center.x + part.offset.x, y = center.y + part.offset.y},
                    points = copyPoints(pumpkin[part.name])
                })
            end

            return newPaths
        end

        self.playerPaths = {}

        for playerIndex = 1, 4 do
            table.insert(self.playerPaths, playerIndex, {
                paths = createPumpkin(relativePoints.pumpkin1, {
                    x = love.graphics.getWidth() * (0.25 * playerIndex - 0.125),
                    y = love.graphics.getHeight() * 0.5
                }),
                followInitialIndex = nil,
                followDirection = nil,
                followPreviousIndex = nil,
                followPathIndex = nil
            })
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

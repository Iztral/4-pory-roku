return {
    init = function(self)
        self.img = {
            backgrounds = {
                assets.pumpkins.tlo_pumpkins_1,
                assets.pumpkins.tlo_pumpkins_2,
                assets.pumpkins.tlo_pumpkins_3,
            },
            pumpkinEyeLeft = assets.pumpkins.pumpkin_left,
            pumpkinEyeRight = assets.pumpkins.pumpkin_right,
            pumpkinMouth = assets.pumpkins.pumpkin_mouth,
            pumpkinMain = assets.pumpkins.pumpkin_main,
        }
		self.autumn = assets.music.autumn,
		self.autumn:setLooping(true)
		self.autumn:play()
		
        self.playerOrder = {}

        self.backgroundTimer = 0

        self.lastBackgroundIndex = nil

        local relativePoints = {
            pumpkin1 = {
                eyeLeft = {
                    {y = -2,x = -33},
                    {y = -16,x = -29},
                    {y = -27,x = -20},
                    {y = -35,x = -9},
                    {y = -23,x = 6},
                    {y = -13,x = 18},
                    {y = -1,x = 29},
                    {y = 10,x = 38},
                    {y = 23,x = 33},
                    {y = 22,x = 18},
                    {y = 19,x = 4},
                    {y = 13,x = -13},
                    {y = 9,x = -23}
                },
                eyeRight = {
                    {y = -17,x = -9},
                    {y = -25,x = 2},
                    {y = -31,x = 12},
                    {y = -30,x = 21},
                    {y = -21,x = 28},
                    {y = -5,x = 36},
                    {y = 7,x = 31},
                    {y = 10,x = 19},
                    {y = 13,x = 0},
                    {y = 16,x = -14},
                    {y = 21,x = -28},
                    {y = 18,x = -37},
                    {y = 16,x = -45},
                    {y = 4,x = -40},
                    {y = -2,x = -32},
                    {y = -6,x = -21}
                },
                mouth = {
                    {y = -30,x = 6},
                    -- {y = -38,x = 15},
                    {y = -43,x = 21},
                    -- {y = -38,x = 30},
                    {y = -32,x = 38},
                    -- {y = -23,x = 50},
                    {y = -29,x = 60},
                    -- {y = -35,x = 67},
                    {y = -42,x = 74},
                    -- {y = -50,x = 83},
                    {y = -45,x = 99},
                    -- {y = -53,x = 107},
                    {y = -62,x = 113},
                    -- {y = -73,x = 120},
                    {y = -82,x = 127},
                    -- {y = -76,x = 131},
                    {y = -69,x = 132},
                    -- {y = -62,x = 131},
                    {y = -53,x = 131},
                    -- {y = -44,x = 129},
                    {y = -37,x = 126},
                    -- {y = -29,x = 122},
                    {y = -18,x = 119},
                    -- {y = -9,x = 114},
                    {y = -2,x = 109},
                    -- {y = 7,x = 104},
                    {y = 14,x = 96},
                    -- {y = 16,x = 85},
                    {y = 12,x = 80},
                    -- {y = 7,x = 77},
                    {y = 9,x = 71},
                    -- {y = 14,x = 63},
                    {y = 17,x = 55},
                    -- {y = 22,x = 50},
                    {y = 24,x = 45},
                    -- {y = 20,x = 36},
                    {y = 12,x = 31},
                    -- {y = 7,x = 22},
                    {y = 14,x = 13},
                    -- {y = 19,x = 9},
                    {y = 26,x = 1},
                    -- {y = 24,x = -10},
                    {y = 18,x = -19},
                    -- {y = 12,x = -25},
                    {y = 6,x = -32},
                    -- {y = -1,x = -38},
                    {y = 4,x = -49},
                    -- {y = 9,x = -59},
                    {y = 0,x = -73},
                    -- {y = -6,x = -79},
                    {y = -10,x = -86},
                    -- {y = -14,x = -90},
                    {y = -10,x = -99},
                    -- {y = -6,x = -107},
                    {y = -15,x = -119},
                    -- {y = -26,x = -126},
                    {y = -36,x = -131},
                    -- {y = -45,x = -135},
                    {y = -61,x = -142},
                    -- {y = -62,x = -136},
                    {y = -59,x = -128},
                    -- {y = -51,x = -121},
                    {y = -48,x = -113},
                    -- {y = -43,x = -105},
                    {y = -44,x = -92},
                    -- {y = -48,x = -82},
                    {y = -43,x = -74},
                    -- {y = -31,x = -72},
                    {y = -37,x = -64},
                    -- {y = -41,x = -56},
                    {y = -42,x = -49},
                    -- {y = -35,x = -41},
                    {y = -31,x = -34},
                    -- {y = -34,x = -28},
                    {y = -39,x = -22},
                    -- {y = -43,x = -14},
                    {y = -46,x = -9},
                    -- {y = -43,x = -6},
                    {y = -38,x = -2},
                },
                setting = {
                    {
                        name = "eyeLeft",
                        offset = {x = -76, y = -40},
                        image = self.img.pumpkinEyeLeft
                    },
                    {
                        name = "eyeRight",
                        offset = {x = 81, y = -40},
                        image = self.img.pumpkinEyeRight
                    },
                    {
                        name = "mouth",
                        offset = {x = -2, y = 65},
                        image = self.img.pumpkinMouth
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
                    points = copyPoints(pumpkin[part.name]),
                    image = part.image
                })
            end

            return newPaths
        end

        self.playerPaths = {}

        for playerIndex = 1, 4 do
            local zeroIndex = playerIndex - 1
            table.insert(self.playerPaths, playerIndex, {
                paths = createPumpkin(relativePoints.pumpkin1, {
                    x = love.graphics.getWidth() * (0.25 * zeroIndex + 0.0) + 251,
                    y = love.graphics.getHeight() * 0.495
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

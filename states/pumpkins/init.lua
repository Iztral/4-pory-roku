return {
    init = function(self)
        self.initialPoint = {y = 294, x = 159}

        self.points = {
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
        }

        self.cursorPosition = nil
        self.cursorRadius = 8
    end,
    draw = require "states.pumpkins.draw",
    update = require "states.pumpkins.update",
    mousepressed = require "states.pumpkins.mousepressed",
    mousemoved = require "states.pumpkins.mousemoved",
    keypressed = require "states.pumpkins.keypressed",
}

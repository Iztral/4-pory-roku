-- libraries
gamestate = require "lib.hump.gamestate"
lume = require "lib.lume"

local states = {
    pumpkins = require "states.pumpkins"
}

function love.load()
    gamestate.registerEvents()
    gamestate.switch(states.pumpkins)
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end

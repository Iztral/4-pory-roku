-- libraries
gamestate = require "lib.hump.gamestate"
signal = require "lib.hump.signal"
lume = require "lib.lume"
baton = require "lib.baton"

local states = {
    pumpkins = require "states.pumpkins"
	sunbath = require "states.sunbath"
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

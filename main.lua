local Gamestate = require "lib.hump.gamestate"

local pumpkins = require "states.pumpkins"

function love.load()
    Gamestate.registerEvents()
    Gamestate.switch(pumpkins)
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end

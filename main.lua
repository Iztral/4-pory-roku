-- libraries
gamestate = require "lib.hump.gamestate"
signal = require "lib.hump.signal"
lume = require "lib.lume"
baton = require "lib.baton"
anim8 = require "lib.anim8"

local states = {
    pumpkins = require "states.pumpkins",
	sunbath = require "states.sunbath",
	bazooka = require "states.bazooka",
	race = require "states.race",
    summary = require "states.scoreSummary"
}

function love.load()
    gamestate.registerEvents()
    gamestate.switch(states.sunbath)
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end

    if key =="k" then
        gamestate.switch(states.pumpkins)
    elseif key == "l" then
        gamestate.switch(states.summary, {
            "player2", "player1", "player4", "player3"
        })
    end
end

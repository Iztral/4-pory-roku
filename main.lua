-- libraries
gamestate = require "lib.hump.gamestate"
signal = require "lib.hump.signal"
timer = require "lib.hump.timer"
vector = require "lib.hump.vector"
lume = require "lib.lume"
baton = require "lib.baton"
anim8 = require "lib.anim8"
tick = require "lib.tick"
bump = require "lib.bump"

states = {
    pumpkins = require "states.pumpkins",
	sunbath = require "states.sunbath",
	bazooka = require "states.bazooka",
	race = require "states.race",
    summary = require "states.scoreSummary",
    podium = require "states.podium"
	menu = require "states.menu"
}

competitionOrder = {
    "bazooka",
    "sunbath",
    "pumpkins",
    "race"
}

competitionOrderIndex = 1

function love.load()
    tick.framerate = 60
    tick.rate = 1 / 60

    gamestate.registerEvents()
    
	gamestate.switch(states.menu)
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end

    if key == "k" then
        gamestate.switch(states.sunbath)
    elseif key == "o" then
        gamestate.switch(states.bazooka)
    elseif key == "p" then
        gamestate.switch(states.race)
    elseif key == "i" then
        gamestate.switch(states.pumpkins)
    elseif key == "u" then
        gamestate.switch(states.summary, {
            "player1",
            "player2",
            "player3",
            "player4",
        })
    end
end

function love.update(dt)
    timer.update(dt)
end

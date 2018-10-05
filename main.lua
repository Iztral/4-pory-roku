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
moonshine = require "lib.moonshine"

states = {
    pumpkins = require "states.pumpkins",
	sunbath = require "states.sunbath",
	bazooka = require "states.bazooka",
	race = require "states.race",
    summary = require "states.scoreSummary",
    podium = require "states.podium",
	menu = require "states.menu",
	choice = require "states.choice",
}

competitionOrder = {
    "bazooka",
    "sunbath",
    "pumpkins",
    -- "race",
    "podium"
}

competitionOrderIndex = 1

standings = {}

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

    local findCompetitionOrder = function(stateName)
        return lume.find(competitionOrder, stateName) or lume.count(competitionOrder)
    end

    if key == "kp1" then
        gamestate.switch(states.sunbath)
        competitionOrderIndex = findCompetitionOrder("sunbath")
    elseif key == "kp2" then
        gamestate.switch(states.bazooka)
        competitionOrderIndex = findCompetitionOrder("bazooka")
    elseif key == "kp3" then
        gamestate.switch(states.race)
        competitionOrderIndex = findCompetitionOrder("race")
    elseif key == "kp4" then
        gamestate.switch(states.pumpkins)
        competitionOrderIndex = findCompetitionOrder("pumpkins")
    elseif key == "kp5" then
        gamestate.switch(states.podium)
        competitionOrderIndex = findCompetitionOrder("podium")
    elseif key == "kp0" then
        gamestate.switch(states.summary, {
            "player2",
            "player1",
            "player3",
            "player4",
        })
    end
end

function love.update(dt)
    timer.update(dt)
end

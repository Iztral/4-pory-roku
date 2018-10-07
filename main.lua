-- random seed
math.randomseed(os.time())

-- shortcuts
lg = love.graphics
lf = love.filesystem

-- libraries
gamestate = require "lib.hump.gamestate"
signal = require "lib.hump.signal"
timer = require "lib.hump.timer"
vector = require "lib.hump.vector"
lume = require "lib.lume"
baton = require "lib.baton"
anim8 = require "lib.anim8"
tick = require "lib.tick"
HC = require "lib.hc"
moonshine = require "lib.moonshine"
lily = require "lib.lily"
inspect = require "lib.inspect"
vivid = require "lib.vivid"

assets = {
    font = {}
}

states = {
    load = require "states.load"
}

competitionOrder = {
    "bazooka",
    "sunbath",
    "pumpkins",
    "race",
    "podium"
}

competitionOrderIndex = 1

standings = {}

function love.load(args)
    love.audio.setVolume(1)

    tick.framerate = 60
    tick.rate = 1 / 60

    isDebug = lume.find(args, "-debug") ~= nil

    gamestate.registerEvents()
    
    gamestate.switch(states.load)
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end

    local findCompetitionOrder = function(stateName)
        return lume.find(competitionOrder, stateName) or lume.count(competitionOrder)
    end

   -- if isDebug then
        if key == "kp1" then
            love.audio.stop()
            gamestate.switch(states.bazooka)
            competitionOrderIndex = findCompetitionOrder("bazooka")
        elseif key == "kp2" then
            love.audio.stop()
            gamestate.switch(states.sunbath)
            competitionOrderIndex = findCompetitionOrder("sunbath")
        elseif key == "kp3" then
            love.audio.stop()
            gamestate.switch(states.pumpkins)
            competitionOrderIndex = findCompetitionOrder("pumpkins")
        elseif key == "kp4" then
            love.audio.stop()
            gamestate.switch(states.race)
            competitionOrderIndex = findCompetitionOrder("race")
        elseif key == "kp5" then
            love.audio.stop()
            gamestate.switch(states.podium)
            competitionOrderIndex = findCompetitionOrder("podium")
        elseif key == "kp0" then
            love.audio.stop()
            gamestate.switch(states.summary, {
                "player2",
                "player1",
                "player3",
                "player4",
            })
        end
  --  end
end

function love.update(dt)
    timer.update(dt)
end

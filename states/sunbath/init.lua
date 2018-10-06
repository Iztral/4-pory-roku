return {
    init = function(self)
    --music--
        self.summer = assets.music.summer
        self.summer:play()
    --timer--
        self.clock = assets.general.timer
    --font--
        self.font_big = assets.font.caviarDreams_48
        self.font_small = assets.font.caviarDreams_32
    --background--
        self.background1 = assets.sunbath.tlopiasek1png
        self.background2 = assets.sunbath.tlopiasek2png
        self.background3 = assets.sunbath.tlopiasek3png
        self.sand = self.background1
    --arrow--
        self.arrow = assets.sunbath.arrow
        
        self.players = {}

        local seasons = {"wiosna", "lato", "jesien", "zima"}

        for playerIndex = 1, 4 do
            -- towel
            self["towel" .. playerIndex] = assets.sunbath["koc" .. playerIndex]

            self.players["player" .. playerIndex] = {
                player_score = 0,
                alfa = 0,
                angle_difference = 0,
                rotation_new = nil,
                rotation_old = nil,
                season = seasons[playerIndex],
                angle = 0,

                currentPerfectAngle = lume.random(-1, 1),
                perfectAngleGenTime = lume.random(1.5, 5),
                perfectAngleTween = timer.new(),

                currentFrameIndex = 1,
                frames = lume.map({1, 2, 3, 4}, function(index)
                    return assets.sunbath[seasons[playerIndex] .. index]
                end),
                masks = lume.map({1, 2, 3, 4}, function(index)
                    return assets.sunbath["maska" .. index]
                end),
                towel = assets.sunbath["koc" .. playerIndex],

                controls = baton.new {
                    controls = {
                        left = {"axis:leftx-"},
                        right = {"axis:leftx+"},
                        up = {"axis:lefty-"},
                        down = {"axis:lefty+"},
                    },
                    pairs = {
                        move = {"left", "right", "up", "down"}
                    },
                    joystick = love.joystick.getJoysticks()[playerIndex]
                }
            }
        end

        self.timer = 30
        self.turn_direction = 1
        self.turn_timer = math.random(3,8)
        self.bck_timer = 5
    end,
    draw = require "states.sunbath.draw",
    update = require "states.sunbath.update",
    player_update = require "states.sunbath.player_update"
    
}

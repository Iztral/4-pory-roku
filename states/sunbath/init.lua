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
    --towel--
        self.towel1 = assets.sunbath.koc1
        self.towel2 = assets.sunbath.koc2
        self.towel3 = assets.sunbath.koc3
        self.towel4 = assets.sunbath.koc4
    --arrow--
        self.arrow = assets.sunbath.arrow
    --leek--
        --spring--
        self.wiosna0 = assets.sunbath.wiosna0
        self.wiosna1 = assets.sunbath.wiosna1
        self.wiosna2 = assets.sunbath.wiosna2
        self.wiosna3 = assets.sunbath.wiosna3
        self.wiosna_main = self.wiosna0
        --summer--
        self.lato0 = assets.sunbath.lato0
        self.lato1 = assets.sunbath.lato1
        self.lato2 = assets.sunbath.lato2
        self.lato3 = assets.sunbath.lato3
        self.lato_main = self.lato0
        --fall--
        self.jesien0 = assets.sunbath.jesien0
        self.jesien1 = assets.sunbath.jesien1
        self.jesien2 = assets.sunbath.jesien2
        self.jesien3 = assets.sunbath.jesien3
        self.jesien_main = self.jesien0
        --winter--
        self.zima0 = assets.sunbath.zima0
        self.zima1 = assets.sunbath.zima1
        self.zima2 = assets.sunbath.zima2
        self.zima3 = assets.sunbath.zima3
        self.zima_main = self.zima0
        
    --leek mask--
        self.mask0 = assets.sunbath.maska0
        self.mask1 = assets.sunbath.maska1
        self.mask2 = assets.sunbath.maska2
        self.mask3 = assets.sunbath.maska3
        self.mask_wiosna = self.mask0
        self.mask_lato = self.mask0
        self.mask_jesien = self.mask0
        self.mask_zima = self.mask0
        
        
        self.players = {
            player1 = {player_score = 0, alfa = 0, turn_grade = 0, angle_difference = 0, rotation_new = nil, rotation_old = nil, season = 1, angle_max = 25, order = 1, controls = baton.new {
                controls = {
                    left = {"axis:leftx-"},
                    right = {"axis:leftx+"},
                    up = {"axis:lefty-"},
                    down = {"axis:lefty+"},
                },
                pairs = {
                    move = {"left", "right", "up", "down"}
                },
                joystick = love.joystick.getJoysticks()[1]
            },},
            player2 = {player_score = 0, alfa = 0, turn_grade = 0, angle_difference = 0, rotation_new = nil, rotation_old = nil, season = 2, angle_max = 25, order = 1, controls = baton.new {
                controls = {
                    left = {"axis:leftx-"},
                    right = {"axis:leftx+"},
                    up = {"axis:lefty-"},
                    down = {"axis:lefty+"},
                },
                pairs = {
                    move = {"left", "right", "up", "down"}
                },
                joystick = love.joystick.getJoysticks()[2]
            },},
            player3 = {player_score = 0, alfa = 0, turn_grade = 0, angle_difference = 0, rotation_new = nil, rotation_old = nil, season = 3, angle_max = 25, order = 1, controls = baton.new {
                controls = {
                    left = {"axis:leftx-"},
                    right = {"axis:leftx+"},
                    up = {"axis:lefty-"},
                    down = {"axis:lefty+"},
                },
                pairs = {
                    move = {"left", "right", "up", "down"}
                },
                joystick = love.joystick.getJoysticks()[3]
            },},
            player4 = {player_score = 0, alfa = 0, turn_grade = 0, angle_difference = 0, rotation_new = nil, rotation_old = nil, season = 4, angle_max = 25, order = 1, controls = baton.new {
                controls = {
                    left = {"axis:leftx-"},
                    right = {"axis:leftx+"},
                    up = {"axis:lefty-"},
                    down = {"axis:lefty+"},
                },
                pairs = {
                    move = {"left", "right", "up", "down"}
                },
                joystick = love.joystick.getJoysticks()[4]
            },},
        }
        self.timer = 30
        self.turn_direction = 1
        self.turn_timer = math.random(3,8)
        self.bck_timer = 5
    end,
    draw = require "states.sunbath.draw",
    update = require "states.sunbath.update",
    player_update = require "states.sunbath.player_update"
    
}

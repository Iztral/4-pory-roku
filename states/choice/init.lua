return {
    init = function(self)
      --music--
      self.choice = love.audio.newSource("mp3/choice.mp3","stream")
      self.choice:play()
      --background--
      self.choicebg = love.graphics.newImage("img/choice/choicebg.png")
      --leek--
      self.wiosna = love.graphics.newImage("img/choice/choice_wiosna.png")
      self.lato = love.graphics.newImage("img/choice/choice_lato.png")
      self.jesien = love.graphics.newImage("img/choice/choice_jesien.png")
      self.zima = love.graphics.newImage("img/choice/choice_zima.png")
      --arrows--
      self.arrow = love.graphics.newImage("img/choice/arrow_choice.png")
      --buttons--
      self.confirm = love.graphics.newImage("img/choice/confirm.png")
      self.locked = love.graphics.newImage("img/choice/locked.png")
      --player_leek--
      self.player_leek1 = self.wiosna
      self.player_leek2 = self.lato
      self.player_leek3 = self.jesien
      self.player_leek4 = self.zima
      --players--
      self.players = {
                player1 = {leek_choice = 1, controls = baton.new {
                    controls = {
                        left = {"axis:leftx-"},
                        right = {"axis:leftx+"},
              lock = {"axis:triggerright+"},
                    },
                    pairs = {
                        move = {"left", "right","lock"}
                    },
                    joystick = love.joystick.getJoysticks()[1]
                },},
                player2 = {leek_choice = 2, controls = baton.new {
                    controls = {
                        left = {"axis:leftx-"},
                        right = {"axis:leftx+"},
              lock = {"axis:triggerright+"},
                    },
                    pairs = {
                        move = {"left", "right","lock"}
                    },
                    joystick = love.joystick.getJoysticks()[2]
                },},
                player3 = {leek_choice = 3, controls = baton.new {
                    controls = {
                        left = {"axis:leftx-"},
                        right = {"axis:leftx+"},
              lock = {"axis:triggerright+"},
                    },
                    pairs = {
                        move = {"left", "right","lock"}
                    },
                    joystick = love.joystick.getJoysticks()[3]
                },},
                player4 = {leek_choice = 4, controls = baton.new {
                    controls = {
                        left = {"axis:leftx-"},
                        right = {"axis:leftx+"},
              lock = {"axis:triggerright+"},
                    },
                    pairs = {
                        move = {"left", "right","lock"}
                    },
                    joystick = love.joystick.getJoysticks()[4]
                },},
            }
	end,
	draw = require "states.choice.draw",
	update = require "states.choice.update",
	}
return {
    init = function(self)
      --music--
      self.choice = love.audio.newSource("mp3/choice.mp3","stream")
      self.choice:play()
      --background--
      self.choice_bg = love.graphics.newImage("img/choice/choice_bg.png")
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
	  
	  self.buttons = {
		self.confirm,
		self.confirm,
		self.confirm,
		self.confirm,
	  }
	  
	  self.transparency = {
		0.99,
		0.99,
		0.99,
		0.99,
	  }
	  --leeks**
	  self.leeks = {
		self.wiosna,
		self.lato,
		self.jesien,
		self.zima,
	  }
      --player_leek--
	  self.player_leeks = {
		self.wiosna,
		self.lato,
		self.jesien,
		self.zima,
	  }
      --players--
      self.players = {
                player1 = {index = 1, leek_choice = 1, locked = -1, controls = baton.new {
                    controls = {
                        left = {"axis:leftx-"},
                        right = {"axis:leftx+"},
						up = {"axis:lefty-"},
						down = {"axis:lefty+"},
						lock = {"axis:triggerright+"},
                    },
                    pairs = {
                        move = {"left", "right", "up", "down", "lock"}
                    },
                    joystick = love.joystick.getJoysticks()[1]
                },},
                player2 = {index = 2, leek_choice = 2, locked = -1, controls = baton.new {
                    controls = {
                        left = {"axis:leftx-"},
                        right = {"axis:leftx+"},
						up = {"axis:lefty-"},
						down = {"axis:lefty+"},
						lock = {"axis:triggerright+"},
                    },
                    pairs = {
                        move = {"left", "right", "up", "down", "lock"}
                    },
                    joystick = love.joystick.getJoysticks()[2]
                },},
                player3 = {index = 3, leek_choice = 3, locked = 1, controls = baton.new {
                    controls = {
                        left = {"axis:leftx-"},
                        right = {"axis:leftx+"},
						up = {"axis:lefty-"},
						down = {"axis:lefty+"},
						lock = {"axis:triggerright+"},
                    },
                    pairs = {
                        move = {"left", "right", "up", "down", "lock"}
                    },
                    joystick = love.joystick.getJoysticks()[3]
                },},
                player4 = {index = 4, leek_choice = 4, locked = 1, controls = baton.new {
                    controls = {
                        left = {"axis:leftx-"},
                        right = {"axis:leftx+"},
						up = {"axis:lefty-"},
						down = {"axis:lefty+"},
						lock = {"axis:triggerright+"},
                    },
                    pairs = {
                        move = {"left", "right", "up", "down", "lock"}
                    },
                    joystick = love.joystick.getJoysticks()[4]
                },},
            }
	end,
	draw = require "states.choice.draw",
	update = require "states.choice.update",
	player_update = require "states.choice.player_update"
	}
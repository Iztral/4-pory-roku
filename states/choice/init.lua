return {
    init = function(self)
	  self.font_bigger = assets.font.caviarDreamsBold_32
	  --music--
      self.choice = assets.music.choice
      self.choice:setLooping(true)
      self.choice:play()
      --background--
      self.choice_bg = assets.choice.choice_bg
	  --1/4--
	  self.wiosna_bg = assets.choice.wiosna_tlo
	  self.lato_bg = assets.choice.lato_tlo
	  self.jesien_bg = assets.choice.jesien_tlo
	  self.zima_bg = assets.choice.zima_tlo
      --leek--
      self.wiosna = assets.choice.choice_wiosna
      self.lato = assets.choice.choice_lato
      self.jesien = assets.choice.choice_jesien
      self.zima = assets.choice.choice_zima
      --arrows--
      self.arrow = assets.choice.arrow_choice
      --buttons--
      self.confirm = assets.choice.confirm
      self.locked = assets.choice.locked
	  
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
	  --timer lightup--
	  self.light_timer = 9
	  self.light_up = 0
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
	  
	  local joysticks = love.joystick.getJoysticks()
	  joystick1 = joysticks[1]
	  joystick2 = joysticks[2]
	  joystick3 = joysticks[3]
	  joystick4 = joysticks[4]
	  
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
                player2 = {index = 2, leek_choice = 2, locked = 1, controls = baton.new {
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
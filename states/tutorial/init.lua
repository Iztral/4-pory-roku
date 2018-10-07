return {
    init = function(self)
	
		self.timer = 10
		alfa_timer = 2
		
		grzyb =  assets.tutorial.kontroller_gala
		trigger = assets.tutorial.kontroller_triger
		start = assets.tutorial.kontroller_start
		
		if competitionOrderIndex == 1 then
			self.tutorial_wiosna:initialize()
		end
		if competitionOrderIndex == 2 then
			self.tutorial_lato:initialize()
		end
		if competitionOrderIndex == 3 then
			self.tutorial_jesien:initialize()
		end
		if competitionOrderIndex == 4 then
			self.tutorial_zima:initialize()
		end
		
	end,
	update = require "states.tutorial.update",
	draw = require "states.tutorial.draw",
	
	--exported modules--
	tutorial_wiosna = require "states.tutorial.wiosna",
	tutorial_lato = require "states.tutorial.lato",
	tutorial_jesien = require "states.tutorial.jesien",
	tutorial_zima = require "states.tutorial.zima",
}
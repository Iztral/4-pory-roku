return {
	data = {},
    initialized = false,
	
	initialize = function(self)
		self.tutorial = assets.tutorial.wiosna_tutorial
		self.grzyb =  assets.tutorial.kontroller_gala
		self.trigger = assets.tutorial.kontroller_triger
		self.start = assets.tutorial.kontroller_start
		self.alfa = 0
	end,
	
	draw = function(self)
		love.graphics.draw(self.tutorial, 0, 0)
		love.graphics.setColor(1, 1, 1, self.alfa)
		love.graphics.draw(self.grzyb, 823, 789, 0, 1, 1, self.grzyb:getWidth()/2, self.grzyb:getHeight()/2)
		love.graphics.draw(self.trigger, 921, 732, 0, 1, 1, self.trigger:getWidth()/2, self.trigger:getHeight()/2)
		love.graphics.draw(self.start, 894, 795, 0, 1, 1, self.start:getWidth()/2, self.start:getHeight()/2)
		love.graphics.setColor(1, 1, 1, 1)
	end,
	
	update = function(self, dt)
		
		alfa_timer = alfa_timer + dt
		if alfa_timer >= 2 * math.pi then
			alfa_timer = alfa_timer - 2 * math.pi
		end
	
		self.alfa = 0 + 1 * math.abs(math.sin(2 * alfa_timer))
	
	end,
}
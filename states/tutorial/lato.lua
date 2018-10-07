return {
	data = {},
    initialized = false,
	
	initialize = function(self)
		self.alfa = 0
	end,
	
	draw = function(self)
		love.graphics.draw(assets.tutorial.lato_tutorial, 0, 0)
		love.graphics.setColor(1, 1, 1, 1)
		love.graphics.draw(grzyb, 840,816, 0, 1, 1, grzyb:getWidth()/2, grzyb:getHeight()/2)
		love.graphics.draw(start, 906,819, 0, 1, 1, start:getWidth()/2, start:getHeight()/2)
		love.graphics.setColor(1, 1, 1, 1)
		love.graphics.draw(trigger, 934,758, 0, 1, 1, trigger:getWidth()/2, trigger:getHeight()/2)
	end,
	
	update = function(self, dt)
		
		alfa_timer = alfa_timer + dt
		if alfa_timer >= 2 * math.pi then
			alfa_timer = alfa_timer - 2 * math.pi
		end
	
		self.alfa = 0 + 0.05 * math.abs(math.sin(2 * alfa_timer))
	
	end,
}
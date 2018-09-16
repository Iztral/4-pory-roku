return function(self,dt,player)

	player.controls:update(dt)
	local x, y = player.controls:get "move"
	
	player.speed = player.acceleration

end
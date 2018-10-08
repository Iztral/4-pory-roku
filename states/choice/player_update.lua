return function(self, player, dt)
    player.controls:update(dt)
    
    if player.controls:pressed("lock") then
        player.locked = true
    end
end
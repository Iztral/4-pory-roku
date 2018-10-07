return function(self,dt)
    
    --anim timer--
    if self.bck_timer and self.bck_timer > 0 then
        self.bck_timer = self.bck_timer - dt
    end
    
    --start size timer--
    if self.start_timer and self.start_timer > 0 then
        self.start_timer = self.start_timer - dt
    end
    if self.start_timer < 0 then
        self.start_timer = 2
    end
    
    --anim switch--
    if self.bck_timer < 5 and self.bck_timer > 4 or self.bck_timer < 1 and self.bck_timer > 0 then
        self.menu_main = self.menu1
    end
    if self.bck_timer < 4 and self.bck_timer > 3 or self.bck_timer < 2 and self.bck_timer > 1  then
        self.menu_main = self.menu2
    end
    if self.bck_timer < 3 and self.bck_timer > 2 then
        self.menu_main = self.menu3
    end
    
    if self.bck_timer < 0 then
        self.bck_timer = 5
    end

    -- board scaling
    self.startBoardTimer = self.startBoardTimer + dt
    if self.startBoardTimer >= 2 * math.pi then
        self.startBoardTimer = self.startBoardTimer - 2 * math.pi
    end
    
    --click detection--
    self.controls:update(dt)
    if self.controls:pressed("start") then
        love.audio.stop()
        gamestate.switch(states.choice)
        
    end
    if self.controls:pressed("quit") then
        love.event.quit()
        love.audio.stop()
    end
end
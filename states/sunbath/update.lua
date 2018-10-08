return function(self,dt)
    self.countdown:update(dt)
    
    if not self.gameStarted then return end

    --timer function--
    if self.timer and self.timer > 0 then
        self.timer = self.timer - dt
    end
    if self.timer < 0 then
        self.timer = 0
        self.summer:stop()

        local sorted_scores = lume.sort(self.players,function(a, b) return a.player_score > b.player_score end)
        local sorted_scores_keys = {}

        for playerKey, _ in pairs(sorted_scores) do
            table.insert(sorted_scores_keys, playerKey)
        end

        gamestate.switch(states.stateswitcher, self, states.summary, sorted_scores_keys)
    end
    
    --anim timer--
    if self.bck_timer and self.bck_timer > 0 then
        self.bck_timer = self.bck_timer - dt
    end
    
    --anim switch--
    if self.bck_timer < 5 and self.bck_timer > 4 or self.bck_timer < 1 and self.bck_timer > 0 then
        self.sand = self.background1
    end
    if self.bck_timer < 4 and self.bck_timer > 3 or self.bck_timer < 2 and self.bck_timer > 1  then
        self.sand = self.background2
    end
    if self.bck_timer < 3 and self.bck_timer > 2 then
        self.sand = self.background3
    end
    
    if self.bck_timer < 0 then
        self.bck_timer = 5
    end
    
    for index,player in pairs(self.players) do
        self:player_update(player,dt)
    end
end

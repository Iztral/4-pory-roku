return function(self, k)
    if isDebug and k == "y" then
        for k, player in pairs(self.players) do
            player.locked = true
        end
    end
end
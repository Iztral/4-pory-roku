return function(self, key)
    if key == "f" and isDebug then
        local center = {
            x = 251,
            y = love.graphics.getHeight() * 0.495
        }
        local newPoint = {
            x = self.initialPoint.x - center.x,
            y = self.initialPoint.y - center.y
        }
        print(lume.serialize(newPoint))
        for k, v in pairs(self.points) do
            print(": " .. lume.serialize(v))
        end
    end
end

return function(self, x, y)
    self.cursorPosition = {x = x, y = y}

    local activePoints = lume.count(self.points, "active")
    for k, p in pairs(self.points) do
        if not p.active then
            local distance = math.pow(x - (self.initialPoint.x + p.x), 2) + math.pow(y - (self.initialPoint.y + p.y), 2)

            if distance <= math.pow(self.cursorRadius, 2) then
                p.active = true
            end
        end
    end
end

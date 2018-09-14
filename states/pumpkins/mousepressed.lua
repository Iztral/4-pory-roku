return function(self, x, y, button, isTouch, presses)
    if self.initialPoint == nil then
        self.initialPoint = {x = x, y = y}
    else
        table.insert(self.points, {x = x - self.initialPoint.x, y = y - self.initialPoint.y})
    end
end

return {
    init = function(self)
    end,

    enter = function(self, current, from, to, arg1, arg2, arg3)
        self.stateFrom = from
        self.stateTo = to
        self.arg1 = arg1
        self.arg2 = arg2
        self.arg3 = arg3

        if not self.stateTo.initialized then
            if self.stateTo.init then self.stateTo:init()
            elseif self.stateTo.enter then self.stateTo:enter() end
            self.stateTo.initialized = true
        end

        self.shiftX = 0
        timer.tween(1, self, {shiftX = -lg.getWidth()}, "in-out-quart", function()
            gamestate.switch(self.stateTo, arg1, arg2, arg3)
        end)

        self:draw()
    end,

    draw = function(self)
        lg.push()
            lg.setColor(1, 1, 1)
            lg.translate(self.shiftX, 0)
            self.stateFrom:draw()
        lg.pop()

        lg.push()
            lg.setColor(1, 1, 1)
            lg.translate(self.shiftX + lg.getWidth(), 0)
            self.stateTo:draw()
        lg.pop()
    end,

    update = function(self, dt)
    end
}
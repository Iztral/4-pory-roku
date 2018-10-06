return function(self)
    if assets.font_timeburnerbold_32 then
        lg.setColor(1, 1, 1)

        lg.setFont(assets.font_timeburnerbold_32)
        lg.printf("Lołding...", 0, lg.getHeight() / 2 - 72, lg.getWidth(), "center")
        lg.printf("Plis łejt", 0, lg.getHeight() / 2 - 32, lg.getWidth(), "center")

        local loadingBarWidth = 0.25 * lg.getWidth()
        local multililyMod = self.multilily:getLoadedCount() / self.multilily:getCount()

        lg.setColor(0, 0.6, 0)
        lg.rectangle("fill", lg.getWidth() * 0.5 - loadingBarWidth * 0.5, lg.getHeight() * 0.5 + 16, loadingBarWidth * multililyMod, 16)

        lg.setColor(0, 0.3, 0)
        lg.setLineWidth(3)
        lg.rectangle("line", lg.getWidth() * 0.5 - loadingBarWidth * 0.5, lg.getHeight() * 0.5 + 16, loadingBarWidth, 16)
    end
end

local testFont = love.graphics.newFont(24)

function love.draw()
    love.graphics.setFont(testFont)
    love.graphics.printf("Hello World", 0, love.graphics.getHeight() / 2 - 12, love.graphics.getWidth(), "center")
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end

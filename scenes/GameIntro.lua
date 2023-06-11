
local intro = {}

function intro.load()
    love.graphics.setBackgroundColor(0, 0, 0)
    love.graphics.setColor(255, 255, 255)
    love.graphics.setNewFont(12)

    -- player = player:new("Mavin",100, 100)
end

function intro.draw()

    love.graphics.setColor(0, 0, 0)
    love.graphics.print("Intro", 10, 10)
    -- player:draw()
end

function intro.mousepressed(x, y, button, istouch)
    --if button == 1 then
    --    if x >= self.x and x <= self.x + self.width and y >= self.y and y <= self.y + self.height then
    --
    --        player:mousepressed(x, y, button, istouch)
    --    end
    --end
end

function intro.update(dt)
    --player:update(dt)
end

return intro

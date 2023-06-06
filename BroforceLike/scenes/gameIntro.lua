
local intro = {}

function intro.load()
    love.graphics.setBackgroundColor(0, 0, 0)
    love.graphics.setColor(255, 255, 255)
    love.graphics.setNewFont(12)
    love.window.setTitle("Broforce Like <3 -- Intro")
    love.window.setMode(1640, 900, {resizable=false, vsync=0, minwidth=1640, minheight=900})
end

function intro.draw()
    love.graphics.print("Intro", 10, 10)
end

function intro.mousepressed(x, y, button, istouch)
    if button == 1 then
        if x >= self.x and x <= self.x + self.width and y >= self.y and y <= self.y + self.height then

            print("mouse Intro")
        end
    end
end

return intro

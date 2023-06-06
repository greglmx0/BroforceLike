quitButton = {}
quitButton.__index = quitButton

function quitButton:new(x, y, width, height)
    local bn = {}
    setmetatable(bn, quitButton)

    bn.x = x - (width / 2)
    bn.y = y
    bn.width = width
    bn.height = height

    --bn.hover = false
    --bn.top = y
    --bn.left = x
    --bn.visible = true

    return bn
end

function quitButton:draw()
    text = "Quit"
    love.graphics.setColor(0, 255, 255)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    love.graphics.setColor(255, 255, 255)
    love.graphics.print(text, self.x + (self.width / 2) - (love.graphics.getFont():getWidth(text) / 2), self.y + (self.height / 2) - (love.graphics.getFont():getHeight(text) / 2))
end

function quitButton:mousepressed(x, y, button, istouch)
    if button == 1 then
        if x >= self.x and x <= self.x + self.width and y >= self.y and y <= self.y + self.height then
            love.event.quit()
        end
    end
end


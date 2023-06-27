local love = require("love")

function Floor(y, text)

    return {
        x = 0,
        y = y,
        width = 64,
        height = 64,
        color = { r = 200, g = 200, b = 0.1 },
        text = text or "Floor",

        draw = function(self)
            love.graphics.setColor(0.2, 0.2, self.color.b)
            love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
            love.graphics.setColor(0.9, 0.9, 0.9)
            love.graphics.printf(self.text, self.x, self.y, self.width, "center")
        end
    }
end

return Floor
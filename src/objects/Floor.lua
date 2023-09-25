local love = require("love")

function Floor(y, text)

    return {
        x = 0,
        y = y,
        width = 64,
        height = 64,  -- 0.95, 0.61, 0.66
        color = { r = 0.95, g = 0.61, b = 0.66 },
        text = text or "",

        draw = function(self)
            love.graphics.setColor(self.color.r, self.color.g, self.color.b)
            love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
            love.graphics.setColor(0.9, 0.9, 0.9)
            love.graphics.printf(self.text, self.x, self.y, self.width, "center")
        end
    }
end

return Floor
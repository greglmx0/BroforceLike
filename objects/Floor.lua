local love = require("love")

function Floor(y)

    return {
        x = 0,
        y = y,
        width = width,
        height = 150,
        color = { r = 200, g = 200, b = 200 },

        draw = function(self)
            love.graphics.setColor(self.color.r, self.color.g, self.color.b)
            love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
        end
    }
end

return Floor
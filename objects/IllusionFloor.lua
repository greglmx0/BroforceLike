local love = require("love")

function illusionFloor()

    return {
        x = 0,
        y = 0,
        realX = 0,
        realY = 0,
        width = 64,
        height = 64,  -- 0.95, 0.61, 0.66
        color = { r = 0.2, g = 0.5, b = 0.7 },

        draw = function(self)
            love.graphics.setColor(self.color.r, self.color.g, self.color.b)
            love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
        end
    }
end

return illusionFloor
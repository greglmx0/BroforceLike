local love = require("love")

function Spike(x, y, state)

    return {
        state = state or "down",
        x = x,
        y = y,

        realX = 0,
        realY = 0,

        box= {},

        color =  { r = 0.22, g = 0.32, b = 0.32 },

        draw = function(self)


            if self.state == "down" then
                love.graphics.setColor(self.color.r, self.color.g, self.color.b)
                love.graphics.rectangle("fill", self.x, self.y + 44 , 64, 20)

                -- add box in box {}
                self.box[#self.box + 1] = { x = self.x, y = self.y + 44, width = 64, height = 20 }
            end

            if self.state == "up" then
                love.graphics.setColor(self.color.r, self.color.g, self.color.b)
                love.graphics.rectangle("fill", self.x, self.y, 64, 20)
                self.box[#self.box + 1] = { x = self.x, y = self.y, width = 64, height = 20 }
            end

            if self.state == "left" then
                love.graphics.setColor(self.color.r, self.color.g, self.color.b)
                love.graphics.rectangle("fill", self.x, self.y, 20, 64)
                self.box[#self.box + 1] = { x = self.x, y = self.y, width = 20, height = 64 }
            end

            if self.state == "right" then
                love.graphics.setColor(self.color.r, self.color.g, self.color.b)
                love.graphics.rectangle("fill", self.x + 44, self.y, 20, 64)

                self.box[#self.box + 1] = { x = self.x + 44, y = self.y, width = 20, height = 64 }
            end
        end
    }
end

return Spike
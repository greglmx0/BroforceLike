local IllusionFloor = require "src/objects/IllusionFloor"
local Floor = require "src/objects/Floor"
local Spike = require "src/objects/Spike"

function mapIntro()

    -- MapName = "MapIntro"
    
    return {
        updateMap = function(self)
            for i = 1, #self.map do
                for j = 1, #self.map[1] do

                    if self.map[i][j] == 1 then

                        local floor = Floor((i - 1) * 64)

                        floor.x = ((j - 1) * 64) + love.graphics.getWidth() / 2 - player.x - 64
                        floor:draw()

                    elseif self.map[i][j] == 10 then

                        local spike = Spike(
                                ((j - 1) * 64) + love.graphics.getWidth() / 2 - player.x - 64,
                                (i - 1) * 64, "down")

                        spike:draw()

                    elseif self.map[i][j] == 11 then

                        local spike = Spike(
                                ((j - 1) * 64) + love.graphics.getWidth() / 2 - player.x - 64,
                                (i - 1) * 64, "left")

                        spike:draw()

                    elseif self.map[i][j] == 12 then

                        local spike = Spike()

                        spike.x = ((j - 1) * 64) + love.graphics.getWidth() / 2 - player.x - 64
                        spike.y = (i - 1) * 64
                        spike.realX = (j - 1) * 64
                        spike.realY = (i - 1) * 64
                        spike.state = "up"

                        spike:draw()

                    elseif self.map[i][j] == 13 then

                        local spike = Spike(
                                ((j - 1) * 64) + love.graphics.getWidth() / 2 - player.x - 64,
                                (i - 1) * 64, "right")
                        spike:draw()

                    elseif self.map[i][j] == 20 then

                        local illusionFloor = IllusionFloor()

                        illusionFloor.x = ((j - 1) * 64) + love.graphics.getWidth() / 2 - player.x - 64
                        illusionFloor.y = (i - 1) * 64

                        illusionFloor.realX = (j - 1) * 64
                        illusionFloor.realY = (i - 1) * 64


                        if (player.x < illusionFloor.realX - (6*64) or player.x > illusionFloor.realX + (6*64)) then
                            illusionFloor:draw()
                        end
                        -- illusionFloor:draw()

                    elseif self.map[i][j] == 100 then

                        -- local floor = Floor((i - 1) * 64)

                        love.graphics.setColor(0.6, 0.6, 0.6)
                        love.graphics.rectangle("fill", ((j - 1) * 64) + love.graphics.getWidth() / 2 - player.x - 64, (i - 1) * 64, 64, 64)

                        love.graphics.setColor(0.9, 0.9, 0.9)
                        love.graphics.printf("dead ca ", ((j - 1) * 64) + love.graphics.getWidth() / 2 - player.x - 64, (i - 1) * 64, 64, "center")

                    else
                        love.graphics.setColor(0.2, 0.2, 0.2)
                        love.graphics.rectangle("fill", ((j - 1) * 64) + love.graphics.getWidth() / 2 - player.x - 64, ((i - 1) * 64), 64, 64)

                    end
                end
            end


        end,

        update = function(self, dt)
            self:updateMap()
        end
    }

end

return mapIntro
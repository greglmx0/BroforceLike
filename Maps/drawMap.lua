local drawMap = {}

local map = require("Maps/map")

function drawMap.draw()

    for i = 1, #map do
        for j = 1, #map[1] do
            if map[i][j] ~= 0 and map[i][j] ~= nil then

                love.graphics.setColor(1, 1, 1, 1)
                love.graphics.draw(grid.tileSet, grid.tileTexture[map[i][j]], ((j - 1) * 64) + love.graphics.getWidth() / 2 - player.x - 64, (i - 1) * 64)
            end
        end
    end
end

function drawMap.update(dt)
    self.drawMap.draw()
end




return drawMap

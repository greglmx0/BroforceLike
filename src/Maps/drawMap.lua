global = require("global")

local drawMap = {}
drawMap.map = require("src/data/map")



function drawMap:draw()
    for i = 1, #drawMap.map do
        for j = 1, #drawMap.map[1] do
            if drawMap.map[i][j] ~= 0 and drawMap.map[i][j] ~= nil then

                love.graphics.setColor(1, 1, 1, 1)
                love.graphics.draw(grid.tileSet, grid.tileTexture[drawMap.map[i][j]], ((j - 1) * 64) + love.graphics.getWidth() / 2 - player.x - 64, (i - 1) * 64)
            end
        end
    end
end

function drawMap.update(dt)
    drawMap:draw()
end

function drawMap:refreshMap()
    print("global.mapRefreshed: " .. tostring(global.mapRefreshed))
    drawMap.map = require("src/data/map")
end

return drawMap
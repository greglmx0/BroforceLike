global = require("global")
map = require("src/data/map")

local drawMap = {}
drawMap.map = map



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
    if not global.mapRefreshed then
        drawMap:refreshMap()
        global.mapRefreshed = true
    end
    drawMap:draw()
end

function drawMap:refreshMap()
    print(#drawMap.map)
    local newMap = {}
    for i = 1, #drawMap.map do
        table.insert(newMap, drawMap.map[i] )
        -- table.remove(drawMap.map, i)
    end


    print("global.mapRefreshed: " .. tostring(global.mapRefreshed))
    drawMap.map =  newMap
    print(#drawMap.map)
end

return drawMap
local love = require("love")
local Text = require "src/components/Text"

map = require "src/Maps/drawMap"
import = require "src/import"
player = require "src/entity/Player"

local game = {}

game.score = 0

game.func = nil
game.difficulty = 1
game.lives = 3
game.level  = 1

function game:load(func, difficulty, lives, level)

    game.func = func or function()
        print("This button has no function attached")
    end
    game.difficulty = difficulty or 1
    game.lives = lives or 3
    game.level = level or 1

    import.importMap()
    map:refreshMap()
    player:load(4)

end


    function game:draw()
        map:draw()

        Text("Score: " .. self.score, 0, 0, "h3"):draw()
        Text("Lives: " .. player.lives, 0, 50, "h3"):draw()
        Text("Level: " .. self.level, 0, 100, "h3"):draw()
    end

    function game:update(dt)
        player:update(dt)

        if love.keyboard.isDown("escape") then
            menu:changeGameState("gamePaused")
        end
    end

return game

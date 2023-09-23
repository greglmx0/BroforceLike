local love = require("love")
local Map = require "Maps/drawMap"
local Text = require "../components/Text"

function Game(func, difficulty, lives, level)

    func = {
        func = func or function()
            print("This button has no function attached")
        end,
    }

    map = Map
    player = Player(4)

    return {
        difficulty = difficulty or 1,
        score = 0,
        level = level or 1,

        draw = function(self)

            -- map:updateMap()
            map.draw()

            Text("Score: " .. self.score, 0, 0, "h3"):draw()
            Text("Lives: " .. player.lives, 0, 50, "h3"):draw()
            Text("Level: " .. self.level, 0, 100, "h3"):draw()
        end,

        -- update draw Score and Lives
        update = function(dt)
            player:update(dt)

            if love.keyboard.isDown("escape") then
                menu:changeGameState("paused")
            end
        end,
    }
end

return Game

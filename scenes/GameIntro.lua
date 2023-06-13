local love = require("love")
local Map = require "Maps/MapIntro"
local Text = require "../components/Text"

function Game(func, difficulty, lives, level)
    func = {
        func = func or function() print("This button has no function attached") end,
    }

    map = Map()
    player = Player(4, map)

    return {
        difficulty = difficulty or 1,
        score = 0,
        lives = lives or 3,
        level = level or 1,

        draw = function(self)
            map:build()
            Text("Score: " .. self.score, 0, 0, "h3"):draw()
            Text("Lives: " .. self.lives, 0, 50, "h3"):draw()
            Text("Level: " .. self.level, 0, 100, "h3"):draw()
        end
    }
end

return Game

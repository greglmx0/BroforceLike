local love = require("love")
local Floor = require "objects/Floor"
local Text = require "../components/Text"

function Game(func, difficulty, lives, level)
    func = {
        func = func or function() print("This button has no function attached") end,
    }

    floor = Floor(800)

    return {
        difficulty = difficulty or 1,
        score = 0,
        lives = lives or 3,
        level = level or 1,

        draw = function(self)
            floor:draw()
        end
    }
end

return Game

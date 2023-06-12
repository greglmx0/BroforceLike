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
        state = {
            menu = true,
            paused = false,
            running = false,
            ended = false,
            setting = false,
        },



        changeGameState = function(self, state)
            game.state["menu"] = state == "menu"
            game.state["paused"] = state == "paused"
            game.state["running"] = state == "running"
            game.state["ended"] = state == "ended"
            game.state["setting"] = state == "setting"
        end,


        startNewGame = function (self, player)
            self:changeGameState("running")
        end,

        draw = function(self)
            floor:draw()
        end
    }
end

return Game

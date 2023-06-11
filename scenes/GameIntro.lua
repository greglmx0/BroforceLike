local love = require("love")
local Text = require "../components/Text"

function Game(func, difficulty, lives, level)
    local btn_text = {}
    func = func or function()
        print("This button has no function attached")
    end

    if text_y then
        btn_text.y = text_y + button_y
    else
        btn_text.y = button_y
    end

    if text_x then
        btn_text.x = text_x + button_x
    else
        btn_text.x = button_x
    end
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
        },

        changeGameState = function(self, state)
            game.state["menu"] = state == "menu"
            game.state["paused"] = state == "paused"
            game.state["running"] = state == "running"
            game.state["ended"] = state == "ended"
        end,


        startNewGame = function (self, player)

            self:changeGameState("running")

        end,

        setButtonColor = function(self, red, green, blue)
            self.button_color = { r = red, g = green, b = blue }
        end,

        setTextColor = function(self, red, green, blue)
            self.text_color = { r = red, g = green, b = blue }
        end,

        checkHover = function(self, mouse_x, mouse_y, cursor_radius)
            if (mouse_x + cursor_radius >= self.button_x) and (mouse_x - cursor_radius <= self.button_x + self.width) then
                if (mouse_y + cursor_radius >= self.button_y) and (mouse_y - cursor_radius <= self.button_y + self.height) then
                    return true
                end
            end

            return false
        end,

        click = function(self)
            func()
        end,

        draw = function(self)

            love.graphics.setColor(120, 120, 120)
            love.graphics.rectangle("fill", self .button_x, self.button_y, self.width, self.height)

        end

    }

end

return Game

--function intro.load()
--    love.graphics.setBackgroundColor(0, 0, 0)
--    love.graphics.setColor(255, 255, 255)
--    love.graphics.setNewFont(12)
--
--    -- player = player:new("Mavin",100, 100)
--end
--
--function intro.draw()
--
--    love.graphics.setColor(0, 0, 0)
--    love.graphics.print("Intro", 10, 10)
--    -- player:draw()
--end
--
--function intro.mousepressed(x, y, button, istouch)
--    --if button == 1 then
--    --    if x >= self.x and x <= self.x + self.width and y >= self.y and y <= self.y + self.height then
--    --
--    --        player:mousepressed(x, y, button, istouch)
--    --    end
--    --end
--end
--
--function intro.update(dt)
--    --player:update(dt)
--end
--
--return intro

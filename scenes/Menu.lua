require("GUI/Button")

width = love.graphics.getWidth()
height = love.graphics.getHeight()

function Menu()

    local funcs = {
        newGame = function ()
            game = Game()
            pause = Paused(game)
            menu:changeGameState("running")
        end,
        showSetting = function()
            menu:changeGameState("setting")
        end,
        quitGame = function()
            love.event.quit()
        end,
    }

    local buttons = {
        Button(funcs.newGame, nil, nil, love.graphics.getWidth() / 3, 50, "New Game", "center", "h3", love.graphics.getWidth() / 3, love.graphics.getHeight() * 0.25),
        Button(funcs.showSetting, nil, nil, love.graphics.getWidth() / 3, 50, "Setting", "center", "h3", love.graphics.getWidth() / 3, love.graphics.getHeight() * 0.40),
        Button(funcs.quitGame, nil, nil, love.graphics.getWidth() / 3, 50, "Quit", "center", "h3", love.graphics.getWidth() / 3, love.graphics.getHeight() * 0.55),
    }

    return {

        state = {
            menu = true,
            paused = false,
            running = false,
            ended = false,
            setting = false,
        },

        changeGameState = function(self, state)
            menu.state["menu"] = state == "menu"
            menu.state["paused"] = state == "paused"
            menu.state["running"] = state == "running"
            menu.state["ended"] = state == "ended"
            menu.state["setting"] = state == "setting" print("changed to " .. state)
        end,

        focused = "",
        run = function(self, clicked)
            local mouse_x, mouse_y = love.mouse.getPosition()
            for name, button in pairs(buttons) do
                if button:checkHover(mouse_x, mouse_y, 10) then
                    if clicked then
                        print("clicked " .. name)
                        button:click()
                    end

                    self.focused = name

                    button:setTextColor(0.8, 0.2, 0.2)
                else
                    button:setTextColor(1, 1, 1)
                end
            end
        end,

        draw = function(self)
            for _, button in pairs(buttons) do
                button:draw()
            end
        end
    }
end

return Menu



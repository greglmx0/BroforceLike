require("src/components/Button")

function GameOver()

    local funcs = {
        newGame = function ()
            game = Game()
            gamePaused = GamePaused(game)
            menu:changeGameState("running")
        end,
        returnToMenu = function()
            menu:changeGameState("menu")
        end,
        quitGame = function()
            love.event.quit()
        end,
    }

    local buttons = {
        Button(funcs.newGame, nil, nil, love.graphics.getWidth() / 3, 50, "New Game", "center", "h3", love.graphics.getWidth() / 3, love.graphics.getHeight() * 0.25),
        Button(funcs.returnToMenu, nil, nil, love.graphics.getWidth() / 3, 50, "Menu", "center", "h3", love.graphics.getWidth() / 3, love.graphics.getHeight() * 0.40),
        Button(funcs.quitGame, nil, nil, love.graphics.getWidth() / 3, 50, "Quit", "center", "h3", love.graphics.getWidth() / 3, love.graphics.getHeight() * 0.55),
    }

    return {
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

return GameOver

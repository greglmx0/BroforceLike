
function EditorPaused()
    local funcs = {
        returnInEditor = function()
            menu:changeGameState("editor")
        end,
        backToMenu = function()
            menu:changeGameState("menu")
        end,
        quitGame = function()
            love.event.quit()
        end,
    }
    local buttons = {
        Button(funcs.returnInEditor, nil, nil, love.graphics.getWidth() / 3, 50, "Back to editor", "center", "h3", love.graphics.getWidth() / 3, love.graphics.getHeight() * 0.35),
        Button(funcs.backToMenu, nil, nil, love.graphics.getWidth() / 3, 50, "Back to menu", "center", "h3", love.graphics.getWidth() / 3, love.graphics.getHeight() * 0.50),
        Button(funcs.quitGame, nil, nil, love.graphics.getWidth() / 3, 50, "Quit game", "center", "h3", love.graphics.getWidth() / 3, love.graphics.getHeight() * 0.65),
    }

    return {

        focused = "",
        run = function(self, clicked)
            local mouse_x, mouse_y = love.mouse.getPosition()
            for name, button in pairs(buttons) do
                if button:checkHover(mouse_x, mouse_y, 10) then
                    if clicked then
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

            love.graphics.setColor(1, 1, 1)
            love.graphics.print("Paused", 0, 0)

            for _, button in pairs(buttons) do
                button:draw()
            end

        end
    }

end

return EditorPaused
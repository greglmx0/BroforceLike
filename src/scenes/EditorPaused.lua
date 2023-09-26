local editorPaused = {}

editorPaused.focused = ""

function editorPaused:quitGame()
    love.event.quit()
end

function editorPaused:backToMenu()
    menu:changeGameState("menu")
end

function editorPaused:returnInEditor()
    menu:changeGameState("editor")
end

local buttons = {
    Button(editorPaused.returnInEditor, nil, nil, love.graphics.getWidth() / 3, 50, "Back to editor", "center", "h3", love.graphics.getWidth() / 3, love.graphics.getHeight() * 0.35),
    Button(editorPaused.backToMenu, nil, nil, love.graphics.getWidth() / 3, 50, "Back to menu", "center", "h3", love.graphics.getWidth() / 3, love.graphics.getHeight() * 0.50),
    Button(editorPaused.quitGame, nil, nil, love.graphics.getWidth() / 3, 50, "Quit game", "center", "h3", love.graphics.getWidth() / 3, love.graphics.getHeight() * 0.65),
}

function editorPaused:run(clicked)
    local mouse_x, mouse_y = love.mouse.getPosition()
    for name, button in pairs(buttons) do
        if button:checkHover(mouse_x, mouse_y, 10) then
            if clicked then
                button:click()
            end
            editorPaused.focused = name
            button:setTextColor(0.8, 0.2, 0.2)
        else
            button:setTextColor(1, 1, 1)
        end
    end
end

function editorPaused:draw(self)

    love.graphics.setBackgroundColor(0/255, 0/255, 0/255)

    for _, button in pairs(buttons) do
        button:draw()
    end

end

return editorPaused
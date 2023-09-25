local setting = {}

setting.focused = ""

function setting:backToMenu()
    menu:changeGameState("menu")
end

local buttons = {
    Button(setting.backToMenu, nil, nil, love.graphics.getWidth() / 3, 50, "Back to menu", "center", "h3", love.graphics.getWidth() / 3, love.graphics.getHeight() * 0.80),
}

function setting:run(clicked)
    local mouse_x, mouse_y = love.mouse.getPosition()
    for name, button in pairs(buttons) do
        if button:checkHover(mouse_x, mouse_y, 10) then
            if clicked then
                button:click()
            end
            setting.focused = name
            button:setTextColor(0.8, 0.2, 0.2)
        else
            button:setTextColor(1, 1, 1)
        end
    end
end

function setting:draw()

    love.graphics.setColor(1, 1, 1)
    love.graphics.print("Setting", 0, 0)

    for _, button in pairs(buttons) do
        button:draw()
    end
end

return setting
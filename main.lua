--global = require "global"
local menu = require "scenes/Menu"
local intro = require "scenes/gameIntro"

scene = "menu"

function love.load()

    love.graphics.setBackgroundColor(0, 0, 0)
    love.graphics.setColor(255, 255, 255)
    love.graphics.setNewFont(12)
    -- love.window.setTitle("Broforce Like <3")

    if scene == "menu" then
        menu.load()

    elseif scene == "intro" then
        intro.load()
    end



end

function love.draw()
    -- scene.draw()

    if scene == "menu" then
        menu.draw()

    elseif scene == "intro" then
        intro.draw()
    end
end

function love.mousepressed(x, y, button, istouch)

    if scene == "menu" then
        menu.mousepressed(x, y, button, istouch)
    elseif scene == "intro" then
        intro.mousepressed(x, y, button, istouch)
    end

    -- scene.mousepressed(x, y, button, istouch)

    print("x: " .. x .. " y: " .. y)
end
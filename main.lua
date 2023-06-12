local love = require("love")
local Player = require "entity/Player"
local Menu = require "scenes/Menu"
local Game = require "scenes/GameIntro"
local Setting = require "scenes/Setting"
local Pause = require "scenes/Pause"

function love.load()
    mouse_x, mouse_y = 0, 0
    menu = Menu()
    setting = Setting()
end

function love.update(dt)

    mouse_x, mouse_y = love.mouse.getPosition()

    if menu.state.running then
        player:update(dt)
    end

    if menu.state.menu then
        menu:run(clickedMouse)
        clickedMouse = false
    end

    if menu.state.paused then
        pause:run(clickedMouse)
        clickedMouse = false
    end

    if menu.state.setting then
        setting:run(clickedMouse)
        clickedMouse = false
    end

end

function love.draw()

    if menu.state["running"] then

        player:draw()
        game:draw()

    elseif menu.state["menu"] then

        menu:draw()

    elseif menu.state["paused"] then

        pause:draw()

    elseif menu.state["setting"] then

        setting:draw()

    elseif menu.state["ended"] then
        love.graphics.printf("Game Over", fonts.massive.font, 0, love.graphics.getHeight() / 2 - fonts.massive.size, love.graphics.getWidth(), "center")
    end

    if not menu.state["running"] then
        -- if game is NOT running

    end
end

function love.keypressed(key)
    if menu.state.running then

        if key == "escape" then
            menu:changeGameState("paused")
        end
    elseif menu.state.paused then

        if key == "escape" then
            menu:changeGameState("running")
        end
    end
end

--function love.mousepressed(x, y, button, istouch)
--    print("x: " .. x .. " y: " .. y)
--end

function love.mousepressed(x, y, button, istouch, presses)
    if button == 1 then
        if not menu.state.running or not menu.state.paused then
            clickedMouse = true -- set if mouse is clicked
        end
    end
end
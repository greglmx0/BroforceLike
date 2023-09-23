local love = require("love")
local Player = require "entity/Player"
local Menu = require "scenes/Menu"
local Setting = require "scenes/Setting"
local Pause = require "scenes/Pause"
local editor = require "MapEditor/src/mainMapEditor"
grid = require("MapEditor/src/grid")

if arg[#arg] == "--debug" then require("mobdebug").start() end

function love.load()
    mouse_x, mouse_y = 0, 0
    menu = Menu()
    setting = Setting()

    if menu.state.editor then
        editor.load()
    end

end

function love.update(dt)

    mouse_x, mouse_y = love.mouse.getPosition()

    if menu.state.running then
        -- player:update(dt)
        game:update(dt)
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

    if menu.state.gameover then
        gameover:run(clickedMouse)
        clickedMouse = false
    end

    if menu.state.editor then
        editor.update(dt)
    end

end

function love.draw()

    if menu.state["running"] then

        game:draw()
        player:draw()

    elseif menu.state["menu"] then

        menu:draw()

    elseif menu.state["paused"] then

        pause:draw()

    elseif menu.state["setting"] then

        setting:draw()

    elseif menu.state["editor"] then

        editor.draw()

    elseif menu.state["gameover"] then
        gameover:draw()

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

    if menu.state.editor then
        editor.mousepressed(x, y, touch)
    end

    if button == 1 then
        if not menu.state.running or not menu.state.paused then
            clickedMouse = true -- set if mouse is clicked
        end
    end
end

function love.textinput(t)
    if menu.state.editor then
        editor:textinput(t)
    end
end

function love.keypressed(key)
    if menu.state.editor then
        editor.keypressed(key)
    end
end

function love.wheelmoved(x, y)
    if menu.state.editor then
        editor.wheelmoved(x, y)
    end
end
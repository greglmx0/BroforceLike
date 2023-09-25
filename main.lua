local love = require("love")
local Menu = require "src/scenes/Menu"
editor = require "src/scenes/Editor"
grid = require("src/grid")
editorPaused = require("src/scenes/EditorPaused")
game = require "src/scenes/GameIntro"
setting = require "src/scenes/Setting"
drawMap = require("src/Maps/drawMap")

global = require("global")

if arg[#arg] == "--debug" then
    require("mobdebug").start()
end


function love.load()
    mouse_x, mouse_y = 0, 0
    menu = Menu()

    if menu.state.editor then
        editor.load()
    end
end

function love.update(dt)

    mouse_x, mouse_y = love.mouse.getPosition()

    if menu.state.running then
        if not global.mapRefreshed then
            drawMap:refreshMap()
            global.mapRefreshed = true
        end
        game:update(dt)
    end

    if menu.state.menu then
        menu:run(clickedMouse)
        clickedMouse = false
    end

    if menu.state.gamePaused then
        gamePaused:run(clickedMouse)
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

    if menu.state.editorPaused then
        editorPaused:run(clickedMouse)
        clickedMouse = false
    end
end

function love.draw()

    if menu.state["running"] then
        game:draw()
        player:draw()
    elseif menu.state["menu"] then
        menu:draw()
    elseif menu.state["gamePaused"] then
        gamePaused:draw()
    elseif menu.state["editorPaused"] then
        editorPaused:draw()
    elseif menu.state["setting"] then
        setting:draw()
    elseif menu.state["editor"] then
        editor.draw()
    elseif menu.state["gameover"] then
        gameover:draw()
    end
end

function love.keypressed(key)
    if menu.state.running then

        if key == "escape" then
            menu:changeGameState("gamePaused")
        end
    elseif menu.state.paused then

        if key == "escape" then
            menu:changeGameState("running")
        end
    end
end

function love.mousepressed(x, y, button, istouch, presses)

    if menu.state.editor then
        editor.mousepressed(x, y, touch)
    end

    if button == 1 then
        if not menu.state.running or not menu.state.gamePaused then
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
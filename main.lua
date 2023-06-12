local love = require("love")
local Player = require "entity/Player"
local Menu = require "scenes/Menu"
local Game = require "scenes/GameIntro"
local Setting = require "scenes/Setting"
local Pause = require "scenes/Pause"

function love.load()
    mouse_x, mouse_y = 0, 0

    game = Game()
    pause = Pause(game)
    setting = Setting(game)
    player = Player(4)
    menu = Menu(game, player)
end

function love.update(dt)

    mouse_x, mouse_y = love.mouse.getPosition()

    if game.state.running then
        player:update(dt)
    end

    if game.state.menu then
        menu:run(clickedMouse)
        clickedMouse = false
    end

    if game.state.paused then
        pause:run(clickedMouse)
        clickedMouse = false
    end

    if game.state.setting then
        setting:run(clickedMouse)
        clickedMouse = false
    end

end

function love.draw()

    if game.state["running"] then

        player:draw()
        game:draw()

    elseif game.state["menu"] then

        menu:draw()

    elseif game.state["paused"] then

        pause:draw()

    elseif game.state["setting"] then

        setting:draw()

    elseif game.state["ended"] then
        love.graphics.printf("Game Over", fonts.massive.font, 0, love.graphics.getHeight() / 2 - fonts.massive.size, love.graphics.getWidth(), "center")
    end

    if not game.state["running"] then
        -- if game is NOT running

    end
end

function love.keypressed(key)
    if game.state.running then

        if key == "escape" then
            game:changeGameState("paused")
        end
    elseif game.state.paused then

        if key == "escape" then
            game:changeGameState("running")
        end
    end
end

--function love.mousepressed(x, y, button, istouch)
--    print("x: " .. x .. " y: " .. y)
--end

function love.mousepressed(x, y, button, istouch, presses)
    if button == 1 then
        if not game.state.running or not game.state.paused then
            clickedMouse = true -- set if mouse is clicked
        end
    end
end
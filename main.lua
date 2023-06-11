local love = require("love")
local Player = require "entity/Player"
local Menu = require "scenes/Menu"
local Game = require "scenes/GameIntro"

function love.load()
    mouse_x, mouse_y = 0, 0

    game = Game()
    player = Player(4)
    menu = Menu( game, player )

end

function love.update(dt)

    mouse_x, mouse_y = love.mouse.getPosition()

    if game.state.menu or game.state.paused then -- check if in menu state
        menu:run(clickedMouse) -- run the menu
        clickedMouse = false -- set mouse cicked
    end

end

function love.draw()

    if game.state["running"] then

        -- game:draw()

    elseif game.state["menu"] then

        menu:draw()

    elseif game.state["paused"] then

        menu:draw()

    elseif game.state["ended"] then
        love.graphics.printf("Game Over", fonts.massive.font, 0, love.graphics.getHeight() / 2 - fonts.massive.size, love.graphics.getWidth(), "center")
    end

    if not game.state["running"] then
        -- only execute if the game state is NOT running

    end
end

function love.keypressed(key)
    if game.state.running then

        if key == "z" or key == "up"  then
            print(key)
        end

        if key == "s" or key == "down"  then
            print(key)
        end

        if key == "q" or key == "left"  then
            print(key)
        end

        if key == "d" or key == "right"  then
            print(key)
        end

        if key == "space" then
            print(key)
        end

        if key == "escape" then
            print(game.state)
            game:changeGameState("paused")
            print(game.state)
        end
    elseif game.state.paused then

        if key == "escape" then
            print(game.state)
            game:changeGameState("running")
            print(game.state)
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
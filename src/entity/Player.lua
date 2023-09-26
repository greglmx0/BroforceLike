local GameOver = require "src/scenes/GameOver"
local utils = require "src/utils/utils"
local map = require "src/data/map"

player = {}

player.x = 128
player.y = 600
player.width = 32
player.height = 32

player.speed = 8
player.inJump = false
player.timeJump = 0
player.timeMaxJump = 20

player.wapon = {}
player.tileKill = { 43, 78, 77, 100, 68, 69 }

function player:load(lives)
    player.lives = lives or 3
end

function player.draw()

    love.graphics.setColor(255, 255, 255)
    love.graphics.rectangle("fill", love.graphics.getWidth() / 2, player.y, player.width, player.height)

    love.graphics.setColor(0.1, 0.1, 0.1)
    love.graphics.setFont(love.graphics.newFont(10))
    love.graphics.printf(player.x .. "", love.graphics.getWidth() / 2, player.y, player.width, "center")
end

function player.update(dt)

    if menu.state.running then

        player:gravity()
        player:jump()
        player.moveLeft()
        player:moveRight()

        player.checkDead()
    end
end

function player:tileColision(player_x, player_y, player_width, player_height, idObject)

    idObject = idObject or { 1 }

    print(player_x, player_y, player_width, player_height, idObject)

    if type(idObject) == "number" then
        idObject = { idObject }
    end

    idObject = tableMerge(player.tileKill, idObject)
    if findInArray(idObject, map[math.floor(player_y / 64) + 1][math.floor(player_x / 64) + 2])
            or findInArray(idObject, map[math.floor((player_y + player_height) / 64) + 1][math.floor(player_x / 64) + 2])
            or findInArray(idObject, map[math.floor(player_y / 64) + 1][math.floor((player_x + player_width) / 64) + 2])
            or findInArray(idObject, map[math.floor((player_y + player_height) / 64) + 1][math.floor((player_x + player_width) / 64) + 2])
    then
        return true
    end
    return false
end

function player:playerDead()
    if player.lives <= 0 then
        gameover = GameOver()
        menu:changeGameState("gameover")
        return
    else
        player.lives = player.lives - 1
        player.x = 128
        player.y = 600
    end
end

function player:checkDead()

    if player:tileColision(player.x, player.y, player.width, player.height, 100) then
        player:playerDead()
    end

end

function player:spikeColision ()
    box = {
        x = 19 * 64 - player.x - 12,
        y = 12 * 64,
        w = 64,
        h = 20,
    }

    if player.x >= box.x + box.w
            or player.x + player.width <= box.x
            or player.y >= box.y + box.h
            or player.y + player.height <= box.y
    then
        return false
    else
        return true
    end
end

function player:gravity()
    if player.y + player.height < love.graphics.getHeight() then
        for i = 8, 0, -1 do

            if player:tileColision(player.x, player.y + i, player.width, player.height) == false then
                player.y = player.y + i
                break
            else
                player.inJump = false
                player.timeJump = 0
            end
        end
    end
end

function player:jump ()
    if love.keyboard.isDown("space", "up") then

        if player.inJump == false then
            player.inJump = true
        end

        if player.timeJump < player.timeMaxJump and player.inJump == true then
            player.timeJump = player.timeJump + 1
            for i = 12, 0, -1 do
                if player:tileColision(player.x, player.y - i, player.width, player.height) == false
                then
                    player.y = player.y - i
                    break
                end
            end
        end

    end
end

function player:moveLeft()
    if love.keyboard.isDown("q", "left") then

        for i = 8, 0, -1 do

            if player:tileColision(player.x - i, player.y, player.width, player.height) == false then
                player.x = player.x - i
                break
            end
        end
    end
end

function player:moveRight()
    if love.keyboard.isDown("d", "right") then

        for i = 8, 0, -1 do
            if player:tileColision(player.x + i, player.y, player.width, player.height) == false then
                player.x = player.x + i
                break
            end
        end
    end
end

return player
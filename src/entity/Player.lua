local GameOver = require "src/scenes/GameOver"
local utils = require "src/utils/utils"
local map = require "src/data/map"

function Player(num_lives)

    return {
        lives = num_lives or 3,
        map = map,

        x = 128,
        y = 600,
        width = 32,
        height = 32,

        speed = 8,
        inJump = false,
        timeJump = 0,
        timeMaxJump = 20,

        wapon = {},
        tileKill = {43, 78,77, 100, 68,69},

        draw = function(self)

            love.graphics.setColor(255, 255, 255)
            love.graphics.rectangle("fill", love.graphics.getWidth() / 2, self.y, self.width, self.height)

            love.graphics.setColor(0.1, 0.1, 0.1)
            love.graphics.setFont(love.graphics.newFont(10))
            love.graphics.printf(self.x .. "", love.graphics.getWidth() / 2, self.y, self.width, "center")
        end,

        update = function(self, dt)

            if menu.state.running then

                -- self:spikeColision(self)

                self:gravity(self)
                self:jump(self)
                self.moveLeft(self)
                self:moveRight(self)

                self.checkDead(self)
            end
        end,

        tileColision = function(player_x, player_y, player_width, player_height, idObject)

            idObject = idObject or {1}

            if type(idObject) == "number" then
              idObject = {idObject}
            end

            idObject =  tableMerge(player.tileKill, idObject)
            if findInArray( idObject, map[math.floor(player_y / 64) + 1][math.floor(player_x / 64) + 2])
                    or findInArray( idObject, map[math.floor((player_y + player_height) / 64) + 1][math.floor(player_x / 64) + 2])
                    or findInArray( idObject, map[math.floor(player_y / 64) + 1][math.floor((player_x + player_width) / 64) + 2])
                    or findInArray( idObject, map[math.floor((player_y + player_height) / 64) + 1][math.floor((player_x + player_width) / 64) + 2] )
            then
                -- print("colision")
                return true
            end
            -- print("no colision")
            return false
        end,

        playerDead = function(self)
            if self.lives <= 0 then
                gameover = GameOver()
                menu:changeGameState("gameover")
                return
            else
                self.lives = self.lives - 1
                self.x = 128
                self.y = 600
            end
        end,

        checkDead = function(self)

            if self.tileColision(self.x, self.y, self.width, self.height, 100) then
                self:playerDead()
            end

        end,

        spikeColision = function(self)
            box = {
                x = 19*64 - self.x - 12,
                y = 12*64,
                w = 64,
                h = 20,
            }

            if         player.x >= box.x + box.w
                    or player.x + player.width <= box.x
                    or player.y >= box.y + box.h
                    or player.y + player.height <= box.y
            then
                return false
            else
                return true
            end
        end,

        gravity = function(self)
            if self.y + self.height < love.graphics.getHeight() then
                for i = 8, 0, -1 do

                    if self.tileColision(self.x, self.y + i, self.width, self.height) == false then
                        self.y = self.y + i
                        break
                    else
                        self.inJump = false
                        self.timeJump = 0
                    end
                end
            end
        end,

        jump = function(self)
            if love.keyboard.isDown("space", "up") then

                if self.inJump == false then
                    self.inJump = true
                end


                if self.timeJump < self.timeMaxJump and self.inJump == true then
                    self.timeJump = self.timeJump + 1
                    for i = 12, 0, -1 do
                        if         self.tileColision(self.x, self.y - i, self.width, self.height) == false
                        then
                            self.y = self.y - i
                            break
                        end
                    end
                end

            end
        end,

        moveLeft = function(self)
            if love.keyboard.isDown("q", "left") then

                for i = 8, 0, -1 do

                    if self.tileColision(self.x - i, self.y, self.width, self.height) == false then
                        self.x = self.x - i
                        break
                    end
                end
            end
        end,

        moveRight = function(self)
            if love.keyboard.isDown("d", "right") then

                for i = 8, 0, -1 do
                    if self.tileColision(self.x + i, self.y, self.width, self.height) == false then
                        self.x = self.x + i
                        break
                    end
                end
            end
        end
    }
end

return Player
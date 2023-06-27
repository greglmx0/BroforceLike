map = require "Maps/MapIntro"

function Player(num_lives, map)

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


        draw = function(self)

            love.graphics.setColor(255, 255, 255)
            love.graphics.rectangle("fill", love.graphics.getWidth() / 2, self.y, self.width, self.height)

            love.graphics.setColor(0.1, 0.1, 0.1)
            love.graphics.setFont(love.graphics.newFont(10))
            love.graphics.printf(self.x .. "", love.graphics.getWidth() / 2, self.y, self.width, "center")

        end,

        ---- check colision AABB (Axis-Aligned Bounding Box)

        --[[
                curseur_x >= box.x
            && curseur_x < box.x + box.w
            && curseur_y >= box.y
            && curseur_y < box.y + box.h)
        ]]


        colision = function(player_x, player_y, player_width, player_height, object_map)

            if         object_map.map[math.floor(player_y / 64) + 1]                                [math.floor(player_x / 64) + 2 ] == 1
                     or object_map.map[math.floor((player_y + player_height) / 64) + 1]              [math.floor(player_x / 64) + 2 ] == 1
                     or object_map.map[math.floor(player_y / 64) + 1]                                [math.floor((player_x + player_width) / 64) + 2 ] == 1
                     or object_map.map[math.floor((player_y + player_height) / 64) + 1]              [math.floor((player_x + player_width) / 64) + 2 ] == 1
            then
                -- print("colision")
                return true
            end


            -- print("no colision")
            return false
        end,

        checkDead = function(self)

            player_x = math.floor(self.x / 64)
            player_y = math.floor((self.y + 32 + 1) / 64)

            if self.map.map[player_y + 1][player_x + 1] == 100 then
                if self.lives <= 0 then
                    menu:changeGameState("gameover")
                    return
                else
                    self.lives = self.lives - 1
                    self.x = 128
                    self.y = 600
                end
            end
        end,

        update = function(self, dt)

            if menu.state.running then

                -- gravity
                if self.y + self.height < love.graphics.getHeight() then
                    for i = 8, 0, -1 do

                        if self.colision(self.x, self.y + i, self.width, self.height, self.map) == false then
                            self.y = self.y + i
                            break
                        else
                            self.inJump = false
                            self.timeJump = 0
                        end
                    end
                end

                -- jump
                if love.keyboard.isDown("space") or love.keyboard.isDown("up") then

                    if self.inJump == false then
                        -- and self.colision(self.x, self.y -1, self.width, self.height, self.map) == false
                        self.inJump = true

                        for i = 12, 0, -1 do
                            if self.colision(self.x, self.y - i, self.width, self.height, self.map) == false then
                                self.y = self.y - i
                                break
                            end
                        end
                    end
                end

                if self.timeJump < self.timeMaxJump and self.inJump == true then
                    self.timeJump = self.timeJump + 1
                    for i = 12, 0, -1 do
                        if self.colision(self.x, self.y - i, self.width, self.height, self.map) == false then
                            self.y = self.y - i
                            break
                        end
                    end
                end

                if love.keyboard.isDown("s") or love.keyboard.isDown("down") then


                end

                -- move left
                if love.keyboard.isDown("q") or love.keyboard.isDown("left") then

                    for i = 8, 0, -1 do

                        if self.colision(self.x - i, self.y, self.width, self.height, self.map) == false then
                            self.x = self.x - i
                            break
                        end
                    end
                end

                -- move right
                if love.keyboard.isDown("d") or love.keyboard.isDown("right") then

                    for i = 8, 0, -1 do

                        if self.colision(self.x + i, self.y, self.width, self.height, self.map) == false then
                            self.x = self.x + i
                            break
                        end
                    end
                end

                self.checkDead(self)

            end
        end,
    }
end

return Player





--player = {}
--player.__index = player
--
--function player:new(name, x, y)
--    local p = {}
--    setmetatable(p, player)
--
--    p.name = name
--    p.x = x
--    p.y = y
--
--    print("Player " .. p.name .. " created !")
--    print("x: " .. p.x .. " y: " .. p.y)
--
--    return p
--end
--
--function player:draw()
--    -- love.graphics.setColor(125, 125, 125)
--    -- love.graphics.rectangle("fill", self.x, self.y, 100, 100)
--    -- love.graphics.circle("fill", self.x, self.y, 50)
--end
--
--function player:update(dt)
--    -- self.x = self.x + 1
--end
--
--function player:mousepressed(x, y, button, istouch)
--    print("PAN !")
--end

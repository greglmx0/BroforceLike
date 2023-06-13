map = require "Maps/MapIntro"

function Player(num_lives, map)

    return {
        lives = num_lives or 3,
        map = map,

        x = 128,
        y = 128,
        width = 32,
        height = 32,

        rotation = 0,
        expload_time = 0,
        exploading = false,
        thrusting = false,
        wapon = {},

        draw = function(self)

            love.graphics.setColor(255, 255, 255)
            love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
            love.graphics.setColor(0, 0, 0)

        end,

        ---- check colision AABB (Axis-Aligned Bounding Box)

        --[[
                curseur_x >= box.x
            && curseur_x < box.x + box.w
            && curseur_y >= box.y
            && curseur_y < box.y + box.h)
        ]]


        colision = function(player_x, player_y, player_width, player_height, object_map)

            if object_map.map[math.floor(player_y / 64)][math.floor(player_x / 64)] == 1
                    or object_map.map[math.floor((player_y + player_height) / 64)][math.floor(player_x / 64)] == 1
                    or object_map.map[math.floor(player_y / 64)][math.floor((player_x + player_width) / 64)] == 1
                    or object_map.map[math.floor((player_y + player_height) / 64)][math.floor((player_x + player_width) / 64)] == 1
            then
                return true
            end

            return false
        end,

        update = function(self, dt)

            if menu.state.running then

                -- check colision with map
                --if self.colision(self.x, self.y, self.width, self.height, self.map) then
                --    print("COLLISION")
                --else
                --    print("NO COLLISION")
                --end

                if self.y + self.height < love.graphics.getHeight()
                        and self.colision(self.x, self.y + 8, self.width, self.height, self.map) == false then
                    self.y = self.y + 8
                end

                if love.keyboard.isDown("space") or love.keyboard.isDown("up") then

                    print(dt)

                    if      self.y > 0
                            and self.colision(self.x, self.y - 8, self.width, self.height, self.map) == false then
                        self.y = self.y - 8
                    end
                end

                if love.keyboard.isDown("s") or love.keyboard.isDown("down") then


                end

                if love.keyboard.isDown("q") or love.keyboard.isDown("left") then

                    if self.x > 0 and self.colision(self.x - 8, self.y, self.width, self.height, self.map) == false then
                        self.x = self.x - 8
                    end
                end

                if love.keyboard.isDown("d") or love.keyboard.isDown("right") then

                    if self.colision(self.x + 8, self.y, self.width, self.height, self.map) == false then
                        self.x = self.x + 8
                    end
                end
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

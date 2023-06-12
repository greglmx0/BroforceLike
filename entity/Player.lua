function Player(num_lives)

    return {
        lives = num_lives or 3,
        x = love.graphics.getWidth() / 2,
        y = love.graphics.getHeight() / 2,
        rotation = 0,
        expload_time = 0,
        exploading = false,
        thrusting = false,
        wapon = {},

        draw = function(self)

            love.graphics.setColor(255, 255, 255)
            love.graphics.rectangle("fill", self.x, self.y, 40, 80)
            love.graphics.setColor(0, 0, 0)

        end,

        update = function(self, dt)

            if menu.state.running then

                if love.keyboard.isDown("z") or love.keyboard.isDown("up") then

                    if self.y - 80 < love.graphics.getHeight() then
                        self.y = self.y - 10
                    end

                    self.y = self.y - 10
                end

                if love.keyboard.isDown("s") or love.keyboard.isDown("down") then

                    -- test if player is not under the floor
                    if self.y + 80 < love.graphics.getHeight() then
                        self.y = self.y + 10
                    end

                    -- self.y = self.y + 10
                end

                if love.keyboard.isDown("q") or love.keyboard.isDown("left") then
                    self.x = self.x - 10
                end

                if love.keyboard.isDown("d") or love.keyboard.isDown("right") then
                    self.x = self.x + 10
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

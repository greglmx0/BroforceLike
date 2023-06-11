local love = require "love"

player = {}
player.__index = player

function player:new(name, x, y)
    local p = {}
    setmetatable(p, player)

    p.name = name
    p.x = x
    p.y = y

    print("Player " .. p.name .. " created !")
    print("x: " .. p.x .. " y: " .. p.y)

    return p
end

function player:draw()
    -- love.graphics.setColor(125, 125, 125)
    -- love.graphics.rectangle("fill", self.x, self.y, 100, 100)
    -- love.graphics.circle("fill", self.x, self.y, 50)
end

function player:update(dt)
    -- self.x = self.x + 1
end

function player:mousepressed(x, y, button, istouch)
    print("PAN !")
end

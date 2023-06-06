require("GUI/quitButton")
require("GUI/introButton")

local menu = {}

    width = love.graphics.getWidth()
    height = love.graphics.getHeight()

function menu.load()
    love.graphics.setBackgroundColor(0, 0, 0)
    love.graphics.setColor(255, 255, 255)
    love.graphics.setNewFont(12)
    love.window.setTitle("Broforce Like <3 -- Menu")
    love.window.setMode(1640, 900, {resizable=true, vsync=0, minwidth=1640, minheight=900})

    introButton = introButton:new( width, 500, 250, 50)
    quitButton = quitButton:new( width, 600, 250, 50)
end

function menu.draw()
    quitButton:draw()
    introButton:draw()
end

function menu.mousepressed(x, y, button, istouch)
    quitButton:mousepressed(x, y, button, istouch)
    introButton:mousepressed(x, y, button, istouch)
end

return menu




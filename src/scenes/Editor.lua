
local editor = {}

io.stdout:setvbuf('no')
--love.graphics.setDefaultFilter("nearest")
--if arg[#arg] == "-debug" then require("mobdebug").start() end
--utf8 = require("utf8")

mouseTouch1 = 1
mouseTouch2 = 2

window = {}
window.width = 1640
window.height = 900
Font = love.graphics.newFont(16)

camera = require("src/camera")
action = require("src/action")
tool = require("src/tool")
tile = require("src/tile")
mouse = require("src/mouse")
hud = require("src/hud")
export = require("src/export")
import = require("src/import")
input = require("src/input")

function editor.load()

  grid.load()
  input.load()

  window.grid = {}
  window.grid.width = window.width-hud.leftBar.width-hud.rightBar.width
  window.grid.height = window.height-hud.topBar.height
  
  action.resetPos.f()
  import.importMap()
  
end

function editor.mousepressed(x, y, touch)
  
  action.mousepressed(touch)
  import.mousepressed(touch)
  export.mousepressed(touch)
  input.mousepressed(touch)
  
end

function editor.textinput(t)
  input.textinput(t)
end

function editor.keypressed(key)
  input.keypressed(key)
end

function editor.wheelmoved(x, y)
  action.zoom.wheelmoved(y)
end

function editor.update(dt)
  
  mouse.update()
  action.update(dt)
  tool.update()
  tile.update()
  
end

function editor.draw()
  
  love.graphics.setBackgroundColor(50/255, 50/255, 50/255)
  
  camera:set()
    grid.draw() -- draw tiles
    action.grid.f() -- draw grid
  camera:unset()
  
  hud.leftBar.draw()
  hud.rightBar.draw()
  hud.topBar.draw()

  hud.drawButtonLeftBar(5, 50, 10, 30, tool.list)
  hud.drawButtonLeftBar(5, 400, 10, 30, action.list)
  hud.drawButtonLeftBar(5, 650, 10, 30, action.importantList)
  hud.drawButtonTopBar(450, 5, 10, 30, export.list, "Save")
  hud.drawTile(10, 100, 1, 32)
  input.draw()
end

return editor
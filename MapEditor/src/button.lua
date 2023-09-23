local button = {}
button.bg = {}
button.bgInput = {}
button.list = {}

--Background
button.bg.on = love.graphics.newImage("MapEditor/src/graph/button/bgButtonOn.png")
button.bg.off = love.graphics.newImage("MapEditor/src/graph/button/bgButtonOff.png")
button.bg.over = love.graphics.newImage("MapEditor/src/graph/button/bgButtonOver.png")

button.bgInput.on = love.graphics.newImage("MapEditor/src/graph/button/bgInputOn.png")
button.bgInput.off = love.graphics.newImage("MapEditor/src/graph/button/bgInputOff.png")
button.bgInput.over = love.graphics.newImage("MapEditor/src/graph/button/bgInputOver.png")


--Tool
--button.list["select"] = love.graphics.newImage("MapEditor/src/graph/button/toolButtonSelect.png")
button.list["pen"] = love.graphics.newImage("MapEditor/src/graph/button/toolButtonPen.png")
button.list["erase"] = love.graphics.newImage("MapEditor/src/graph/button/toolButtonErase.png")
button.list["fill"] = love.graphics.newImage("MapEditor/src/graph/button/toolButtonFill.png")
--button.list["tileSwapper"] = love.graphics.newImage("MapEditor/src/graph/button/toolButtonTileSwapper.png")
button.list["tilePicker"] = love.graphics.newImage("MapEditor/src/graph/button/toolButtonTilePicker.png")
button.list["camera"] = love.graphics.newImage("MapEditor/src/graph/button/toolButtonCamera.png")

--Action
button.list["grid"] = love.graphics.newImage("MapEditor/src/graph/button/actionButtonGrid.png")
button.list["resetPos"] = love.graphics.newImage("MapEditor/src/graph/button/actionButtonResetPos.png")
button.list["resetMap"] = love.graphics.newImage("MapEditor/src/graph/button/actionButtonResetMap.png")

--Import/Export
button.list["exportLua"] = love.graphics.newImage("MapEditor/src/graph/button/actionButtonExportLua.png")
--button.list["exportTxt"] = love.graphics.newImage("MapEditor/src/graph/button/actionButtonExportTxt.png")
--button.list["exportJson"] = love.graphics.newImage("MapEditor/src/graph/button/actionButtonExportJson.png")
button.list["importLua"] = love.graphics.newImage("MapEditor/src/graph/button/actionButtonImportLua.png")
--button.list["importTxt"] = love.graphics.newImage("MapEditor/src/graph/button/actionButtonImportTxt.png")
--button.list["importJson"] = love.graphics.newImage("MapEditor/src/graph/button/actionButtonImportJson.png")

return button
local button = {}
button.bg = {}
button.bgInput = {}
button.list = {}

path = "src/asset/button/"

--Background
button.bg.on = love.graphics.newImage(path .. "bgButtonOn.png")
button.bg.off = love.graphics.newImage(path .. "bgButtonOff.png")
button.bg.over = love.graphics.newImage(path .. "bgButtonOver.png")

button.bgInput.on = love.graphics.newImage(path .. "bgInputOn.png")
button.bgInput.off = love.graphics.newImage(path .. "bgInputOff.png")
button.bgInput.over = love.graphics.newImage(path .. "bgInputOver.png")


--Tool
--button.list["select"] = love.graphics.newImage("MapEditor/src/graph/button/toolButtonSelect.png")
button.list["pen"] = love.graphics.newImage(path .. "toolButtonPen.png")
button.list["erase"] = love.graphics.newImage(path .. "toolButtonErase.png")
button.list["fill"] = love.graphics.newImage(path .. "toolButtonFill.png")
--button.list["tileSwapper"] = love.graphics.newImage("MapEditor/src/graph/button/toolButtonTileSwapper.png")
button.list["tilePicker"] = love.graphics.newImage(path .. "toolButtonTilePicker.png")
button.list["camera"] = love.graphics.newImage(path .. "toolButtonCamera.png")

--Action
button.list["grid"] = love.graphics.newImage(path .. "actionButtonGrid.png")
button.list["resetPos"] = love.graphics.newImage(path .. "actionButtonResetPos.png")
button.list["resetMap"] = love.graphics.newImage(path .. "actionButtonResetMap.png")

--Import/Export
button.list["exportLua"] = love.graphics.newImage(path .. "actionButtonExportLua.png")
--button.list["exportTxt"] = love.graphics.newImage("MapEditor/src/graph/button/actionButtonExportTxt.png")
--button.list["exportJson"] = love.graphics.newImage("MapEditor/src/graph/button/actionButtonExportJson.png")
button.list["importLua"] = love.graphics.newImage(path .. "actionButtonImportLua.png")
--button.list["importTxt"] = love.graphics.newImage("MapEditor/src/graph/button/actionButtonImportTxt.png")
--button.list["importJson"] = love.graphics.newImage("MapEditor/src/graph/button/actionButtonImportJson.png")

return button
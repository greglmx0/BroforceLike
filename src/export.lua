local export = {}

export.list = {"exportLua"}
export.format = {"lua"} -- , "txt", "json"}

export.saveAndExit = {"exportLua"}

export.baseDirectory = love.filesystem.getSourceBaseDirectory()
export.path = export.baseDirectory.."/BroforceLike/src/data/map"

local function errorExportFileNotFound(file)
  if file ~= nil then return false end

  love.window.showMessageBox(
    "An existing directory is required to save a map",
    "directory: " .. export.path
  )

  return true
end

local function writeToFileWithExtension(extension, cb)
  local filename = export.path..extension
  local file = io.open(filename, "w+")

  if errorExportFileNotFound(file) then return end

  cb(file)

  io.close(file)
end

function export.lua(file)
  file:write("local map = {\n")
  local i
  for i = 1, #grid.map-1 do
    file:write("  {"..tostring(table.concat(grid.map[i], ", ")).."},\n")
  end
  file:write("  {"..tostring(table.concat(grid.map[#grid.map], ", ")).."}\n}\n")
  file:write("return map")
end

function export.mousepressed(touch)
  if mouse.zone == "topBar" then
    local spacing = 10
    local pX = 450
    local pY = 5
    local width = 30
    local i
    for i = 1, #export.format do
      local x = pX+(i-1)*spacing+(i-1)*width
      if mouse.collide(x, pY, width, width) and love.mouse.isDown(mouseTouch1) then
        local format = export.format[i]
        local extension = "."..format
        writeToFileWithExtension(extension, export[format])
      end
    end
  end
end

function export.saveAndExit()
  print("saveAndExit")
end


return export

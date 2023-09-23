local grid = {}
grid.map = {}
grid.width = 64
grid.height = 64
grid.tileWidth = 64
grid.tileHeight = 64
grid.tileTexture = {}
-- grid.tileSetPath = "tileset/tileset.png"
grid.tileSets = {}

function grid.loadExternalImage()

  local tileList = {}
  for dir in io.popen('dir ' .. love.filesystem.getSourceBaseDirectory() .. '/BroforceLike/MapEditor/tileset' ):lines() do
    for i in string.gmatch(dir, "%S+") do
        table.insert(tileList, i)
    end
  end

  for i, tile in ipairs(tileList) do
    -- print(tile .. ' : start loading')
    path = love.filesystem.getSourceBaseDirectory()..'/BroforceLike/MapEditor/tileset/' .. tile

    local file = io.open(path, "rb")
    local data = file:read("*all")
    file:close()

    local fileData = love.filesystem.newFileData(data, tostring(string.gsub(tile, '.png', "")))
    local imgData = love.image.newImageData(fileData)
    grid.tileSet = love.graphics.newImage(imgData)
  end
end


function grid.load()

  grid.loadExternalImage()

  local id = 1
  local nbColumn = grid.tileSet:getWidth() / grid.tileWidth
  local nbLine = grid.tileSet:getHeight() / grid.tileHeight
  for l = 1, nbLine do
    for c = 1, nbColumn do
      grid.tileTexture[id] = love.graphics.newQuad(
        (c-1)*grid.tileWidth,
        (l-1)*grid.tileHeight,
        grid.tileWidth,
        grid.tileHeight,
        grid.tileSet:getWidth() ,
        grid.tileSet:getHeight() )

      id = id + 1
    end
  end

  grid.mapLoad()

end

function grid.mapLoad()
  grid.map = {}
  for l = 1, grid.height do
    grid.map[l] = {}
    for c = 1, grid.width do
      grid.map[l][c] = 0
    end
  end
end


function grid.draw()
  love.graphics.setColor(1, 1, 1, 1)
  for l = 1, grid.height do
    local gridLine = grid.map[l]
    if gridLine ~= nil then
      for c = 1, grid.width do
        local gridPos = gridLine[c]
        if gridPos ~= nil and gridPos ~= 0 then
          local x = (c-1)*grid.tileWidth
          local y = (l-1)*grid.tileHeight
          love.graphics.draw(grid.tileSet, grid.tileTexture[gridPos], x, y)
        end
      end
    end
  end

  love.graphics.setColor(200/255, 200/255, 200/255, 100/255)

  if action.grid.value == true then
    for i = 1, grid.height+1 do
      love.graphics.line(0, (i-1)*grid.tileHeight, grid.width*grid.tileWidth,(i-1)*grid.tileHeight)
    end
    for i = 1, grid.width+1 do
      love.graphics.line((i-1)*grid.tileWidth, 0, (i-1)*grid.tileWidth, grid.height*grid.tileHeight)
    end
  else
    love.graphics.line(0, 0, grid.width * grid.tileWidth, 0)
    love.graphics.line(0, grid.height*grid.tileHeight, grid.width*grid.tileWidth,grid.height*grid.tileHeight)
    love.graphics.line( 0, 0, 0, grid.height*grid.tileHeight)
    love.graphics.line(grid.width*grid.tileWidth, 0, grid.width*grid.tileWidth, grid.height*grid.tileHeight)
  end
end


return grid

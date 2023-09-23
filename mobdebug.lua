local mobdebug = {}

debugState = false

function mobdebug.load()


  print("mobdebug.load()")

end

function mobdebug.start()

  debugState = true

  print("mobdebug.start()")

end


--local function formatString(str)
--  return string.gsub(string.gsub(str, "\r", ""), "\n", "")
--end

return mobdebug
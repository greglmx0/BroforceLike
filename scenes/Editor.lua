
function Editor()
    return {

        draw = function(self)

            love.graphics.setColor(1, 1, 1)
            love.graphics.print("Editor", 0, 0)

        end
    }
end

return Editor
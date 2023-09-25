local love = require("love")

function tableMerge(t1, t2)
    for k,v in pairs(t2) do
        if type(v) == "table" then
            if type(t1[k] or false) == "table" then
                tableMerge(t1[k] or {}, t2[k] or {})
            else
                t1[k] = v
                table.insert(t1, v)
            end
        else
            table.insert(t1, v)
            -- t1[k] = v
        end
    end
    return t1
end

function findInArray(array, value)
    for i, v in ipairs(array) do

        if v == value then
            return true
        end
    end
    return false
end
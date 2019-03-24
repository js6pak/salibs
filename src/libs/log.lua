local module = {}

function module.init(modName)
    module.file = io.open(modName .. ".log", "w")
end

function module.write(message, level)
    level = level or "INFO"

    module.file:write(os.date("%Y-%m-%d %H:%M") .. " " .. level .. " " .. tostring(message) .. "\n")
    module.file:flush()
end

return module
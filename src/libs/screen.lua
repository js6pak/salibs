local module = {}

module.position = {}

function module.position:new (x, y)
    o = {x = x, y = y}

    setmetatable(o, self)
    self.__index = self
    return o
end

module.screenSize = module.position:new(1280, 720)
module.center = module.position:new(1280 / 2, 720 / 2)

return module
local module = {}

module.player = {}

function module.player.getX() return getPlayerX() end
function module.player.getY() return getPlayerY() end
function module.player.teleport(x, y)
    x = x or nil
    y = y or nil

    if(x) then setPlayerX(x) end
    if(y) then setPlayerY(y) end
end
function module.player.setGravity(value) setGravity(value) end
function module.player.setMovement(value) if(value) then enablePlayer() else disablePlayer() end end
function module.player.isMoving() return isPlayerMoving() end
function module.player.isJumping() return isPlayerJumping() end
function module.player.isFalling() return isPlayerFalling() end
function module.player.jump() return jump() end
function module.player.right() return forceRight() end
function module.player.left() return forceLeft() end
function module.player.kill() return killPlayer() end

module.text = {}

function module.text:new (x, y, fontSize, text)
    o = {
        x = x or 0,
        y = y or 0,
        fontSize = fontSize or 18,
        text = text or ""
    }

    setmetatable(o, self)
    self.__index = self

    o:draw()
    return o
end

function module.text:draw ()
    self.id = drawText(self.x, self.y, self.fontSize, self.text)
end

function module.text:redraw ()
    self:delete()
    self:draw()
end

function module.text:edit (text)
    self.text = text
    editText(self.id, text)
end

function module.text:delete ()
    deleteText(self.id)
end

module.level = {}

function module.level.skip() return skipLevel() end
function module.level.getNumber() return getLevelNumber() end
function module.level.clearBlocks() return clearBlocks() end
function module.level.placeBlock(block, x, y) return placeBlock(block, x, y) end

module.object = {}

function module.object:new (path, x, y)
    o = {
        path = path,
        x = x,
        y = y
    }

    o.id = newObject(o.path, o.x, o.y)

    setmetatable(o, self)
    self.__index = self
    return o
end

function module.object:teleport(x, y)
    x = x or nil
    y = y or nil

    if(x) then setObjectX(o.id, x) end
    if(y) then setObjectY(o.id, y) end
end

function module.object:delete()
    deleteObject(self.id)
end

function module.object:setCollision(value)
    setObjectCollision(o.id, value and 1 or 0)
end

return module
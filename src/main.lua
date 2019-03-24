local workshopMode = false
local libsDir = workshopMode and "custom\\libs\\" or os.getenv("SALIBS_SRC") .. "\\src\\libs\\"

modName = "salibs"
api = dofile(libsDir .. "salapi.lua")
log = dofile(libsDir .. "log.lua")
label = dofile(libsDir .. "label.lua")
screen = dofile(libsDir .. "screen.lua")

local splashLabelPosition = screen.center
splashLabelPosition.y = screen.center.y - 50;
local splashLabel = label:new({position = splashLabelPosition})

function testsalapi()
    api.player.teleport(api.player.getX() + 1, api.player.getY() + 1)
    -- api.player.setGravity(0.5)
    log.write("isMoving: " .. tostring(api.player.isMoving()))
    log.write("isJumping: " .. tostring(api.player.isJumping()))
    log.write("isFalling: " .. tostring(api.player.isFalling()))
    api.player.jump()

    die = api.object:new("die.png", 0, 0)
    die:teleport(50, 50)
    die:setCollision(true)
end

function init()
    log.init(modName)

    log.write("Initializing playground")
    testsalapi()
end

function update()
    splashLabel:onUpdate()
end

function getKey(id)
    id = tonumber(id)

    if (id == 84) then -- T
        api.player.right()
        die:setCollision(false)
    elseif (id == 82) then -- R
        api.player.kill()
        die:delete()
    elseif (id == 112) then -- F1
        splashLabel.inputEnabled = not splashLabel.inputEnabled
    elseif (id == 116) then -- F5
        splashLabel.content = ""
        splashLabel.inputEnabled = false
        splashLabel.animatedContent = "Wow this is\nANIMATION"     
    else
        splashLabel:onKeyPressed(id)
    end
end

function onDeath()

end
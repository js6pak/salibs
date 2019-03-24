local label = {
    text,
    content = "Defualt text",
    animatedContent = "",
    cursor = false,
    inputEnabled = false,
    brackets = true,
    position,
    fontSize = 18
}

function label:updateAnimaton()
    self.content = self.content .. self.animatedContent:sub(1, 1)
    self.animatedContent = self.animatedContent:sub(2)
end

function label:updateLabel()
    self:updateAnimaton()

    local resultText = "";
    if(self.brackets) then resultText = "[" end    
    resultText = resultText .. self.content
    if(self.cursor and self.inputEnabled) then resultText = resultText .. "_" end    
    if(self.brackets) then resultText = resultText .. "]" end    

    self.text.x = self.position.x - resultText:len() * self.fontSize/2
    self.text.y = self.position.y - self.fontSize
    self.text.text = resultText
    deleteText(self.text.id)
    self.text:redraw()
end

function label:onUpdate()
    self:updateLabel()
    self.cursor = not self.cursor
end

function label:onKeyPressed(keyName)
    local key = tonumber(keyName)

    if (self.inputEnabled) then
        if (key == 8) then -- backspace
            self.content = self.content:sub(1, -2)
            self:updateLabel()
        elseif (key == 13) then -- enter
            self.content = self.content .. '\n'
            self:updateLabel()
        elseif (key == 32) then -- spacebar
            self.content = self.content .. ' '
            self:updateLabel()
        elseif (key >= 48 and key <= 90) then
            local char = string.char(key)
            self.content = self.content .. char
            self:updateLabel()
        end
    end
end

function label:new (o)
    o = o or {}

    o.text = api.text:new(o.position.x, o.position.y, o.content)
    setUpdate(460)

    setmetatable(o, self)
    self.__index = self
    return o
end

return label
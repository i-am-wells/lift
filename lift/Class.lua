
local function newClass(...)
  local classTable = {}

  -- Inheritance: copy contents of parent classes now.
  for _, parentClass in ipairs {...} do
    for key, value in pairs(parentClass) do
      classTable[key] = value
    end
  end

  local function createInstance(...)
    local instance = setmetatable({}, {__index = classTable})
    if instance.init then instance:init(...) end
    return instance
  end

  return setmetatable(classTable, {__call = createInstance})
end

local Class = setmetatable({}, {__call = newClass})

return Class
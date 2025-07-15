local function requireAll(...)
  local t = {}
  for _, name in ipairs {...} do t[name] = require(name) end
  return t
end

return requireAll(
  'Class',
  'hash',
  'iterator',
  'util'
)
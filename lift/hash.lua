local iterator = require 'iterator'
local util = require 'util'

local hash = {}

local hashImpl = {
  table = function(t)
    local idx, res = 0, 0
    local function hashAndShift(val)
      res = res ~ util.shift(hash.hash(val), idx)
      idx = (idx + 1) % 64
    end
    for k, v in pairs(t) do
      hashAndShift(k)
      hashAndShift(v)
    end
    return res
  end,

  string = function(s)
    local p, power, m, res = 257, 1, (1e9+9), 0
    for val in iterator.returns(s:byte(1, s:len())) do
      res = (res + val * power) % m
      power = (power * p) % m
    end
    return res
  end,
}

function hash.hash(v)
  local impl = hashImpl[type(v)]
  if impl then return impl(v) end
  return hashImpl.string(tostring(v))
end

return hash
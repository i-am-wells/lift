local util = {}

function util.shift(x, n)
  return (x << n) | (x >> (64 - n))
end

return util
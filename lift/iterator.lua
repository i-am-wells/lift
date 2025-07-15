local iterator = {}

function iterator.returns(...)
  local t, i = {...}, 0
  return function()
    i = i + 1
    if i <= #t then
      return t[i]
    end
  end
end

return iterator
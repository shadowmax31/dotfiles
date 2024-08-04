local random = math.random

local M = {}

function M.generate()
  local seed = tonumber(tostring(os.time()):reverse():sub(1, 9))

  if (seed ~= nil) then
    math.randomseed(seed)

    local template = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
    return string.gsub(template, '[xy]', function(c)
      local v = (c == 'x') and random(0, 0xf) or random(8, 0xb)
      return string.format('%x', v)
    end)
  else
    error('Could not build a random seed')
  end
end

function M.insert_at_cursor()
  local uuid = M.generate()

  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { uuid })
end

return M

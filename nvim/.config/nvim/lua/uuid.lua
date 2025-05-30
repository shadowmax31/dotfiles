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
  local line = vim.api.nvim_get_current_line()

  local set_text_from = col
  if (line ~= '') then
    set_text_from = col + 1
  end
  vim.api.nvim_buf_set_text(0, row - 1, set_text_from, row - 1, set_text_from, { uuid })
  vim.api.nvim_win_set_cursor(0, { row, col + string.len(uuid) })
end

return M

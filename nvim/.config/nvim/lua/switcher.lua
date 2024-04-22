local M = {}

local function navigation(file_name)
  vim.api.nvim_command('e ' .. file_name)
end

local function get_path_state()
  local buf_name = vim.api.nvim_buf_get_name(0)
  local path = buf_name:match('(.+)/.+$')
  local file_name = buf_name:match('.+/(.+)$')
  local prefix = file_name:match('[%-%w_]+')
  local file_type = file_name:match('^.+%.(.+)$')
  local full_suffix = file_name:match('[%-%w_]+%.(.*)')
  local full_prefix = file_name:match('([%-%w_%.]+)%.%w+$')
  local short_prefix = file_name:match('[%w]+')
  local long_prefix = file_name:match("([%w_%-]+)[%-_]")
  return {
    path = path,
    prefix = prefix,
    full_prefix = full_prefix,
    full_suffix = full_suffix,
    short_prefix = short_prefix,
    long_prefix = long_prefix,
    file_type = file_type,
    file_name = file_name
  }
end

function M.toggle(suffixOne, suffixTwo)
  local path_state = get_path_state();
  local suffix = suffixOne;
  if path_state.full_suffix == suffix then
    suffix = suffixTwo
  end

  return navigation(path_state.path .. '/' .. path_state.prefix .. '.' .. suffix)
end

return M;

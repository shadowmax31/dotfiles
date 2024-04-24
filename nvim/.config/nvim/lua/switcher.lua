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

function string:endswith(suffix)
    return self:sub(-#suffix) == suffix
end

function M.toggle2(suffixes)
  local path_state = get_path_state()

  local found_index = nil
  for i = 1, #suffixes do
    if path_state.file_name:endswith(suffixes[i]) then
      found_index = i
      break
    end
  end

  if found_index ~= nil then
    local next_index = 1
    if found_index < #suffixes then
      next_index = found_index + 1
    end


    local next_filename = path_state.file_name:gsub(suffixes[found_index], suffixes[next_index])

    return navigation(path_state.path .. '/' .. next_filename)
  else
    print("Could not find a matching suffix")
  end

end

return M;

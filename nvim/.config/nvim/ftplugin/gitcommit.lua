local handle = io.popen("git branch --show-current")
if handle ~= nil then
  local branch_name = handle:read("*a")
  handle:close()

  local issue_name = string.match(branch_name, "PX%-%d+")
  if issue_name ~= nil then
    vim.api.nvim_buf_set_lines(0, 0, 0, false, { '', '', issue_name })
    vim.api.nvim_win_set_cursor(0, { 1, 1 })
  end
end

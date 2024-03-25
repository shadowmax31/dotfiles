function SearchFileBackwards(fn)
  local fp = vim.fn.expand('%:p')
  local pos = #fp
  local pom = ""
  while pos > 0 do
    if fp:sub(pos, pos) == '/' then
      pom = fp:sub(1, pos) .. fn
      if vim.fn.filereadable(pom) == 1 then
        break
      end
    end
    pos = pos - 1
  end
  return pom
end

function BuildMavenProject()
    local pom = SearchFileBackwards("pom.xml")
    if pom ~= "" then
        vim.uv.spawn('mvn', { args = { "-f", pom, "compile" } })
    else
        vim.api.nvim_echo({{ "No pom.xml found.", "WarningMsg" }}, true, {})
    end
end

vim.api.nvim_command('autocmd BufWritePost *.java lua BuildMavenProject()')

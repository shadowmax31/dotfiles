require("formatter").setup {
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = {
    java = {
      function()
        return {
            exe = "clang-format",
            args = {"--assume-filename=.java"},
            stdin = true
        }
      end
    },
  }
}

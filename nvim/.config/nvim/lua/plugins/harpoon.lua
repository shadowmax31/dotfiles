return {
  'ThePrimeagen/harpoon',
  config = function()
    local harpoon_mark = require("harpoon.mark")
    local harpoon_ui = require("harpoon.ui")
    vim.keymap.set('n', '<leader>m', harpoon_mark.add_file)
    vim.keymap.set('n', '<leader>n', harpoon_ui.toggle_quick_menu)

    vim.keymap.set('n', '<leader>h', function () harpoon_ui.nav_file(1) end)
    vim.keymap.set('n', '<leader>j', function () harpoon_ui.nav_file(2) end)
    vim.keymap.set('n', '<leader>k', function () harpoon_ui.nav_file(3) end)
    vim.keymap.set('n', '<leader>l', function () harpoon_ui.nav_file(4) end)
  end
}

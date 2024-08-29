require("plugins")
require("nvim-cmp")
require("autopairs")
require("lualine").setup()
require "lsp.mason"
require("lsp.handlers").setup()
require("lsp.null-ls")
require("nvim-tree").setup()
require("whichkey")
require("alpha-config")
require("toggleterm").setup()
local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})



-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.wo.number = true
vim.opt.termguicolors = true
vim.cmd 'colorscheme gruvbox'
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])

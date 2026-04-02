vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

require("config.lazy")

-- Set the theme
vim.cmd.colorscheme("tokyonight-moon")

-- Old vim configs
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"

-- Ctrl + n: File tree toggler
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- LSP keybindings
vim.keymap.set("n", "gd", function()
  vim.lsp.buf.definition()
  vim.cmd("normal! zz")
end, { desc = "Go to definition (centered)" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover docs" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })

-- Show diagnostics when hovering
vim.o.updatetime = 250
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})

-- Open the cheatsheet
vim.keymap.set("n", "<leader>?", "<cmd>edit ~/.config/nvim/CHEATSHEET.md<CR>", { desc = "Open cheatsheet" })

-- Buffer keybindings
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-h>", ":bprev<CR>", { desc = "Prev buffer" })
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader><leader>", "<C-^>", { desc = "Last buffer" })

-- Highlight the current line and its number
vim.opt.cursorline = true
vim.opt.cursorlineopt = "both"

-- Enable treesitter
-- For this plugin, treesitter-cli should be installed either from cargo or npm
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python", "bash", "sql", "dockerfile" },
  callback = function()
    vim.treesitter.start()
  end,
})

-- Move lines without re-indenting
vim.keymap.set("n", "<M-Up>", ":m .-2<CR>", { desc = "Move line up" })
vim.keymap.set("n", "<M-Down>", ":m .+1<CR>", { desc = "Move line down" })

vim.keymap.set("v", "<M-Up>", ":m '<-2<CR>gv", { desc = "Move selection up" })
vim.keymap.set("v", "<M-Down>", ":m '>+1<CR>gv", { desc = "Move selection down" })

-- Switch between themes
vim.keymap.set("n", "<leader>th", function()
  require("telescope.builtin").colorscheme({ enable_preview = true })
end, { desc = "Pick theme (with preview)" })

-- Control the indentation with the arrow keys
vim.keymap.set("v", "<A-Left>",  "<gv", { noremap=true, silent=true })
vim.keymap.set("v", "<A-Right>", ">gv", { noremap=true, silent=true })

-- Set line length marker
-- Python-only: show a guide at column 79
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.colorcolumn = "80"
    -- Optional: keep formatting expectations consistent
    -- vim.opt_local.textwidth = 79
  end,
})

-- Make the column clearly visible
vim.api.nvim_set_hl(0, "ColorColumn", {
  bg = "#3a1f1f",  -- change to taste
})

-- After yanking, cursor stays at the bottom instead of jumping
vim.keymap.set("x", "y", "y`>", { noremap = true })

-- black formatter (saves the cursor position)
vim.keymap.set("n", "<leader>f", function()
  local pos = vim.api.nvim_win_get_cursor(0)   -- cursor (row, col)
  local view = vim.fn.winsaveview()            -- scroll, folds, etc.

  vim.cmd("%!black -q --line-length 79 -")

  vim.fn.winrestview(view)
  
  -- Clamp cursor position
  local line_count = vim.api.nvim_buf_line_count(0)
  local new_row = math.min(pos[1], line_count)
  local line = vim.api.nvim_buf_get_lines(0, new_row - 1, new_row, false)[1] or ""
  local new_col = math.min(pos[2], #line)
  vim.api.nvim_win_set_cursor(0, { new_row, new_col })
end, { desc = "Format with Black" })

-- Copilot keymaps
vim.keymap.set("n", "<leader>ce", ":Copilot enable<CR>")
vim.keymap.set("n", "<leader>cd", ":Copilot disable<CR>")


vim.keymap.set("i", "<C-l>", function()
  require("copilot.suggestion").accept()
end)

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


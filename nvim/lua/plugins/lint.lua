return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    -- Use flake8 for Python
    lint.linters_by_ft = {
      python = { "flake8" },
    }

    -- Run flake8 when you:
    -- 1) open a file
    -- 2) save a file
    -- 3) leave insert mode
    local grp = vim.api.nvim_create_augroup("Linting", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = grp,
      callback = function()
        lint.try_lint()
      end,
    })

    -- Optional: manual lint keybind
    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Run lint (flake8)" })
  end,
}


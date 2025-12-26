return {
  -- Mason: installs language servers
  {
    "williamboman/mason.nvim",
    config = true,
  },

  -- Mason-lspconfig: bridges mason <-> built-in LSP
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = { "pyright" },
      automatic_installation = true,
    },
  },

  -- Neovim built-in LSP config (0.11+)
  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      -- ✅ new Neovim 0.11+ style
      vim.lsp.config("pyright", {
        -- you can put settings here later
      })

      vim.lsp.enable("pyright")
    end,
  },
}


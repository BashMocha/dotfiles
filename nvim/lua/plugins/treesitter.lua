return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        install_dir = vim.fn.stdpath("data") .. "/site",
      })

      -- install parsers (or use :TSInstall)
      require("nvim-treesitter").install({ "lua", "vim", "query", "python", "bash", "sql", "dockerfile" })
    end,
  },
}


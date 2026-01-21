return {
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "VeryLazy", -- or remove this line to load immediately
    config = function()
      require("treesitter-context").setup({
        enable = true,
        mode = "topline",
        multiline_threshold = 1,
        -- max_lines = 1,
        patterns = {
            python = { "class_definition", "function_definition" },
        },

        line_numbers = false,
      })
    end,
  },
}

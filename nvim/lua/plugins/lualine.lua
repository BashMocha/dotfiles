return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "tokyonight-night",
        section_separators = "",
        component_separators = "",
      },
      sections = {
        lualine_y = {
          function()
            return "Lines: " .. vim.api.nvim_buf_line_count(0)
          end,
        },
        lualine_z = { "location" },
      },
    })
  end,
}

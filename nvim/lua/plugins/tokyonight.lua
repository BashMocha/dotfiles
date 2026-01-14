return {
  "folke/tokyonight.nvim",
  priority = 1000, -- load before other plugins
  config = function()
    vim.cmd.colorscheme("tokyonight-night") -- try: tokyonight-storm, tokyonight-moon, tokyonight-day
  end,
}

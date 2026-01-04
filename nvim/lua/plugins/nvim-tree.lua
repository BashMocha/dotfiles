return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    sort = {
      sorter = "case_sensitive",
    },
    view = {
      side = "right",
      width = 30,
      preserve_window_proportions = true,
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = true,
    },
  },
}

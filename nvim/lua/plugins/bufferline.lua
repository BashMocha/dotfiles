return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  opts = {
    options = {
      -- rigid rectangles:
      separator_style = "thin", -- try: "thin", "none"

      -- make it look clean
      show_buffer_close_icons = false,
      show_close_icon = false,
      enforce_regular_tabs = true,
      always_show_bufferline = true,

      -- optional: show diagnostics count from LSP
      diagnostics = "nvim_lsp",

      -- optional: don’t show NvimTree as a “buffer tab”
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "left",
          separator = true,
        },
      },
    },
  },
}


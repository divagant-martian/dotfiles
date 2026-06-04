require("telescope").setup {
  defaults = {
    layout_strategy = "vertical",
    layout_config = {
      vertical = {
        scroll_speed = 1,
        preview_height = 0.6,
        preview_cutoff = 0,
      },
    },
  },
  pickers = {
    lsp_type_definitions = {
      jump_type = "never",
      layout_config = { width = 100, preview_height = 0.8 },
    },
    lsp_definitions = {
      jump_type = "never",
      layout_config = { width = 100, preview_height = 0.8 },
    },
    live_grep = {
      layout_config = { width = 100, preview_height = 0.8 },
    },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {},
    }
  }
}

require("telescope").load_extension("ui-select")

-- Telescope configuration is kinda shitty. This is a wrapper to the
-- lsp_workspace_diagnostics that actually uses an aditional mapping. This
-- wrapper is the one to map

local action_state = require('telescope.actions.state')

local entry_line_diagnostics = function()
    local selected_entry = action_state.get_selected_entry()
    local value = selected_entry['value']
    local diagnostics = vim.lsp.diagnostic.get_line_diagnostics(
        value.bufnr,
        value.lnum-1,
        {severity=value.type}
    )
    print(value.type)
    print(diagnostics[1].message)
end

local m = {}
m.lsp_workspace_diagnostics_with_map = function ()
    require('telescope.builtin').lsp_workspace_diagnostics{
        attach_mappings = function(_, map)
            map('i', '<Right>', entry_line_diagnostics )
            map('n', '<Right>', entry_line_diagnostics )
            return true
        end
    }

end

-- This is your opts table
require("telescope").setup {
  pickers = {
    -- Default configuration for builtin pickers goes here:
    lsp_type_definitions = {
      jump_type = "never",
      layout_strategy = "vertical",
      layout_config = { scroll_speed = 1, width = 100, preview_height = 0.8 },
    },
    lsp_definitions = {
      jump_type = "never",
      layout_strategy = "vertical",
      layout_config = { scroll_speed = 1, width = 100, preview_height = 0.8 },
    },
    lsp_references = {
      layout_strategy = "vertical",
    },
    lsp_implementations = {
        layout_strategy = "vertical",
    },
    diagnostics = {
        layout_strategy = "vertical",
    },
    lsp_workspace_symbols = {
        layout_strategy = "vertical",
    },
    lsp_dynamic_workspace_symbols = {
        layout_strategy = "vertical",
    },
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      },

      -- pseudo code / specification for writing custom displays, like the one
      -- for "codeactions"
      -- specific_opts = {
      --   [kind] = {
      --     make_indexed = function(items) -> indexed_items, width,
      --     make_displayer = function(widths) -> displayer
      --     make_display = function(displayer) -> function(e)
      --     make_ordinal = function(e) -> string
      --   },
      --   -- for example to disable the custom builtin "codeactions" display
      --      do the following
      --   codeactions = false,
      -- }
    }
  }
}
-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("ui-select")

return m

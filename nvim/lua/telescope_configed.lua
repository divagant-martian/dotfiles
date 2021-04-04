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

return m

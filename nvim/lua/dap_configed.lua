local dap = require('dap')

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<leader>eb', dap.toggle_breakpoint)
vim.keymap.set('n', '<leader>ec', function() dap.continue() end)
vim.keymap.set('n', '<leader>eo', dap.repl.open)

dap.adapters.codelldb = {
    type = 'server',
    port = "6969",
    executable = {
      command = '/usr/bin/codelldb',
      args = {"--port", "6969"},
    }
}
dap.configurations.rust = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}

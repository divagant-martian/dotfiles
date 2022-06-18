-- Basics

-- remap leader
vim.g.mapleader = ","
-- remap U to u
vim.api.nvim_set_keymap('', 'U', 'u', { noremap = true })
-- remap :W to :w
-- FIXME: Remove vimscript (Blocked on https://github.com/neovim/neovim/pull/11613).
vim.api.nvim_command('command! -bar -nargs=* -complete=file -range=% -bang W <line1>,<line2>write<bang> <args>')
vim.api.nvim_command('command! -bar -nargs=* -complete=file -range=% -bang Wq <line1>,<line2>wq<bang> <args>')
vim.api.nvim_command('command! -bar -nargs=* -complete=file -range=% -bang WQ <line1>,<line2>wq<bang> <args>')
vim.api.nvim_command('command! -bar -nargs=* -complete=file -bang Q q<bang>')
-- unmap s
vim.api.nvim_set_keymap('', 's', '', {})

-- Navigation

-- move to next/previous buffer
vim.api.nvim_set_keymap('', '<A-Left>', ':bp<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-Right>', ':bn<CR>', { noremap = true })
-- move to the upper/lower split
vim.api.nvim_set_keymap('', '<A-Up>', '<C-w><Up>', { noremap = true })
vim.api.nvim_set_keymap('', '<A-Down>', '<C-w><Down>', { noremap = true })


-- Edition

-- use blackhole register for the next action
vim.api.nvim_set_keymap('', '<leader>b', '"_', {})
-- use backspace to delete to blackhole register
vim.api.nvim_set_keymap('', '<BS>', '"_d', {})


-- Language Server Protocol

-- go to definition
vim.api.nvim_set_keymap('n', '<leader>d', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>x', '<cmd>Telescope lsp_definitions<CR>', { noremap = true, silent = true })
-- go to type definition
vim.api.nvim_set_keymap('n', '<leader>t', '<cmd>lua vim.lsp.buf.type_definition()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>y', '<cmd>Telescope lsp_type_definitions<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>i', '<cmd>Telescope lsp_implementations<CR>', { noremap = true, silent = true })
-- show hover information
vim.api.nvim_set_keymap('n', '<leader>m', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
-- format the current buffer
vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', { noremap = true, silent = true })
-- show diagnostics for the current line
vim.api.nvim_set_keymap('n', '<leader>l', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', { noremap = true, silent = true })
-- rename
vim.api.nvim_set_keymap('n', '<leader>c', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
-- next diagnostic in current buffer
vim.api.nvim_set_keymap('n', '<leader>n', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', { noremap = true, silent = true })
-- previous diagnostic in current buffer
vim.api.nvim_set_keymap('n', '<leader>p', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>a', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>', { noremap = true, silent = true })

-- Telescope

-- show references
vim.api.nvim_set_keymap('n', '<leader>r', '<cmd>Telescope lsp_references<CR>', { noremap = true, silent = true })
-- show diagnostics
vim.api.nvim_set_keymap('n', '<leader>w', "<cmd>Telescope diagnostics<CR>", {noremap = true, silent = true})
-- show code actions
vim.api.nvim_set_keymap('n', '<leader><space>', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })
-- spell suggestions
vim.api.nvim_set_keymap('n', '<leader>s', '<cmd>Telescope spell_suggest<CR>', { noremap = true, silent = true })

-- Floating terminal
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
vim.api.nvim_set_keymap('t', '<F3>', '<C-\\><C-n>:FloatermToggle<CR>', { noremap = true })
vim.api.nvim_set_keymap('', '<F3>', ':FloatermToggle<CR>', { noremap = true })
-- Open the terminal as a split
vim.api.nvim_set_var('floaterm_wintype', 'split')
-- Set height of the terminal
vim.api.nvim_set_var('floaterm_height', 0.4)

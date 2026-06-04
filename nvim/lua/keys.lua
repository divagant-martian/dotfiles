vim.g.clipboard = {
    name = "xclip",
    copy  = { ["+"] = { "xclip", "-quiet", "-i", "-selection", "clipboard" },
              ["*"] = { "xclip", "-quiet", "-i", "-selection", "primary"   } },
    paste = { ["+"] = { "xclip", "-o", "-selection", "clipboard" },
              ["*"] = { "xclip", "-o", "-selection", "primary"   } },
    cache_enabled = 1,
}

vim.keymap.set('n', '<F2>', 'gcc', { remap = true })
vim.keymap.set('x', '<F2>', 'gc',  { remap = true })

vim.g.mapleader = ","

vim.keymap.set('', 'U', 'u')
vim.api.nvim_create_user_command('W',  '<line1>,<line2>write<bang> <args>', {
    bar = true, nargs = '*', complete = 'file', range = '%', bang = true })
vim.api.nvim_create_user_command('Wq', '<line1>,<line2>wq<bang> <args>',    {
    bar = true, nargs = '*', complete = 'file', range = '%', bang = true })
vim.api.nvim_create_user_command('WQ', '<line1>,<line2>wq<bang> <args>',    {
    bar = true, nargs = '*', complete = 'file', range = '%', bang = true })
vim.api.nvim_create_user_command('Q',  'q<bang>',                           {
    bar = true, bang = true })

vim.keymap.set('', 's', '<Nop>')

-- delete without copy
vim.keymap.set('', '<BS><BS>', '"_dd')
vim.keymap.set('', '<BS>',     '"_d')

-- Navigation
vim.keymap.set('', '<A-Left>',  ':bp<CR>')
vim.keymap.set('', '<A-Right>', ':bn<CR>')
vim.keymap.set('', '<A-Del>',   ':bw<CR>')
vim.keymap.set('', '<A-Up>',    '<C-w><Up>')
vim.keymap.set('', '<A-Down>',  '<C-w><Down>')

-- Diagnostics (global — work without LSP too)
vim.keymap.set('n', '<leader>l', vim.diagnostic.open_float,                          { silent = true })
vim.keymap.set('n', '<leader>n', function() vim.diagnostic.jump({ count =  1 }) end, { silent = true })
vim.keymap.set('n', '<leader>p', function() vim.diagnostic.jump({ count = -1 }) end, { silent = true })
vim.keymap.set('n', '<leader>w', '<cmd>Telescope diagnostics<CR>',                   { silent = true })

-- Telescope (non-LSP)
vim.keymap.set('n', '<leader>a', '<cmd>Telescope live_grep<CR>',    { silent = true })
vim.keymap.set('n', '<leader>e', '<cmd>Telescope find_files<CR>',   { silent = true })
vim.keymap.set('n', '<leader>s', '<cmd>Telescope spell_suggest<CR>', { silent = true })

-- Floating terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.keymap.set('t', '<F3>', '<C-\\><C-n>:FloatermToggle<CR>')
vim.keymap.set('',  '<F3>', ':FloatermToggle<CR>')
vim.g.floaterm_wintype = 'split'
vim.g.floaterm_height  = 0.4

-- Git signs
vim.keymap.set('', '<leader>b',  '<cmd>Gitsigns blame_line<CR>',    { silent = true })
vim.keymap.set('', '<leader>gn', '<cmd>Gitsigns next_hunk<CR>',     { silent = true })
vim.keymap.set('', '<leader>gp', '<cmd>Gitsigns prev_hunk<CR>',     { silent = true })
vim.keymap.set('', '<leader>gd', '<cmd>Gitsigns preview_hunk<CR>',  { silent = true })
vim.keymap.set('', '<leader>gs', '<cmd>Gitsigns stage_hunk<CR>',    { silent = true })
vim.keymap.set('', '<leader>gu', '<cmd>Gitsigns undo_stage_hunk<CR>', { silent = true })
vim.keymap.set('', '<leader>gr', '<cmd>Gitsigns reset_hunk<CR>',    { silent = true })

require('plugins')

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true

-- Arrow keys wrap lines
vim.opt.whichwrap:append('<,>,[,]')

-- UI
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.hidden = true

-- Open new line without entering insert mode
vim.keymap.set('n', 'o', 'o<Esc>')

-- Files
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand('~/.undodir')

-- Clipboard
vim.opt.clipboard:append('unnamedplus')

-- Modules
require('lsp')
require('dap_configed')
require('autocomplete')
require('telescope_configed')
require('keys')

-- Colors. look.lua calls colorscheme, so must come before highlight overrides.
vim.api.nvim_create_autocmd('ColorScheme', {
    callback = function()
        vim.api.nvim_set_hl(0, 'Normal', { ctermbg = 'NONE' })
    end,
})
require('look')
require('gitsigns_config')

-- Highlight overrides (after colorscheme is applied)
vim.api.nvim_set_hl(0, 'Normal',     { bg = 'NONE', ctermbg = 'NONE' })
vim.api.nvim_set_hl(0, 'DiffAdd',    { bg = 'NONE', fg = '#aaf6b1' })
vim.api.nvim_set_hl(0, 'DiffChange', { bg = 'NONE', fg = '#e2b870' })
vim.api.nvim_set_hl(0, 'DiffDelete', { bg = 'NONE', fg = '#ef5350' })
vim.api.nvim_set_hl(0, 'DiffText',   { bg = 'NONE' })

-- TODO shortcuts
vim.keymap.set('n', '<A-t>', 'A<CR>// TODO:')
vim.keymap.set('i', '<A-t>', '<Esc>A<CR>// TODO:')

-- Abbreviation
vim.cmd('iabbrev todome TODO(@divma):')

-- Treesitter folding
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldlevelstart = 20
vim.keymap.set('n', '<Space>', 'za')

-- Autocmds
vim.api.nvim_create_autocmd('User', {
    pattern = 'TelescopePreviewerLoaded',
    callback = function() vim.opt_local.wrap = true end,
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
    pattern = '*.jrnl',
    callback = function()
        vim.opt_local.syntax = 'markdown'
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
    end,
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
    pattern = { '*.htm', '*.html', '*.js', '*.css' },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.softtabstop = 2
    end,
})

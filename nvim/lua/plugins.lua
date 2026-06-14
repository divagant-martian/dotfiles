local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "justinmk/vim-dirvish",
    "machakann/vim-sandwich",
    {
        "windwp/nvim-autopairs",
        dependencies = { "hrsh7th/nvim-cmp" },
        config = function()
            require('nvim-autopairs').setup({})
            require('cmp').event:on('confirm_done', require('nvim-autopairs.completion.cmp').on_confirm_done())
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require('lualine').setup({
                options = {
                    theme = 'rose-pine',
                    icons_enabled = true,
                    component_separators = { left = '|', right = '|' },
                    section_separators = { left = '', right = '' },
                },
                tabline = {
                    lualine_a = { 'buffers' },
                },
            })
        end,
    },
    { "j-hui/fidget.nvim", config = true },
    "neovim/nvim-lspconfig",
    "lewis6991/gitsigns.nvim",
    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    "nvim-telescope/telescope-ui-select.nvim",
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter").setup({
                ensure_installed = {
                    "rust", "go", "lua", "python", "zig",
                    "toml", "json", "yaml",
                    "markdown", "markdown_inline", "comment",
                },
                highlight = { enable = true },
            })
        end,
    },
    { "rose-pine/neovim", name = "rose-pine" },
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "voldikss/vim-floaterm",
    "wsdjeg/vim-fetch",
    "mfussenegger/nvim-dap",
    "mtdl9/vim-log-highlighting",
    {
        "sindrets/diffview.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = true,
    },
})

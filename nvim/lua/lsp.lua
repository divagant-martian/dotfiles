local nvim_lsp = require'lspconfig'

-- local on_attach = function(client)
--     require'completion'.on_attach(client)
-- end

nvim_lsp.rust_analyzer.setup({
        ["rust-analyzer"] = {
            rustcSource = "discover",
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    -- on_attach=on_attach,
    -- settings = {
        -- ["rust-analyzer"] = {
            -- assist = {
            --     importMergeBehavior = "last",
            --     importPrefix = "by_self",
            -- },
            -- cargo = {
            --     loadOutDirsFromCheck = true
            -- },
            -- procMacro = {
            --     enable = true
            -- },
        -- }
    -- }
})

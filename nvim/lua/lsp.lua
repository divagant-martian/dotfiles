-- Snipets: cool autocomplete
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig').rust_analyzer.setup({
    capabilities = capabilities,
    ["rust-analyzer"] = {
        rustcSource = "discover",
        cargo = {
            loadOutDirsFromCheck = true
        },
        procMacro = {
            enable = true
        },
    }
})

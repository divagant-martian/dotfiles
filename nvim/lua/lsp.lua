-- Snipets: cool autocomplete
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig').rust_analyzer.setup({
    capabilities = capabilities,
    settings = {
        ["rust-analyzer"] = {
            rustcSource = "discover",
            procMacro = {
                enable = true
            },
            completion = {
                snippets = {
                    arc = {
                        postfix = "arc",
                        body = "Arc::new(${receiver})",
                        scope = "expr",
                        requires = "std::sync::Arc",
                    }
                }
            },
        }

    }
})

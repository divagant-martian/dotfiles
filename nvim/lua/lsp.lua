-- Snipets: cool autocomplete
local lspconfig = require 'lspconfig'
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.rust_analyzer.setup({
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

lspconfig.gopls.setup({
    cmd = {'gopls', '--remote=auto'},
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
})

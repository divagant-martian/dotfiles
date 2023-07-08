-- Snipets: cool autocomplete
local lspconfig = require 'lspconfig'
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

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
                    some = {
                        postfix = "some",
                        body = "Some(${receiver})",
                        scope = "expr",
                    },
                    ok = {
                        postfix = "ok",
                        body = "Ok(${receiver})",
                        scope = "expr",
                    },
                    err = {
                        postfix = "err",
                        body = "Err(${receiver})",
                        scope = "expr",
                    },
                    unsafe = {
                        postfix = "unsafe",
                        body = "unsafe { ${receiver} }",
                        scope = "expr",
                    },
                    arc = {
                        postfix = "arc",
                        body = "Arc::new(${receiver})",
                        scope = "expr",
                        requires = "std::sync::Arc",
                    },
                    print = {
                        postfix = "print",
                        body = "println!(\"{}\", ${receiver});",
                        scope = "expr",
                    },
                    debug = {
                        postfix = "debug",
                        body = "println!(\"{:?}\", ${receiver});",
                        scope = "expr",
                    },
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

lspconfig.pylsp.setup{}

require('lsp-notify').setup({})


local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.clangd.setup({ capabilities = capabilities })

lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
    settings = {
        ["rust-analyzer"] = {
            rustc = {
                source = "discover",
            },
            procMacro = {
                enable = true,
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
                        body = 'println!("{}", ${receiver});',
                        scope = "expr",
                    },
                    debug = {
                        postfix = "debug",
                        body = 'println!("{:?}", ${receiver});',
                        scope = "expr",
                    },
                },
            },
        },
    },
})

lspconfig.gopls.setup({
    cmd = { 'gopls', '--remote=auto' },
    capabilities = capabilities,
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
})

lspconfig.pylsp.setup({ capabilities = capabilities })
lspconfig.zls.setup({ capabilities = capabilities })

lspconfig.ocamllsp.setup({
    capabilities = capabilities,
    settings = {
        ocamlformat = "ocamlformat",
    },
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local buf = args.buf
        vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition,                              { buffer = buf, silent = true })
        vim.keymap.set('n', '<leader>x', '<cmd>Telescope lsp_definitions<CR>',               { buffer = buf, silent = true })
        vim.keymap.set('n', '<leader>t', vim.lsp.buf.type_definition,                        { buffer = buf, silent = true })
        vim.keymap.set('n', '<leader>y', '<cmd>Telescope lsp_type_definitions<CR>',          { buffer = buf, silent = true })
        vim.keymap.set('n', '<leader>i', '<cmd>Telescope lsp_implementations<CR>',           { buffer = buf, silent = true })
        vim.keymap.set('n', '<leader>m', vim.lsp.buf.hover,                                  { buffer = buf, silent = true })
        vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end, { buffer = buf, silent = true })
        vim.keymap.set('n', '<leader>c', vim.lsp.buf.rename,                                 { buffer = buf, silent = true })
        vim.keymap.set('n', '<leader>r', '<cmd>Telescope lsp_references<CR>',                { buffer = buf, silent = true })
        vim.keymap.set('n', '<leader>k', '<cmd>Telescope lsp_incoming_calls<CR>',            { buffer = buf, silent = true })
        vim.keymap.set('n', '<leader>o', '<cmd>Telescope lsp_outgoing_calls<CR>',            { buffer = buf, silent = true })
        vim.keymap.set('n', '<leader>u', '<cmd>Telescope lsp_document_symbols<CR>',          { buffer = buf, silent = true })
        vim.keymap.set('n', '<leader><space>', vim.lsp.buf.code_action,                      { buffer = buf, silent = true })
    end,
})

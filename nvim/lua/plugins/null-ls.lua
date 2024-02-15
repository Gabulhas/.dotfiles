local null_ls = require("null-ls")
local helpers = require("null-ls.helpers")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.autopep8,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.eslint, null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.ocamlformat,
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.lua_format,
        null_ls.builtins.formatting.ocamlformat
    },
    debug = true,

    -- you can reuse a shared lspconfig on_attach callback here
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({bufnr = bufnr})
                end
            })
        end
    end
})

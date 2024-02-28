-----------------------------------------------------------
-- Neovim LSP configuration file
-----------------------------------------------------------
-- Plugin: nvim-lspconfig
-- for language server setup see: https://github.com/neovim/nvim-lspconfig
local nvim_lsp = require 'lspconfig'

local easy_load_servers = {
    'bashls', 'jedi_language_server', 'html', 'gopls', 'svls', 'texlab',
    'ocamllsp', 'elixirls', 'nimls', 'tsserver', 'html', 'hls', 'lua_ls',
    'csharp_ls', 'elixirls', 'clangd', 'zls'
}

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.documentationFormat = {
    'markdown', 'plaintext'
}
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport =
    true
capabilities.textDocument.completion.completionItem.tagSupport = {
    valueSet = {1}
}
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {'documentation', 'detail', 'additionalTextEdits'}
}
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer

vim.cmd [[autocmd! ColorScheme * highlight NormalFloat ctermbg=NONE ctermfg=7]]
vim.cmd [[autocmd! ColorScheme * highlight FloatBorder ctermbg=NONE ctermfg=7]]

local border = {
    {"┏", "FloatBorder"}, {"━", "FloatBorder"}, {"┓", "FloatBorder"},
    {"┃", "FloatBorder"}, {"┛", "FloatBorder"}, {"━", "FloatBorder"},
    {"┗", "FloatBorder"}, {"┃", "FloatBorder"}
}

-- LSP settings (for overriding per client)
local handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover,
                                          {border = border}),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers
                                                      .signature_help,
                                                  {border = border})
}

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end
    local nmap = function(keys, func, desc)
        if desc then desc = 'LSP: ' .. desc end

        vim.keymap.set('n', keys, func, {buffer = bufnr, desc = desc})
    end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = {noremap = true, silent = true}

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'gK', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<space>wa',
                   '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr',
                   '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl',
                   '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
                   opts)
    buf_set_keymap('n', '<space>D',
                   '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>',
                   opts)
    buf_set_keymap('n', '<space>e',
                   '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
                   opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.set_loclist()<CR>',
                   opts)
    buf_set_keymap('n', '<space>lf',
                   '<cmd>lua vim.lsp.buf.format { async = true }<CR>', opts)
    -- buf_set_keymap('n', '<space>d', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)

    nmap('gr', require('telescope.builtin').lsp_references,
         '[G]oto [R]eferences')
    -- nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws',
         require('telescope.builtin').lsp_dynamic_workspace_symbols,
         '[W]orkspace [S]ymbols')
end

for _, lsp in ipairs(easy_load_servers) do

    nvim_lsp[lsp].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {debounce_text_changes = 150},
        handlers = handlers
    })
end

-----------------------------------------------------------
-- Lua config
-----------------------------------------------------------

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

--- EFM START ---
require"lspconfig".efm.setup {
    init_options = {documentFormatting = true},
    filetypes = {"python"},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            lua = {
                {
                    formatCommand = "lua-format -i --no-keep-simple-function-one-line --no-break-after-operator --column-limit=150 --break-after-table-lb",
                    formatStdin = true
                }
            },

            python = {{formatCommand = "autopep8 -", formatStdin = true}}

        }
    }
}

--- Rust START ---

local rt = require('rust-tools')
local opts = {
    -- rust-tools options
    tools = {
        autoSetHints = true,
        inlay_hints = {
            -- automatically set inlay hints (type hints)
            -- default: true
            auto = false,

            -- Only show inlay hints for the current line
            only_current_line = true,

            -- whether to show parameter hints with the inlay hints or not
            -- default: true
            show_parameter_hints = true,

            -- prefix for parameter hints
            -- default: "<-"
            parameter_hints_prefix = "<- ",

            -- prefix for all the other hints (type, chaining)
            -- default: "=>"
            other_hints_prefix = "=> ",

            -- whether to align to the length of the longest line in the file
            max_len_align = false,

            -- padding from the left if max_len_align is true
            max_len_align_padding = 1,

            -- whether to align to the extreme right or not
            right_align = false,

            -- padding from the right if right_align is true
            right_align_padding = 7,

            -- The color of the hints
            highlight = "Comment"
        }
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
    -- https://rust-analyzer.github.io/manual.html#features
    server = {
        settings = {
            ["rust-analyzer"] = {
                assist = {
                    importEnforceGranularity = true,
                    importPrefix = "crate"
                },
                cargo = {allFeatures = true, {buildScripts = {enable = true}}},

                checkOnSave = {
                    -- default: `cargo check`
                    command = "clippy"
                },
                imports = {granularity = {group = "module"}, prefix = "self"},
                cargo = {buildScripts = {enable = true}},
                procMacro = {enable = true},
                diagnostics = {
                    disabled = {"macro-error", "unresolved-proc-macro"}
                }
            }
            --            inlayHints = {
            --                lifetimeElisionHints = {enable = true, useParameterNames = true}
            --            }
        },
        on_attach = function(client, bufnr)
            -- Hover actions
            on_attach(client, bufnr)
            client.server_capabilities.semanticTokensProvider = nil
            vim.api.nvim_buf_set_keymap(bufnr, "n", "K",
                                        "<cmd>:RustHoverActions<CR>",
                                        {noremap = true, silent = true})
            -- Code action groups
            vim.keymap.set("n", "<Leader>a",
                           rt.code_action_group.code_action_group,
                           {buffer = bufnr})
        end

    }
}

rt.setup(opts)

--- Rust END ---

--- Solidity START ---
-- require"lspconfig".solidity.setup({
--    cmd = { 'nomicfoundation-solidity-language-server', '--stdio' },
--    filetypes = { 'solidity' },
--    root_dir = require("lspconfig.util").find_git_ancestor,
--    single_file_support = true,
--    capabilities = capabilities,
--    on_attach = on_attach,
-- })

--- Solidity END ---
-- vim.cmd [[autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)]]
capabilities.offsetEncoding = 'utf-8'
require('lspconfig').clangd.setup {capabilities = capabilities}

require('lspconfig').solidity.setup({
    on_attach = on_attach, -- probably you will need this.
    capabilities = capabilities,
    flags = {debounce_text_changes = 150},
    handlers = handlers,
    settings = {
        -- example of global remapping
        solidity = {
            includePath = '',
            remapping = {
                ["@OpenZeppelin/"] = 'OpenZeppelin/openzeppelin-contracts@4.6.0/'
            }
        }
    }
})

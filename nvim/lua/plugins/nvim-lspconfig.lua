-----------------------------------------------------------
-- Neovim LSP configuration file
-----------------------------------------------------------
-- Plugin: nvim-lspconfig
-- for language server setup see: https://github.com/neovim/nvim-lspconfig
local nvim_lsp = require 'lspconfig'

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.documentationFormat = {'markdown', 'plaintext'}
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = {valueSet = {1}}
capabilities.textDocument.completion.completionItem.resolveSupport = {properties = {'documentation', 'detail', 'additionalTextEdits'}}
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = {noremap = true, silent = true}

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    -- buf_set_keymap('n', '', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

local easy_load_servers = {
    'bashls', 'jedi_language_server', 'clangd', 'html', 'gopls', 'svls', 'texlab', 'ocamllsp', 'elixirls', 'nimls', 'solc', 'tsserver', 'html'
}

for _, lsp in ipairs(easy_load_servers) do

    nvim_lsp[lsp].setup({on_attach = on_attach, capabilities = capabilities, flags = {debounce_text_changes = 150}})
end

-----------------------------------------------------------
-- Lua config
-----------------------------------------------------------

-- local luadev = require("lua-dev").setup({})
-- 
-- local lspconfig = require('lspconfig')
-- lspconfig.sumneko_lua.setup(luadev)

-- require"lspconfig".sumneko_lua.setup({
--    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
--    capabilities = capabilities,
--    settings = {
--        Lua = {
--            runtime = {version = 'LuaJIT', path = vim.split(package.path, ';')},
--            completion = {enable = true, callSnippet = "Both"},
--            diagnostics = {enable = true, globals = {'vim', 'describe'}, disable = {"lowercase-global"}},
--            workspace = {
--                library = {
--                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
--                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
--                    [vim.fn.expand('/usr/share/awesome/lib')] = true
--                },
--                -- adjust these two values if your performance is not optimal
--                maxPreload = 2000,
--                preloadFileSize = 1000
--            }
--        }
--    },
--    on_attach = on_attach_common
-- })

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require"lspconfig".efm.setup {
    init_options = {documentFormatting = true},
    filetypes = {"lua", "python"},
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

local path_to_elixirls = vim.fn.expand("~/gitdownloads/elixir-ls/release/language_server.sh")

require"lspconfig".elixirls.setup({
    cmd = {path_to_elixirls},
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        elixirLS = {
            -- I choose to disable dialyzer for personal reasons, but
            -- I would suggest you also disable it unless you are well
            -- aquainted with dialzyer and know how to use it.
            dialyzerEnabled = false,
            -- I also choose to turn off the auto dep fetching feature.
            -- It often get's into a weird state that requires deleting
            -- the .elixir_ls directory and restarting your editor.
            fetchDeps = false
        }
    }
})

local rt = require('rust-tools')
local opts = {
    -- rust-tools options
    tools = {autoSetHints = true, inlay_hints = {show_parameter_hints = true, parameter_hints_prefix = "->", other_hints_prefix = ""}},

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
    -- https://rust-analyzer.github.io/manual.html#features
    server = {
        settings = {
            ["rust-analyzer"] = {
                assist = {importEnforceGranularity = true, importPrefix = "crate"},
                cargo = {allFeatures = true, {buildScripts = {enable = true}}},

                checkOnSave = {
                    -- default: `cargo check`
                    command = "clippy"
                },
                imports = {granularity = {group = "module"}, prefix = "self"},
                cargo = {buildScripts = {enable = true}},
                procMacro = {enable = true},
                diagnostics = {disabled = {"macro-error", "unresolved-proc-macro"}}
            },
            inlayHints = {lifetimeElisionHints = {enable = true, useParameterNames = true}}
        },
        on_attach = function(_, bufnr)
            -- Hover actions
            vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>:RustHoverActions<CR>", {noremap = true, silent = true})
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, {buffer = bufnr})
        end

    }
}

rt.setup(opts)
vim.cmd [[autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)]]

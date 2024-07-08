local cmd = vim.cmd

local prettier_files = {
    "css", "graphql", "html", "javascript", "javascriptreact", "json", "less",
    "markdown", "scss", "typescript", "typescriptreact", "yaml"
}

-- Add packages
require("lazy").setup({

    -- file explorer
    {
        'kyazdani42/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons' -- optional, for file icons
        }
    }, -- autopair
    {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup() end
    }, -- telescope
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {{'nvim-lua/plenary.nvim'}}
    }, {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'}, {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = {
            "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"
        }
    }, {"aaronhallaert/advanced-git-search.nvim"}, {
        "lewis6991/gitsigns.nvim",
        config = function() require('gitsigns').setup() end
    }, {
        "mbrea-c/wal-colors.nvim",
        dir = "/home/guilherme/gitdownloads/wal-colors.nvim",
        config = function()
            require("wal-colors").setup("mbc-colorscheme")
            vim.cmd([[colorscheme mbc]]) -- activate the colorscheme
        end,
        priority = 1000 -- recommended to ensure the colorscheme
        -- is loaded before other plugins
    }, {
        'nvim-lualine/lualine.nvim',
        dependencies = {'nvim-tree/nvim-web-devicons', lazy = true}
    }, {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = {
                    "c", "lua", "vim", "vimdoc", "query", "elixir", "heex",
                    "javascript", "html"
                },
                sync_install = false,
                highlight = {enable = true},
                indent = {enable = true}
            })
        end
    }, {'neovim/nvim-lspconfig'}, {'jose-elias-alvarez/null-ls.nvim'}, {
        "folke/trouble.nvim",
        dependencies = "kyazdani42/nvim-web-devicons",
        config = function() require("trouble").setup() end
    }, {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'L3MON4D3/LuaSnip', 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer', 'saadparwaiz1/cmp_luasnip'
        }
    }, {'ray-x/guihua.lua'}, {'glepnir/lspsaga.nvim'},
    {'jubnzv/virtual-types.nvim'}, {'sbdchd/neoformat'},
    {'folke/lsp-colors.nvim'}, {'simrat39/symbols-outline.nvim'},
    {'ray-x/lsp_signature.nvim'}, {"mfussenegger/nvim-dap"},
    {"Pocco81/DAPInstall.nvim"}, {"theHamsta/nvim-dap-virtual-text"}, {
        "rcarriga/nvim-dap-ui",
        dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"}
    }, {"mfussenegger/nvim-dap-python"}, {"nvim-telescope/telescope-dap.nvim"},
    {"leoluz/nvim-dap-go"}, {"jbyuki/one-small-step-for-vimkind"},

    -----------------------------------------------------------
    -- Language Specific Plugins
    -----------------------------------------------------------

    {'neovimhaskell/haskell-vim', ft = {'haskell'}}, -- Go
    {
        'ray-x/go.nvim',
        config = function() require("go").setup() end,
        ft = {"go", "gomod"},
        build = ':lua require("go.install").update_all_sync()'
    }, -- Go
    {'lervag/vimtex', ft = {'tex'}}, -- LaTeX
    {'mfussenegger/nvim-jdtls', ft = 'java'}, -- Java
    {'simrat39/rust-tools.nvim'}, -- Rust
    {
        'MunifTanjim/prettier.nvim',
        ft = prettier_files,
        config = function()
            require('prettier').setup({
                bin = 'prettier',
                filetypes = prettier_files
            })
        end
    }, -- Java lmao 
    {
        'nvim-java/nvim-java',
        dependencies = {
            'nvim-java/lua-async-await', 'nvim-java/nvim-java-refactor',
            'nvim-java/nvim-java-core', 'nvim-java/nvim-java-test',
            'nvim-java/nvim-java-dap', 'MunifTanjim/nui.nvim',
            'neovim/nvim-lspconfig', 'mfussenegger/nvim-dap', {
                'williamboman/mason.nvim',
                opts = {
                    registries = {
                        'github:nvim-java/mason-registry',
                        'github:mason-org/mason-registry'
                    }
                }
            }
        },
        ft = {"java"},
        config = function() require('java').setup() end
    }

})

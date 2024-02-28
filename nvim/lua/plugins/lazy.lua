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
        'pwntester/octo.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim',
            'nvim-tree/nvim-web-devicons'
        }
    }, {
        "mbrea-c/wal-colors.nvim",
        dir = "/home/guilherme/gitdownloads/wal-colors.nvim",
        config = function()
            require("wal-colors").setup("mbc-colorscheme")
            vim.cmd([[colorscheme mbc]]) -- activate the colorscheme
        end,
        priority = 1000 -- recommended to ensure the colorscheme
        -- is loaded before other plugins
    }, {'wakatime/vim-wakatime'}, {
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
    }, -- LSP
    {'neovim/nvim-lspconfig'}, {'jose-elias-alvarez/null-ls.nvim'}, {
        "folke/trouble.nvim",
        dependencies = "kyazdani42/nvim-web-devicons",
        config = function() require("trouble").setup() end
    }, -- autocomplete
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'L3MON4D3/LuaSnip', 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer', 'saadparwaiz1/cmp_luasnip'
        }
    }, {'ray-x/guihua.lua'}, -- completion looks
    {'glepnir/lspsaga.nvim'}, {'jubnzv/virtual-types.nvim'},

    {'sbdchd/neoformat'}, {"akinsho/toggleterm.nvim"},

    {'folke/lsp-colors.nvim'}, {'simrat39/symbols-outline.nvim'},

    {'ray-x/lsp_signature.nvim'}, -- DAP
    {"mfussenegger/nvim-dap"}, {"Pocco81/DAPInstall.nvim"},
    {"theHamsta/nvim-dap-virtual-text"}, {"rcarriga/nvim-dap-ui"},
    {"mfussenegger/nvim-dap-python"}, {"nvim-telescope/telescope-dap.nvim"},
    {"leoluz/nvim-dap-go"}, {"jbyuki/one-small-step-for-vimkind"},

    -----------------------------------------------------------
    -- Language Specific Plugins
    -----------------------------------------------------------

    -- Haskell
    {'neovimhaskell/haskell-vim', ft = {'haskell'}}, -- Go
    {
        'ray-x/go.nvim',
        config = function() require("go").setup() end,
        ft = {"go", "gomod"},
        build = ':lua require("go.install").update_all_sync()'
    }, -- LaTeX
    {'lervag/vimtex', ft = {'tex'}}, -- Markdown
    -- Nim
    {'alaviss/nim.nvim', ft = 'nim'}, -- Java
    {'mfussenegger/nvim-jdtls', ft = 'java'}, -- Rust
    {'simrat39/rust-tools.nvim'}, -- javascript and all that cringe stuff
    {
        'MunifTanjim/prettier.nvim',
        ft = prettier_files,
        config = function()
            require('prettier').setup({
                bin = 'prettier',
                filetypes = prettier_files
            })
        end
    }, -- Other
    {'pest-parser/pest.vim', ft = 'pest'},
    {'rvmelkonian/move.vim', ft = 'move'},
    {'Hoffs/omnisharp-extended-lsp.nvim', ft = "csharp"}

})

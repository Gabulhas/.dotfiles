local cmd = vim.cmd

cmd [[packadd packer.nvim]]
local packer = require 'packer'

vim.loader.enable()
-- Add packages
return packer.startup(function(use)
    use 'wbthomason/packer.nvim' -- packer can manage itself

    -- file explorer
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons' -- optional, for file icons
        }
    }

    -- autopair
    use {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup() end
    }

    -- telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/plenary.nvim'}}
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"}
    }

    use {"aaronhallaert/advanced-git-search.nvim"}
    use {"lewis6991/gitsigns.nvim", run = require('gitsigns').setup()}

    use {
        'pwntester/octo.nvim',
        requires = {
            'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim',
            'nvim-tree/nvim-web-devicons'
        }
    }

    use {'/home/guilherme/gitdownloads/pywal16.nvim', as = 'pywal16'}

    -- WoRk BtW

    use 'wakatime/vim-wakatime'

    use {
        'nvim-lualine/lualine.nvim',
        requires = {'nvim-tree/nvim-web-devicons', opt = true}
    }

    -- treesitter interface
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({
                with_sync = true
            })
            ts_update()
        end
    }

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'jose-elias-alvarez/null-ls.nvim'
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function() require("trouble").setup() end
    }

    -- autocomplete
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'L3MON4D3/LuaSnip', 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer', 'saadparwaiz1/cmp_luasnip'
        }
    }

    use 'ray-x/guihua.lua'

    -- completion looks
    use 'glepnir/lspsaga.nvim'

    use 'jubnzv/virtual-types.nvim'

    use {'sbdchd/neoformat'}

    use {"akinsho/toggleterm.nvim"}

    use 'folke/lsp-colors.nvim'

    use 'simrat39/symbols-outline.nvim'

    use 'ray-x/lsp_signature.nvim'

    -- DAP
    use "mfussenegger/nvim-dap"
    use "Pocco81/DAPInstall.nvim"
    use "theHamsta/nvim-dap-virtual-text"
    use "rcarriga/nvim-dap-ui"
    use {"mfussenegger/nvim-dap-python"}
    use "nvim-telescope/telescope-dap.nvim"
    use {"leoluz/nvim-dap-go"}
    use {"jbyuki/one-small-step-for-vimkind", module = "osv"}

    -----------------------------------------------------------
    -- Language Specific Plugins
    -----------------------------------------------------------

    -- Haskell
    use {'neovimhaskell/haskell-vim', ft = {'haskell'}}

    -- Go
    use {
        'ray-x/go.nvim',
        config = function()
            require("go").setup()
            --            require("go.format").gofmt()  -- gofmt only
            --            local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
            --            vim.api.nvim_create_autocmd("BufWritePre", {
            --              pattern = "*.go",
            --              callback = function()
            --               require('go.format').gofmt()
            --              end,
            --              group = format_sync_grp,
            -- })

        end,
        ft = {"go", "gomod"},
        run = ':lua require("go.install").update_all_sync()'
    }

    -- LaTeX
    use {'lervag/vimtex', ft = {'tex'}}

    -- Markdown
    use {'npxbr/glow.nvim', run = ':GlowInstall', ft = {'markdown'}}

    -- Elixir
    use({
        "elixir-tools/elixir-tools.nvim",
        tag = "stable",
        requires = {"nvim-lua/plenary.nvim"}
    })

    -- Nim
    use {'alaviss/nim.nvim', ft = 'nim'}

    -- Java
    use {'mfussenegger/nvim-jdtls', ft = 'java'}

    -- Rust
    use {'simrat39/rust-tools.nvim'}

    -- javascript and all that cringe stuff

    local prettier_files = {
        "css", "graphql", "html", "javascript", "javascriptreact", "json",
        "less", "markdown", "scss", "typescript", "typescriptreact", "yaml"
    }
    use {
        'MunifTanjim/prettier.nvim',
        ft = prettier_files,
        config = function()
            require('prettier').setup({
                bin = 'prettier',
                filetypes = prettier_files
            })
        end
    }

    -- Other
    use {'pest-parser/pest.vim', ft = 'pest'}
    use {'rvmelkonian/move.vim', ft = 'move'}
    use {'Hoffs/omnisharp-extended-lsp.nvim', ft = "csharp"}

end)

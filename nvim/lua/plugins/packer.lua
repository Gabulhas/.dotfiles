-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------
-- Plugin manager: packer.nvim
-- https://github.com/wbthomason/packer.nvim
-- For information about installed plugins see the README
--- neovim-lua/README.md
--- https://github.com/brainfucksec/neovim-lua#readme
local cmd = vim.cmd
cmd [[packadd packer.nvim]]
local packer = require 'packer'

-- Add packages
return packer.startup(function()
    use 'wbthomason/packer.nvim' -- packer can manage itself
    use 'lewis6991/impatient.nvim'

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
        config = function()
            require('nvim-autopairs').setup()
        end
    }

    -- telescope
    use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/plenary.nvim'}}}
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

    use {'Gabulhas/wal.vim', as = 'wal'}
    -- use {'AlphaTechnolog/pywal.nvim', as = 'pywal'}
    -- use({
    --     "sainnhe/everforest",
    --     -- Optional; default configuration will be used if setup isn't called.
    --     config = function()
    --         vim.cmd([[colorscheme everforest]])

    --     end
    -- })

    -- treesitter interface
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({with_sync = true})
            ts_update()
        end
    }

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'MunifTanjim/prettier.nvim'
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    -- autocomplete
    use {
        'hrsh7th/nvim-cmp',
        requires = {'L3MON4D3/LuaSnip', 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-path', 'hrsh7th/cmp-buffer', 'saadparwaiz1/cmp_luasnip'}
    }

    -- completion looks
    use 'glepnir/lspsaga.nvim'

    use 'jubnzv/virtual-types.nvim'

    use {'sbdchd/neoformat'}

    use {"akinsho/toggleterm.nvim"}

    use 'folke/lsp-colors.nvim'

    use 'simrat39/symbols-outline.nvim'

    use 'ray-x/lsp_signature.nvim'

    -- DAP
    use 'mfussenegger/nvim-dap'
    use {"rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}}

    -----------------------------------------------------------
    -- Language Specific Plugins
    -----------------------------------------------------------

    -- Haskell
    use {'neovimhaskell/haskell-vim', ft = {'haskell'}}

    -- Golang
    use {'fatih/vim-go', run = ':GoUpdateBinaries', ft = {'go'}}
    use {'leoluz/nvim-dap-go', ft = {'go'}} -- Install the plugin with Packer

    -- LaTeX
    use {'lervag/vimtex', ft = {'tex'}}

    -- Markdown
    use {'npxbr/glow.nvim', run = ':GlowInstall', ft = {'markdown'}}

    -- Gleam
    use {'gleam-lang/gleam.vim', ft = {'gleam'}}

    -- Elixir
    use {'elixir-editors/vim-elixir', ft = {'elixir', 'eelixir'}}

    -- Nim
    use {'alaviss/nim.nvim', ft = {'nim'}}

    -- Java
    use {'mfussenegger/nvim-jdtls', ft = {'java'}}

    -- Rust
    use 'simrat39/rust-tools.nvim'

    -- Other
    use {'pest-parser/pest.vim'}

    -- Don't look
    use("MunifTanjim/nui.nvim")
    use("dpayne/CodeGPT.nvim")

end)

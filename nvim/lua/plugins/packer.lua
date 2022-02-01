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

local elixir_types = {'elixir', 'eelixir'}

-- Add packages
return packer.startup(function()
    use 'wbthomason/packer.nvim' -- packer can manage itself

    -- file explorer
    use 'kyazdani42/nvim-tree.lua'

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

    use {'dylanaraps/wal', as = 'wal'}
    -- use {'AlphaTechnolog/pywal.nvim', as = 'pywal'}

    -- treesitter interface
    use 'nvim-treesitter/nvim-treesitter'

    use 'nvim-treesitter/playground'

    -- LSP
    use 'neovim/nvim-lspconfig'

    -- autocomplete
    use {
        'hrsh7th/nvim-cmp',
        requires = {'L3MON4D3/LuaSnip', 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-path', 'hrsh7th/cmp-buffer', 'saadparwaiz1/cmp_luasnip'}
    }

    -- zend mode
    use {
        "folke/zen-mode.nvim",
        config = function()
            require("zen-mode").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    -- completion looks
    use 'glepnir/lspsaga.nvim'

    -- this replaces baba_de_camelo :(
    use 'jubnzv/virtual-types.nvim'

    use {'sbdchd/neoformat'}

    use {"akinsho/toggleterm.nvim"}

    use 'folke/lsp-colors.nvim'

    -----------------------------------------------------------
    -- Language Specific Plugins
    -----------------------------------------------------------

    -- Lua
    use "folke/lua-dev.nvim"

    -- Haskell
    use {'neovimhaskell/haskell-vim', ft = {'haskell'}}

    -- Golang
    use {'fatih/vim-go', run = ':GoUpdateBinaries', ft = {'go'}}

    -- LaTeX
    -- use {'lervag/vimtex', ft = {'tex'}}

    -- Markdown
    use {'npxbr/glow.nvim', run = ':GlowInstall', ft = {'markdown'}}

    -- Gleam
    use {'gleam-lang/gleam.vim', ft = {'gleam'}}

    -- Nim
    use {'alaviss/nim.nvim', ft = {'nim'}}

end)

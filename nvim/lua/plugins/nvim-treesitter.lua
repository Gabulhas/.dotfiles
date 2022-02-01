-----------------------------------------------------------
-- Treesitter configuration file
-----------------------------------------------------------
-- Plugin: nvim-treesitter
-- https://github.com/nvim-treesitter/nvim-treesitter
require('nvim-treesitter.configs').setup {
    highlight = {enable = true},
    query_linter = {enable = true, use_virtual_text = true, lint_events = {"BufWrite", "CursorHold"}}
}

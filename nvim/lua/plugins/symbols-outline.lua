require("symbols-outline").setup()
local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

map('n', '<F8>', ':SymbolsOutline<CR>', default_opts) -- search file

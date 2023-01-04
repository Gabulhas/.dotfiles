-----------------------------------------------------------
-- Keymaps configuration file: keymaps of neovim
-- and plugins.
-----------------------------------------------------------
local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}
local cmd = vim.cmd

-----------------------------------------------------------
-- Neovim shortcuts:
-----------------------------------------------------------

-- spell :)
map('n', '<leader>s', ":set spell!<CR>", default_opts)

-- don't use arrow keys
map('', '<up>', '<nop>', {noremap = true})
map('', '<down>', '<nop>', {noremap = true})
map('', '<left>', '<nop>', {noremap = true})
map('', '<right>', '<nop>', {noremap = true})

-- move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h', default_opts)
map('n', '<C-j>', '<C-w>j', default_opts)
map('n', '<C-k>', '<C-w>k', default_opts)
map('n', '<C-l>', '<C-w>l', default_opts)

-----------------------------------------------------------
-- Applications & Plugins shortcuts:
-----------------------------------------------------------

-- nvim-tree
map('n', '<C-n>', ':NvimTreeToggle<CR>', default_opts) -- open/close
map('n', '<leader>r', ':NvimTreeRefresh<CR>', default_opts) -- refresh
map('n', '<leader>n', ':NvimTreeFindFile<CR>', default_opts) -- search file

-- Telescope
map('n', '<leader>ff', [[<cmd>Telescope find_files <cr>]], default_opts)
map('n', '<leader>fg', [[<cmd>Telescope live_grep <cr>]], default_opts)
map('n', '<leader>fb', [[<cmd>Telescope buffers <cr>]], default_opts)
map('n', '<leader>fh', [[<cmd>Telescope help_tags <cr>]], default_opts)
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, {desc = '[S]earch [F]iles'})
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, {desc = '[S]earch [H]elp'})
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, {desc = '[S]earch current [W]ord'})
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, {desc = '[S]earch [D]iagnostics'})
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, {desc = '[ ] Find existing buffers'})


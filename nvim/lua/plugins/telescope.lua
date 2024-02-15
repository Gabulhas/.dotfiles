local actions = require("telescope.actions")

local telescope = require("telescope")
local telescope_builtin = require("telescope.builtin")

telescope.setup {
    defaults = {mappings = {i = {["<C-s>"] = actions.file_split}}},
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case" -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        }
    }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
telescope.load_extension('fzf')
telescope.load_extension("advanced_git_search")
telescope.load_extension('dap')
telescope.load_extension('file_browser')

vim.keymap.set('n', '<leader>ff', [[<cmd>Telescope find_files <cr>]],
               {noremap = true, silent = true})
vim.keymap.set('n', '<leader>fg', [[<cmd>Telescope live_grep <cr>]],
               {noremap = true, silent = true})
vim.keymap.set('n', '<leader>fh', [[<cmd>Telescope help_tags <cr>]],
               {noremap = true, silent = true})
vim.keymap.set('n', '<leader>fd', telescope_builtin.diagnostics,
               {desc = '[S]earch [D]iagnostics'})
vim.keymap.set('n', '<leader><space>', telescope_builtin.buffers,
               {desc = '[ ] Find existing buffers'})
vim.keymap.set('n', '<leader>fb', [[<cmd>Telescope file_browser<cr>]],
               {desc = '[S]earch [D]iagnostics'})

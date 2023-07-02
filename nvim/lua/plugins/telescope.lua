local actions = require("telescope.actions")

local telescope = require("telescope")
local telescope_builtin = require("telescope.builtin")

telescope.setup {
    defaults = {
        mappings = {
            i = {
                ["<C-s>"] = actions.file_split,
            }
        }

    },
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



vim.keymap.set('n', '<leader>ff', [[<cmd>Telescope find_files <cr>]],   {noremap = true, silent = true})
vim.keymap.set('n', '<leader>fg', [[<cmd>Telescope live_grep <cr>]],    {noremap = true, silent = true})
vim.keymap.set('n', '<leader>fb', [[<cmd>Telescope buffers <cr>]],      {noremap = true, silent = true})
vim.keymap.set('n', '<leader>fh', [[<cmd>Telescope help_tags <cr>]],    {noremap = true, silent = true})
vim.keymap.set('n', '<leader>sf',       telescope_builtin.find_files, {desc = '[S]earch [F]iles'})
vim.keymap.set('n', '<leader>sh',       telescope_builtin.help_tags, {desc = '[S]earch [H]elp'})
vim.keymap.set('n', '<leader>sw',       telescope_builtin.grep_string, {desc = '[S]earch current [W]ord'})
vim.keymap.set('n', '<leader>sd',       telescope_builtin.diagnostics, {desc = '[S]earch [D]iagnostics'})
vim.keymap.set('n', '<leader><space>',  telescope_builtin.buffers, {desc = '[ ] Find existing buffers'})



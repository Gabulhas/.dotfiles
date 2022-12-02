-----------------------------------------------------------
-- File manager configuration file
-----------------------------------------------------------
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {adaptive_size = true, mappings = {list = {{key = "u", action = "dir_up"}}}},
    renderer = {group_empty = true},
    filters = {dotfiles = true}
})

 vim.cmd([[hi NvimTreeWinSeparator ctermbg=7 ctermfg=7]])

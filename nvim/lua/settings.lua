-----------------------------------------------------------
-- Neovim settings
-----------------------------------------------------------
-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
-- local map = vim.api.nvim_set_keymap  -- set global keymap local cmd = vim.cmd -- execute Vim commands
local cmd = vim.cmd
local exec = vim.api.nvim_exec -- execute Vimscript
local fn = vim.fn -- call Vim functions
local g = vim.g -- global variables
local opt = vim.opt -- global/buffer/windows-scoped options

-----------------------------------------------------------
-- General
----------------------------------------------------------- 
g.mapleader = ' '
g.maplocalleader = ','
g.ttyfast = true
g.pumheight = 10
g.exrc = true
g.secure = true
g.pumheight = 10
g.mousescroll = 0
g.mouse = ''
exec([[
    set mouse=
]], false)

cmd [[
set clipboard=unnamedplus
]]

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true -- show line number
opt.relativenumber = true
opt.showmatch = true -- highlight matching parenthesis
opt.splitright = true -- vertical split to the right
opt.splitbelow = true -- orizontal split to the bottom
opt.ignorecase = true -- ignore case letters when search
opt.smartcase = true -- ignore lowercase for the whole pattern
opt.linebreak = true -- wrap on word boundary
opt.scrolloff = 12

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true -- enable background buffers
opt.history = 100 -- remember n lines in history
opt.lazyredraw = true -- faster scrolling
opt.synmaxcol = 240 -- max column for syntax highlight

-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------
cmd [[colorscheme pywal16]]
cmd [[highlight MatchParen ctermfg=white ctermbg=green cterm=NONE]]

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true -- use spaces instead of tabs
opt.shiftwidth = 4 -- shift 4 spaces when tab
opt.tabstop = 4 -- 1 tab == 4 spaces
opt.smartindent = true -- autoindent new lines

-- don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-----------------------------------------------------------
-- Autocompletion
-----------------------------------------------------------
-- insert mode completion options
opt.completeopt = 'menu,menuone,noselect'

-----------------------------------------------------------
-- Terminal
-----------------------------------------------------------
-- open a terminal pane on the right using :Term
cmd [[command Term :botright vsplit term://$SHELL]]

-- Terminal visual tweaks
--- enter insert mode when switching to terminal
--- close terminal buffer on process exit
cmd [[
    autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
    autocmd TermOpen * startinsert
    autocmd BufLeave term://* stopinsert
]]

-----------------------------------------------------------
-- Aliases
-----------------------------------------------------------
cmd [[
	cnoreabbrev W! w!
	cnoreabbrev Q! q!
	cnoreabbrev Qall! qall!
	cnoreabbrev Wq wq
	cnoreabbrev Wa wa
	cnoreabbrev wQ wq
	cnoreabbrev WQ wq
	cnoreabbrev W w
	cnoreabbrev Q q
	cnoreabbrev Qall qall
]]

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- disable builtins plugins
local disabled_built_ins = {
    "netrw", "netrwPlugin", "netrwSettings", "netrwFileHandlers", "gzip", "zip", "zipPlugin", "tar", "tarPlugin", "getscript", "getscriptPlugin",
    "vimball", "vimballPlugin", "2html_plugin", "logipat", "rrhelper", "spellfile_plugin", "matchit"
}

for _, plugin in pairs(disabled_built_ins) do g["loaded_" .. plugin] = 1 end

-- automatically load .vim files
cmd [[
    set exrc
    set secure
]]

cmd [[
    set encoding=utf-8
]]

-----------------------------------------------------------
-- Other
-----------------------------------------------------------

cmd [[
    au BufNewFile,BufRead *.gl setfiletype scheme
]]


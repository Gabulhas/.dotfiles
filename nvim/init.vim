call plug#begin('~/.local/share/nvim/plugged')

    "------------ General use Plugins ---------------""
    
    "file explorer
    Plug 'kyazdani42/nvim-tree.lua'

    " zen mode
    Plug 'junegunn/goyo.vim'

    "auto () [] {}
    Plug 'jiangmiao/auto-pairs'

    "Telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'fannheyward/telescope-coc.nvim'

    
    "Using plug
    Plug 'dylanaraps/wal', {'as': 'wal'}

    "Plug 'https://gitlab.com/bloodflame/wal.vim'

    "syntax
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

    "highlighted yank
    Plug 'machakann/vim-highlightedyank'


    "Languages
    let elixir_types = ['elixir', 'eelixir']
    let languages = ['ocaml', 'go', 'tex', 'html', 'htmldjango','javascript', 'c', 'cpp', 'haskell', 'nim', 'python', 'rust', 'cs']  + elixir_types

    "completion
    Plug 'neoclide/coc.nvim', {'branch': 'release', 'for': languages}
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile', 'for': languages}


    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make', 'for': languages }

    " Neoformat
    Plug 'sbdchd/neoformat', {'for' : ['ocaml', 'python', 'rust']}
    "
    "------------ Language Specific Plugins ---------------""


    "Haskell
    Plug 'neovimhaskell/haskell-vim', {'for' : ['haskell']}

    "Python
    Plug 'Vimjas/vim-python-pep8-indent', {'for' : ['python']}

    "Elixir
    Plug 'elixir-editors/vim-elixir', {'for':elixir_types}
    Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack', 'for': elixir_types}

    "Golang
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for':['go'] }

    " LaTeX
    Plug 'lervag/vimtex', {'for': 'tex'}

    " Markdown
    Plug 'npxbr/glow.nvim', {'do': ':GlowInstall', 'for':['markdown']}

    "Gleam
    Plug 'gleam-lang/gleam.vim', {'for' : ['gleam']}

    "Nim
    Plug 'alaviss/nim.nvim', {'for' : ['nim']}

call plug#end()



"""Vim basic configs
colorscheme wal
set splitbelow

syntax enable

filetype plugin indent on
set ttyfast
set number
set pumheight=10
set shiftwidth=4
set showmatch
set encoding=UTF-8
set scrolloff=12
set exrc
set secure

"Leader
let mapleader = "\<Space>"
let maplocalleader = "\\"
map <Space> <Leader>


"open terminal
nnoremap <silent> <Leader>nt :!($TERM &)<CR>i

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope current_buffer_fuzzy_find sorting_strategy=ascending prompt_position=top <cr>
nnoremap <leader>fw <cmd>Telescope buffers<cr>
nnoremap <leader>fc <cmd>Telescope commands<cr>

" coc
" GoTo code navigation.
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> ge <Plug>(coc-diagonostics)

nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" spell
nnoremap <silent> <Leader>s :set spell!<CR>

" scroll using tab
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"



"""nvim-tree configs
nnoremap <C-n> :NvimTreeToggle<CR>
let g:nvim_tree_show_icons = {
    \ 'git': 0,
    \ 'folders': 1,
    \ 'files': 0,
    \ 'folder_arrows': 0,
    \ }

"
""" Neoformat
" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to space conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1


" better window navigation, cause CTRL+W+DIRECTION sucks
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Because of shiftclick xD
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

" Center search results 
nnoremap n nzz
nnoremap N Nzz


" fix hightlight paren for alacritty + wal.vim
highlight MatchParen ctermfg=white ctermbg=green cterm=NONE


" yank animation
let g:highlightedyank_highlight_duration =200

" this has to be here for some reason lmao
let g:opamshare = substitute(system('opam var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

"treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {}
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {"lingua"},  -- list of language that will be disabled
  },
}
require'nvim-tree'.setup {}
require('telescope').load_extension('coc')
require('telescope').load_extension('fzf')
EOF



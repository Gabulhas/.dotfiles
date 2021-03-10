filetype plugin indent on


call plug#begin('~/.local/share/nvim/plugged')

    "------------ General use Plugins ---------------""
    "file explorer
    Plug 'preservim/nerdtree'

    Plug 'jiangmiao/auto-pairs'
    
    " Tagbar
    Plug 'majutsushi/tagbar'

    
    " Using plug
    Plug 'dylanaraps/wal', {'as': 'wal'}


    " Rainbow parentheses
    Plug 'luochen1990/rainbow'

    Plug 'vim-airline/vim-airline'


    "syntax
    "Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update


    "completion
    Plug 'neoclide/coc.nvim', {'branch': 'release', 'for': ['ocaml', 'go', 'elixir', 'tex']}
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile', 'for': ['ocaml', 'go', 'elixir','tex']}



    "------------ Language Specific Plugins ---------------""

    "Python
    "Plug 'davidhalter/jedi-vim', {'for' : ['python']}
    Plug 'Vimjas/vim-python-pep8-indent', {'for' : ['python']}
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins', 'for': ['python'] }
    Plug 'zchee/deoplete-jedi', {'for' : ['python']}
    Plug 'dense-analysis/ale', {'for' : ['python']}
    Plug 'sbdchd/neoformat', {'for' : ['python']}

    "Elixir
    Plug 'elixir-editors/vim-elixir', {'for':['elixir']}
    Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack', 'for': ['elixir']}

    "Golang
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for':['go'] }
    


call plug#end()


let g:airline_theme='wal'
let g:airline_symbols = {}
    "'linenr':'≡',
    "'maxlinenr':'◊'

let g:airline_symbols.linenr = ' ≡'
let g:airline_symbols.maxlinenr = ' ◊'
let g:airline_symbols.whitespace = ' ‡'





"Leader
let mapleader = "\<Space>"
let maplocalleader = "«"
map <Space> <Leader>


" terminal mode
nnoremap <silent> <Leader>t :terminal<CR>i
tnoremap <Esc> <C-\><C-n>

" fzf files
nnoremap <silent> <Leader>cf :Files ~<CR>
nnoremap <silent> <Leader>z :FZF ~<CR>
nnoremap <silent> <Leader>f :Files %:p:h<CR>
nnoremap <silent> <Leader>cr :Rg<CR>


" spell
nnoremap <silent> <Leader>s :set spell!<CR>

" start rainbow parentheses
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

"deoplete
let g:deoplete#enable_at_startup = 1

" scroll using tab
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


"""Vim configs
" enable syntax highlighting
syntax enable


" Display x lines above/below the cursor when scrolling with a mouse.
set scrolloff=12

" Speed up scrolling in Vim
set ttyfast

" turn hybrid line numbers on
"set number relativenumber
" set nu rnu

" show line numbers
set number

" max menu size
set pumheight=10


" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show the matching part of the pair for [] {} and ()
set showmatch


"""nerdtree configs
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
map <C-n> :NERDTreeToggle<CR>


autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"""merlin configs
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"


"""ale configs
let g:ale_linters = {
      \   'python': ['flake8', 'pylint'],
      \   'javascript': ['eslint'],
      \}


" better window navigation, cause CTRL+W+DIRECTION sucks
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" latex pdfviewer
let g:livepreview_previewer = 'qpdfview'


" fix hightlight paren for alacritty + wal.vim
highlight MatchParen ctermfg=white ctermbg=green cterm=NONE


" yank animation
let g:highlightedyank_highlight_duration =200

" tagbar
nmap <F8> :TagbarToggle<CR>





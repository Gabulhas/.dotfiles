call plug#begin('~/.local/share/nvim/plugged')

    "------------ General use Plugins ---------------""
    
    " Rainbow parentheses
    Plug 'luochen1990/rainbow'
    
    "file explorer
    Plug 'preservim/nerdtree'
    "Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    "Plug 'ryanoasis/vim-devicons'


    " auto () [] {}
    Plug 'jiangmiao/auto-pairs'
    
    " Tagbar
    Plug 'majutsushi/tagbar'

    " fzf
    " TODO: remove
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    
    " Using plug
    Plug 'dylanaraps/wal', {'as': 'wal'}

    Plug 'https://gitlab.com/bloodflame/wal.vim'
    "Plug 'itchyny/lightline.vim'


    "Better Terminal in VIM
    Plug 'kassio/neoterm'

    "syntax
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update


    "completion
    Plug 'neoclide/coc.nvim', {'branch': 'release', 'for': ['ocaml', 'go', 'elixir','tex', 'html', 'htmldjango','javascript']}
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile', 'for': ['ocaml', 'go', 'elixir','tex', 'html', 'htmldjango','javascript']}

    " highlighted yank
    Plug 'machakann/vim-highlightedyank'


    "------------ Language Specific Plugins ---------------""

    "Python
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
    
    " LaTeX
    Plug 'lervag/vimtex', {'for': 'tex'}

    " Markdown
    Plug 'npxbr/glow.nvim', {'do': ':GlowInstall', 'for':['markdown']}

    "Gleam
    Plug 'gleam-lang/gleam.vim'

call plug#end()

colorscheme wal



filetype plugin indent on


"Leader
let mapleader = "\<Space>"
let maplocalleader = "\\"
map <Space> <Leader>

set splitbelow

" terminal mode
"nnoremap <silent> <Leader>nt :terminal<CR>i
"nnoremap <silent> <Leader>t :15sp <CR> :terminal<CR> i
"tnoremap <Esc> <C-\><C-n>:q!<CR>


" fzf files
"nnoremap <silent> <Leader>cf :Files ~<CR>
"nnoremap <silent> <Leader>f :Files %:p:h<CR>
"nnoremap <silent> <Leader>z :FZF ~<CR>
"nnoremap <silent> <Leader>cr :Rg<CR>




" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

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

nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"


" Use K to show documentation in preview window.
nnoremap <leader> K :call <SID>show_documentation()<CR>


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

"utf
set encoding=UTF-8


"""nerdtree configs
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
map <C-n> :NERDTreeToggle<CR>


autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1


"""VIM-GO configs

let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 2
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_format_strings = 1
let g:go_auto_type_info = 1



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

" Because of shiftclick :
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



" latex pdfviewer
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_context_pdf_viewer = 'zathura'


" fix hightlight paren for alacritty + wal.vim
highlight MatchParen ctermfg=white ctermbg=green cterm=NONE


" yank animation
let g:highlightedyank_highlight_duration =200

" tagbar
nmap <F8> :TagbarToggle<CR>


"treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = false,              -- false will disable the whole extension
    disable = {"lingua"},  -- list of language that will be disabled
  },
}
EOF


let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'p:protocols',
        \ 'm:modules',
        \ 'e:exceptions',
        \ 'y:types',
        \ 'd:delegates',
        \ 'f:functions',
        \ 'c:callbacks',
        \ 'a:macros',
        \ 't:tests',
        \ 'i:implementations',
        \ 'o:operators',
        \ 'r:records'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 'p' : 'protocol',
        \ 'm' : 'module'
    \ },
    \ 'scope2kind' : {
        \ 'protocol' : 'p',
        \ 'module' : 'm'
    \ },
    \ 'sort' : 0
\ }



" Run project specific .vimrc files
set exrc
set secure



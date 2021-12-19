
"""merlin configs
let g:opamshare = substitute(system('opam var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
let g:opambin = substitute(system('opam var bin'),'\n$','','''')
"execute "autocmd FileType ocaml source".g:opamshare."/ocp-indent/vim/indent/ocaml.vim"
let g:neoformat_ocaml_ocamlformat = {
            \ 'exe': g:opambin . '/ocamlformat',
            \ 'no_append': 1,
            \ 'stdin': 1,
            \ 'args': ['--disable-outside-detected-project', '--name', '"%:p"', '-']
            \ }

let g:neoformat_enabled_ocaml = ['ocamlformat']

map <leader>t :MerlinTypeOf<CR>
map <leader>s :MerlinTypeOfSel<CR>

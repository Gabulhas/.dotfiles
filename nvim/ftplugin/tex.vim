" latex pdfviewer
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_context_pdf_viewer = 'zathura'

let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \    '-shell-escape',
    \    '-verbose',
    \    '-file-line-error',
    \    '-synctex=1',
    \    '-interaction=nonstopmode',
    \ ],
    \}

let g:vimtex_compiler_latexmk_engines = {
    \ '_'          : '-xelatex',
    \ 'luatex'           : '-lualatex',
    \ 'lualatex'         : '-lualatex',
    \ 'xelatex'          : '-xelatex',
    \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
    \ 'context (luatex)' : '-pdf -pdflatex=context',
    \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
    \}

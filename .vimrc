set scrolloff=5
set ttyfast
inoremap jk <ESC>
nnoremap K 5k
nnoremap J 5j
syntax on

" change insert mode to |
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" for m in vscode
nnoremap m <leader><leader>s

" 4. copy paste to system clipboard
set clipboard=unnamedplus

" auto create folder 
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END
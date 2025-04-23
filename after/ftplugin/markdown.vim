set wrap linebreak
set tabstop=4
set shiftwidth=4

" Modify the default breaks: remove '.' and '*'
set breakat-=*
" Enable indentation
set breakindent
" Ident by an additional 2 characters on wrapped lines, when line >= 40
" characters, put 'showbreak' at start of line
set breakindentopt=shift:2,min:40,sbr
" Append characters to indent
set showbreak=↪

" Break on entire word
set wrap linebreak

" Enable spell checking
set spell

set nonumber

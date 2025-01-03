" Smart indentation for soft-wrapped lines
" (https://stackoverflow.com/a/26015800)

" Modify the default breaks: remove '.' and '*'
set breakat-=.
set breakat-=*
set breakat-=)
set breakat-=]
set breakat-=-
" Enable indentation
set breakindent
" Ident by an additional 4 characters on wrapped lines, when line >= 40 characters, put 'showbreak' at start of line
set breakindentopt=shift:4,min:40,sbr
" Append characters to indent
set showbreak=↪

" Break on entire word
set wrap linebreak


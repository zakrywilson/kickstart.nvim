" Reuse Go's configuration
runtime! after/ftplugin/go.vim

" Tabs: match Go style
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal noexpandtab

" Smart wrapping
set breakat-=.
set breakat-=*
set breakindent
set breakindentopt=shift:4,min:40,sbr
set showbreak=↪
set wrap linebreak

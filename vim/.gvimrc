" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

set mousehide		" Hide the mouse when typing text


"set the X11 font to use
"set guifont=Droid\ Sans\ Mono\ 12
"set guifont=Source\ Code\ Pro\ 12
set guifont=Monaco\ 12
"set guifont=Inconsolata\ 12
"set guifont=DEC\ Terminal\ 12
"set guifont=Gnu\ Unifont\ Mono\ 12
"set guifont=Monospace\ 12
"set guifont=Andale\ Mono\ 12
"set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
"set guifont=Menlo\ Regular\ 11

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" I like highlighting strings inside C comments
let c_comment_strings=1

" Switch on syntax highlighting if it wasn't on yet.
if !exists("syntax_on")
  syntax on
endif

" Switch on search pattern highlighting.
set hlsearch

set background=dark

"colorscheme lucius
colorscheme solarized
"colorscheme torte
"colorscheme murphy
"colorscheme zenburn

set lines=50
set columns=132

set ch=2		" Make command line two lines high


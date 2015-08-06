set nocompatible
set backup
set backupdir=$HOME/.vim.backups
set directory=$HOME/.vim.tmp

" Vundle setup
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
filetype off 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Plugin 'Valloric/YouCompleteMe'               " Intellisense style autocompletion
Plugin 'tpope/vim-fugitive'                   " Git integration
Plugin 'vimwiki/vimwiki'                      " Vimwiki support
Plugin 'sjl/vitality.vim'                     " Makes vim play nice with iTerm2 and tmux on macs
Plugin 'Lokaltog/powerline'                   " Very nifty status line
Plugin 'taglist.vim'                          " TAGS support and explorer
Plugin 'weynhamz/vim-plugin-minibufexpl'      " Mini Buffer Explorer
Plugin 'tpope/vim-endwise'                    " Adds closing block statments for Ruby,Python,C,shell,etc.
Plugin 'nathanaelkane/vim-indent-guides'      " Visual indentation guides
Plugin 'scrooloose/syntastic'                 " Syntax checking support
Plugin 'vim-ruby/vim-ruby'                    " Ruby support
Plugin 'klen/python-mode'                     " Python support
Plugin 'tpope/vim-cucumber'                   " Cucumber unit test support
Plugin 'godlygeek/tabular'                    " Text alignment/filtering
Plugin 'plasticboy/vim-markdown'              " Markdown support
Plugin 'ntpeters/vim-better-whitespace'       " Trailing whitespace detection and removal
Plugin 'ColorSchemeMenuMaker'                 " Exposes all colorschemes via menu in gvim
Plugin 'flazz/vim-colorschemes'               " Large library of color schemes
Plugin 'altercation/vim-colors-solarized'     " Solarized colorscheme
Plugin 'elzr/vim-json'                        " JSON support
Plugin 'todolist.vim'                         " Support for FIXME and TODO and similar tags
Plugin 'Shougo/unite.vim'                     " REPLACE ALL THE THINGS...
Plugin 'sqwishy/vim-sqf-syntax'               " SQF (Arma 3 script) support
Plugin 'jimenezrick/vimerl'                   " Erlang support

call vundle#end()
filetype plugin indent on

" Just disable YouCompleteMe if there isn't a modern enough vim to handle it.
" We don't really care for a warning on every startup.
if v:version < 703 || (v:version == 703 && !has('patch584'))
	let g:loaded_youcompleteme = 1
endif

set exrc
set number
set ruler
set showcmd
set showmatch
set shiftround
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set smarttab
set autoindent
set smartindent
set cindent
set cinoptions=l1,c4,(s,U1,w1,m1,j1
set cinwords=if,elif,else,for,while,try,except,finally,def,class
set foldmethod=syntax
set splitbelow
set nojoinspaces
set title
set updatecount=20
set updatetime=1000
set hl="8b,db,es,mb,Mn,nu,rs,sr,tb,vr,ws"
set nohls
set textwidth=80
set ttyfast
set nofoldenable
set modeline
set hidden
set hlsearch
set incsearch
set t_Co=256
set ch=1
set autochdir
set tags=tags;

set statusline=
set statusline +=\ [%n]            "buffer number
set statusline +=%#warningmsg#
set statusline +=%{SyntasticStatuslineFlag()}
set statusline +=%*
set statusline +=%{&ff!='unix'?'['.&ff.']':''}
set statusline +=%*
set statusline +=%y                "file type
set statusline +=\ %<%F            "full path
set statusline +=%m                "modified flag
set statusline +=%=%5l             "current line
set statusline +=/%L               "total lines
set statusline +=%4v\              "virtual column number

set laststatus=2

" Spot Ruby *file files.
autocmd BufNewFile,BufRead Berksfile set filetype=ruby
autocmd BufNewFile,BufRead Thorfile set filetype=ruby
autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby

" I want text wrapping for some file types
autocmd FileType markdown,plaintex,tex,text setlocal textwidth=78

map <F1> :ls<CR>:b<Space>
map <F2> !par 80 <CR>
map <F3> !/usr/local/bin/boxes -r <CR>
map <F4> !/usr/local/bin/boxes -p h2 -s 80 -i text -t 4 -d pound-cmt <CR>
map <F5> !/usr/local/bin/boxes -p h2 -s 80 -i text -t 4 -d shell <CR>
map <F7> :WMToggle <CR>
map <F8> :TlistToggle <CR>
map <F9> :SyntasticCheck <CR>
map <S-F9> :Errors <CR>
map <C-F9> :SyntasticReset <CR>


map <C-PageUp> :bn <CR>
map <C-PageDown> :bp <CR>
map <silent><C-Left> <C-T>
map <silent><C-Right> <C-]>


map <C-1> :buffer 1 <CR>
map <C-2> :buffer 2 <CR>
map <C-3> :buffer 3 <CR>
map <C-4> :buffer 4 <CR>
map <C-5> :buffer 5 <CR>
map <C-6> :buffer 6 <CR>
map <C-7> :buffer 7 <CR>
map <C-8> :buffer 8 <CR>
map <C-9> :buffer 9 <CR>
map <C-0> :buffers <CR>

map T :TaskList<CR>

let g:miniBufExplSplitBelow=0
let g:miniBufExplMapCTabSwitchBufs = 1

let c_comment_strings=1
let g:vimwiki_folding=1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

inoremap <Nul> <C-x><C-o>

" Make smartindent stop outdenting lines beginning with #
inoremap # X#

" Python remapping
:autocmd FileType python noremap <F4> !/usr/local/bin/boxes -p h2 -s 80 -i text -t 4 -d pound-cmt <CR>
:autocmd FileType python noremap <F5> !/usr/local/bin/boxes -p h2 -s 80 -i text -t 4 -d shell <CR>

:autocmd FileType python set tags+=$HOME/.vim/tags/python.ctags
:autocmd FileType python set laststatus=2

:autocmd FileType python let g:pymode_rope = 1
:autocmd FileType python let g:pymode_doc = 1
:autocmd FileType python let g:pymode_doc_key = 'K'
:autocmd FileType python let g:pymode_lint = 0
:autocmd FileType python let g:pymode_lint_checker = "pyflakes,pep8"
:autocmd FileType python let g:pymode_lint_write = 1
:autocmd FileType python let g:pymode_virtualenv = 1
:autocmd FileType python let g:pymode_breakpoint = 1
:autocmd FileType python let g:pymode_breakpoint_key = '<leader>b'
:autocmd FileType python let g:pymode_syntax = 1
:autocmd FileType python let g:pymode_syntax_all = 1
:autocmd FileType python let g:pymode_syntax_indent_errors = g:pymode_syntax_all
:autocmd FileType python let g:pymode_syntax_space_errors = g:pymode_syntax_all
:autocmd FileType python let g:pymode_folding = 0

" Ruby remapping
:autocmd FileType ruby noremap <F4> !/usr/local/bin/boxes -p h2 -s 80 -i text -t 4 -d pound-cmt <CR>
:autocmd FileType ruby noremap <F5> !/usr/local/bin/boxes -p h2 -s 80 -i text -t 4 -d shell <CR>
:autocmd FileType ruby set tags+=$HOME/.vim/tags/ruby.ctags

" Vim script remapping
:autocmd FileType vim noremap <F4> !/usr/local/bin/boxes -p h2 -s 80 -i text -t 4 -d vim-cmt <CR>

" Git Commit message settings
:autocmd FileType gitcommit set textwidth=72

" Lua remapping
:autocmd FileType lua noremap <F4> !/usr/local/bin/boxes -p h2 -s 80 -i text -t 4 -d lua-cmt <CR>
:autocmd FileType lua noremap <F5> !/usr/local/bin/boxes -p h2 -s 80 -i text -t 4 -d lua-box <CR>

" Shell remapping
:autocmd FileType sh noremap <F4> !/usr/local/bin/boxes -p h2 -s 80 -i text -t 4 -d pound-cmt <CR>
:autocmd FileType sh noremap <F5> !/usr/local/bin/boxes -p h2 -s 80 -i text -t 4 -d shell <CR>
:autocmd FileType sh autocmd BufWritePre <buffer> StripWhitespace

" JSON
au! BufRead,BufNewFile *.json set filetype=json
augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END

" Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction


if has("cscope")
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
else
   echo "no cscope"
endif


" Switch on syntax highlighting if it wasn't on yet.
if !exists("syntax_on")
  syntax on
endif

filetype plugin on
filetype indent on

set background=dark

colorscheme lucius

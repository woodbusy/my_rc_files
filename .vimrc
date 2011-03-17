
set nocompatible

set autoindent
set shiftwidth=2
set smarttab
set expandtab
set showmode
set showmatch
set ruler
set nojoinspaces
set cpo+=$
set whichwrap=""
set modelines=0
set nobackup
set encoding=utf-8
set wildmenu
let g:rubycomplete_rails = 1


" Manage buffers effectively.
" set hidden
set nohidden

" keep a longer history
set history=1000

" For when we aren't running in a GUI...
if !has("gui_running")
  " Set 256 colors
  set t_Co=256 
  set background=dark
  colorscheme ir_black
endif


"extended % matching
runtime macros/matchit.vim

set number

filetype plugin indent on
syntax enable

" python support
" --------------
"  don't highlight exceptions and builtins. I love to override them in local
"  scopes and it sucks ass if it's highlighted then. And for exceptions I
"  don't really want to have different colors for my own exceptions ;-)
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=0

" ruby support
" ------------
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" template language support (SGML / XML too)
" ------------------------------------------

autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd BufNewFile,BufRead *.rhtml setlocal ft=eruby
autocmd BufNewFile,BufRead *.tmpl setlocal ft=htmljinja
autocmd BufNewFile,BufRead *.py_tmpl setlocal ft=python

" CSS
" ---
autocmd FileType css setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" Lisp
" ---
autocmd FileType lisp setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" rst
" ---
autocmd BufNewFile,BufRead *.txt setlocal ft=rst
autocmd FileType rst setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" Javascript
" ----------
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
let javascript_enable_domhtmlcss=1

" Better Search
" -------------
set hlsearch
set incsearch

set cursorline                   

if exists('+colorcolumn')
  " Show column 80, so I can know when to use the enter key.
  set colorcolumn=80
endif

" File Browser
" ------------
" hide some files and remove stupid help
let g:explHideFiles='^\.,.*\.sw[po]$,.*\.pyc$'
let g:explDetailedHelp=0

" Builtin file browser
map ,b :Explore!<CR>


" NERDtree file browser is better
map ,nt :NERDTree 
" Locate the current file in NERDTree
map ,nf :NERDTreeFind<CR>

" map a shortcut for a regexp recursive search
map .f :QFpgrep 

" Fuzzyfinder is kinda like CMD+T in textmate
map ,ff :FufFileWithCurrentBufferDir<CR>
map ,fd :FufDirWithCurrentBufferDir<CR>

map <TAB> 

" Run the current buffer as ruby code.
map ,rr :exe ':w !ruby'<CR>

" Run the current spec file.
map ,rs :exe ':!spec --format nested %'<CR>
map ,tt :let g:rubytest_in_quickfix = 0<CR><Plug>RubyTestRun
map ,tT :let g:rubytest_in_quickfix = 1<CR><Plug>RubyTestRun
map ,tf :let g:rubytest_in_quickfix = 0<CR><Plug>RubyFileRun
map ,tF :let g:rubytest_in_quickfix = 1<CR><Plug>RubyFileRun
map ,m :TlistToggle<CR>

"taglist settings
" Only show the tags for the current file
let Tlist_Show_One_File = 1
" Sort methods by name
let Tlist_Sort_Type = "name"

" Mapping so that I can easily change to the working directory of the
" current file.
map ,cd :cd %:p:h<CR>

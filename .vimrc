" VUNDLE
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()
filetype plugin indent on


set t_Co=256
" colorscheme (doesn't work)
set term=xterm-256color
set background=dark
"let g:solarized_termcolors=256
" colorscheme solarized

" Basic settings
" http://vimrcfu.com/snippet/53
if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

set autoindent
set backspace=indent,eol,start
set smarttab

set ttimeout
set ttimeoutlen=100

set incsearch
set ignorecase
set hlsearch
set smartcase

set number  "show line numbers

set showmatch  "show matching brackets

set encoding=utf-8
set autoread

" Move visual block
" http://vimrcfu.com/snippet/77
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Keep search results in middle of screen
" http://vimrcfu.com/snippet/175
nnoremap n nzz
nnoremap N Nzz

" Keep undo history between closes
" http://vimrcfu.com/snippet/179
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for und

" Make sure Vim adjusts the file type when you change a file’s extension.
" http://vimrcfu.com/snippet/46
if has('autocmd')
  " assuming filetype plugin indent on
  augroup filetype_detect_on_rename
    autocmd!
    autocmd BufFilePost * filetype detect
  augroup END
endif

" vimdiff color settings
" http://tuxdiary.com/2014/02/17/customize-vimdiff-color-scheme/
" highlight DiffAdd cterm=none ctermbg=lightblue gui=none 
" highlight DiffDelete cterm=none ctermbg=Blue 
" highlight DiffChange cterm=none ctermbg=Blue
" highlight DiffText cterm=none ctermbg=green


" Change statusline color based on mode
" http://stackoverflow.com/questions/9065941/how-can-i-change-vim-status-line-colour
function! InsertStatuslineColor(mode)
	if a:mode == 'i'
		hi statusline ctermbg=0 ctermfg=6
	elseif a:mode == 'r'
		hi statusline ctermbg=0 ctermfg=2
	else
		hi statusline ctermbg=0 ctermfg=4
	endif
endfunction
au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline ctermbg=0 ctermfg=7
hi statusline ctermbg=0 ctermfg=8


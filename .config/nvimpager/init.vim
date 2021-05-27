filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	Plugin 'chriskempson/base16-vim'
call vundle#end()
filetype on
syntax enable
set termguicolors
colorscheme base16-oceanicnext
let g:no_man_maps = 0
set clipboard=unnamedplus
set ignorecase smartcase
set hlsearch
set noincsearch
hi Cursor blend=100
set guicursor+=a:Cursor/lCursor
set mouse=

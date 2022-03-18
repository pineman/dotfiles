set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'mbbill/undotree'
	Plugin 'pineman/vim-buftabline'
	" Syntax
	Plugin 'terminalnode/sway-vim-syntax'
	Plugin 'chr4/nginx.vim'
	Plugin 'jvirtanen/vim-hcl'
	" Colors
	Plugin 'chriskempson/base16-vim'
call vundle#end()
filetype on
filetype indent off
runtime macros/matchit.vim
syntax enable
set termguicolors
colorscheme base16-oceanicnext
set colorcolumn=80
set cursorline
set mouse=
set clipboard=unnamedplus
set ignorecase smartcase
set hlsearch
set noincsearch
set number
set autoread
set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftround
set encoding=utf-8
set fileformat=unix
set autoindent
set backspace=eol,indent,start
set ttyfast
set wildmenu
set lazyredraw
set copyindent
set linebreak
set path=**
set foldmethod=indent
set foldlevel=99
set splitbelow
set splitright
set undofile
set backup
set backupcopy=yes
set undodir=~/.vim/undo/
set backupdir=~/.vim/backup/
set directory=~/.vim/swap/,/tmp
set autowrite
if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep
	set grepformat=%f:%l:%c:%m
endif
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * checktime
" Remember cursor position
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 15
let g:netrw_keepdir = 0
set title
set showcmd
set showmode
set shortmess+=a
set laststatus=2
set stl=%0*%1*%m%r%0*
set stl+=[%n]
set stl+=\ %<%f
set stl+=\ %y
set stl+=\ [%{&fenc?&fenc:&enc}]\ [%{&ff}]
set stl+=%=
set stl+=\ %l-%c\ %p%%
set stl+=\ [%LL]
set stl+=%1*%m%0*

nnoremap j gj
nnoremap k gk
nnoremap gl $
nnoremap gh ^
nnoremap e el
nnoremap P "0p
set hidden
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprev<CR>
nmap <C-j> :bp <BAR> bd #<CR>
map <C-u> <C-W>h
map <C-i> <C-W>l
nnoremap <C-p> :find *
nnoremap <F3> :Lexplore<cr>
nnoremap <F4> :UndotreeToggle<cr>
nnoremap <F5> :make<cr>
set pastetoggle=<F6>
" Create a vsplit at 80 columns to simulate hard wrap
function! SoftHardWrap()
	execute "vs /dev/null/"
	execute "windo wincmd h"
	execute "vertical resize 84"
endfunction
map <F9> :call SoftHardWrap()<cr>
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
nnoremap <esc><esc> :w<cr> :silent! noh <cr>

au Filetype python setlocal ts=4 sts=4 sw=4 expandtab
au Filetype json setlocal expandtab
au Filetype tex setlocal makeprg=latexmk sw=2 ts=2 sts=2
au BufRead,BufNewFile *.svg,*.sass,*.less,*.scss,*.css,*.htm,*.html,*.xhtml,*.shtml,*.php setlocal sw=2 ts=2 sts=2
" Remove trailing whitespace
let blacklist = ['markdown']
autocmd BufWritePre * if index(blacklist, &ft) < 0 | :%s/\s\+$//e

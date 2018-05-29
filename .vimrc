set nocompatible
filetype plugin on

runtime macros/matchit.vim
syntax enable

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'mbbill/undotree'
	Plugin 'PotatoesMaster/i3-vim-syntax'
	Plugin 'othree/yajs.vim'

	Plugin 'altercation/vim-colors-solarized'
	"Plugin 'jnurmine/Zenburn'
	"Plugin 'sickill/vim-monokai'
	"Plugin 'fatih/molokai'
call vundle#end()

if exists('g:vimpager.enabled')
	autocmd BufRead,BufWinEnter * setlocal readonly nomodifiable
	"let g:vimpager.passthrough=0
	set colorcolumn=0
	let aux = &t_ve
	set t_ve= "Hide cursor
	au VimLeave * let &t_ve=aux "Restore cursor upon exit
else
	set number
	set colorcolumn=80
	"set cursorline " TODO: lots of cpu
endif

set background=dark
colorscheme solarized
if has("gui_running")
	set guioptions=aim
	set mousemodel=popup
	set guifont=xos4\ Terminus\ Regular
	au BufEnter * let g:solarized_bold=0 | colorscheme solarized
endif

set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftround
set encoding=utf-8
set fileformat=unix
set autoindent
"set breakindent
filetype indent off
set backspace=eol,indent,start
set mouse=a
set clipboard=autoselect
set ttyfast
set wildmenu
"set lazyredraw
" To print with correct colors, use gvim.
set printoptions=paper:A4,syntax:y,wrap:y,duplex:off,number:y,left:13mm,right:13mm,top:20mm,bottom:20mm
set printfont=Times\ New\ Roman\ 12 " Doesnt work on linux?
set copyindent
set ignorecase
set smartcase
set linebreak
set path=**
set foldmethod=indent
set foldlevel=99
set splitbelow
set splitright
set hlsearch
set undofile
set backup
set undodir=~/.vim/undo/
set backupdir=~/.vim/backup/
set directory=~/.vim/swap/,/tmp
set autowrite

nnoremap j gj
nnoremap k gk
nnoremap e el
"map <C-h> <C-w>h
"map <C-j> <C-w>j
"map <C-k> <C-w>k
"map <C-l> <C-w>l
map <C-h> gT
map <C-j> :tablast<cr>
map <C-k> :tabfirst<cr>
map <C-l> gt
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
nnoremap <esc><esc> :w<cr> :silent! noh <cr>
nnoremap <F5> :Lexplore<cr>
nnoremap <F6> :UndotreeToggle<cr>
nnoremap <F7> :make<cr>
"nnoremap ; :
"nnoremap : ;

au Filetype python setlocal ts=4 sts=4 sw=4 expandtab
au Filetype json setlocal expandtab
au BufRead,BufNewFile *.svg,*.sass,*.less,*.scss,*.css,*.htm,*.html,*.xhtml,*.shtml,*.php setlocal sw=2 ts=2 sts=2

au Filetype tex setlocal makeprg=latexmk sw=2 ts=2 sts=2
" Only works on gvim for some reason
function! Synctex()
	execute "silent !zathura --synctex-forward " . line('.') . ":" . col('.') . ":" . bufname('%') . " " . g:syncpdf
endfunction
map <F8> :call Synctex()<cr>

" Create a vsplit at 80 columns to simulate hard wrap
function! SoftHardWrap()
	execute "vs /dev/null/"
	execute "windo wincmd h"
	execute "vertical resize 84"
endfunction
map <F9> :call SoftHardWrap()<cr>

" Remember cursor position
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif

" Remove trailing whitespace
let blacklist = ['markdown']
autocmd BufWritePre * if index(blacklist, &ft) < 0 | :%s/\s\+$//e

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 15

au BufEnter * setlocal titlestring=vim:\ %F
set showcmd
set showmode
set shortmess+=a

hi User1 ctermbg=1
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
"set rulerformat=%40(%=[%n]\ %y[%{&fenc?&fenc:&enc}][%{&ff}]\ %l-%c\ %p%%\ %r%1*%m%)

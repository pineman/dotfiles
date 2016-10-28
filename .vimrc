set nocompatible
filetype plugin on
filetype indent off

runtime macros/matchit.vim
syntax on

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
	Plugin 'gmarik/Vundle.vim'
	Plugin 'altercation/vim-colors-solarized'
	Plugin 'rkitover/vimpager'
	Plugin 'mbbill/undotree'
	Plugin 'PotatoesMaster/i3-vim-syntax'
	""Plugin 'scrooloose/nerdtree'
	"Plugin 'jnurmine/Zenburn'
	"Plugin 'sickill/vim-monokai'
	"Plugin 'fatih/molokai'
call vundle#end()

set t_Co=256
set shiftwidth=4
set tabstop=4
set softtabstop=4
set noexpandtab
set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix
set autoindent
let $BASH_ENV = '~/.bash_aliases'
set backspace=eol,indent,start
set mouse=a
set ttyfast
set wildmenu
set number
set norelativenumber
set cursorline
set lazyredraw
set printoptions=paper:A4,syntax:y,wrap:y,duplex:off,number:y,left:13mm,right:13mm,top:20mm,bottom:20mm
set printfont=Times\ New\ Roman\ 12 " doesnt work on loonix
set showcmd
set showmode
set copyindent
set shiftround
set ignorecase
set smartcase
set colorcolumn=80
set linebreak
set title

nnoremap j gj
nnoremap k gk
nnoremap e el
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
nnoremap <F5> :make<cr>
nnoremap <F6> :UndotreeToggle<cr>
nnoremap <F7> :NERDTreeToggle<cr>
map K <Nop>

set foldmethod=indent
set foldlevel=99
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
set splitbelow
set splitright
set hlsearch
set undofile
set backup
set undodir=~/.vim/undo/
set backupdir=~/.vim/backup/
set directory=~/.vim/swap/
"set viminfo+=n~/.vim/viminfo
colorscheme solarized
set background=dark
let g:solarized_hitrail=1
if has("gui_running")
	set nocursorline
	set guifont=monospace\ 12
	set guioptions=aim
	set columns=90
	set mousemodel=popup
endif
if has("autocmd")
	autocmd BufRead,BufNewFile *.svg,*.sass,*.less,*.scss,*.css,*.htm,*.html,*.xhtml,*.shtml,*.php,*.md setlocal shiftwidth=2 tabstop=2 softtabstop=2
	autocmd BufRead,BufNewFile *.as setlocal filetype=asm
	autocmd BufRead,BufNewFile *.py setlocal expandtab | retab
	autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
    let blacklist = ['markdown']
    autocmd BufWritePre * if index(blacklist, &ft) < 0 | :%s/\s\+$//e
	"autocmd BufWinEnter * NERDTreeMirror " Show NERDTree in all tabs
endif

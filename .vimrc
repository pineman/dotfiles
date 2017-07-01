set nocompatible
filetype plugin on
filetype indent off

runtime macros/matchit.vim
syntax on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'rkitover/vimpager'
	Plugin 'mbbill/undotree'
	Plugin 'PotatoesMaster/i3-vim-syntax'
	Plugin 'othree/yajs.vim'

	Plugin 'altercation/vim-colors-solarized'
	"Plugin 'jnurmine/Zenburn'
	"Plugin 'sickill/vim-monokai'
	"Plugin 'fatih/molokai'
call vundle#end()

colorscheme solarized
set background=dark
set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftround
set encoding=utf-8
set fileformat=unix
set autoindent
let $BASH_ENV = '~/.bash_aliases'
set backspace=eol,indent,start
set mouse=a
set ttyfast
set wildmenu
set number
set colorcolumn=80
set lazyredraw
set printoptions=paper:A4,syntax:y,wrap:y,duplex:off,number:y,left:13mm,right:13mm,top:20mm,bottom:20mm
set printfont=Times\ New\ Roman\ 12 " doesnt work on loonix
set showcmd
set showmode
set copyindent
set ignorecase
set smartcase
set linebreak
set cursorline

nnoremap j gj
nnoremap k gk
nnoremap e el
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
nnoremap <F5> :Lexplore<cr>
nnoremap <F6> :UndotreeToggle<cr>
nnoremap <F7> :make<cr>
map K <Nop>
nnoremap ; :
cmap WQ wq
cmap Wq wq
cmap W w
cmap Q q
cmap q1 q!
cmap Q1 q!

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
set autowrite
set autochdir

if has("gui_running")
	let g:solarized_hitrail=1
	set guioptions=aim
	set mousemodel=popup
	set guifont=xos4\ Terminus\ Regular
endif

au Filetype python setlocal ts=4 sts=4 sw=4 expandtab
au Filetype json setlocal expandtab
au BufRead,BufNewFile *.svg,*.sass,*.less,*.scss,*.css,*.htm,*.html,*.xhtml,*.shtml,*.php,*.md,*.tex setlocal sw=2 ts=2 sts=2

autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif

let blacklist = ['markdown']
autocmd BufWritePre * if index(blacklist, &ft) < 0 | :%s/\s\+$//e

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 15

"set statusline=%m%=%y\ %l-%c\ %p%%\ %r
"set laststatus=2
set rulerformat=%40(%=%y[%{&fenc?&fenc:&enc}][%{&ff}]\ %l-%c\ %p%%\ %r\ %m%)
set shortmess+=a
"autocmd InsertLeave * file

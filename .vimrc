set nocompatible

runtime macros/matchit.vim
syntax enable

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'mbbill/undotree'
	Plugin 'PotatoesMaster/i3-vim-syntax'
	Plugin 'othree/yajs.vim'
	Plugin 'elixir-editors/vim-elixir'
	Plugin 'JuliaEditorSupport/julia-vim'
	Plugin 'peterhoeg/vim-qml'
	Plugin 'leafgarland/typescript-vim'
	Plugin 'artoj/qmake-syntax-vim'

	Plugin 'altercation/vim-colors-solarized'
	Plugin 'chriskempson/base16-vim'
	"Plugin 'JulioJu/neovim-qt-colors-solarized-truecolor-only'
call vundle#end()
filetype on

if exists('g:vimpager')
	autocmd BufRead,BufWinEnter * setlocal readonly nomodifiable
	"let g:vimpager.passthrough=0
	set colorcolumn=0
	let aux = &t_ve
	set t_ve= "Hide cursor
	au VimLeave * let &t_ve=aux "Restore cursor upon exit
	set laststatus=0
	set mouse=
else
	set laststatus=2
	set colorcolumn=80
	"set cursorline " TODO: lots of cpu
	set mouse=a
	nnoremap j gj
	nnoremap k gk
endif

"colorscheme solarized
set termguicolors
colorscheme base16-oceanicnext
if has("gui_running")
	set guioptions=aim
	set mousemodel=popup
	"au BufEnter * let g:solarized_bold=0 | colorscheme solarized
endif

au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * checktime
set number
set autoread
set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftround
set encoding=utf-8
set fileformat=unix
set autoindent
set nofixendofline
"set breakindent
filetype indent off
set backspace=eol,indent,start
"set clipboard=autoselect
set clipboard=unnamedplus
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
set noincsearch
set undofile
set backup
set backupcopy=yes
set undodir=~/.vim/undo/
set backupdir=~/.vim/backup/
set directory=~/.vim/swap/,/tmp
set autowrite

nnoremap gl $
nnoremap gh ^
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
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
"nnoremap d "_d
"vnoremap d "_d

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

set title
set showcmd
set showmode
set shortmess+=a

hi User1 ctermbg=1
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

if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep
	set grepformat=%f:%l:%c:%m
endif

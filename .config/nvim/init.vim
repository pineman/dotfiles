filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'mbbill/undotree'
	Plugin 'pineman/vim-buftabline'
	" Syntax
	Plugin 'jamespeapen/swayconfig.vim'
	Plugin 'elixir-editors/vim-elixir'
	" Colors
	Plugin 'chriskempson/base16-vim'
call vundle#end()
filetype on
set termguicolors
colorscheme base16-oceanicnext
set colorcolumn=80
set cursorline
set clipboard=unnamedplus
set ignorecase smartcase
set noincsearch
set number
set sw=4 ts=4 sts=4
set shiftround
set copyindent
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
"set list
"set listchars=lead:.,trail:~,tab:>-
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
set shortmess+=a
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
nnoremap P "0p
map * :let @/= expand('<cword>').'\>'\|set hlsearch<C-M>
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprev<CR>
nmap <C-j> :bp <BAR> bd #<CR>
map <C-u> <C-W>h
map <C-i> <C-W>l
nnoremap <C-p> :find *
set path=** " Dubious
set wildignore+=**/node_modules/**
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
nnoremap <esc> :noh<cr>:w<cr>
if exists('g:vscode')
  nnoremap <esc> :noh<cr>:call VSCodeCall("workbench.action.files.save")<cr>
endif

au Filetype python setlocal ts=4 sts=4 sw=4 expandtab
au Filetype json setlocal expandtab
au Filetype tex setlocal makeprg=latexmk sw=2 ts=2 sts=2
au BufRead,BufNewFile *.svg,*.sass,*.less,*.scss,*.css,*.htm,*.html,*.xhtml,*.shtml,*.php setlocal sw=2 ts=2 sts=2
" Remove trailing whitespace
let blacklist = ['markdown']
autocmd BufWritePre * if index(blacklist, &ft) < 0 | :%s/\s\+$//e

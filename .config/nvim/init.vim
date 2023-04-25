filetype off
set rtp+=/opt/homebrew/opt/fzf
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'mbbill/undotree'
	Plugin 'pineman/vim-buftabline'
	Plugin 'junegunn/fzf.vim'
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

" j k multiline
nnoremap j gj
nnoremap k gk
" J K: easier page up and down (J join goes to U)
nnoremap U J
nnoremap J <C-f>
nnoremap K <C-b>
" Redo on S-r instead of C-r
nnoremap <S-r> <C-r>
" * highlight matches, but don't actually move
map * :let @/= expand('<cword>').'\>'\|set hlsearch<C-M>
" tap esc (double tap if on insert) to compulsively	clear highlight and save
nnoremap <esc> :noh<cr>:w<cr>
if exists('g:vscode')
  nnoremap <esc> :noh<cr>:call VSCodeCall("workbench.action.files.save")<cr>
endif
" Select on visual mode, press // to search for selection!
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
" C-l, C-h, C-j: Easy buffer (my tabs with buftabline) management
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprev<CR>
nmap <C-j> :bp <BAR> bd #<CR>
" C-u C-i: Easier pane management
map <C-u> <C-W>h
map <C-i> <C-W>l
" fzf: fd on C-p and rg on C-f
nnoremap <C-p> :Files<CR>
nnoremap <C-f> :Rg 
" don't yank to default register on dd
nnoremap P "0p
nnoremap <F2> :Lexplore<cr>
nnoremap <F3> :UndotreeToggle<cr>
set pastetoggle=<F6>
" Create a vsplit at 80 columns to simulate hard wrap
function! SoftHardWrap()
	execute "vs /dev/null/"
	execute "windo wincmd h"
	execute "vertical resize 84"
endfunction
map <F9> :call SoftHardWrap()<cr>

au Filetype python setlocal ts=4 sts=4 sw=4 expandtab
au Filetype json setlocal expandtab
au Filetype tex setlocal makeprg=latexmk sw=2 ts=2 sts=2
au BufRead,BufNewFile *.svg,*.sass,*.less,*.scss,*.css,*.htm,*.html,*.xhtml,*.shtml,*.php setlocal sw=2 ts=2 sts=2
" Remove trailing whitespace
let blacklist = ['markdown', 'vim']
autocmd BufWritePre * if index(blacklist, &ft) < 0 | :%s/\s\+$//e


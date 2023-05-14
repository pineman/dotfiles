filetype off
set rtp+=/opt/homebrew/opt/fzf
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'mbbill/undotree'
	Plugin 'pineman/vim-buftabline'
	Plugin 'junegunn/fzf.vim'
	"Plugin 'rmagatti/auto-session'
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
set scrolloff=3
set noincsearch
"set list
"set listchars=lead:.,trail:~,tab:>-
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
set titlestring=%F
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
let g:fzf_preview_window = []

" j k multiline
nnoremap j gj
nnoremap k gk
" J K: easier page up and down (J join goes to U)
nnoremap U J
nnoremap J <C-f>
nnoremap K <C-b>
map <C-f> <Nop>
map <C-b> <Nop>
map <C-e> <Nop>
map <C-y> <Nop>
map <C-d> <Nop>
map <C-u> <Nop>
" Use Hk or Lj to scroll. M for middle line.
" mm to center on current line. 
nnoremap mm zz
" C-l, C-h, C-j: Easy buffer nav (tabs with buftabline) 
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprev<CR>
nnoremap <C-j> :bp <BAR> bd #<CR>
" tap esc (double tap if on insert) to compulsively	clear highlight and save
nnoremap <esc> :noh<cr>:w<cr>
if exists('g:vscode')
  nnoremap <esc> :noh<cr><Cmd>call VSCodeNotify("workbench.action.files.save")<CR>
endif
" TODO: find a way to cycle through uppercase marks
nnoremap zz :wqa<cr>
nnoremap ZZ :wqa<cr>
cnoreabbrev W w

" Redo on S-r instead of C-r
nnoremap <S-r> <C-r>
" g/ and //: highlight without moving
nnoremap g/ :let @/=""\|set hlsearch<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
" * highlight current word
map * :let @/= expand('<cword>').'\>'\|set hlsearch<C-M>
" gf: search word under cursor/selection - poor man's goto definition (like gd but not just file-wide)
nnoremap gf :Rg <C-R><C-W><CR>
vnoremap gf "zy :exec 'Rg ' . @z<CR>
" gr: Search and replace word under cursor/selection
nnoremap gr :%s/<C-R><C-W>//g<Left><Left>
vnoremap gr y:let @z=substitute(@", '/', '\\/', 'g')<CR>:%s/\V<c-r>z//g<left><left>
" C-i C-o back/fwd jumplist
" gd go to definition, gh go back
nnoremap gh <C-t>
if exists('g:vscode')
  nnoremap gh <Cmd>call VSCodeNotify("workbench.action.navigateBack")<CR>
endif
" fzf: fd on C-p and rg on C-f (plus gf)
nnoremap <C-p> :Files<CR>
nnoremap <C-F> :Rg<CR>
" keep last explicit yy on gp
nnoremap gp "0p
" = to set indentation (e.g. in visual or =ap)

nnoremap <F1> :Lexplore<cr>
nnoremap <F2> :UndotreeToggle<cr>

au Filetype python setlocal ts=4 sts=4 sw=4 expandtab
au Filetype json setlocal expandtab
au Filetype bash setlocal sw=2 ts=2 sts=2
au Filetype tex setlocal makeprg=latexmk sw=2 ts=2 sts=2
au BufRead,BufNewFile *.svg,*.sass,*.less,*.scss,*.css,*.htm,*.html,*.xhtml,*.shtml,*.php setlocal sw=2 ts=2 sts=2 expandtab
" Remove trailing whitespace
let blacklist = ['markdown', 'vim']
autocmd BufWritePre * if index(blacklist, &ft) < 0 | :%s/\s\+$//e


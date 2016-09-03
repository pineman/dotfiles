set nocompatible
filetype plugin on
filetype plugin indent off
runtime macros/matchit.vim
syntax on

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
	Plugin 'gmarik/Vundle.vim'
	"Plugin 'scrooloose/nerdtree'
	Plugin 'mbbill/undotree'
	Plugin 'rkitover/vimpager'
	Plugin 'PotatoesMaster/i3-vim-syntax'
	Plugin 'JulesWang/css.vim'
	Bundle 'genoma/vim-less'
	Plugin 'altercation/vim-colors-solarized'
	"Plugin 'jnurmine/Zenburn'
	"Plugin 'sickill/vim-monokai'
call vundle#end()

set t_Co=256
set shiftwidth=4
set tabstop=4
set softtabstop=4
set noexpandtab
set autoindent
let $BASH_ENV = '~/.bash_aliases'
set backspace=eol,indent,start
set mouse=a
set ttyfast
set wildmenu
set number
set relativenumber
set printoptions=paper:A4,syntax:y,wrap:y,duplex:off,number:y,left:13mm,right:13mm,top:20mm,bottom:20mm
"set printfont=Times\ New\ Roman\ 12 " doesnt work on loonix
set showcmd
set showmode
set copyindent
set shiftround
set ignorecase
set smartcase
set fileformat=unix
set cursorline
set colorcolumn=80
set numberwidth=3
set gdefault
set linebreak
set title

nnoremap j gj
nnoremap k gk
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
nnoremap <F5> :make<cr>
nnoremap <F6> :UndotreeToggle<cr>
nnoremap <F7> :NERDTreeToggle<cr>
nnoremap <F8> :Hexmode<cr>
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
	set guifont=Droid\ Sans\ Mono\ Dotted\ 12
	set guioptions-=T
	set guioptions-=L
	set guioptions-=r
	set lines=50 columns=90
	set mousemodel=popup
	set background=dark
endif
if has("autocmd")
	autocmd BufRead,BufNewFile *.svg,*.sass,*.less,*.scss,*.css,*.htm,*.html,*.shtml,*.php,*.md setlocal shiftwidth=2 tabstop=2 softtabstop=2
	autocmd BufRead,BufNewFile *.as setlocal filetype=asm
	autocmd BufRead,BufNewFile *.md setlocal colorcolumn=65
	autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
    let blacklist = ['markdown']
    autocmd BufWritePre * if index(blacklist, &ft) < 0 | :%s/\s\+$//e
	"autocmd BufWinEnter * NERDTreeMirror " Show NERDTree in all tabs
endif

" http://vim.wikia.com/wiki/Improved_hex_editing
" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    silent :e " this will reload the file without trickeries
              "(DOS line endings will be shown entirely )
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction

if exists("+showtabline")
     function MyTabLine()
         let s = ''
         let t = tabpagenr()
         let i = 1
         while i <= tabpagenr('$')
             let buflist = tabpagebuflist(i)
             let winnr = tabpagewinnr(i)
             let s .= '%' . i . 'T'
             let s .= (i == t ? '%1*' : '%2*')
             let s .= ' '
             let s .= i . ')'
             let s .= '%*'
             let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
             let file = bufname(buflist[winnr - 1])
             let file = fnamemodify(file, ':p:t')
             if file == ''
                 let file = '[No Name]'
             endif
             let s .= file
             let i = i + 1
         endwhile
         let s .= '%T%#TabLineFill#%='
         let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
         return s
     endfunction
     set stal=2
     set tabline=%!MyTabLine()
endif

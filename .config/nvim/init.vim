filetype off
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
set autowriteall
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
noremap j gj
noremap k gk
" J K: easier page up and down (J join goes to U)
noremap U J
noremap J <C-f>
noremap K <C-b>
" Use Hk or Lj to scroll. M for middle line.
" mm to center on current line. 
noremap mm zz
" C-l, C-h, C-j: Easy buffer nav (tabs with buftabline) 
noremap <C-l> :bnext<CR>
noremap <C-h> :bprev<CR>
noremap <C-j> :bp <BAR> bd #<CR>
" splits: c-w s: horizontal, c-w v: vertical. c-w o: (only) kill all except current.
" c-w hjkl: move focus
" tap esc (double tap if on insert) to compulsively clear highlight and save
nnoremap <esc> :noh<cr>:w<cr>
" TODO: find a way to cycle through uppercase marks
noremap zz :wqa<cr>
noremap ZZ :wqa<cr>
cnoreabbrev W w

" Redo on S-r instead of C-r
noremap <S-r> <C-r>
" * highlight current word without moving
map * :let @/= expand('<cword>').'\>'\|set hlsearch<C-M>
" g/: highlight custom without moving
noremap g/ :let @/=""\|set hlsearch<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
" //: search for visual selection TODO: do without moving
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
" gf: search word under cursor/selection - poor man's goto definition (like gd but not just file-wide)
nnoremap gf :Rg <C-R><C-W><CR>
vnoremap gf "zy :exec 'Rg ' . @z<CR>
" gr: Search and replace word under cursor/selection
nnoremap gr :%s/<C-R><C-W>//g<Left><Left>
vnoremap gr y:let @z=substitute(@", '/', '\\/', 'g')<CR>:%s/<c-r>z//g<left><left>
" C-o C-i: back/fwd jumplist
" gd go to definition, gh go back, gl go fwd
noremap gh <C-t>
noremap gl <C-i>
" fzf: fd on C-p and rg on C-f (plus gf)
noremap <C-p> :Files<CR>
noremap <C-F> :Rg<CR>
" keep last explicit yy on gp
nnoremap gp "0p
" = to set indentation (e.g. in visual or =ap)
" c in visual block mode to change (delete & insert)
" zj to toggle fold at cursor. zo to open all folds. zh fold to current level
noremap zj za
noremap zo zR
noremap zh :let&l:fdl=indent('.')/&sw<cr>
" C-x C-f autocompletes paths! C-n C-p to navigate the submenu
" instead of ciw (which yanks) to delete and then paste, do viwp (vi'p) which won't yank first

noremap <F1> :Lexplore<cr>
noremap <F2> :UndotreeToggle<cr>

au Filetype python setlocal ts=4 sts=4 sw=4 expandtab
au Filetype json setlocal expandtab
au Filetype sh setlocal sw=2 ts=2 sts=2
au Filetype tex setlocal makeprg=latexmk sw=2 ts=2 sts=2
au Filetype javascript,javascriptreact setlocal sw=2 ts=2 sts=2
au BufRead,BufNewFile *.svg,*.sass,*.less,*.scss,*.css,*.htm,*.html,*.xhtml,*.shtml,*.php setlocal sw=2 ts=2 sts=2 expandtab
" Remove trailing whitespace
let blacklist = ['markdown', 'vim']
autocmd BufWritePre * if index(blacklist, &ft) < 0 | :%s/\s\+$//e

" vscode hacks
" J K configured directly in extension keyboard shortcuts
if exists('g:vscode')
  noremap mm <Cmd>call <SNR>4_reveal('center', 0)<CR>
  nnoremap <esc> :noh<cr><Cmd>call VSCodeNotify("workbench.action.files.save")<CR>
  noremap gh <Cmd>call VSCodeNotify("workbench.action.navigateBack")<CR>
end

" TODO: this moves the cursor to the beginning for no reason
function! SaveAllBuffers()
  for buf in filter(range(1, bufnr('$')), 'buflisted(v:val)')
    let l:file_path = bufname(buf)
    if getbufvar(buf, '&mod') && (empty(l:file_path) || l:file_path == '[No Name]')
      let l:file_path = $HOME . '/.vim/temp-backup/' . 'unnamed_' . strftime('%Y%m%d_%H%M%S_') . buf . '.txt'
    else
      continue
    endif
    execute 'silent! w ' . fnameescape(l:file_path)
  endfor
endfunction
autocmd VimEnter * call timer_start(5000, { tid -> SaveAllBuffers() }, {'repeat': -1})

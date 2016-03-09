set nocompatible
filetype off

if has('win32')
    source $VIMRUNTIME/mswin.vim
    set rtp+=~/.vim
    :unmap <C-a>
    behave mswin
endif

set backupdir=~/.vim/backups

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'itchyny/lightline.vim'
Plugin 'SirVer/ultisnips'
Plugin 'terryma/vim-multiple-cursors'
" Plugin Dependencies
Plugin 'honza/vim-snippets' " Utlisnips dependency

call vundle#end()
filetype plugin indent on

" Ultisnips options
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"
" Lightline
set laststatus=2 " always show statusline
let g:lightline = { 'colorscheme': 'jellybeans' }
 
" Make command line two lines high
set ch=2

" Syntax highlighting
if !exists("syntax_on")
    syntax on
endif

" Macros
nnoremap <C-J> moo<esc>`o 
nnoremap <C-K> moO<esc>`o
vnoremap <C-A> <esc>ggVG
 
" Colors
colorscheme my_theme
 
" Gui options
if has("gui_running")
    set mousehide " Hide mouse when typing
    set cursorline " Highlight currentline
    set guioptions-=L " Remove left scroll bar
    set guioptions-=T " Remove toolbar
    set guioptions-=m " Remove menubar
    colors my_jellybeans " Theme
    set guifont=Consolas:h10 " Font
endif

" Turn on the WiLd menu
set wildmenu

" Use Relative line numebrs
set number
set relativenumber 

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
 
" Tab options
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" Search options
set ignorecase
set smartcase
set incsearch
set hlsearch

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction



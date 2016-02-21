set nocompatible
source $VIMRUNTIME/mswin.vim
behave mswin

" Vundle
filetype off
set rtp+=$VIM/vimfiles/bundle/Vundle.vim
call vundle#begin('$VIM/vimFiles/bundle')

" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
" Plugin 'scrooloose/syntastic'

call vundle#end()
filetype plugin indent on

" Make command line two lines high
set ch=2

" Macros
:nnoremap <C-J> o <esc>
:nnoremap <C-K> O <esc>

" Colors
colorscheme my_theme
 
" Gui options
if has("gui_running")
    set mousehide " Hide mouse when typing
    set cursorline " Highlight currentline
    set guioptions-=L " Remove left scroll bar
    colors my_jellybeans " Theme

endif

" Save backups to backup folder
set backupdir=$VIM/backups

" Turn on the WiLd menu
set wildmenu

" Use Relative line numebrs
set number
set relativenumber 

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Auto indent
set ai 
 
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



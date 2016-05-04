set nocompatible
filetype off

if has('win32')

    set rtp+=~/.vim
    behave mswin
    
    " Macros taken from mswin.vim
    vnoremap <BS> d
    map <C-V> "+gP
    cmap <C-V> <C-R>+
    noremap <C-Q> <C-V>

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
Plugin 'terryma/vim-multiple-cursors'

if has("python")
    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets' " Utlisnips dependency
    Plugin 'sjl/gundo.vim'
endif

call vundle#end()
filetype plugin indent on

" Multi Cursor options
let g:multi_cursor_exit_from_insert_mode=0

" Ultisnips options
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Gundo options
nnoremap <Leader>u :GundoToggle<CR>
let g:gundo_preview_height=25
let g:gundo_close_on_revert=1

" Lightline
set laststatus=2 " always show statusline
let g:lightline = { 'colorscheme': 'jellybeans' }
 
" Macros
inoremap <C-K> <esc>O<esc>i
inoremap <C-J> <esc>o<esc>i
nnoremap <C-K> O<esc>
nnoremap <C-J> o<esc>
nnoremap K k J
vnoremap <C-A> <esc>ggVG
nnoremap z<CR> zt3<C-Y>
nnoremap Y y$
nnoremap <silent> <esc>/ :noh <CR>
nnoremap <silent> <leader>e :NERDTreeToggle %:p:h<CR>

" Make command line two lines high
set ch=2

" Syntax highlighting
if !exists("syntax_on")
    syntax on
endif
 
" Colors
colorscheme lazz
 
" Gui options
if has("gui_running")
    set mousehide " Hide mouse when typing
    set cursorline " Highlight currentline
    set guioptions-=a " Disable autoselect
    set guioptions-=L " Remove left scroll bar
    set guioptions-=T " Remove toolbar
    set guioptions-=m " Remove menubar
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
   if $VIMRUNTIME =~ ' '
     if &sh =~ '\<cmd'
       if empty(&shellxquote)
         let l:shxq_sav = ''
         set shellxquote&
       endif
       let cmd = '"' . $VIMRUNTIME . '\diff"'
     else
       let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
     endif
   else
     let cmd = $VIMRUNTIME . '\diff'
   endif
   silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
   if exists('l:shxq_sav')
     let &shellxquote=l:shxq_sav
   endif
 endfunction


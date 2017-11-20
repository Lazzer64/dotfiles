" Startup
if has('vim_starting') && has("win32")
    set rtp+=~/.vim
endif

" Options
set nocompatible
filetype off
set nobackup

set ch=2 
set laststatus=2 " always show statusline
set wildmenu
set number
set relativenumber 

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

set ignorecase
set smartcase
set incsearch
set hlsearch

" Colors
colorscheme jellybeans
let g:jellybeans_overrides = { 'Todo': { 'guifg': 'E5789F' } }

if !exists("syntax_on")
    syntax on
endif

if(&t_Co > 8)
    set cursorline
endif

" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'itchyny/lightline.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'junegunn/vim-easy-align'

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
let g:lightline = {
\ 'colorscheme': 'jellybeans',
\ 'active': {
\    'right': [ [ 'lineinfo' ],
\               [ 'gitbranch'],
\               [ 'fileformat', 'fileencoding', 'filetype' ] ]
\   },
\ 'inactive': {
\    'right': [ [ 'lineinfo' ], [] ]
\   },
\ 'component_function': {
\    'gitbranch': 'fugitive#head'
\ },
\ }

" Auto Commands
autocmd FileType ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2

" Macros
inoremap <C-K> <esc>O<esc>i
inoremap <C-J> <esc>o<esc>i
vnoremap <C-A> <esc>ggVG
nnoremap <C-K> O<esc>
nnoremap <C-J> o<esc>
nnoremap K k J
nnoremap z<CR> zt3<C-Y>
nnoremap Y y$
nnoremap <silent> <esc>/ :noh <CR>
nnoremap <silent> <leader>e :NERDTreeToggle %:p:h<CR>
nnoremap <C-Q> <C-V>
 
" Windows options
if has('win32') 
    vnoremap <BS> d
    map <C-V> "+gp
    cmap <C-V> <C-R>+
endif

" Gui options
if has('gui_running')
    set mousehide
    set cursorline
    set guioptions=
    set guifont=Consolas:h10
endif

if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif

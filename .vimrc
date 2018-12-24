" Windows RTP
if has('vim_starting') && has("win32")
    set runtimepath+=~/.vim
endif

" Plugins
call plug#begin()
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'mbbill/undotree'
Plug 'scrooloose/nerdtree'
Plug 'sgur/vim-editorconfig'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-python/python-syntax'
call plug#end()

" Options
set backspace=eol,start,indent
set ch=2
set complete=.,w,b,u,t
set expandtab
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set nobackup
set nocompatible
set number
set relativenumber
set shiftwidth=4
set showcmd
set smartcase
set smarttab
set tabstop=4
set textwidth=0
set whichwrap+=<,>,h,l
set wildmenu
noh

" Colors
let g:jellybeans_overrides = {'Search': {'guifg': '', 'guibg': '505050'}, 'Terminal': {'guibg': '000000'}}
colorscheme jellybeans

" Undotree
let g:undotree_WindowLayout = 2

" Markdown
let g:markdown_fenced_languages = ['python', 'sh', 'c']

" Multi Cursor options
let g:multi_cursor_exit_from_insert_mode=0

" Ultisnips options
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Python-Syntax
let python_highlight_all=1

" Lightline
let g:lightline = {
\ 'colorscheme': 'jellybeans',
\ 'active': {
\    'right': [['lineinfo'], ['gitbranch'], ['fileformat', 'filetype']]
\   },
\ 'inactive': {
\    'right': [['lineinfo']]
\   },
\ 'component_function': {
\    'gitbranch': 'fugitive#head'
\ },
\ }

" Auto Commands
augroup vimrc
    autocmd!
    autocmd BufRead /tmp/bash-fc* set ft=sh
augroup END

" Mappings
inoremap <silent> <C-J> <esc>o<esc>i
inoremap <silent> <C-K> <esc>O<esc>i

nnoremap <silent> <C-J> o<esc>
nnoremap <silent> <C-K> O<esc>
nnoremap <silent> <C-P> :Files<CR>
nnoremap <silent> <C-Q> <C-V>
nnoremap <silent> <esc>/ :noh<CR>
nnoremap <silent> <expr> <leader>e expand('%') =~ 'NERD_tree' ? ':NERDTreeClose<CR>' : ':NERDTree %:p:h<CR>'
nnoremap <silent> <leader>u :UndotreeToggle<CR>
nnoremap <silent> <leader>wr :set wrap! \| set wrap?<CR>
nnoremap <silent> Y y$
nnoremap <silent> z<CR> zt3<C-Y>

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

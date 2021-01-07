set nocompatible

filetype plugin indent on
syntax on

set backspace=indent,eol,start
set hidden
set noswapfile
set relativenumber
set number
set number relativenumber
set noerrorbells visualbell t_vb=
set clipboard+=unnamedplus
set ttimeout
set ttimeoutlen=100
set timeoutlen=3000

" Plugins
call plug#begin()

Plug 'preservim/NERDTree'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
Plug 'editorconfig/editorconfig-vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'arcticicestudio/nord-vim'

call plug#end()

let g:coc_global_extensions = [ 'coc-tsserver' ]

" Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif

" 
" Shortcuts
"
nnoremap <leader>s :source $MYVIMRC<CR>
nnoremap <leader>1 :PlugInstall<CR>

" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree %<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>

" Split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

colorscheme nord

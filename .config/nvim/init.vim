filetype plugin indent on
syntax on

set exrc
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set expandtab
set hidden
set noerrorbells visualbell t_vb=
set noswapfile
set nobackup
set relativenumber
set nu
set nowrap
set undodir=~/.vim/undodir
set undofile
set incsearch
" set termguicolors
set scrolloff=8
set clipboard+=unnamedplus
set ttimeout
set ttimeoutlen=100
set timeoutlen=3000
set signcolumn=yes

" Plugins
call plug#begin()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'dag/vim-fish'

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
let g:coc_global_extensions = [
    \ 'coc-tsserver',
    \ 'coc-json',
    \ 'coc-css',
    \ 'coc-html',
    \ 'coc-prettier'
    \ ]
Plug 'maxmellon/vim-jsx-pretty'
Plug 'herringtondarkholme/yats.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'

call plug#end()

let mapleader = " " 
nnoremap <leader>s :source $MYVIMRC<CR>
nnoremap <leader>1 :PlugInstall<CR>

" Split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Plugins
nmap <C-P> :FZF<CR>
nmap <leader>i :CocCommand tsserver.organizeImports<CR>
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

colorscheme nord

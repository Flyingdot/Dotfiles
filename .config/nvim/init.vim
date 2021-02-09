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
set mouse=a

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
    \ 'coc-prettier',
    \ 'coc-omnisharp'
    \ ]
Plug 'maxmellon/vim-jsx-pretty'
Plug 'herringtondarkholme/yats.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'editorconfig/editorconfig-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

call plug#end()

let mapleader = " " 
nnoremap <leader>e :e $MYVIMRC<CR>
nnoremap <leader>s :source $MYVIMRC<CR>
nnoremap <leader>1 :PlugInstall<CR>
nnoremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap <leader>p "_dP

" Split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Plugins
nmap <C-P> :FZF<CR>
nmap <C-F> :Rg<CR>
nmap <leader>i :CocCommand tsserver.organizeImports<CR>
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
nmap <silent> gd <Plug>(coc-definition)
nmap <slient> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
command! -nargs=0 Prettier :CocCommand prettier.formatFile

colorscheme nord
highlight Comment cterm=italic gui=italic

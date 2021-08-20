filetype plugin indent on
syntax on

set path+=**
set wildignore+=**/node_modules/**

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
" --------
call plug#begin()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dag/vim-fish'

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
let g:coc_global_extensions = [
    \ 'coc-tsserver',
    \ 'coc-json',
    \ 'coc-css',
    \ 'coc-html',
    \ 'coc-prettier',
    \ 'coc-eslint'
    \ ]
Plug 'maxmellon/vim-jsx-pretty'
Plug 'herringtondarkholme/yats.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'editorconfig/editorconfig-vim'
Plug 'liuchengxu/vim-which-key'
Plug 'vim-scripts/PreserveNoEOL'
Plug 'alvan/vim-closetag'
Plug 'mattn/emmet-vim'

" themes
Plug 'folke/tokyonight.nvim'

call plug#end()

let g:prettier#autoformat = 1

let mapleader = " " 
nnoremap <leader>e :e $MYVIMRC<CR>
source $HOME/.config/nvim/keys/which-key.vim
nnoremap <leader>s :source $MYVIMRC<CR>
nnoremap <leader>1 :PlugInstall<CR>
nnoremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap <leader>p "_dP

" Navigation
" ------------
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


" Plugins
" --------
nmap <C-P> :FZF<CR>
nmap <C-F> :Rg<CR>
nmap <leader>i :CocCommand tsserver.organizeImports<CR>
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" coc
nmap <silent> gd <Plug>(coc-definition)
nmap <slient> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nmap <silent> rn <Plug>(coc-rename)
nmap <leader>i :CocCommand tsserver.organizeImports<CR>
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
command! -nargs=0 Prettier :CocCommand prettier.formatFile

nnoremap <silent> K :call <SID>show_documentation()<CR>
let g:user_emmet_leader_key='<C-Z>'

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


" Visuals
" ---------
let g:tokyonight_style = "night"
" let g:tokyonight_style = "storm"
colorscheme tokyonight
" highlight Comment cterm=italic gui=italic

autocmd FileType javascript.jsx.tsx setlocal commentstring={/*\ %s\ */}
